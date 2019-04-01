import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();

  void updateUserName(String currentValue){
    setState((){
      userName = currentValue;
      });
  }
  void updatePassword(String currentValue){
    setState((){
      password = currentValue;
      });
  }
  void save(BuildContext context){
    setState((){
      if(userName == 'Bassem' && password == '1234'){
        Navigator.push(context,MaterialPageRoute(builder: (context) => new LoggedInSuccessfully()));
      }
      else {
        Scaffold.of(context).showSnackBar( SnackBar(content: Text('Please Try Again')));
      }
      });
  }
  String userName = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(
      builder: (BuildContext context) {
        return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child:Text(
                'Please Login into The System',
                style: Theme.of(context).textTheme.headline,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
                child:  Container(
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(children: <Widget>[
                    Expanded(child: 
                    TextField(
                      decoration: InputDecoration(icon: Icon(Icons.person,color: Colors.white70,),border:InputBorder.none ,hintText: 'User name Or Email '),
                      onChanged: (String currentValue){updateUserName(currentValue);},
                    ),),
                  ],)
                ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: new BoxDecoration(
                    color: Colors.grey,
                    borderRadius: new BorderRadius.all(Radius.circular(10.0))),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(children: <Widget>[
                  Expanded(child: 
                  TextField(
                    // obscureText Parameter is Used for password-like fields.
                    obscureText: true,
                    decoration: InputDecoration(icon: Icon(Icons.lock_open,color: Colors.white70,),border:InputBorder.none ,hintText: 'Password ... '),
                    onChanged: (String currentValue){updatePassword(currentValue);},
                  ),),
                ],)
              ),
            ),
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: RaisedButton(child: Text("Login"),onPressed: (){save(context);}),
            )
      
          ],
        ),
        );
      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
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