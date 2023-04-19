import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Settings',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomSettingsButton(
                  onPressed: () {},
                  label: 'Edit Profile',
                  iconData: Icons.person,
                ),
                const SizedBox(height: 10),
                CustomSettingsButton(
                  onPressed: () {},
                  label: 'Change Password',
                  iconData: Icons.lock,
                ),
                const SizedBox(height: 10),
                CustomSettingsButton(
                  onPressed: () {},
                  label: 'Complaints',
                  iconData: Icons.info,
                ),
                const SizedBox(height: 10),
                CustomSettingsButton(
                  onPressed: () {},
                  label: 'Suggestions',
                  iconData: Icons.offline_bolt_rounded,
                ),
                const SizedBox(height: 10),
                CustomSettingsButton(
                  onPressed: () {},
                  label: 'Call Hotline',
                  iconData: Icons.call,
                  color: Colors.orange,
                ),
                const SizedBox(height: 10),
                CustomSettingsButton(
                  onPressed: () {},
                  label: 'Logout',
                  iconData: Icons.logout,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomSettingsButton extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;
  final String label;
  final Color? color;
  const CustomSettingsButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: onPressed,
      color: color?.withOpacity(.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 30,
              color: color ?? Colors.blue[900],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              size: 20,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
