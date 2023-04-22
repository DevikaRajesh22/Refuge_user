import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/blocs/complaints/complaints_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';
import 'package:refuge_user/util/value_validators.dart';

import '../widgets/custom_alert_dialog.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final ComplaintsBloc complaintsBloc = ComplaintsBloc();

  @override
  void initState() {
    super.initState();
    complaintsBloc.add(GetAllComplaintsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComplaintsBloc>.value(
      value: complaintsBloc,
      child: BlocConsumer<ComplaintsBloc, ComplaintsState>(
        listener: (context, state) {
          if (state is ComplaintsFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed',
                message: state.message,
                primaryButtonLabel: 'Ok',
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: const BackButton(color: Colors.black45),
              centerTitle: false,
              elevation: 1,
              title: Text(
                'Complaints',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddComplaintForm(
                    complaintsBloc: complaintsBloc,
                  ),
                );
              },
              backgroundColor: Colors.blue[900],
              icon: const Icon(Icons.add),
              label: const Text(
                'Add Complaint',
              ),
            ),
            body: SafeArea(
              child: Expanded(
                child: state is ComplaintsSuccessState
                    ? state.complaints.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 100,
                            ),
                            itemCount: state.complaints.length,
                            itemBuilder: (context, index) => ComplaintsItem(
                              complaintDetails: state.complaints[index],
                              complaintsBloc: complaintsBloc,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          )
                        : const Center(child: Text('No complaints found'))
                    : const Center(
                        child: CupertinoActivityIndicator(),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ComplaintsItem extends StatelessWidget {
  final ComplaintsBloc complaintsBloc;
  final dynamic complaintDetails;
  const ComplaintsItem({
    super.key,
    required this.complaintsBloc,
    this.complaintDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: Colors.blue[50],
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
                Text(
                  '#${complaintDetails['id'].toString()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                const Expanded(child: SizedBox()),
                CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: 'Delete?',
                        message: 'Are you sure you want to delete?',
                        primaryButtonLabel: 'Delete',
                        primaryOnPressed: () {
                          complaintsBloc.add(
                            DeleteComplaintsEvent(
                              complaintId: complaintDetails['id'],
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
              complaintDetails['complaint'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddComplaintForm extends StatefulWidget {
  final ComplaintsBloc complaintsBloc;
  const AddComplaintForm({
    super.key,
    required this.complaintsBloc,
  });

  @override
  State<AddComplaintForm> createState() => _AddComplaintFormState();
}

class _AddComplaintFormState extends State<AddComplaintForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _desC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Complaint',
      message: 'Enter the following details to add Complaint.',
      content: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _desC,
              validator: alphaNumericValidator,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Complaint',
                prefixIcon: Icon(Icons.description),
              ),
            ),
          ],
        ),
      ),
      primaryButtonLabel: 'Add',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          widget.complaintsBloc.add(
            AddComplaintsEvent(
              complaint: _desC.text.trim(),
            ),
          );
          Navigator.pop(context);
        }
      },
      secondaryButtonLabel: 'Cancel',
    );
  }
}
