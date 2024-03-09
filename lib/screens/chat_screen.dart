import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bot_app/data/remote/api/api_helper.dart';
import 'package:chat_bot_app/provider/chat_provider.dart';
import 'package:chat_bot_app/utils/util_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/remote/api/urls.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var promptController = TextEditingController();
  
  var dtFormat = DateFormat.Hm();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: Text('ChatBOT'),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<ChatProvider>(
            builder: (_, provider, child) {
              var listMsg = provider.getAllMessages();

              return ListView.builder(
                  reverse: true,
                  itemCount: listMsg.length,
                  itemBuilder: (_, index) {
                    var msgModel = listMsg[index];
                    
                    return msgModel.senderId == 1

                        /// chat bot ui
                        ? Container(
                            padding: EdgeInsets.all(11),
                            color: Colors.blue.shade200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.bgColor,
                                  radius: 25,
                                  child: Image.asset("assets/images/chat_reply.png", width: 17, height: 17),
                                ),
                                SizedBox(
                                  width: 11,
                                ),
                                Expanded(
                                  child: DefaultTextStyle(
                                    style: mTextStyle16(mColor: Colors.white),
                                    child: AnimatedTextKit(
                                      totalRepeatCount: 1,
                                      repeatForever: false,
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                            msgModel.msg,
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              ],
                            ))

                        /// user ui
                        : Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  msgModel.msg,
                                  style: mTextStyle16(mColor: Colors.grey),
                                ),
                                Text(dtFormat.format(DateTime.fromMillisecondsSinceEpoch(msgModel.sentAt)), style: mTextStyle12(mColor: Colors.grey),)
                              ],
                            ),
                          );
                  });
            },
          )),
          TextField(
            style: mTextStyle16(mColor: Colors.grey),
            controller: promptController,
            enableSuggestions: true,
            decoration: InputDecoration(
                fillColor: AppColors.secondaryColor,
                filled: true,
                hintText: "Write a Question..",
                prefixIcon: Icon(Icons.mic),
                suffixIcon: InkWell(
                    onTap: () {
                      Provider.of<ChatProvider>(context, listen: false)
                          .sendMyPrompt(prompt: promptController.text);
                      promptController.clear();
                    },
                    child: Icon(Icons.send)),
                hintStyle: mTextStyle16(mColor: AppColors.mGreyColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21))),
          )
        ],
      ),
    );
  }
}
