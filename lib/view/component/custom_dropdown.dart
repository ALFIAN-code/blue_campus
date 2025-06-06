import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    super.key,
    this.value,
    required this.items,
    required this.onChange,
    this.filledColor = Colors.white,
  });
  String? value;
  final List<String> items;
  void Function(String?)? onChange;
  Color filledColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      isExpanded: true,
      style: TextStyle(
        overflow: TextOverflow.ellipsis
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items:
          items
              .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
              .toList(),
      onChanged: onChange,
    );
  }
}
