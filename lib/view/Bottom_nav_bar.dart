// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:todoapp/Add.dart';
// import 'package:todoapp/Calender.dart';
// import 'package:todoapp/Home.dart';
// import 'package:todoapp/Bell.dart';
// import 'package:todoapp/Setting.dart';

// class Bottom_nav_bar extends StatefulWidget {
//   const Bottom_nav_bar({super.key});

//   @override
//   State<Bottom_nav_bar> createState() => _Bottom_nav_barState();
// }

// class _Bottom_nav_barState extends State<Bottom_nav_bar> {
//   int a = 0;
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> items = [Home(), Calender(), Add(), Bell(), Setting()];
//     return Scaffold(
//       backgroundColor: Colors.black,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.07,
//           child: BottomNavigationBar(
//             unselectedItemColor: Colors.white,
//             selectedItemColor: Colors.white,
//             showUnselectedLabels: true,
//             showSelectedLabels: true,
//             onTap: (current) {
//               a = current;
//               setState(() {});
//             },
//             currentIndex: a,
//             items: [
//               ...List.generate(
//                   4,
//                   (index) => BottomNavigationBarItem(
//                       backgroundColor: Colors.grey,
//                       icon: Icon(
//                         Icons.home_filled,
//                       ),
//                       label: a == index ? "." : ""))
//               // BottomNavigationBarItem(
//               //     backgroundColor: Colors.grey,
//               //     icon: Icon(
//               //       Icons.home_filled,
//               //     ),
//               //     label: ""),
//               // BottomNavigationBarItem(
//               //     icon: Icon(Icons.calendar_month_rounded), label: ""),
//               // BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
//               // BottomNavigationBarItem(
//               //     icon: Icon(Icons.notifications_none_outlined), label: ""),
//               // BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
//             ],
//           ),
//         ),
//       ),
//       body: items[a],
//     );
//   }
// }dddsss

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/services/color_theme.dart';
import 'package:todoapp/utils/navigate.dart';
import 'package:todoapp/view/screens/Add.dart';
import 'package:todoapp/view/screens/Home.dart';
import 'package:todoapp/view/screens/Setting.dart';

class Bottom_nav_bar extends StatefulWidget {
  const Bottom_nav_bar({super.key});

  @override
  State<Bottom_nav_bar> createState() => _Bottom_nav_barState();
}

class _Bottom_nav_barState extends State<Bottom_nav_bar> {
  int a = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      Home(),
      // Calender(),
      // Add(),
      // Bell(),
      Setting()
    ];
    return Scaffold(
      backgroundColor: Clr.black,
      bottomNavigationBar: Stack(alignment: Alignment.topCenter, children: [
        DotNavigationBar(
            backgroundColor: const Color.fromARGB(255, 75, 75, 75),
            unselectedItemColor: Clr.white.withOpacity(0.5),
            curve: Curves.decelerate,
            splashColor: Clr.noclr,
            selectedItemColor: Clr.white,
            onTap: (current) {
              a = current;
              setState(() {});
            },
            currentIndex: a,
            items: [
              DotNavigationBarItem(icon: Icon(Icons.home_filled)),
              // DotNavigationBarItem(icon: Icon(Icons.calendar_month_rounded)),
              // DotNavigationBarItem(icon: CircleAvatar(child: Icon(Icons.add))),
              // DotNavigationBarItem(
              //     icon: Icon(Icons.notifications_none_outlined)),
              DotNavigationBarItem(icon: Icon(Icons.settings))
            ]),
        // CircleAvatar(
        //   radius: 25.r,
        //   backgroundColor: Clr.orang,
        //   child: IconButton(
        //       onPressed: () {
        //         Navigate.push(context, Add());
        //       },
        //       icon: Icon(
        //         Icons.add,
        //         color: Clr.black,
        //         size: 30,
        //       )),
        // ),
        FloatingActionButton(
            heroTag: HeroFlightDirection.push,
            backgroundColor: Clr.orang,
            onPressed: () {
              Navigate.push(context, Add());
            },
            child: Icon(
              Icons.add,
              color: Clr.black,
              size: 25,
            ))
      ]),
      body: items[a],
    );
  }
}
