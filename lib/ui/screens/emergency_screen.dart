import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';
import 'package:refuge_user/ui/widgets/custom_select_box.dart';
import 'package:refuge_user/ui/widgets/emergency_service_selector.dart';
import 'package:refuge_user/ui/widgets/member_selector.dart';
import 'package:refuge_user/util/value_validators.dart';

import '../../blocs/manage_emergency_service_requests/manage_emergency_service_requests_bloc.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_dropdown.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({super.key});

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final ManageEmergencyServiceRequestsBloc manageEmergencysBloc =
      ManageEmergencyServiceRequestsBloc();

  @override
  void initState() {
    super.initState();
    manageEmergencysBloc.add(GetAllEmergencyServiceRequestsEvent());
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
              Icons.report,
              color: Colors.orange,
            ),
            const SizedBox(width: 10),
            Text(
              'Report Emergency',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.orange,
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
            builder: (context) => AddEmergencyForm(
              manageEmergencysBloc: manageEmergencysBloc,
            ),
          );
        },
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Emergency',
        ),
      ),
      body: BlocProvider<ManageEmergencyServiceRequestsBloc>.value(
        value: manageEmergencysBloc,
        child: BlocConsumer<ManageEmergencyServiceRequestsBloc,
            ManageEmergencyServiceRequestsState>(
          listener: (context, state) {
            if (state is ManageEmergencyServiceRequestFailureState) {
              showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                  title: 'Failed',
                  message: state.message,
                  primaryButtonLabel: 'Try Again',
                  primaryOnPressed: () {
                    manageEmergencysBloc
                        .add(GetAllEmergencyServiceRequestsEvent());
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Expanded(
                child: state is ManageEmergencyServiceRequestSuccessState
                    ? state.serviceRequests.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 100,
                            ),
                            itemCount: state.serviceRequests.length,
                            itemBuilder: (context, index) => EmergencyItem(
                              serviceDetails: state.serviceRequests[index],
                              manageEmergencysBloc: manageEmergencysBloc,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          )
                        : const Center(child: Text('No requests found'))
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

class EmergencyItem extends StatelessWidget {
  final ManageEmergencyServiceRequestsBloc manageEmergencysBloc;
  final dynamic serviceDetails;
  const EmergencyItem({
    super.key,
    required this.serviceDetails,
    required this.manageEmergencysBloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.orange[50],
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
                      '#${serviceDetails['id']}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      serviceDetails['service']['name'],
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Text(
                  serviceDetails['status'],
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
                          manageEmergencysBloc.add(
                            DeleteEmergencyServiceRequestEvent(
                              serviceRequestId: serviceDetails['id'],
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
              serviceDetails['remarks'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            if (serviceDetails['accepted_by'] != null) const Divider(),
            if (serviceDetails['accepted_by'] != null)
              Text(
                'Accepted By',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
              ),
            if (serviceDetails['accepted_by'] != null)
              const SizedBox(height: 5),
            if (serviceDetails['accepted_by'] != null)
              Text(
                serviceDetails['accepted_by_details']['name'],
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

class AddEmergencyForm extends StatefulWidget {
  final ManageEmergencyServiceRequestsBloc manageEmergencysBloc;
  const AddEmergencyForm({
    super.key,
    required this.manageEmergencysBloc,
  });

  @override
  State<AddEmergencyForm> createState() => _AddEmergencyFormState();
}

class _AddEmergencyFormState extends State<AddEmergencyForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _descC = TextEditingController();
  String memberLabel = 'Select Member', serviceLabel = "Select Service";
  int memberId = 0, serviceId = 0;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Emergency',
      message:
          'Enter the following details to add an emergency service request.',
      content: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: _descC,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter the description';
                }
              },
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
            Row(
              children: [
                Expanded(
                  child: EmergencyServicesSelector(
                    label: serviceLabel,
                    onSelect: (id) {
                      serviceId = id;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          if (memberId != 0 && serviceId != 0) {
            widget.manageEmergencysBloc.add(
              AddEmergencyServiceRequestEvent(
                remarks: _descC.text.trim(),
                memberId: memberId,
                serviceId: serviceId,
              ),
            );
            Navigator.pop(context);
          } else {
            showDialog(
              context: context,
              builder: (context) => const CustomAlertDialog(
                title: 'Select Member & Service',
                message: 'Please select a member and service to continue',
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
