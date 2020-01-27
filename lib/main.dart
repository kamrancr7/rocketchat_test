import 'package:ddp/ddp.dart';
import 'package:flutter/material.dart';
import 'package:rocketchat_test/model/login_model.dart';
import 'package:rocketchat_test/pages/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rocketchat_test/realtime/client.dart';

import 'models/models.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LoginModel loginModel;

  Future<String> loginRocketChat(context) async {
    var account = {"user": "sp_umar@live.com", "password": "a"};
    final response = await http.post(
        Uri.encodeFull(
            "https://iamflexi.com/iamflexi/api/v1/login"), //use your api there
        body: {"user": "sp_umar@live.com", "password": "a"});

    loginModel = LoginModel.fromJson(json.decode(response.body));

    if (loginModel.status == "success") {

      Client client = Client(
          'testing',
          Uri.parse(
            'https://www.iamflexi.com/iamflexi'
          ),
          true);
      client.addStatusListener((status) async {
        if (status == ConnectStatus.connected) {
          await client.login(UserCredentials()
          ..email = 'sp_umar@live.com'
            ..name = 'sp_umar@live.com'
            ..password = 'a');
          final channels = await client.getChannelsIn();
          channels.forEach((channel) {
            client.subRoomMessages(channel.id);
          });
          client.roomMessages().listen((data) => print(data.doc));
        }
      });

      Navigator.push(
        context,
         MaterialPageRoute(
            builder: (context) => HomePage(loginModel.data.authToken,
                loginModel.data.userId, loginModel.data.me.username)),
      );
      return "success";
    } else {
      return "failed";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RocketChat Test"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Click me"),
            onPressed: () {
              loginRocketChat(context);
            }),
      ),
    );
  }
}
