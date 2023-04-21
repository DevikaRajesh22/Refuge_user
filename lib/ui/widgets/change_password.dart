import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'custom_alert_dialog.dart';
import 'custom_card.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({
    super.key,
  });

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  bool _isObscure = true, _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      isLoading: _isLoading,
      title: 'Change Password',
      message: 'Enter new password and confirm password to change the password',
      content: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          children: [
            CustomCard(
              child: TextFormField(
                controller: _passwordController,
                obscureText: _isObscure,
                validator: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter password';
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _isObscure = !_isObscure;
                      setState(() {});
                    },
                    icon: Icon(
                      _isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomCard(
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: _isObscure,
                validator: (value) {
                  if (value != null &&
                      value.trim().isNotEmpty &&
                      _passwordController.text.trim() == value) {
                    return null;
                  } else {
                    return "Passwords doesn't match";
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Confirm Password',
                ),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Change',
      primaryOnPressed: () async {
        try {
          if (_formKey.currentState!.validate()) {
            _isLoading = true;
            setState(() {});
            await Supabase.instance.client.auth.updateUser(
              UserAttributes(
                password: _passwordController.text.trim(),
              ),
            );
            _isLoading = false;
            setState(() {});
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        } catch (e) {
          showDialog(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: 'Failed!',
              message: e.toString(),
              primaryButtonLabel: 'Ok',
            ),
          );
        }
      },
      secondaryButtonLabel: 'Cancel',
    );
  }
}
