import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/dashboard_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/notification_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/profile_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController =
      TabController(length: 3, vsync: this, initialIndex: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          NotificationSection(),
          DashboardSection(),
          ProfileSection(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue[900],
        child: CustomBottomNavBar(
          selectedIndex: tabController.index,
          onChanged: (int index) {
            tabController.animateTo(index);
            setState(() {});
          },
        ),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;
  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        NavBarButton(
          iconData: Icons.notifications_outlined,
          selectedIconData: Icons.notifications,
          onPressed: () {
            onChanged(0);
          },
          isSelected: selectedIndex == 0,
        ),
        NavBarButton(
          iconData: Icons.home_outlined,
          selectedIconData: Icons.home,
          onPressed: () {
            onChanged(1);
          },
          isSelected: selectedIndex == 1,
        ),
        NavBarButton(
          iconData: Icons.person_outline,
          selectedIconData: Icons.person,
          onPressed: () {
            onChanged(2);
          },
          isSelected: selectedIndex == 2,
        ),
      ],
    );
  }
}

class NavBarButton extends StatelessWidget {
  final IconData iconData, selectedIconData;
  final Function() onPressed;
  final bool isSelected;
  const NavBarButton({
    Key? key,
    required this.iconData,
    required this.selectedIconData,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          isSelected ? selectedIconData : iconData,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
