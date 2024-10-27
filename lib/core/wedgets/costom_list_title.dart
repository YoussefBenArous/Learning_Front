import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
  final IconData? iconData;
  final String? text;
  const CustomListTile({super.key, this.iconData, this.text});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Card(
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Icon(
            iconData!,
            color: const Color.fromARGB(255, 88, 97, 105),
          ),
        ),
      ),
      title: Text(
        text!,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}