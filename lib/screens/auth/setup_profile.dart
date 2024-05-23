import 'package:chat/screens/auth/login_screen.dart';
import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              },
              icon: const Icon(Iconsax.logout))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Hello Guys',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Please Enter Your Name',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomField(
                    controller: emailCon,
                    lable: "Name",
                    icon: Iconsax.user,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Center(
                      child: Text(
                        "Continue".toUpperCase(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
