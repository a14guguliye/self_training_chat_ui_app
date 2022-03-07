import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> category_list = [
    'messages',
    'online',
    'requests',
    'groups'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE33B2A),
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category_list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Text(
                category_list[index],
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.2,
                    color: (index == selectedIndex)
                        ? Colors.white
                        : Colors.white60),
              ),
            ),
          );
        },
      ),
    );
  }
}
