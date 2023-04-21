import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_select_box.dart';

import '../../blocs/manage_disasters/manage_disasters_bloc.dart';
import '../../blocs/manage_members/manage_members_bloc.dart';
import 'custom_alert_dialog.dart';
import 'custom_card.dart';

class MembersSelector extends StatefulWidget {
  final Function(int) onSelect;
  final String label;
  const MembersSelector({
    super.key,
    required this.onSelect,
    this.label = 'Select Member',
  });

  @override
  State<MembersSelector> createState() => _MembersSelectorState();
}

class _MembersSelectorState extends State<MembersSelector> {
  final ManageMembersBloc manageMembersBloc = ManageMembersBloc();

  @override
  void initState() {
    manageMembersBloc.add(GetAllMembersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: BlocProvider<ManageMembersBloc>.value(
        value: manageMembersBloc,
        child: BlocConsumer<ManageMembersBloc, ManageMembersState>(
          listener: (context, state) {
            if (state is ManageMembersFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed!',
                  message: state.message,
                  primaryButtonLabel: 'Retry',
                  primaryOnPressed: () {
                    manageMembersBloc.add(GetAllMembersEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ManageMembersSuccessState) {
              return CustomSelectBox(
                iconData: Icons.person,
                items: List<CustomSelectBoxItem>.generate(
                  state.members.length,
                  (index) => CustomSelectBoxItem(
                    value: state.members[index]['id'],
                    label: state.members[index]['name'],
                  ),
                ),
                label: widget.label,
                onChange: (selected) {
                  widget.onSelect(selected != null ? selected.value : 0);
                },
              );
            } else if (state is ManageMembersFailureState) {
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
