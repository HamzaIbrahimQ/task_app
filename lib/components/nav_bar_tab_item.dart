import 'package:flutter/material.dart';
import 'package:task_app/constants/constatnts.dart';



class TabItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool isSelected;
  final GestureTapCallback onTap;
  const TabItem({Key? key, required this.text, this.icon, required this.isSelected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: isSelected ? mainColor : Colors.black,),
            Text(text, style: TextStyle(
                color: isSelected ? mainColor : Colors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 12
            ),)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}