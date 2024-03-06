import 'package:flutter/material.dart';

import './tabs/index.dart';
import './tabs/find.dart';
import './tabs/account.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;

  final List _pages = const [Index(), Find(), Account()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.filter_b_and_w), label: "发现"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
          ],
        ));
  }
}
