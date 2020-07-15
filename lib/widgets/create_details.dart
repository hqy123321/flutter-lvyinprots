import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CreateDetails extends StatefulWidget {
  @override
  _CreateDetailsState createState() => _CreateDetailsState();
}

class _CreateDetailsState extends State<CreateDetails> {
  DateTime _dateTime = DateTime.now();
  TextEditingController yueqiu = new TextEditingController();
  var _textStyle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('发布约球'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          _body(context),
        ],
      )
    );
  }
  Widget _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('约球名称', style: _textStyle,),
          TextField(
            controller: yueqiu,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              hintText: '输入约球名称',),
              onChanged: (value) {
                
            },
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0),
            child: Text('所约球类', style: _textStyle,),
          ),
          TextField(
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              hintText: '请输入所约球类',),
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0),
            child: Text('详细地址', style: _textStyle,),
          ),
          TextField(
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              hintText: '请输入会和地址或场馆地址',),
              onChanged: (value) {
                
            },
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0),
            child: Text('招募人数', style: _textStyle,),
          ),
          TextField(
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              hintText: '请输入招募人数',),
              onChanged: (value) {
                
            },
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0),
            child: Text('联系电话', style: _textStyle,),
          ),
          TextField(
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10.0),
              hintText: '请输入联系电话',),
              inputFormatters: <TextInputFormatter> [
                WhitelistingTextInputFormatter.digitsOnly
              ],
              onChanged: (value) {
                
            },
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0, bottom: 15.0),
            child: Text('时间', style: _textStyle,),
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showDateTimePicker(context,
                showTitleActions: true,
                onConfirm: (date) {
                  setState(() {
                    _dateTime = date;
                  });
                },
                currentTime: DateTime.now(),
                locale: LocaleType.zh);
            },
            child: Text('$_dateTime'),
          ),
          Divider(color: Colors.black),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20.0),
            child: RaisedButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Fluttertoast.showToast(msg: "创建成功");
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('发布', style: TextStyle(color: Colors.white),),
              )
            ),
          )
        ],
      ),
    );
  }
}