import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // Import the iconsax package if needed

class NotificationIconButton extends StatelessWidget {
  final Function()? onPressed;

  const NotificationIconButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:const Icon(
        Iconsax.notification, // Use the notification icon from the iconsax package
        color: Colors.grey,
        size: 24.0, // Adjust the size as needed
      ),
      onPressed: onPressed,
    );
  }
}
