// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ReporthazardScreen extends StatelessWidget {
//   const ReporthazardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 70,
//         color: const Color.fromARGB(255, 2, 62, 138),
//         child: Padding(
//           padding: const EdgeInsetsDirectional.only(),
//           child: SizedBox(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 buildContainerBottomNav(Icons.notifications),
//                 buildContainerBottomNav(Icons.home, isSelected: true),
//                 buildContainerBottomNav(Icons.person),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: SafeArea(
//           child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: const Color.fromARGB(225, 2, 62, 138),
//           ),
//           Container(
//             height: 620,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//             ),
//           ),
//           Column(
//             children: [
//               const SizedBox(
//                 height: 100,
//               ),
//               Container(
//                 height: 450,
//                 width: 350,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 8)]),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Hazard Report Form',
//                       style: GoogleFonts.inriaSans(
//                           fontSize: 16.8,
//                           color: const Color.fromARGB(255, 166, 162, 162),
//                           fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               'Location of the',
//                               style: GoogleFonts.inriaSans(
//                                   fontSize: 16.8,
//                                   color:
//                                       const Color.fromARGB(255, 166, 162, 162),
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Text('Hazard',
//                                 style: GoogleFonts.inriaSans(
//                                     fontSize: 16.8,
//                                     color: const Color.fromARGB(
//                                         255, 166, 162, 162),
//                                     fontWeight: FontWeight.bold))
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 45,
//                         ),
//                         Container(
//                             height: 30,
//                             width: 180,
//                             decoration: const BoxDecoration(
//                                 color: Color.fromARGB(255, 217, 217, 217),
//                                 boxShadow: [
//                                   BoxShadow(color: Colors.grey, blurRadius: 0)
//                                 ]))
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('Date of event',
//                             style: GoogleFonts.inriaSans(
//                                 fontSize: 16.8,
//                                 color: const Color.fromARGB(255, 166, 162, 162),
//                                 fontWeight: FontWeight.bold)),
//                         const SizedBox(
//                           height: 45,
//                           width: 58,
//                         ),
//                         Container(
//                             height: 30,
//                             width: 180,
//                             decoration: const BoxDecoration(
//                                 color: Color.fromARGB(255, 217, 217, 217),
//                                 boxShadow: [
//                                   BoxShadow(color: Colors.grey, blurRadius: 0)
//                                 ]))
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Text('Choose Hazard',
//                             style: GoogleFonts.inriaSans(
//                                 fontSize: 16.8,
//                                 color: const Color.fromARGB(255, 166, 162, 162),
//                                 fontWeight: FontWeight.bold)),
//                         const SizedBox(
//                           height: 45,
//                           width: 49,
//                         ),
//                         Container(
//                             height: 30,
//                             width: 180,
//                             decoration: const BoxDecoration(
//                                 color: Color.fromARGB(255, 217, 217, 217),
//                                 boxShadow: [
//                                   BoxShadow(color: Colors.grey, blurRadius: 0)
//                                 ]))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(
//                       children: [
//                         Text('Children on site'),
//                         Expanded(
//                           child: ListTile(
//                             title: Text('yes'),
//                             leading: Radio(
//                                 value: 'yes',
//                                 groupValue: 'yes',
//                                 onChanged: (value) {}),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       )),
//     );
//   }

//   Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
//     return Container(
//       decoration: BoxDecoration(
//           color: isSelected
//               ? const Color.fromARGB(255, 151, 200, 240)
//               : const Color.fromARGB(255, 2, 62, 138),
//           shape: BoxShape.circle),
//       height: 50,
//       width: 50,
//       child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
//     );
//   }
// }
