import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/screen/todo/model/todo_model.dart';
import 'package:flutter_training/screen/todo/view_model/todo_cubit.dart';
import 'package:flutter_training/screen/todo/view_model/todo_state.dart';
import 'package:flutter_training/widget/base_button.dart';
import 'package:flutter_training/widget/base_text_input.dart';
import 'package:flutter_training/widget/base_text_label.dart';
import 'package:flutter_training/widget/custom/custom_todo_background.dart';
import 'package:flutter_training/widget/custom/todo_radio_group.dart';
import 'package:flutter_training/util/enums.dart';
import 'package:intl/intl.dart';

class AddTodoScreen extends StatelessWidget {
  final TodoModel? arg;

  const AddTodoScreen({super.key, this.arg});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => TodoCubit(), child: _AddTodoBody(arg));
  }
}

class _AddTodoBody extends StatefulWidget {
  final TodoModel? arg;

  const _AddTodoBody(this.arg);

  @override
  State<_AddTodoBody> createState() => _AddTodoBodyState();
}

class _AddTodoBodyState extends State<_AddTodoBody> {
  final TextEditingController _keyTaskTitle = TextEditingController();
  final TextEditingController _keyTime = TextEditingController();
  final TextEditingController _keyDate = TextEditingController();
  final TextEditingController _keyNotes = TextEditingController();

  TodoModel model = TodoModel();

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.arg != null) {
      isUpdate = true;
      model = widget.arg!;
      _keyTaskTitle.text = widget.arg!.taskTitle!;
      _keyDate.text = DateFormat('dd/MM/yyyy').format(widget.arg!.date!);
      _keyTime.text = DateFormat(
        'h:mm a',
      ).format(DateFormat('HH:mm:ss').parse(widget.arg!.time!));
      _keyNotes.text = widget.arg!.notes!;
    }
  }

  @override
  Widget build(BuildContext context) {
    TodoIconType type = TodoIconType.list;
    switch (model.category) {
      case 'list':
        type = TodoIconType.list;
      case 'calendar':
        type = TodoIconType.calendar;
      case 'trophy':
        type = TodoIconType.trophy;
    }
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 70,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.todoBackground,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: BlocConsumer<TodoCubit, TodoState>(
              listener: (context, state) {
                if (state is TodoOperationSuccess) {
                  Navigator.pop(context, true);
                  ExceptionHandler.showSuccessSnackBar(state.message);
                }
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CustomTodoBackground(height: 90),
                            Positioned(
                              left: 16,
                              top: 12,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.black,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 35,
                              child: BaseTextLabel(
                                isUpdate
                                    ? AppLocalizations.of(context)!.edit_task
                                    : AppLocalizations.of(
                                        context,
                                      )!.add_new_task,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        _buildInput(context, type),
                        SafeArea(
                          child: BaseButton(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            backgroundColor: AppColors.todoPurple,
                            title: AppLocalizations.of(context)!.save,
                            borderRadius: 50,
                            height: 55,
                            onTap: () {
                              if (_keyTaskTitle.text.isNotEmpty &&
                                  _keyDate.text.isNotEmpty &&
                                  _keyTime.text.isNotEmpty &&
                                  _keyNotes.text.isNotEmpty) {
                                model.taskTitle = _keyTaskTitle.text;
                                model.date = DateFormat(
                                  'dd/MM/yyyy',
                                ).parse(_keyDate.text);
                                model.time = DateFormat('HH:mm:ss').format(
                                  DateFormat('hh:mm a').parse(_keyTime.text),
                                );
                                model.notes = _keyNotes.text;
                                model.category ??= TodoIconType.list.name;
                                if (isUpdate) {
                                  context.read<TodoCubit>().updateTodo(model);
                                } else {
                                  context.read<TodoCubit>().addTodo(model);
                                }
                              } else {
                                ExceptionHandler.showErrorSnackBar(
                                  AppLocalizations.of(
                                    context,
                                  )!.please_fill_in_all_fields,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    if (state is TodoLoading)
                      Container(
                        color: Colors.black.withOpacity(0.7),
                        child: Center(
                          child: SpinKitCircle(
                            size: 50,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildInput(BuildContext context, TodoIconType type) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              BaseTextInput(
                textController: _keyTaskTitle,
                margin: EdgeInsets.symmetric(vertical: 10),
                colorBgTextField: AppColors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray_border,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.todoPurple, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                title: AppLocalizations.of(context)!.task_title,
                hintText: AppLocalizations.of(context)!.task_title,
                cursorColor: AppColors.todoPurple,
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: [
                    BaseTextLabel(
                      AppLocalizations.of(context)!.category,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    TodoRadioGroup(
                      initialSelected: type,
                      onSelected: (selectedType) {
                        model.category = selectedType.name.toString();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: BaseTextInput(
                      textController: _keyDate,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      colorBgTextField: AppColors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.gray_border,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.todoPurple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: AppLocalizations.of(context)!.date,
                      hintText: AppLocalizations.of(context)!.date,
                      cursorColor: AppColors.todoPurple,
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: AppColors.todoPurple,
                      ),
                      onTapSuffixIcon: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.todoPurple,
                                  onPrimary: AppColors.white,
                                  onSurface: AppColors.black,
                                  surface: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          String formattedDate = DateFormat(
                            'dd/MM/yyyy',
                          ).format(pickedDate);
                          _keyDate.text = formattedDate;
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: BaseTextInput(
                      textController: _keyTime,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      colorBgTextField: AppColors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.gray_border,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.todoPurple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: AppLocalizations.of(context)!.time,
                      hintText: AppLocalizations.of(context)!.time,
                      cursorColor: AppColors.todoPurple,
                      suffixIcon: Icon(
                        Icons.access_time_rounded,
                        color: AppColors.todoPurple,
                      ),
                      onTapSuffixIcon: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.todoPurple,
                                  onPrimary: AppColors.white,
                                  onSurface: AppColors.black,
                                  surface: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedTime != null) {
                          final now = DateTime.now();
                          final dateTime = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );

                          String formattedTime = DateFormat(
                            'hh:mm a',
                          ).format(dateTime);
                          _keyTime.text = formattedTime;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                textController: _keyNotes,
                margin: EdgeInsets.symmetric(vertical: 10),
                colorBgTextField: AppColors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray_border,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.todoPurple, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                title: AppLocalizations.of(context)!.notes,
                hintText: AppLocalizations.of(context)!.notes,
                cursorColor: AppColors.todoPurple,
                minLines: 6,
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
