
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class FieldMsgCard extends StatelessWidget {
  const FieldMsgCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: TextField(
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.emoji_happy),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.camera),
                    ),
                  ],
                ),
                border: InputBorder.none,
                hintText: "Message",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ),
        IconButton.filled(
          onPressed: () {},
          icon: const Icon(Iconsax.send_1),
        ),
      ],
    );
  }
}
