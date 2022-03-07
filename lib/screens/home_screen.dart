import 'package:ecommerceapp/widgets/category_selector.dart';
import 'package:ecommerceapp/widgets/favoriteContacts.dart';
import 'package:ecommerceapp/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE33B2A),
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30,
          onPressed: () {},
        ),
        backgroundColor: const Color(0xFFE33B2A),
        title: const Text(
          "Chats",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const CategorySelector(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFF7EA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: const <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
