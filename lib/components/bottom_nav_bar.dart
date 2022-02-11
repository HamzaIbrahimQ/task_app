import 'package:flutter/material.dart';
import 'package:task_app/constants/constatnts.dart';
import 'nav_bar_tab_item.dart';




class NavBar extends StatefulWidget {
  int selectedPosition;
  NavBar({Key? key, required this.selectedPosition}) : super(key: key);
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: greyColor,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          elevation: 7.5,
          child: SizedBox(
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(width: 1.0,),
                TabItem(text: tabs[0], icon: Icons.home_outlined, isSelected: widget.selectedPosition == 0, onTap: () {
                  setState(() {
                    widget.selectedPosition = 0;
                  });
                },),
                TabItem(text: tabs[1], icon: Icons.shopping_bag_outlined, isSelected: widget.selectedPosition == 1, onTap: () {
                  setState(() {
                    widget.selectedPosition = 1;
                  });
                },),
                const SizedBox(width: 32,),
                TabItem(text: tabs[2], icon: Icons.apps_outlined, isSelected: widget.selectedPosition == 2, onTap: () {
                  setState(() {
                    widget.selectedPosition = 2;
                  });
                },),
                TabItem(text: tabs[3], icon: Icons.person_outline, isSelected: widget.selectedPosition == 3, onTap: () {
                  setState(() {
                    widget.selectedPosition = 3;
                  });
                },),
                const SizedBox(width: 1.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
