import 'dart:io';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.userId,
    this.avatarPath,
  });

  final String? avatarPath;
  final String userId;

  @override
  Widget build(BuildContext context) {
    File? file = avatarPath != null ? File(avatarPath!) : null;
    return file != null
        ? Image.file(
            file,
            fit: BoxFit.cover,
          )
        : RandomAvatar(userId);
  }
}
