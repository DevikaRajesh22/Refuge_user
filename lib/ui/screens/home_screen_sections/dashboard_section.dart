import 'package:flutter/material.dart';
import 'package:refuge_user/widgets/custom_button.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)]),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/hand.png',
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Care Team')
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomButton(
              label: 'Location',
              onTap: () {
                Navigator.of(context).pushNamed('/location');
              },
              isNormalButton: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomButton(
              label: 'Emergency',
              onTap: () {},
              isNormalButton: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomButton(
              label: 'Family',
              onTap: () {},
              isNormalButton: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomButton(
              label: 'Job',
              onTap: () {},
              isNormalButton: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomButton(
              label: 'Class',
              onTap: () {},
              isNormalButton: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: CustomButton(
              label: 'Review',
              onTap: () {},
              isNormalButton: true,
            ),
          ),
        ],
      ),
    );
  }
}
