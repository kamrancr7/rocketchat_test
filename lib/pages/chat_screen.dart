import 'package:flutter/material.dart';
import 'package:rocketchat_test/model/chat_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  final authToken;
  final userId;
  final roomId;

  ChatScreen(this.authToken,this.userId,this.roomId);

  @override
  _ChatScreenState createState() => _ChatScreenState(authToken,userId,roomId);
}

class _ChatScreenState extends State<ChatScreen> {

  final _authToken;
  final _userId;
  final _roomId;
  ChatModel chatModel;
  bool isLoading = true;

  _ChatScreenState(this._authToken,this._userId,this._roomId);

  Future<String> getChatData() async {
    final response = await http.get(
        Uri.encodeFull(
            "https://iamflexi.com/iamflexi/api/v1/im.messages?roomId=$_roomId"), //use your api there
        headers: {
          "X-Auth-Token": _authToken,
          "X-User-Id": _userId,
          "Content-Type": "application/json"
        });

    chatModel = ChatModel.fromJson(json.decode(response.body));
    isLoading = false;
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    getChatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Screen"),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator()) :
      ListView.builder(
        reverse: true,
        itemCount: chatModel.count
      ,itemBuilder: (context,i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(chatModel.messages[i].msg),
          )
        ],
      )),
    );
  }
}
