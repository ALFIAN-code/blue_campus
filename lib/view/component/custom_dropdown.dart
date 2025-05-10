import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    super.key,
    required this.value,
    required this.items,
    required this.onChange,
  });
  String value;
  final List<String> items;
  void Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
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
