import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/snack_bar.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
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
              'Reset Password',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'Please Enter Your Email',
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
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailCon.text)
                          .then((value) {
                        Navigator.pop(context);
                        return CustomSnackbar.show(
                            context, 'email sent , check your email');
                      }).onError((error, stackTrace) {
                        return CustomSnackbar.show(context, error.toString());
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: kPrimaryColor,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Center(
                      child: Text(
                        "Send Email".toUpperCase(),
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
