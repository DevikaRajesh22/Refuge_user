import 'package:flutter/material.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';

import '../widgets/custom_alert_dialog.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            builder: (context) => const AddComplaintForm(),
          );
        },
        backgroundColor: Colors.blue[900],
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Complaint',
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 100,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => ComplaintsItem(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}

class ComplaintsItem extends StatelessWidget {
  const ComplaintsItem({
    super.key,
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
                  '#123123',
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
                      builder: (context) => const CustomAlertDialog(
                        title: 'Delete?',
                        message: 'Are you sure you want to delete?',
                        primaryButtonLabel: 'Delete',
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis nulla vestibulum, bibendum magna a, eleifend est. Suspendisse potenti. In hac habitasse platea dictumst. Proin in urna at felis dictum dignissim.',
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

class AddComplaintForm extends StatelessWidget {
  const AddComplaintForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Complaint',
      message: 'Enter the following details to add Complaint.',
      content: Column(
        children: [
          TextFormField(
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Complaint',
              prefixIcon: Icon(Icons.description),
            ),
          ),
        ],
      ),
      primaryButtonLabel: 'Add',
      secondaryButtonLabel: 'Cancel',
    );
  }
}
