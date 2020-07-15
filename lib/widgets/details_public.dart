import 'package:flutter/material.dart';

class DetailsPublic extends StatelessWidget {
  List list;
  int index;
  DetailsPublic({this.list, this.index});
  var blackText = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(list[index]['title']),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _body(),
    );
  }
  
  Widget _body() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 18.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(list[index]['title1'], style: TextStyle(fontWeight: FontWeight.bold),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('报名中', style: TextStyle(color: Colors.white),),
                  )
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(list[index]['img1'], fit: BoxFit.fill,width: double.infinity, height: 150,),
          ),
          _bottomList()
        ],
      ),
    );
  }

  Widget _bottomList() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('主办单位', style: blackText,),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Text(list[index]['zbdw']),
          ),
          Text('承办单位', style: blackText),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Text(list[index]['xbdw']),
          ),
          Text('协办单位', style: blackText),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 18.0),
            child: Text('暂无'),
          ),
          Text('竞赛时间和地点', style: blackText,),
          Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text("比赛时间:  ${list[index]['time']}"),
          ),
          Text('比赛地点:  ${list[index]['address']}')
        ],
      ),
    );
  }
}