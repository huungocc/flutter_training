import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/todo/view/add_todo_screen.dart';
import 'package:flutter_training/ui/screen/todo/view_model/todo_cubit.dart';
import 'package:flutter_training/ui/screen/todo/view_model/todo_state.dart';
import 'package:flutter_training/ui/widget/base_button.dart';
import 'package:flutter_training/ui/widget/base_dialog.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_todo_background.dart';
import 'package:flutter_training/ui/widget/custom/todo_info_card.dart';
import 'package:flutter_training/util/common.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => TodoCubit(), child: _TodoBody());
  }
}

class _TodoBody extends StatefulWidget {
  const _TodoBody();

  @override
  State<_TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<_TodoBody> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    context.read<TodoCubit>().loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hideAppBar: true,
      isLightStatusBar: true,
      colorBackground: AppColors.todoBackground,
      body: Stack(
        children: [
          CustomTodoBackground(height: 250,),
          Align(
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  BaseTextLabel(
                    Common.formatLongDate(DateTime.now()),
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 40),
                  BaseTextLabel(
                    AppLocalizations.of(context)!.my_todo_list,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  const SizedBox(height: 30),
                  _buildContent(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: BaseButton(
          title: AppLocalizations.of(context)!.add_new_task,
          backgroundColor: AppColors.todoPurple,
          borderRadius: 50,
          onTap: () async {
            final isSuccess = await showModalBottomSheet<bool>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return AddTodoScreen();
              },
            );
            if (!context.mounted) return;

            if (isSuccess == true) {
              getData();
            }
          },
        ),
      ),
    );
  }

  Expanded _buildContent() {
    return Expanded(
      child: BlocConsumer<TodoCubit, TodoState>(
        listener: (context, state) {
          if (state is TodoOperationSuccess) {
            getData();
          }
        },
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(
              child: SpinKitCircle(size: 50, color: AppColors.black),
            );
          }
          if (state is TodoLoaded) {
            final todos = state.todos;
            final completed = state.completed;

            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                  ],
                  stops: const [0.0, 0.96, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstOut,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: (todos.isNotEmpty)
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: todos.length,
                              separatorBuilder: (context, index) => Container(
                                color: AppColors.todoBackground,
                                height: 1,
                              ),
                              itemBuilder: (context, index) {
                                final todo = todos[index];

                                final isFirst = index == 0;
                                final isLast = index == todos.length - 1;

                                final borderRadius = BorderRadius.vertical(
                                  top: isFirst
                                      ? const Radius.circular(20)
                                      : Radius.zero,
                                  bottom: isLast
                                      ? const Radius.circular(20)
                                      : Radius.zero,
                                );

                                return Dismissible(
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.red,
                                    ),
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Icon(Icons.delete, color: Colors.white),
                                  ),
                                  onDismissed: (direction) {
                                    setState(() {
                                      todos.removeAt(index);
                                    });
                                    context.read<TodoCubit>().deleteTodo(todo);
                                  },
                                  key: Key(todos[index].id!),
                                  child: TodoInfoCard(
                                    borderRadiusGeometry: borderRadius,
                                    title: todo.taskTitle,
                                    type: todo.category,
                                    time: Common.convertTime24to12(todo.time!),
                                    onTap: () async {
                                      final isSuccess =
                                          await showModalBottomSheet<bool>(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            builder: (BuildContext context) {
                                              return AddTodoScreen(arg: todo);
                                            },
                                          );
                                      if (!context.mounted) return;

                                      if (isSuccess == true) {
                                        getData();
                                      }
                                    },
                                    onCheck: () {
                                      BaseDialog.showNotifyDialog(
                                        message: AppLocalizations.of(context)!.complete_task,
                                        onConfirm: () {
                                          context
                                              .read<TodoCubit>()
                                              .updateTodoStatus(todo, true);
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            )
                          : TodoInfoCard(
                              title: AppLocalizations.of(context)!.no_data_yet,
                              time: 'N/A',
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                      child: BaseTextLabel(
                        AppLocalizations.of(context)!.completed,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: (completed.isNotEmpty)
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: completed.length,
                              separatorBuilder: (context, index) => Container(
                                color: AppColors.todoBackground,
                                height: 1,
                              ),
                              itemBuilder: (context, index) {
                                final complete = completed[index];

                                final isFirst = index == 0;
                                final isLast = index == completed.length - 1;

                                final borderRadius = BorderRadius.vertical(
                                  top: isFirst
                                      ? const Radius.circular(20)
                                      : Radius.zero,
                                  bottom: isLast
                                      ? const Radius.circular(20)
                                      : Radius.zero,
                                );

                                return TodoInfoCard(
                                  borderRadiusGeometry: borderRadius,
                                  title: complete.taskTitle,
                                  time: Common.convertTime24to12(complete.time!),
                                  type: complete.category,
                                  isCompleted: true,
                                  onCheck: () {
                                    BaseDialog.showNotifyDialog(
                                      message:
                                      AppLocalizations.of(context)!.cancel_complete_task,
                                      onConfirm: () {
                                        context
                                            .read<TodoCubit>()
                                            .updateTodoStatus(
                                              complete,
                                              false,
                                            );
                                      },
                                    );
                                  },
                                );
                              },
                            )
                          : TodoInfoCard(
                              title: AppLocalizations.of(context)!.no_data_yet,
                              time: 'N/A',
                              isCompleted: true,
                            ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
