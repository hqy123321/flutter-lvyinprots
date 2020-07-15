
import 'package:ballfriend/item/public_item.dart';
import 'package:ballfriend/item/venues_item.dart';
import 'package:ballfriend/widgets/ballFight_home.dart';
import 'package:ballfriend/widgets/details_public.dart';
import 'package:ballfriend/widgets/message_home.dart';
import 'package:ballfriend/widgets/venues_home.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:ballfriend/item/home_item.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName = '厦门市';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            _show(context);
          },
          child: Row(
            children: <Widget>[
              Icon(Icons.pin_drop, color: Colors.white,),
              Expanded(
                child: Text(cityName, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MessageHome(),
                )
              );
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: BottonClipper(),
                child: Container(
                  color: Colors.green[400],
                  height: 200,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                      ),
                      child: Text('🔍搜索您想要了解的内容', style: TextStyle(color: Colors.blueGrey),)
                    ),
                    Container(
                      width: double.infinity,
                      height: 160.0,
                      child: new Swiper(
                        itemCount: imgList.length,
                        pagination: new SwiperPagination(),
                        loop: true,
                        autoplay: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.asset(
                            imgList[index]['url'],
                            fit: BoxFit.fill
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: _topList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: _centerList(),
                    ),
                    _bottomList(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _topList() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('约球约战', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> BallFightHome()
                )
              );
            },
          ),
         Container(
           padding: EdgeInsets.only(bottom: 15.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: ballFightList.map((item){
               return GestureDetector(
                 onTap: () {
                   Navigator.of(context).push(
                     MaterialPageRoute(
                       builder: (context) => BallFightHome(),
                     )
                   );
                 },
                 child: Column(
                  children: <Widget>[
                    item['icons'],
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(item['title']),
                    )
                  ],
                ),
               );
             }).toList(),
           ),
         )
        ],
      ),
    );
  }
  
  _centerList() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('场馆预定', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.arrow_forward_ios, size: 15.0,),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> VenuesHome()
                )
              );
            },
          ),
          _centerItem(1),
          _centerItem(2)
        ],
      ),
    );
  }

  Widget _centerItem(int i) {
    return ListTile(
      title: Text(venuesList[i]['title']),
      subtitle: Text(venuesList[i]['address']),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green[400]),
          borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
          child: Text('快速预定', style: TextStyle(color: Colors.green[400]),),
        )
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Venues(list: venuesList, index: i,),
          )
        );
      },
    );
  }

  _bottomList() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('球友赛事', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
          ),
          _bottomItem(1),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: _bottomItem(2),
          ),
        ],
      ),
    );
  }

  Widget _bottomItem(int i) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> DetailsPublic(list: ballgames,index: i,)
          )
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(ballgames[i]['img2'], fit: BoxFit.fill,width: 110, height: 135,),
          ),
          Expanded(
          child:Container(
            height: 135,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),)
        ],
      ),
    );
  }

 void _show(BuildContext context) async{
    Result result = await CityPickers.showCitiesSelector(
      context: context,
    );
    setState(() {
      cityName = result.cityName;
    });
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