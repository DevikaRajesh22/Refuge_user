import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:refuge_user/blocs/notifications/notifications_bloc.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';

import '../../widgets/custom_alert_dialog.dart';

class NotificationSection extends StatefulWidget {
  const NotificationSection({super.key});

  @override
  State<NotificationSection> createState() => _NotificationSectionState();
}

class _NotificationSectionState extends State<NotificationSection> {
  final NotificationsBloc notificationsBloc = NotificationsBloc();
  @override
  void initState() {
    super.initState();
    notificationsBloc.add(GetAllNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<NotificationsBloc>.value(
        value: notificationsBloc,
        child: BlocConsumer<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            if (state is NotificationsFailureState) {
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
                  'Notifications',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                const Divider(height: 1),
                Expanded(
                  child: state is NotificationsSuccessState
                      ? state.notifications.isNotEmpty
                          ? ListView.separated(
                              padding: const EdgeInsets.only(
                                top: 20,
                                left: 20,
                                right: 20,
                                bottom: 100,
                              ),
                              itemCount: state.notifications.length,
                              itemBuilder: (context, index) => NotificationItem(
                                notificationDetails: state.notifications[index],
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                            )
                          : const Center(child: Text('No notifications found'))
                      : const Center(
                          child: CupertinoActivityIndicator(),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final dynamic notificationDetails;
  const NotificationItem({
    super.key,
    required this.notificationDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notificationDetails['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              notificationDetails['message'],
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              DateFormat('hh:mm a dd/MM/yyyy').format(
                  DateTime.parse(notificationDetails['created_at']).toLocal()),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
