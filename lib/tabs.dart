import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/person_page.dart';
import 'pages/public_page.dart';


class Tabs extends StatefulWidget {
  String email;
  Tabs({Key key, this.email}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currendIndex = 0 ;
  List<Widget> pages = [];
  @override
  void initState() {
    super.initState();
    pages
    ..add(HomePage())
    ..add(PublicPage())
    ..add(PersonPage(userName: widget.email,));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currendIndex,children: pages,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currendIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currendIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('赛事')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("我的")
          )
        ],
      ),
    );
  }
}