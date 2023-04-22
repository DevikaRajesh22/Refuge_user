import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_select_box.dart';

import '../../blocs/manage_emergency_services/manage_emergency_services_bloc.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';

class EmergencyServicesSelector extends StatefulWidget {
  final Function(int) onSelect;
  final String label;
  const EmergencyServicesSelector({
    super.key,
    required this.onSelect,
    this.label = 'Select Service',
  });

  @override
  State<EmergencyServicesSelector> createState() =>
      _EmergencyServicesSelectorState();
}

class _EmergencyServicesSelectorState extends State<EmergencyServicesSelector> {
  final ManageEmergencyServicesBloc manageEmergencyServicesBloc =
      ManageEmergencyServicesBloc();

  @override
  void initState() {
    manageEmergencyServicesBloc.add(GetAllEmergencyServiceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocProvider<ManageEmergencyServicesBloc>.value(
        value: manageEmergencyServicesBloc,
        child: BlocConsumer<ManageEmergencyServicesBloc,
            ManageEmergencyServicesState>(
          listener: (context, state) {
            if (state is ManageEmergencyServicesFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed!',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    manageEmergencyServicesBloc
                        .add(GetAllEmergencyServiceEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ManageEmergencyServicesSuccessState) {
              return CustomSelectBox(
                iconData: Icons.emergency,
                items: List<CustomSelectBoxItem>.generate(
                  state.services.length,
                  (index) => CustomSelectBoxItem(
                    value: state.services[index]['id'],
                    label: state.services[index]['name'],
                  ),
                ),
                label: widget.label,
                onChange: (selected) {
                  widget.onSelect(selected != null ? selected.value : 0);
                },
              );
            } else if (state is ManageEmergencyServicesFailureState) {
              return const SizedBox();
            } else {
              return const SizedBox(
                width: 100,
                child: SizedBox(
                  height: 2,
                  child: LinearProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
