import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/dashboard_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/family_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/notification_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/profile_section.dart';
import 'package:refuge_user/ui/widgets/custom_dropdown.dart';

import '../widgets/custom_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          NotificationSection(),
          DashboardSection(),
          FamilySection(),
          ProfileSection(),
        ],
      ),
      floatingActionButton: tabController.index == 2
          ? FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AddMemberForm(),
                );
              },
              label: const Text(
                'Add Member',
              ),
              icon: const Icon(
                Icons.add,
              ),
              backgroundColor: Colors.blue[900],
            )
          : null,
      bottomNavigationBar: Material(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.blue[900],
        elevation: 10,
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

class AddMemberForm extends StatelessWidget {
  const AddMemberForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Member',
      message: 'Enter the following details to add a family member.',
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            readOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
            },
            decoration: const InputDecoration(
              hintText: 'Date of Birth',
              prefixIcon: Icon(Icons.date_range),
            ),
          ),
          const SizedBox(height: 10),
          CustomDropdownButton(
            label: 'Gender',
            leadingIcon: Icons.people,
            items: const [
              {
                'name': 'Male',
                'value': 'male',
              },
              {
                'name': 'Female',
                'id': 'female',
              },
              {
                'name': 'Other',
                'id': 'other',
              },
            ],
            onChange: (item) {},
          ),
          const SizedBox(height: 10),
          CustomDropdownButton(
            label: 'Disaster',
            leadingIcon: Icons.warning,
            items: const [
              {
                'name': 'name',
                'id': 1,
              },
              {
                'name': 'name',
                'id': 2,
              },
              {
                'name': 'name',
                'id': 3,
              },
              {
                'name': 'name',
                'id': 4,
              },
            ],
            onChange: (item) {},
          )
        ],
      ),
      primaryButtonLabel: 'Add',
      secondaryButtonLabel: 'Cancel',
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
          label: 'Notifcations',
          iconData: Icons.notifications_outlined,
          selectedIconData: Icons.notifications,
          onPressed: () {
            onChanged(0);
          },
          isSelected: selectedIndex == 0,
        ),
        NavBarButton(
          label: 'Home',
          iconData: Icons.home_outlined,
          selectedIconData: Icons.home,
          onPressed: () {
            onChanged(1);
          },
          isSelected: selectedIndex == 1,
        ),
        NavBarButton(
          label: 'Family',
          iconData: Icons.people_outline,
          selectedIconData: Icons.people,
          onPressed: () {
            onChanged(2);
          },
          isSelected: selectedIndex == 2,
        ),
        NavBarButton(
          label: 'Settings',
          iconData: Icons.settings_outlined,
          selectedIconData: Icons.settings,
          onPressed: () {
            onChanged(3);
          },
          isSelected: selectedIndex == 3,
        ),
      ],
    );
  }
}

class NavBarButton extends StatelessWidget {
  final IconData iconData, selectedIconData;
  final String label;
  final Function() onPressed;
  final bool isSelected;
  const NavBarButton({
    Key? key,
    required this.iconData,
    required this.selectedIconData,
    required this.onPressed,
    required this.isSelected,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Icon(
                isSelected ? selectedIconData : iconData,
                size: 24,
                color: Colors.white,
              ),
              if (isSelected) const SizedBox(width: 5),
              if (isSelected)
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
