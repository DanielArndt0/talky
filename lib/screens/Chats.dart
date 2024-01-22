// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/components/AvatarImage.dart';
import 'package:talky_chat/components/ChatCard.dart';
import 'package:talky_chat/components/ContactCard.dart';
import 'package:talky_chat/components/Tabs.dart';
import 'package:talky_chat/components/UserAvatar.dart';
import 'package:talky_chat/controllers/interfaces/ChatsScreenController.dart';
import 'package:talky_chat/models/components/ChatPreviwModel.dart';
import 'package:talky_chat/models/components/ContactPreviewModel.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late final ChatsScreenController screenController;

  @override
  void initState() {
    screenController = context.read<ChatsScreenController>();
    screenController.initState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: screenController.fabOnPressed,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAvatar(
                    avatarAction: screenController.userAvatarOnPressed,
                    avatar: AvatarImage(
                      avatarPath: screenController.localUser.avatarPath,
                      userId: screenController.localUser.uuid!,
                    ),
                    status: screenController.localUser.availabilityStatus,
                    radius: 50,
                  ),
                  IconButton(
                    onPressed: screenController.searchOnPressed,
                    icon: const Icon(Icons.search_sharp),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Tabs(
                  tabPage: {
                    'Chat': _ChatTab(
                      screenController: screenController,
                    ),
                    'Contacts': _ContactsTab(
                      screenController: screenController,
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatTab extends StatelessWidget {
  const _ChatTab({
    super.key,
    required this.screenController,
  });

  final ChatsScreenController screenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const _Divider(),
            itemCount: screenController.chats.length,
            itemBuilder: (context, index) {
              final contact = screenController.chats[index];
              return ChatCard(
                onPressed: screenController.chatOnPressed,
                chat: ChatPreviewModel(
                  title: contact.name,
                  message: contact.messages!.last.message,
                  time: contact.messages!.last.timestamp,
                  avatar: RandomAvatar(contact.uuid),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _ContactsTab extends StatelessWidget {
  const _ContactsTab({
    super.key,
    required this.screenController,
  });

  final ChatsScreenController screenController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const _Divider(),
            itemCount: screenController.contacts.length,
            itemBuilder: (context, index) {
              final contact = screenController.contacts[index];
              return ContactCard(
                onPressed: screenController.contactOnPressed,
                contact: ContactPreviewModel(
                  title: contact.name,
                  status: contact.status,
                  avatar: RandomAvatar(contact.uuid),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 20,
      endIndent: 20,
      thickness: 0.5,
    );
  }
}
