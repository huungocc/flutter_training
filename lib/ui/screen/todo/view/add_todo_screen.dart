import 'package:flutter/material.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/todo/model/todo_model.dart';
import 'package:flutter_training/ui/widget/base_button.dart';
import 'package:flutter_training/ui/widget/base_text_input.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_todo_background.dart';
import 'package:flutter_training/ui/widget/custom/todo_radio_group.dart';
import 'package:flutter_training/util/enums.dart';
import 'package:intl/intl.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _AddTodoBody();
  }
}

class _AddTodoBody extends StatefulWidget {
  const _AddTodoBody();

  @override
  State<_AddTodoBody> createState() => _AddTodoBodyState();
}

class _AddTodoBodyState extends State<_AddTodoBody> {
  final TextEditingController _keyTaskTitle = TextEditingController();
  final TextEditingController _keyTime = TextEditingController();
  final TextEditingController _keyDate = TextEditingController();
  final TextEditingController _keyNotes = TextEditingController();

  TodoModel model = TodoModel();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: Container(
          color: AppColors.todoBackground,
          height: MediaQuery.of(context).size.height - 70,
          child: Column(
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
                        child: const Icon(Icons.close, color: AppColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 35,
                    child: BaseTextLabel(
                      'Add New Task',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
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
                            borderSide: BorderSide(
                              color: AppColors.todoPurple,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: 'Task Title',
                          hintText: 'Task Title',
                          cursorColor: AppColors.todoPurple,
                        ),
                        const SizedBox(height: 20,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 20,
                            children: [
                              BaseTextLabel('Category', fontSize: 16, fontWeight: FontWeight.w500,),
                              TodoRadioGroup(
                                initialSelected: TodoIconType.list,
                                onSelected: (selectedType) {
                                  model.category = selectedType.name.toString();
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30,),
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
                                title: 'Date',
                                hintText: 'Date',
                                cursorColor: AppColors.todoPurple,
                                suffixIcon: Icon(Icons.date_range, color: AppColors.todoPurple,),
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
                                    String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
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
                                title: 'Time',
                                hintText: 'Time',
                                cursorColor: AppColors.todoPurple,
                                suffixIcon: Icon(Icons.access_time_rounded, color: AppColors.todoPurple,),
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
                                    final dateTime = DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);

                                    String formattedTime = DateFormat('hh:mm a').format(dateTime);
                                    _keyTime.text = formattedTime;
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
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
                            borderSide: BorderSide(
                              color: AppColors.todoPurple,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: 'Notes',
                          hintText: 'Notes',
                          cursorColor: AppColors.todoPurple,
                          minLines: 6,
                          maxLines: 6,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: BaseButton(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: AppColors.todoPurple,
                  title: 'Save',
                  borderRadius: 50,
                  height: 55,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
