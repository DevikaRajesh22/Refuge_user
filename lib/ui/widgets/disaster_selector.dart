import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/manage_disasters/manage_disasters_bloc.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';

class DisastersSelector extends StatefulWidget {
  final Function(int) onSelect;
  final int selecteDisaster;
  const DisastersSelector({
    super.key,
    required this.onSelect,
    this.selecteDisaster = 0,
  });

  @override
  State<DisastersSelector> createState() => _DisastersSelectorState();
}

class _DisastersSelectorState extends State<DisastersSelector> {
  final ManageDisastersBloc departmentBloc = ManageDisastersBloc();

  @override
  void initState() {
    departmentBloc.add(GetAllDisasterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocProvider<ManageDisastersBloc>.value(
        value: departmentBloc,
        child: BlocConsumer<ManageDisastersBloc, ManageDisastersState>(
          listener: (context, state) {
            if (state is ManageDisastersFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed!',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    departmentBloc.add(GetAllDisasterEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ManageDisastersSuccessState) {
              return DropdownMenu<dynamic>(
                leadingIcon: const Icon(Icons.landscape),
                hintText: 'Select Disaster',
                initialSelection: widget.selecteDisaster,
                onSelected: (value) {
                  if (value != null) {
                    widget.onSelect(value);
                  }
                },
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                dropdownMenuEntries: [
                  ...List<DropdownMenuEntry>.generate(
                    state.disasters.length,
                    (index) => DropdownMenuEntry(
                      value: state.disasters[index]['id'],
                      label: state.disasters[index]['name'],
                    ),
                  ),
                ],
              );
            } else if (state is ManageDisastersFailureState) {
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
