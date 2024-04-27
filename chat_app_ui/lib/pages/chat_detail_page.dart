import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bean/chat_data_json.dart';
import '../bean/custom_bubble.dart';
import '../my_theme/theme.dart';

/// Created by Alex.Ling on 03/10/2024.
/// Description: chat_detail_page
/// For chat_app_ui
class ChatDetailPage extends StatefulWidget {
  final String name;
  final String img;
  const ChatDetailPage({super.key, required this.name, required this.img});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      bottomNavigationBar: getBottomBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 17,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "last seen recently",
                    style: TextStyle(
                      fontSize: 12,
                      color: white.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: primary,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.img),
        )
      ],
    );
  }

  Widget getBottomBar() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.attachment,
              color: primary,
              size: 21,
            ),
            Container(
              width: size.width * 0.76,
              height: 32,
              decoration: BoxDecoration(
                  color: white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextField(
                  style: TextStyle(
                    color: white,
                  ),
                  cursorColor: primary,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      // suffixIcon: Icon(Icons.sticker_emoji,color: primary,size: 25,)
                      suffixIcon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: primary,
                        size: 25,
                      )),
                ),
              ),
            ),
            // Icon(Icons.microphone,color: primary,size: 28,)
            const Icon(
              Icons.mic_none_rounded,
              color: primary,
              size: 28,
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return ListView(
      padding: const EdgeInsets.only(top: 20, bottom: 80),
      children: List.generate(messages.length, (index) {
        return CustomBubbleChat(
            isMe: messages[index]['isMe'],
            message: messages[index]['message'],
            time: messages[index]['time'],
            isLast: messages[index]['isLast']);
      }),
    );
  }
}
