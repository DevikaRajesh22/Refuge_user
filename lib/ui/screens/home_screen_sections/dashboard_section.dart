import 'package:flutter/material.dart';
import 'package:refuge_user/ui/screens/emergency_screen.dart';
import 'package:refuge_user/ui/screens/hazards_screen.dart';
import 'package:refuge_user/ui/widgets/custom_button.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 0,
              color: Colors.blue[50],
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.groups,
                        size: 50,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Stay Calm',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Dont worry, help is on the way. Add you family mambers to be found by Govt. or NGOs, Request emergency services or Report Hazard. Stay informed with our notifications.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(child: Divider()),
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 0,
              color: Colors.red[50],
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HazardScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.warning,
                        size: 50,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Report Hazard',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'If you are in danger, please report a hazard to get assistance immediately.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'VIEW AND REPORT HAZARD',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 0,
              color: Colors.orange[50],
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EmergencyScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.report,
                        size: 50,
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Emergency Service',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'If you are in need of any emeregency service, please request an emergency service now.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'VIEW AND REQUEST SERVICE',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
