import 'package:flutter/material.dart';

import 'Users.dart';

class HomePage extends StatelessWidget {
  User loginedUser;

  HomePage(User currentuser) {
    loginedUser = currentuser;
  }
  List<Widget> childen = users.map((user) => view(user)).toList();

  static Widget view(User user) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              child: user.image.length > 0
                  ? ClipOval(
                      child: Image.memory(
                        user.getUserImage(),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      decoration: new BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(100.0))),
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        user.name[0],
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
            ),
            Padding(padding: EdgeInsets.all(15.0), child: Text(user.name)),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    childen.insert(
        0,
        Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(child: Text('This is a list of all saved users'))));
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          InkWell(
            child: loginedUser.image.length > 0
                ? ClipOval(
                    child: Image.memory(
                      loginedUser.getUserImage(),
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    decoration: new BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(50.0))),
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    width: 50.0,
                    child: Center(
                        child: Text(
                      loginedUser.name[0],
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
          ),
        ],
      ),
      body: ListView(
        children: childen,
      ),
    );
  }
}
