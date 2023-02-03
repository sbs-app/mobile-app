import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Model class to hold menu option data
class MenuOptionsModel {
  String key;
  String value;
  IconData icon;

  MenuOptionsModel(
      {required this.key, required this.value, required this.icon});
}

class SegmentedSelector extends StatelessWidget {
  SegmentedSelector(
      {required this.menuOptions,
      required this.selectedOption,
      required this.onValueChanged});

  final List<MenuOptionsModel> menuOptions;
  final String selectedOption;
  final void Function(dynamic) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
        groupValue: selectedOption,
        children: Map.fromIterable(
          menuOptions,
          key: (option) => option.key,
          value: (option) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(option.icon),
              SizedBox(width: 6),
              Text(
                option.value,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        onValueChanged: onValueChanged);
  }
}
