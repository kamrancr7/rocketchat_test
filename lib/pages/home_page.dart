import 'package:flutter/material.dart';
import 'package:rocketchat_test/model/all_chat_users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'chat_screen.dart';

class HomePage extends StatefulWidget {
  final authToken;
  final userId;
  final userName;
  HomePage(this.authToken, this.userId, this.userName);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AllChatUsers allChatUsers;
  bool _loading = true;

  Future<String> getAllChatUsers() async {
    final response = await http.get(
        Uri.encodeFull(
            "https://iamflexi.com/iamflexi/api/v1/im.list"), //use your api there
        headers: {
          "X-Auth-Token": widget.authToken,
          "X-User-Id": widget.userId,
          "Content-Type": "application/json"
        });

    allChatUsers = AllChatUsers.fromJson(json.decode(response.body));

    if (allChatUsers.success) {
      _loading = false;
      setState(() {});
      return "success";
    } else {
      _loading = false;
      setState(() {});
      return "failed";
    }
  }

  @override
  void initState() {
    super.initState();
    getAllChatUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: allChatUsers.count,
        itemBuilder: (context, i) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(widget.authToken,
                          widget.userId, allChatUsers.ims[i].id)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.userName == allChatUsers.ims[i].usernames[0] ?
                    userName(allChatUsers.ims[i].usernames[1],allChatUsers.ims[i].msgs) :
                userName(allChatUsers.ims[i].usernames[0],allChatUsers.ims[i].msgs),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget userName(userName, int msgs){
    if(msgs > 0){
      return Text(userName);
    }
  }
}
