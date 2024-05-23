import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Iconsax.message_add),
      ),
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Card(
                      child: ListTile(
                        leading: CircleAvatar(),
                        title: Text("Name"),
                        subtitle: Text("Last Message"),
                        trailing: Badge(
                          // backgroundColor: kPrimaryColor ,
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          label: Text("3"),
                          largeSize: 30,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
