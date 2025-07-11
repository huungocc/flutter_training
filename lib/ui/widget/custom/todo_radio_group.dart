import 'package:flutter/material.dart';

import '../../../util/enums.dart';
import 'custom_widget.dart';

class TodoRadioGroup extends StatefulWidget {
  final TodoIconType initialSelected;
  final ValueChanged<TodoIconType> onSelected;

  const TodoRadioGroup({
    super.key,
    required this.initialSelected,
    required this.onSelected,
  });

  @override
  State<TodoRadioGroup> createState() => _TodoRadioGroupState();
}

class _TodoRadioGroupState extends State<TodoRadioGroup> {
  late TodoIconType selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 10,
      children: TodoIconType.values.map((type) {
        return CustomWidget.todoIcon(
          type,
          isSelected: selected == type,
          onTap: () {
            setState(() => selected = type);
            widget.onSelected(type);
          },
        );
      }).toList(),
    );
  }
}
