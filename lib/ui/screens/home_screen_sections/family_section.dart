import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refuge_user/blocs/manage_members/manage_members_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';
import 'package:refuge_user/ui/widgets/label_with_text.dart';

import '../../../util/get_age.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_icon_button.dart';
import '../home_screen.dart';

class FamilySection extends StatefulWidget {
  const FamilySection({super.key});

  @override
  State<FamilySection> createState() => _FamilySectionState();
}

class _FamilySectionState extends State<FamilySection> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ManageMembersBloc>(context).add(GetAllMembersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ManageMembersBloc, ManageMembersState>(
        listener: (context, state) {
          if (state is ManageMembersFailureState) {
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
          return Column(
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
                child: state is ManageMembersSuccessState
                    ? state.members.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 100,
                            ),
                            itemCount: state.members.length,
                            itemBuilder: (context, index) => MemberItem(
                              memberDetails: state.members[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 10),
                          )
                        : const Center(child: Text('No members found'))
                    : const Center(
                        child: CupertinoActivityIndicator(),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  final dynamic memberDetails;
  const MemberItem({
    super.key,
    required this.memberDetails,
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
                  '#${memberDetails['id'].toString()}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  memberDetails['name'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${getAge(DateTime.parse(memberDetails['dob']))} ${memberDetails['gender']}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  memberDetails['phone'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  memberDetails['disaster']['name'],
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                if (memberDetails['camp_id'] != null) const Divider(height: 20),
                if (memberDetails['camp_id'] != null)
                  LabelWithText(
                    label: 'Camp',
                    text: memberDetails['camp']['name'],
                  ),
                if (memberDetails['camp_id'] != null) const SizedBox(height: 5),
                if (memberDetails['camp_id'] != null)
                  Text(
                    memberDetails['camp']['address'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
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
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AddMemberForm(
                        manageMembersBloc:
                            BlocProvider.of<ManageMembersBloc>(context),
                        memberDetails: memberDetails,
                      ),
                    );
                  },
                  color: Colors.orange,
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  iconData: Icons.delete_forever,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => CustomAlertDialog(
                        title: 'Delete?',
                        message: 'Are you sure you want to delete?',
                        primaryButtonLabel: 'Delete',
                        primaryOnPressed: () {
                          BlocProvider.of<ManageMembersBloc>(context).add(
                            DeleteMemberEvent(
                              memberId: memberDetails['id'],
                            ),
                          );
                          Navigator.pop(context);
                        },
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
