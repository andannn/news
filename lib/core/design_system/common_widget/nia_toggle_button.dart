import 'package:flutter/material.dart';

class NiaToggleButton extends StatelessWidget {
  const NiaToggleButton(
      {super.key,
      required this.isChecked,
      required this.uncheckedIconData,
      required this.checkedIconData,
      required this.onCheckChanged});

  final bool isChecked;
  final IconData uncheckedIconData;
  final IconData checkedIconData;
  final void Function(bool isChecked) onCheckChanged;

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    if (isChecked) {
      iconData = checkedIconData;
    } else {
      iconData = uncheckedIconData;
    }
    return ToggleButtons(
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      isSelected: [isChecked],
      children: [Icon(iconData)],
      onPressed: (_) => onCheckChanged(!isChecked),
    );
  }
}
