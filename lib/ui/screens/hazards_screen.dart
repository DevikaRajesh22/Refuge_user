import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/blocs/manage_hazards/manage_hazards_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';
import 'package:refuge_user/ui/widgets/custom_select_box.dart';
import 'package:refuge_user/ui/widgets/member_selector.dart';
import 'package:refuge_user/util/value_validators.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_dropdown.dart';

class HazardScreen extends StatefulWidget {
  const HazardScreen({super.key});

  @override
  State<HazardScreen> createState() => _HazardScreenState();
}

class _HazardScreenState extends State<HazardScreen> {
  final ManageHazardsBloc manageHazardsBloc = ManageHazardsBloc();

  @override
  void initState() {
    super.initState();
    manageHazardsBloc.add(GetAllHazardsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black45),
        centerTitle: false,
        elevation: 1,
        title: Row(
          children: [
            const Icon(
              Icons.warning,
              color: Colors.red,
            ),
            const SizedBox(width: 10),
            Text(
              'Report Hazard',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddHazardForm(
              manageHazardsBloc: manageHazardsBloc,
            ),
          );
        },
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Hazard',
        ),
      ),
      body: BlocProvider<ManageHazardsBloc>.value(
        value: manageHazardsBloc,
        child: BlocConsumer<ManageHazardsBloc, ManageHazardsState>(
          listener: (context, state) {
            if (state is ManageHazardsFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  message: state.message,
                  primaryButtonLabel: 'Try Again',
                  primaryOnPressed: () {
                    manageHazardsBloc.add(GetAllHazardsEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Expanded(
                child: state is ManageHazardsSuccessState
                    ? state.hazards.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 100,
                            ),
                            itemCount: state.hazards.length,
                            itemBuilder: (context, index) => HazardItem(
                              hazardDetails: state.hazards[index],
                              manageHazardsBloc: manageHazardsBloc,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          )
                        : const Center(child: Text('No hazards found'))
                    : const Center(
                        child: CupertinoActivityIndicator(),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HazardItem extends StatelessWidget {
  final ManageHazardsBloc manageHazardsBloc;
  final dynamic hazardDetails;
  const HazardItem({
    super.key,
    required this.hazardDetails,
    required this.manageHazardsBloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.red[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${hazardDetails['id']}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      hazardDetails['level'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  hazardDetails['status'],
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: 'Delete?',
                        message: 'Are you sure you want to delete?',
                        primaryButtonLabel: 'Delete',
                        primaryOnPressed: () {
                          manageHazardsBloc.add(
                            DeleteHazardEvent(
                              hazardId: hazardDetails['id'],
                            ),
                          );
                          Navigator.pop(context);
                        },
                        secondaryButtonLabel: 'No',
                      ),
                    );
                  },
                  iconData: Icons.delete_forever,
                  color: Colors.red,
                )
              ],
            ),
            const Divider(),
            Text(
              hazardDetails['remarks'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            if (hazardDetails['accepted_by'] != null) const Divider(),
            if (hazardDetails['accepted_by'] != null)
              Text(
                'Accepted By',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
              ),
            if (hazardDetails['accepted_by'] != null) const SizedBox(height: 5),
            if (hazardDetails['accepted_by'] != null)
              Text(
                hazardDetails['accepted_by_details']['name'],
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}

class AddHazardForm extends StatefulWidget {
  final ManageHazardsBloc manageHazardsBloc;
  const AddHazardForm({
    super.key,
    required this.manageHazardsBloc,
  });

  @override
  State<AddHazardForm> createState() => _AddHazardFormState();
}

class _AddHazardFormState extends State<AddHazardForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _descC = TextEditingController();
  String level = 'moderate', memberLabel = 'Select Member';
  int memberId = 0;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Hazard',
      message: 'Enter the following details to add a hazard request.',
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: _descC,
              validator: alphaNumericValidator,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Description',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: MembersSelector(
                    label: memberLabel,
                    onSelect: (id) {
                      memberId = id;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomSelectBox(
              items: [
                CustomSelectBoxItem(
                  label: 'Moderate',
                  value: 'moderate',
                ),
                CustomSelectBoxItem(
                  label: 'Serious',
                  value: 'serious',
                ),
                CustomSelectBoxItem(
                  label: 'Extreme',
                  value: 'extreme',
                ),
              ],
              label: '$level Level',
              onChange: (item) {
                level = item != null ? item.value : 'moderate';
              },
              iconData: Icons.warning,
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (memberId != 0) {
            widget.manageHazardsBloc.add(
              AddHazardEvent(
                hazard: _descC.text.trim(),
                level: level,
                memberId: memberId,
              ),
            );
            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (context) => const CustomAlertDialog(
                title: 'Select Member',
                message: 'Please select member to continue',
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
