import 'package:ecommerceapp/models/message.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    return Row(
      children: [
        Container(
          width: isMe
              ? (MediaQuery.of(context).size.width - 80)
              : MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: isMe ? Colors.red : const Color(0xFFFFEFEE),
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15))
                  : const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
          margin: isMe
              ? const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 80,
                )
              : const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey),
              ),
              const SizedBox(height: 8.0),
              Text(message.text),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        ),
        isMe
            ? SizedBox.shrink()
            : message.isLiked
                ? (const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
                : const Icon(Icons.favorite_border),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
        title: Text(
          widget.user.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: ((context, index) {
                    final Message message = messages[index];
                    bool isMe = messages[index].sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  }),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 70,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.red,
                      size: 25,
                    )),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "send a messsage",
                  ),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.red,
                      size: 25,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
