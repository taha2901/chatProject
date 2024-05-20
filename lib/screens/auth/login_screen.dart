import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Logo(),
            const SizedBox(height: 20,),
            Text(
              'Welcome Back',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              'New Material Chat App With Taha',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Column(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
