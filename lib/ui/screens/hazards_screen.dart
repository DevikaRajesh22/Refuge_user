import 'package:flutter/material.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/custom_icon_button.dart';

import '../widgets/custom_alert_dialog.dart';
import '../widgets/custom_dropdown.dart';

class HazardScreen extends StatelessWidget {
  const HazardScreen({super.key});

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
            builder: (context) => const AddHazardForm(),
          );
        },
        backgroundColor: Colors.red,
        icon: const Icon(Icons.add),
        label: const Text(
          'Add Hazard',
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
          itemBuilder: (context, index) => HazardItem(),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ),
    );
  }
}

class HazardItem extends StatelessWidget {
  const HazardItem({
    super.key,
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
                      '#123123',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 2.5),
                    Text(
                      'Extreme',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                    ),
                  ],
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

class AddHazardForm extends StatelessWidget {
  const AddHazardForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Hazard',
      message: 'Enter the following details to add a hazard request.',
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
            label: 'Level',
            leadingIcon: Icons.warning,
            items: const [
              {
                'name': 'Extreme',
                'id': 1,
              },
              {
                'name': 'Serious',
                'id': 2,
              },
              {
                'name': 'Moderate',
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
