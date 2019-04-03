import 'package:flutter/material.dart';

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

  void login() {
    final loginform = formKey.currentState;
    if (loginform.validate()) {
      loginform.save();
      if (usernameController.text == 'Bassem' &&
          passwordController.text == '12345678') {
        passwordController.text = "";
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new LoggedInSuccessfully()));
      } else {
        final SnackBar d = new SnackBar(
          content: Text('Sorry wrong logins'),
        );
        scafoldKey.currentState.showSnackBar(d);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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

class LoggedInSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Home Page',
      )),
      body: Center(
        child: Text("Welcome to the home page"),
      ),
    );
  }
}
