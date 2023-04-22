import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/dashboard_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/family_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/notification_section.dart';
import 'package:refuge_user/ui/screens/home_screen_sections/profile_section.dart';
import 'package:refuge_user/ui/widgets/custom_dropdown.dart';
import 'package:refuge_user/ui/widgets/custom_select_box.dart';
import 'package:refuge_user/ui/widgets/disaster_selector.dart';
import 'package:refuge_user/util/value_validators.dart';

import '../../blocs/manage_members/manage_members_bloc.dart';
import '../widgets/custom_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ManageMembersBloc manageMembersBloc = ManageMembersBloc();
  late TabController tabController = TabController(
    length: 4,
    vsync: this,
    initialIndex: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ManageMembersBloc>.value(
        value: manageMembersBloc,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [
            NotificationSection(),
            DashboardSection(),
            FamilySection(),
            ProfileSection(),
          ],
        ),
      ),
      floatingActionButton: tabController.index == 2
          ? FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddMemberForm(
                    manageMembersBloc: manageMembersBloc,
                  ),
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

class AddMemberForm extends StatefulWidget {
  final ManageMembersBloc manageMembersBloc;
  final dynamic memberDetails;
  const AddMemberForm({
    super.key,
    required this.manageMembersBloc,
    this.memberDetails,
  });

  @override
  State<AddMemberForm> createState() => _AddMemberFormState();
}

class _AddMemberFormState extends State<AddMemberForm> {
  final TextEditingController _nameC = TextEditingController();
  final TextEditingController _phoneC = TextEditingController();
  final TextEditingController _dateC = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String gender = 'male';
  int disasterId = 0;
  String disasterLabel = 'Select Disaster';

  @override
  void initState() {
    super.initState();
    if (widget.memberDetails != null) {
      _nameC.text = widget.memberDetails['name'];
      _phoneC.text = widget.memberDetails['phone'];
      _dateC.text = DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(widget.memberDetails['dob']));
      gender = widget.memberDetails['gender'];
      disasterId = widget.memberDetails['disaster_id'];
      disasterLabel = widget.memberDetails['disaster']['name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Save Member',
      message: 'Enter the following details to save family member.',
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _nameC,
                validator: alphaNumericValidator,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phoneC,
                validator: phoneValidator,
                decoration: const InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dateC,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Select Date of Birth';
                  }
                },
                readOnly: true,
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (date != null) {
                    _dateC.text = DateFormat('yyyy-MM-dd').format(date);
                    setState(() {});
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Date of Birth',
                  prefixIcon: Icon(Icons.date_range),
                ),
              ),
              const SizedBox(height: 10),
              CustomSelectBox(
                items: [
                  CustomSelectBoxItem(label: 'Male', value: 'male'),
                  CustomSelectBoxItem(label: 'Female', value: 'female'),
                  CustomSelectBoxItem(label: 'Other', value: 'other'),
                ],
                label: gender,
                onChange: (value) {
                  gender = value != null ? value.value : 'male';
                  setState(() {});
                },
                iconData: Icons.people,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: DisastersSelector(
                      label: disasterLabel,
                      onSelect: (value) {
                        disasterId = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      primaryButtonLabel: 'Save',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (disasterId != 0) {
            if (widget.memberDetails != null) {
              widget.manageMembersBloc.add(
                EditMemberEvent(
                  memberId: widget.memberDetails['id'],
                  name: _nameC.text.trim(),
                  phone: _phoneC.text.trim(),
                  dob: _dateC.text.trim(),
                  gender: gender,
                  disasterId: disasterId,
                ),
              );
            } else {
              widget.manageMembersBloc.add(
                AddMemberEvent(
                  name: _nameC.text.trim(),
                  phone: _phoneC.text.trim(),
                  dob: _dateC.text.trim(),
                  gender: gender,
                  disasterId: disasterId,
                ),
              );
            }

            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (context) => const CustomAlertDialog(
                title: 'Select Disaster',
                message: 'Please select disaster to continue',
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        }
      },
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
