import 'dart:ui';

import 'package:ballfriend/widgets/activity_person.dart';
import 'package:ballfriend/widgets/login_person.dart';
import 'package:ballfriend/widgets/message_home.dart';
import 'package:ballfriend/widgets/opinion_person.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PersonPage extends StatefulWidget {
  String userName;
  PersonPage({Key key,this.userName}) : super (key: key);
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  DateTime _dateTime = DateTime.now();
  Color textColor = Colors.white;
  var textTopList = TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "签到成功");
          },
          child: Icon(Icons.event_available, color: Colors.white,),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MessageHome(),
                )
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.chat_bubble_outline, color: Colors.white,),
            )
          )
        ],
        elevation: 0.0,
      ),
      body: _body(context)
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: <Widget>[
         ClipPath(
          clipper: BottonClipper(),
          child: Container(
            color: Colors.green[400],
            height: 200,
          ),
        ),
        Column(
          children: <Widget> [
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 18.0),
              child: (widget.userName == null) ? ListTile(
                leading: ClipOval(
                  child: Image.asset('images/touxiang.jpg', height: 60, width: 60.0, fit: BoxFit.fill,),
                ),
                title: Text('你还没有登录哦', style: TextStyle(color: textColor, fontSize: 20.0),),
                subtitle: Text('Hey,一起来场友谊赛吧...', style: TextStyle(color: Colors.grey[300]),),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPerson(),
                    )
                  );
                },
              ) : ListTile(
                leading: ClipOval(
                  child: Image.asset('images/touxiang.jpg', height: 60, width: 60.0, fit: BoxFit.fill,),
                ),
                title: Text("球友${_dateTime.year}${_dateTime.minute}", style: TextStyle(color: textColor, fontSize: 20.0),),
                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.change_history, color: Colors.deepOrange[50],),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text('青铜会员', style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  _centerList(),
                  _bottomList(),
                ],
              ),
            )
          ]
        )
      ],
    );
  }

  Widget _centerList() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "您是第2${_dateTime.day}${_dateTime.minute}位球友");
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.equalizer, color: Colors.blueAccent,size: 40.0,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('登录评估', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('排名NO-2${_dateTime.day}${_dateTime.minute}', style: TextStyle(fontSize: 10.0)),
                        ],
                      )
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "您的评价是宅男  (多参加活动可以提升评价哦)");
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.fitness_center, color: Colors.blueAccent,size: 40.0,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('运动评估', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('宅男', style: TextStyle(fontSize: 10.0)),
                        ],
                      )
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

  Widget _bottomList() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assistant_photo, color: Colors.green[400],),
              title: Text('我的约球'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ActivityPerson()
                  )
                );
              }
            ),
            Divider(color: Colors.grey,),
            new ListTile(
              leading: Icon(Icons.border_color, color: Colors.green[400],),
              title: Text('意见反馈'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OpinionPerson()
                  )
                );
              },
            ),
            Divider(color: Colors.grey,),
            new ListTile(
              leading: Icon(Icons.touch_app, color: Colors.green[400],),
              title: Text('点赞评分'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Fluttertoast.showToast(msg: "谢谢您的点赞");
              },
            ),
          ],
        ),
      ),
    );
  }
}


class BottonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-50);

    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEndPont = Offset(size.width, size.height-50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
      firstEndPont.dx, firstEndPont.dy);
    path.lineTo(size.width, size.height-50);
    path.lineTo(size.width, 0);

    return path;                      
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false ;
  }
}