import 'package:Expenza/core/utils/enums/icons.dart';
import 'package:Expenza/core/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class NavItem {
  final String title;
  final AppIcons icon;

  NavItem({required this.title, required this.icon});
}

class NavBar extends StatelessWidget {
  final List<NavItem> navItems;
  final Color iconColor;
  final Color backColor;
  final Color scaffoldColor;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.navItems,
    this.iconColor = Colors.black,
    this.backColor = Colors.white,
    this.scaffoldColor = Colors.transparent,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: _mainContainerDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 18,
          children: [_navBar()],
        ),
      ),
    );
  }

  Container _navBar() {
    return Container(
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: List.generate(navItems.length, (index) {
          return _navItem(index);
        }),
      ),
    );
  }

  Container _navItem(int index) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selectedIndex == index ? scaffoldColor : Colors.transparent,
      ),
      padding: EdgeInsets.all(15),
      child: InkWell(
        child: AppIcon(
          navItems[index].icon,
          style: selectedIndex == index ? IconStyles.bold : IconStyles.bulk,
        ),
      ),
    );
  }

  BoxDecoration _mainContainerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          scaffoldColor.withAlpha(0),
          scaffoldColor.withAlpha(204),
          scaffoldColor,
        ],
        stops: [0.0, 0.2, 1.0],
      ),
    );
  }
}
