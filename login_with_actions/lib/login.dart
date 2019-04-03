import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final scafoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  final FocusNode passwordfocusNode = new FocusNode();
  final passwordController = new TextEditingController();
  final usernameController = new TextEditingController();

  void login(){
    final loginform = formKey.currentState;
    if(loginform.validate())
    {
      loginform.save();
      if(usernameController.text == 'Bassem' && passwordController.text == '12345678'){
        passwordController.text = "";
        Navigator.push(context, MaterialPageRoute(builder: (context) => new LoggedInSuccessfully()));  
      }
      else{
        final SnackBar  d = new SnackBar(content: Text('Sorry wrong logins'),);
        scafoldKey.currentState.showSnackBar(d);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafoldKey,
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          new BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField(
                    
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (text) => FocusScope.of(context).requestFocus(passwordfocusNode),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white70,
                        ),
                        border: InputBorder.none,
                        labelText: 'User Name Or email address',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          new BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormField( 
                    validator: (val) => !(val.length >= 8)? 'Invalid Password' : null,
                    onFieldSubmitted: (text){login();},
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: RaisedButton(
                  child: Text('Login'),
                  onPressed:login,
                )
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class LoggedInSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome',)
        ),
      body: Center(
        child: Text("welcome To Our Play"),
        ),
    );
  }
}