import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../bean/chat_data_json.dart';
import '../my_theme/theme.dart';
import 'chat_detail_page.dart';

/// Created by Alex.Ling on 03/10/2024.
/// Description: chat_page
/// For chat_app_ui
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        "Chats",
        style:
            TextStyle(fontSize: 20, color: white, fontWeight: FontWeight.w500),
      ),
      leading: const IconButton(
          onPressed: null,
          icon: Text(
            "Edit",
            style: TextStyle(
                fontSize: 16, color: primary, fontWeight: FontWeight.w500),
          )),
      actions: const [
        IconButton(
            onPressed: null,
            icon: Icon(
              LineIcons.edit,
              color: primary,
            ))
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: const BoxDecoration(color: greyColor),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      style: const TextStyle(color: white),
                      cursorColor: primary,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            LineIcons.search,
                            color: white.withOpacity(0.3),
                          ),
                          hintText: "Search for messages or users",
                          hintStyle: TextStyle(
                              color: white.withOpacity(0.3), fontSize: 17)),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          getListChats()
        ],
      ),
    );
  }

  Widget getListChats() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(chat_data.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatDetailPage(
                        name: chat_data[index]['name'],
                        img: chat_data[index]['img'])));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(chat_data[index]['img']),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: (size.width - 40) * 0.6,
                              child: Text(
                                chat_data[index]['name'],
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                                maxLines: 2,
                              ),
                            ),
                            Text(
                              chat_data[index]['date'],
                              style: TextStyle(
                                  fontSize: 14, color: white.withOpacity(0.4)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: (size.width - 40) * 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Flexible(child:  Text(
                               chat_data[index]['text'],
                               style: TextStyle(
                                 fontSize: 15,
                                 height: 1.3,
                                 color: white.withOpacity(0.3),),
                               overflow: TextOverflow.ellipsis,
                             ),),
                              chat_data[index]['badge'] > 0
                                  ? Badge(
                                textColor: primary,
                                label: Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Text(
                                    chat_data[index]['badge'].toString(),
                                    style: const TextStyle(color: white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                                  : Container()
                            ],
                          ),
                        ),
                        Divider(
                          color: white.withOpacity(0.3),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
