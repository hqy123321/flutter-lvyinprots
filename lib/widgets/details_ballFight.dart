import 'dart:ui';

import 'package:ballfriend/item/ballFight_item.dart';
import 'package:ballfriend/widgets/create_details.dart';
import 'package:flutter/material.dart';


class DetailsBallFight extends StatefulWidget {
  int i;
  DetailsBallFight({Key key, this.i}) : super(key: key);
  @override
  _DetailsBallFightState createState() => _DetailsBallFightState(i);
}

class _DetailsBallFightState extends State<DetailsBallFight> {
  bool isButton = true;
  int i;
  _DetailsBallFightState(this.i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset('images/fengjing.jpg',width: double.infinity, height: 220, fit: BoxFit.fill,),
              ///磨砂
              // BackdropFilter(  
              //   filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              //   child: Opacity(
              //     opacity: 0.3,
              //     child: Container(
              //       width: double.infinity,
              //       height: 220,
              //       decoration: BoxDecoration(color: Colors.grey.shade200),
              //     ),
              //   ),
              // ),
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add_circle_outline, color: Colors.white,),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateDetails(),
                        )
                      );
                    },
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110, 15.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(ballFightLists[i]['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.white),),
                    Padding(
                      padding: EdgeInsets.only(top:10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.schedule, color: Colors.green[400], size: 15.0,),
                          Text("  ${ballFightLists[i]['time']}", style: TextStyle(color: Colors.green[400]),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:10.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.room, color: Colors.green[400], size: 15.0,),
                          Text("  ${ballFightLists[i]['address']}", style: TextStyle(color: Colors.green[400]),)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          _detailsList(),
        ],
      ),
    );
  }

  Widget _detailsList() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _topList(),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:_centerList()
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:_bottomList()
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child:_buttonList()
            ),
          ],
        ),
      ),
    );
  }

  Widget _topList() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('活动介绍', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            Divider(color: Colors.grey[400],),
            Text('组织者:  ${ballFightLists[i]['initiator']}'),
            Divider(color: Colors.grey[400],),
            Text('电话号码:  ${ballFightLists[i]['phone']}'),
            Divider(color: Colors.grey[400],),
            Text('报名用户:  ${ballFightLists[i]['person']}/12')
          ],
        ),
      ),
    );
  }

  Widget _centerList() {
    return Card(
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('活动说明:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
            Divider(color: Colors.grey[400]),
            Text(ballFightLists[i]['instructions'])
          ],
        ),
      ),
    );
  }

  Widget _bottomList() {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('留言板'),
                IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.border_color, color: Colors.grey, size: 15.0,),
                )
              ],
            ),
            Text('你可以正在这里发表或解答任何对该活动的疑问,例如:  活动现在已经有多少人了?')
          ],
        ),
      ),
    );
  }

  Widget _buttonList() {
    return isButton ? Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 3.0,
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        onPressed: () {
          setState(() {
            isButton = false ;
          });
        },
        child: Text("报名参加", style: TextStyle(color: Colors.white),),
      ),
    ) : Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 3.0,
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        onPressed: () {
          setState(() {
            isButton = true ;
          });
        },
        child: Text("已报名", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}