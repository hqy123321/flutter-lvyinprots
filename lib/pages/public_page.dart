import 'package:ballfriend/item/public_item.dart';
import 'package:ballfriend/widgets/details_public.dart';
import 'package:flutter/material.dart';

class PublicPage extends StatefulWidget {
  @override
  _PublicPageState createState() => _PublicPageState();
}

class _PublicPageState extends State<PublicPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text('热门联赛'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: '全部'),
              Tab(text: '篮球'),
              Tab(text: '足球'),
              Tab(text: '羽毛球'),
              Tab(text: '兵乓球'),
              Tab(text: '高尔夫',)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            allballList(),
            basketball(),
            football(),
            badminton(),
            bpballs(),
            golfball()
          ],
        ),
      ),
    );
  }

  allballList() {
    List<Widget> items = [];
    for (int i = 0; i < ballgames.length; i++) {
      items.add(_allballItem(i));
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  Widget _allballItem(int i) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> DetailsPublic(list: ballgames,index: i,)
          )
        );
      },
      child:Card(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 135.0,
                width: 110.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(ballgames[i]['img2'], fit: BoxFit.fill,),
                ),
              ),
              Expanded(
                child: Container(
                  height: 135,
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(ballgames[i]['title1'], style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.schedule, color: Colors.grey, size: 15.0,),
                            Text(ballgames[i]['time']),
                          ],
                        )
                      ),    
                      Row(
                        children: <Widget>[
                          Icon(Icons.room, color: Colors.grey, size: 15.0,),
                          Text(ballgames[i]['address'])
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(''),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.red
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(ballgames[i]['title'], style: TextStyle(color: Colors.white),),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }

  basketball() {
    List<Widget> items = [];
    for (int i = 0; i < ballgames.length; i++) {
      if (ballgames[i]['title'] == "篮球") {
        items.add(_allballItem(i));
      }
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  football() {
    List<Widget> items = [];
    for (int i = 0; i < ballgames.length; i++) {
      if (ballgames[i]['title'] == "足球") {
        items.add(_allballItem(i));
      }
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }
  badminton() {
    List<Widget> items = [];
    for (int i = 0; i < ballgames.length; i++) {
      if (ballgames[i]['title'] == "羽毛球") {
        items.add(_allballItem(i));
      }
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  bpballs() {
    List<Widget> items = [];
    for (int i = 0; i < ballgames.length; i++) {
      if (ballgames[i]['title'] == "兵乒球") {
        items.add(_allballItem(i));
      }
    }
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: ListView(
        children: items
      ),
    );
  }

  golfball() {
    List<Widget> items = [];
    for (int i = 0; i < ballgames.length; i++) {
      if (ballgames[i]['title'] == "高尔夫") {
        items.add(_allballItem(i));
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