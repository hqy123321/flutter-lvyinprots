import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterLogin extends StatefulWidget {
  @override
  _RegisterLoginState createState() => _RegisterLoginState();
}

class _RegisterLoginState extends State<RegisterLogin> {
  final _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  String _email, _password,_password_confirm;
  bool _isObscure = true;
  Color _eyeColor;
  TextEditingController _controllerMail = new TextEditingController();
  TextEditingController _controllerPwd = new TextEditingController();
  TextEditingController _controllerRePwd = new TextEditingController();

  void _userRegister() {
      _email=_controllerMail.text;
      _password=_controllerPwd.text;
      _password_confirm=_controllerRePwd.text;

      if (_formKey.currentState.validate()) {
        save();
        Navigator.pop(context,[_email]);
      }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Form(
            key: _formKey,
            child:ListView(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                buildTitle(),
                buildTitleLine(),
                SizedBox(height: 40.0),
                buildEmailTextField(),
                SizedBox(height: 25.0),
                buildPasswordTextField(context),
                SizedBox(height: 25.0),
                _bulidConfirmTextField(context),
                SizedBox(height: 60.0,),
                buildRegisterButton(context),
                SizedBox(height: 20.0),
              ],
            )
        )

    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '注册',
        style: TextStyle(fontSize: 42.0,),
      ),
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
      controller: _controllerMail,
      decoration: InputDecoration(
        labelText: '请输入您的邮箱',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的邮箱地址';
        }else{
          return null;
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      controller: _controllerPwd,
      onSaved: (String value) => _password = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: '请输入密码',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  TextFormField _bulidConfirmTextField(BuildContext context) {
    return TextFormField(
      controller: _controllerRePwd,
      onSaved: (String value) => _password_confirm = value,
      obscureText: _isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请确认密码';
        }else if (value != _password){
          return '两次密码不一致！';
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: '请重复输入密码',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                  _eyeColor = _isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  Align buildRegisterButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '注册',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
          color: Colors.blueAccent,
          onPressed: () {
            _userRegister();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
        ),
      ),
    );
  }

  save() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_email,_password);
  }
}