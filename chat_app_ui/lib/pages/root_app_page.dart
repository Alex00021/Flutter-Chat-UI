import 'package:chat_app_ui/pages/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../my_theme/theme.dart';
import 'chat_page.dart';
import 'contact_page.dart';

/// Created by Alex.Ling on 03/10/2024.
/// Description: root_app_page
/// For chat_app_ui


class RootAppPage extends StatefulWidget {
  const RootAppPage({super.key});

  @override
  State<RootAppPage> createState() => _RootAppPageState();
}

class _RootAppPageState extends State<RootAppPage> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }


  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ContactPage(),
        ChatPage(),
        SettingPage()
      ],
    );
  }

  Widget getFooter() {
    List iconsItems = [
      // MaterialIcons.account_circle,
      Icons.account_circle,
      // Ionicons.ios_chatbubbles,
      Icons.mark_chat_unread_rounded,
      // MaterialIcons.settings,
      Icons.settings,
    ];
    List textItems = [
      "Contacts",
      "Chats",
      "Settings"
    ];

    return Container(
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: greyColor
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(iconsItems.length, (index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  index == 1 ? Badge(
                    label: const Text("3",style: TextStyle(
                        color:white
                    ),
                    ),
                    child:Icon(iconsItems[index],size: 30,color:pageIndex == index ? primary :white.withOpacity(0.5)) ,
                  ) : Icon(iconsItems[index],size: 30,color:pageIndex == index ? primary :white.withOpacity(0.5)),
                  const SizedBox(height: 3,),
                  Text(textItems[index],style: TextStyle(fontSize: 11,color:pageIndex == index ? primary : white.withOpacity(0.5)),)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
