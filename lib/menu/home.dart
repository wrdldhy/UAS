import 'package:vity/menu/screen/planner.dart';
import 'package:vity/menu/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(Wbn());
}

class Wbn extends StatelessWidget {
  final List<Widget> screens = [
    HomeScreen(),
    const ProfileScreen(),
  ];
  var screenIndex = 0.obs;

  Wbn({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Material App",
        home: Obx(
          () => Scaffold(
            // appBar: AppBar(
            //title: const Text("Planner"),
            //),
            body: Center(
              child: screens[screenIndex.value],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: screenIndex.value,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.schedule), label: "planner"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ],
              onTap: ((value) {
                screenIndex.value = value;
              }),
            ),
          ),
        ));
  }
}
