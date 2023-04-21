import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:refuge_user/ui/screens/complaints_screen.dart';
import 'package:refuge_user/ui/screens/login_screen.dart';
import 'package:refuge_user/ui/screens/registration_screen.dart';
import 'package:refuge_user/ui/screens/suggestions_screen.dart';
import 'package:refuge_user/ui/widgets/custom_alert_dialog.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/change_password.dart';

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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // CustomSettingsButton(
                    //   onPressed: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => const RegisterScreen(),
                    //       ),
                    //     );
                    //   },
                    //   label: 'Edit Profile',
                    //   iconData: Icons.person,
                    // ),
                    // const SizedBox(height: 10),
                    CustomSettingsButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const ChangePasswordDialog(),
                        );
                      },
                      label: 'Change Password',
                      iconData: Icons.lock,
                    ),
                    const SizedBox(height: 10),
                    CustomSettingsButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ComplaintsScreen(),
                          ),
                        );
                      },
                      label: 'Complaints',
                      iconData: Icons.info,
                    ),
                    const SizedBox(height: 10),
                    CustomSettingsButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SuggestionsScreen(),
                          ),
                        );
                      },
                      label: 'Suggestions',
                      iconData: Icons.offline_bolt_rounded,
                    ),
                    const SizedBox(height: 10),
                    CustomSettingsButton(
                      onPressed: () {
                        launchUrl(Uri.parse('tel:10000'));
                      },
                      label: 'Call Hotline',
                      iconData: Icons.call,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 10),
                    CustomSettingsButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                            title: 'Logout',
                            message: 'Are you sure you want to logout?',
                            primaryButtonLabel: 'Logout',
                            primaryOnPressed: () async {
                              await Supabase.instance.client.auth.signOut();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            secondaryButtonLabel: 'Cancel',
                          ),
                        );
                      },
                      label: 'Logout',
                      iconData: Icons.logout,
                    ),
                  ],
                ),
              ),
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
