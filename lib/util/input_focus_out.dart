import 'package:flutter/material.dart';

void inputFocusOut(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
