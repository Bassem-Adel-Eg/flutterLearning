import 'package:flutter/material.dart';
import 'Users.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scafoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  final FocusNode passwordfocusNode = new FocusNode();
  final passwordController = new TextEditingController();
  final usernameController = new TextEditingController();
  var userImage = getUnknownUserImage();

  void login() {
    final loginform = formKey.currentState;
    if (loginform.validate()) {
      loginform.save();

      User s = users
          .firstWhere((user) => (user.userName == usernameController.text));

      final SnackBar wrongPassword = new SnackBar(
        content: Text('Sorry try again'),
      );
      if (s != null) {
        if (s.password == passwordController.text) {
          passwordController.text = "";
          setState(() {userImage = s.getUserImage(); });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new HomePage(s)));
        } else {
          passwordController.text = "";
          if(s.image.length > 10){
            setState(() {userImage = s.getUserImage(); });
          }else{
            setState(() {userImage = getUnknownUserImage();});
          }
          scafoldKey.currentState.showSnackBar(wrongPassword);
        }
      } else {
        scafoldKey.currentState.showSnackBar(wrongPassword);
        setState(() {userImage = getUnknownUserImage();});
      }
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget userNameWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.grey,
            borderRadius: new BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          controller: usernameController,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (text) =>
              FocusScope.of(context).requestFocus(passwordfocusNode),
          decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.white70,
              ),
              border: InputBorder.none,
              labelText: 'Username Or Email',
              labelStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
    Widget passwordWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: new BoxDecoration(
            color: Colors.grey,
            borderRadius: new BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: TextFormField(
          validator: (val) => !(val.length >= 8) ? 'Invalid Password' : null,
          onFieldSubmitted: (text) {
            login();
          },
          focusNode: passwordfocusNode,
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
              icon: Icon(
                Icons.lock_open,
                color: Colors.white70,
              ),
              border: InputBorder.none,
              labelText: 'Password',
              labelStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
    Widget loginForm = Form(
      key: formKey,
      child: ListView(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              height: 250.0,
              width: 250.0,
              decoration: new BoxDecoration(
                  color: Colors.grey,
                  borderRadius: new BorderRadius.all(Radius.circular(125.0))),
              child: ClipOval(
                child: Image.memory(
                  userImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          userNameWidget,
          passwordWidget,
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(
                child: Text('Login'),
                onPressed: login,
              )),
        ],
      ),
    );
    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(child: loginForm),
    );
  }
}