// To parse this JSON data, do
//
//     final allChatUsers = allChatUsersFromJson(jsonString);

import 'dart:convert';

AllChatUsers allChatUsersFromJson(String str) => AllChatUsers.fromJson(json.decode(str));

String allChatUsersToJson(AllChatUsers data) => json.encode(data.toJson());

class AllChatUsers {
  List<Im> ims;
  int offset;
  int count;
  int total;
  bool success;

  AllChatUsers({
    this.ims,
    this.offset,
    this.count,
    this.total,
    this.success,
  });

  factory AllChatUsers.fromJson(Map<String, dynamic> json) => AllChatUsers(
    ims: List<Im>.from(json["ims"].map((x) => Im.fromJson(x))),
    offset: json["offset"],
    count: json["count"],
    total: json["total"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "ims": List<dynamic>.from(ims.map((x) => x.toJson())),
    "offset": offset,
    "count": count,
    "total": total,
    "success": success,
  };
}

class Im {
  String id;
  DateTime updatedAt;
  int msgs;
  String t;
  DateTime ts;
  List<String> usernames;
  int usersCount;
  LastMessage lastMessage;
  DateTime lm;
  DateTime jitsiTimeout;

  Im({
    this.id,
    this.updatedAt,
    this.msgs,
    this.t,
    this.ts,
    this.usernames,
    this.usersCount,
    this.lastMessage,
    this.lm,
    this.jitsiTimeout,
  });

  factory Im.fromJson(Map<String, dynamic> json) => Im(
    id: json["_id"],
    updatedAt: DateTime.parse(json["_updatedAt"]),
    msgs: json["msgs"],
    t: json["t"],
    ts: DateTime.parse(json["ts"]),
    usernames: List<String>.from(json["usernames"].map((x) => x)),
    usersCount: json["usersCount"],
    lastMessage: json["lastMessage"] == null ? null : LastMessage.fromJson(json["lastMessage"]),
    lm: json["lm"] == null ? null : DateTime.parse(json["lm"]),
    jitsiTimeout: json["jitsiTimeout"] == null ? null : DateTime.parse(json["jitsiTimeout"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "_updatedAt": updatedAt.toIso8601String(),
    "msgs": msgs,
    "t": t,
    "ts": ts.toIso8601String(),
    "usernames": List<dynamic>.from(usernames.map((x) => x)),
    "usersCount": usersCount,
    "lastMessage": lastMessage == null ? null : lastMessage.toJson(),
    "lm": lm == null ? null : lm.toIso8601String(),
    "jitsiTimeout": jitsiTimeout == null ? null : jitsiTimeout.toIso8601String(),
  };
}

class LastMessage {
  String id;
  String rid;
  String msg;
  DateTime ts;
  U u;
  List<dynamic> mentions;
  List<dynamic> channels;
  DateTime updatedAt;

  LastMessage({
    this.id,
    this.rid,
    this.msg,
    this.ts,
    this.u,
    this.mentions,
    this.channels,
    this.updatedAt,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
    id: json["_id"],
    rid: json["rid"],
    msg: json["msg"],
    ts: DateTime.parse(json["ts"]),
    u: U.fromJson(json["u"]),
    mentions: List<dynamic>.from(json["mentions"].map((x) => x)),
    channels: List<dynamic>.from(json["channels"].map((x) => x)),
    updatedAt: DateTime.parse(json["_updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rid": rid,
    "msg": msg,
    "ts": ts.toIso8601String(),
    "u": u.toJson(),
    "mentions": List<dynamic>.from(mentions.map((x) => x)),
    "channels": List<dynamic>.from(channels.map((x) => x)),
    "_updatedAt": updatedAt.toIso8601String(),
  };
}

class U {
  String id;
  String username;

  U({
    this.id,
    this.username,
  });

  factory U.fromJson(Map<String, dynamic> json) => U(
    id: json["_id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
  };
}