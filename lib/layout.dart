import 'package:chat/screens/home/chat_home_screen.dart';
import 'package:chat/screens/home/contact_home_screen.dart';
import 'package:chat/screens/home/group_home_screen.dart';
import 'package:chat/screens/home/setting_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: const [
          ChatHomeScreen(),
          GroupHomeScreen(),
          ContactHomeScreen(),
          SettingHomeScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
          elevation: 0,
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
              pageController.jumpToPage(value);
            });
          },
          destinations: const [
            
            NavigationDestination(
              icon: Icon(Iconsax.message),
              label: "Chat",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.messages),
              label: "Group",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: "Contacts",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.setting),
              label: "Settings",
            ),
          ]),
    );
  }
}
