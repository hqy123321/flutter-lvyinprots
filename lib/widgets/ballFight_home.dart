import 'package:ballfriend/item/ballFight_item.dart';
import 'package:ballfriend/widgets/details_ballFight.dart';
import 'package:flutter/material.dart';

class BallFightHome extends StatefulWidget {
  @override
  _BallFightHomeState createState() => _BallFightHomeState();
}

class _BallFightHomeState extends State<BallFightHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('约球约战'),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: '全部',),
              Tab(text: '报名中',),
              Tab(text: '比赛中',),
              Tab(text: '已结束',),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            allActivity(),
            signUpActivity(),
            gamesActivity(),
            endActivity()
          ],
        ),
      ),
    );
  }

  allActivity() {
    List<Widget> items = [];
    for (int i = 0; i < ballFightLists.length; i++) {
      items.add(_ballFigthItem(i));
    }
   
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  Widget _ballFigthItem(int i) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsBallFight(i: i,),
          )
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ballFightLists[i]['id'] == "1" ? 
              _blueItem()
              : ballFightLists[i]['id'] == "2" ?
              _orangeItem() : _greyItem() ,
              Divider(color: Colors.grey,),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(ballFightLists[i]['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.room, color: Colors.grey, size: 15.0,),
                    Text(ballFightLists[i]['address'])
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.schedule, color: Colors.grey, size: 15.0,),
                    Text(ballFightLists[i]['time'])
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.flag, color: Colors.green[400],),
                        Text('${ballFightLists[i]['person']}人已报名', style: TextStyle(color: Colors.green[400]),)
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '>',
                            style: TextStyle(color: Colors.green[100],fontSize: 20.0)
                          ),
                          TextSpan(
                            text: '>',
                            style: TextStyle(color: Colors.green[200],fontSize: 20.0)
                          ),
                          TextSpan(
                            text: '>',
                            style: TextStyle(color: Colors.green[300],fontSize: 20.0)
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _blueItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text('报名中', style: TextStyle(color: Colors.white),),
      )
    );
  }

  Widget _orangeItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text('比赛中', style: TextStyle(color: Colors.white),),
      )
    );
  }

  Widget _greyItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text('已结束', style: TextStyle(color: Colors.white),),
      )
    );
  }

  signUpActivity() {
     List<Widget> items = [];
    for (int i = 0; i < ballFightLists.length; i++) {
      if (ballFightLists[i]['id'] == "1") {
        items.add(_ballFigthItem(i));
      }
    }
   
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  gamesActivity() {
    List<Widget> items = [];
    for (int i = 0; i < ballFightLists.length; i++) {
      if (ballFightLists[i]['id'] == "2") {
        items.add(_ballFigthItem(i));
      }
    }
   
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  endActivity() {
    List<Widget> items = [];
    for (int i = 0; i < ballFightLists.length; i++) {
      if (ballFightLists[i]['id'] == "3") {
        items.add(_ballFigthItem(i));
      }
    }
   
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

}