import 'package:chat/screens/chat/widgets/chat_message_card.dart';
import 'package:chat/screens/chat/widgets/field_msg_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nabil"),
            Text(
              "Last Seen 11:28 am",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.trash),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.copy),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ChatMessageCard(
                    index: index,
                  );
                },
              ),
            ),
            // Center(
            //   child: GestureDetector(
            //     child: Card(
            //       child: Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "👋",
            //               style: Theme.of(context).textTheme.displayMedium,
            //             ),
            //             const SizedBox(
            //               height: 16,
            //             ),
            //             Text(
            //               "Say Assalamu Alaikum",
            //               style: Theme.of(context).textTheme.bodyMedium,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const FieldMsgCard(),
          ],
        ),
      ),
    );
  }
}
