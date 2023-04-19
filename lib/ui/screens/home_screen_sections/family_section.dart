import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';

import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_icon_button.dart';

class FamilySection extends StatelessWidget {
  const FamilySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Family Members',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Add yourself as a Family Member too.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(height: 15),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              itemBuilder: (context, index) => const MemberItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  const MemberItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#532452',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Member Name',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  '26 Male',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Flood 2023',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomIconButton(
                  iconData: Icons.edit,
                  onPressed: () {},
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  iconData: Icons.delete_forever,
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
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
