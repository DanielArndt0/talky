// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/components/Avatar.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.radius,
    this.name,
    this.status,
    this.statusIcon,
    this.statusAction,
    this.avatar,
    this.avatarAction,
  });

  final double radius;
  final String? name;
  final AvailabilityStatus? status;
  final Widget? statusIcon;
  final void Function()? statusAction;
  final Widget? avatar;
  final void Function()? avatarAction;

  Widget splash(void Function()? onTap) => Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.1),
          child: Ink(),
        ),
      );

  String nameValidation() {
    if (name != null) {
      if (name!.isNotEmpty && name!.length < 2) {
        return name!.substring(0, 1);
      } else if (name!.length >= 2) {
        return name!.substring(0, 2);
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = AppColors.userAvatarBackgrounds;
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            height: radius,
            width: radius,
            child: Stack(
              children: [
                Avatar(
                  radius: radius,
                  color: colors[Random().nextInt(colors.length)],
                  avatar: avatar != null
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(radius)),
                          child: avatar,
                        )
                      : Center(
                          child: FittedBox(
                            child: Text(
                              nameValidation().toUpperCase().trim(),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: radius * 0.5,
                              ),
                            ),
                          ),
                        ),
                ),
                splash(avatarAction),
              ],
            ),
          ),
          status == null
              ? const SizedBox()
              : Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    height: radius * 0.25,
                    width: radius * 0.25,
                    child: Stack(
                      children: [
                        Container(
                          height: radius * 0.25,
                          width: radius * 0.25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: status!.color,
                          ),
                          child: Center(child: statusIcon),
                        ),
                        splash(statusAction),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
