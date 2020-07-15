import 'package:flutter/material.dart';

class ActivityPerson extends StatefulWidget {
  @override
  _ActivityPersonState createState() => _ActivityPersonState();
}

class _ActivityPersonState extends State<ActivityPerson> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('我的约球'),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "我报名的",),
              Tab(text: "我发起的",)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(),
            Container()
          ],
        ),
      ),
    );
  }
}