import 'package:flutter/material.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/ui/screen/todo/view/add_todo_screen.dart';
import 'package:flutter_training/ui/widget/base_button.dart';
import 'package:flutter_training/ui/widget/base_screen.dart';
import 'package:flutter_training/ui/widget/base_text_label.dart';
import 'package:flutter_training/ui/widget/custom/custom_todo_background.dart';
import 'package:flutter_training/ui/widget/custom/todo_info_card.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _TodoBody();
  }
}

class _TodoBody extends StatefulWidget {
  const _TodoBody();

  @override
  State<_TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<_TodoBody> {


  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hideAppBar: true,
      isLightStatusBar: true,
      colorBackground: AppColors.todoBackground,
      body: Stack(
        children: [
          CustomTodoBackground(),
          Align(
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  BaseTextLabel(
                    'October 20, 2022',
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  const SizedBox(height: 40),
                  BaseTextLabel(
                    'My Todo List',
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ShaderMask(
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        color: AppColors.todoBackground,
                                        height: 1,
                                      ),
                                  itemBuilder: (context, index) {
                                    return TodoInfoCard(
                                      title: 'Đi học',
                                      time: '10:00 PM'/*DateFormat('hh:mm a').format('')*/
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 30,
                                horizontal: 20,
                              ),
                              child: BaseTextLabel(
                                'Completed',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        color: AppColors.todoBackground,
                                        height: 1,
                                      ),
                                  itemBuilder: (context, index) {
                                    return TodoInfoCard(
                                      title: 'Đi học',
                                      time: '10:00 PM'/*DateFormat('hh:mm a').format('')*/,
                                      isCompleted: true,
                                      onTap: () => print('onTap'),
                                      onCheck: () {
                                        print('onCheck');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: BaseButton(
          title: 'Add New Task',
          backgroundColor: AppColors.todoPurple,
          borderRadius: 50,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return AddTodoScreen();
              },
            );
          },
        ),
      ),
    );
  }
}
