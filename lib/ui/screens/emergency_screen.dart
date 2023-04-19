import 'package:flutter/material.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_dropdown.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

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
            builder: (context) => const AddEmergencyForm(),
          );
        },
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Emergency',
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
          itemBuilder: (context, index) => EmergencyItem(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}

class EmergencyItem extends StatelessWidget {
  const EmergencyItem({
    super.key,
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
                Text(
                  '#123123',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'Pending',
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
            const Divider(),
            Text(
              'Accepted By',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              'Some NGO Pvt.Ltd',
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

class AddEmergencyForm extends StatelessWidget {
  const AddEmergencyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Emergency Request',
      message: 'Enter the following details to add an emergency request.',
      content: Column(
        children: [
          TextFormField(
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Description',
              prefixIcon: Icon(Icons.description),
            ),
          ),
          const SizedBox(height: 10),
          CustomDropdownButton(
            label: 'Member',
            leadingIcon: Icons.people,
            items: const [
              {
                'name': 'name',
                'id': 1,
              },
              {
                'name': 'name',
                'id': 2,
              },
              {
                'name': 'name',
                'id': 3,
              },
              {
                'name': 'name',
                'id': 4,
              },
            ],
            onChange: (item) {},
          ),
          const SizedBox(height: 10),
          CustomDropdownButton(
            label: 'Service',
            leadingIcon: Icons.warning,
            items: const [
              {
                'name': 'Blood',
                'id': 1,
              },
              {
                'name': 'Food',
                'id': 2,
              },
              {
                'name': 'Cloths',
                'id': 3,
              },
            ],
            onChange: (item) {},
          )
        ],
      ),
      primaryButtonLabel: 'Add',
      secondaryButtonLabel: 'Cancel',
    );
  }
}
