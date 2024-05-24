import 'package:chat/layout.dart';
import 'package:chat/screens/auth/forget_screen.dart';
import 'package:chat/screens/auth/setup_profile.dart';
import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/snack_bar.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailCon = TextEditingController();
    TextEditingController passCon = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Logo(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'New Material Chat App With Taha',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomField(
                    controller: emailCon,
                    lable: "Email",
                    icon: Iconsax.direct,
                  ),
                  CustomField(
                    controller: passCon,
                    lable: "Password",
                    icon: Iconsax.password_check,
                    isPass: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        child: const Text("Forget Password?"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetScreen(),
                              ));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        // print('Done');

                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailCon.text, password: passCon.text)
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Layout();
                              },
                            ),
                          );
                          return CustomSnackbar.show(context, 'Login is done');
                        }).onError((error, stackTrace) {
                          return CustomSnackbar.show(context, error.toString());
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Center(
                      child: Text(
                        "Login".toUpperCase(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () async {
                      // Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const SetupProfileScreen(),
                      //     ),
                      //     (route) => false);
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailCon.text, password: passCon.text)
                          .then((value) => print("Donne"))
                          .onError((error, stackTrace) {
                        return CustomSnackbar.show(context, error.toString());
                      });
                    },
                    child: Center(
                      child: Text(
                        "Create Account".toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground, // onBackground not background
                        ),
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
