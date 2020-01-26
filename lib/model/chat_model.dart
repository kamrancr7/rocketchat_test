// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  List<Message> messages;
  int count;
  int offset;
  int total;
  bool success;

  ChatModel({
    this.messages,
    this.count,
    this.offset,
    this.total,
    this.success,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
    count: json["count"],
    offset: json["offset"],
    total: json["total"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
    "count": count,
    "offset": offset,
    "total": total,
    "success": success,
  };
}

class Message {
  String id;
  Rid rid;
  String msg;
  DateTime ts;
  U u;
  List<dynamic> mentions;
  List<dynamic> channels;
  DateTime updatedAt;
  T t;
  bool groupable;
  List<ActionLink> actionLinks;
  Reactions reactions;

  Message({
    this.id,
    this.rid,
    this.msg,
    this.ts,
    this.u,
    this.mentions,
    this.channels,
    this.updatedAt,
    this.t,
    this.groupable,
    this.actionLinks,
    this.reactions,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["_id"],
    rid: ridValues.map[json["rid"]],
    msg: json["msg"],
    ts: DateTime.parse(json["ts"]),
    u: U.fromJson(json["u"]),
    mentions: json["mentions"] == null ? null : List<dynamic>.from(json["mentions"].map((x) => x)),
    channels: json["channels"] == null ? null : List<dynamic>.from(json["channels"].map((x) => x)),
    updatedAt: DateTime.parse(json["_updatedAt"]),
    t: json["t"] == null ? null : tValues.map[json["t"]],
    groupable: json["groupable"] == null ? null : json["groupable"],
    actionLinks: json["actionLinks"] == null ? null : List<ActionLink>.from(json["actionLinks"].map((x) => ActionLink.fromJson(x))),
    reactions: json["reactions"] == null ? null : Reactions.fromJson(json["reactions"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rid": ridValues.reverse[rid],
    "msg": msg,
    "ts": ts.toIso8601String(),
    "u": u.toJson(),
    "mentions": mentions == null ? null : List<dynamic>.from(mentions.map((x) => x)),
    "channels": channels == null ? null : List<dynamic>.from(channels.map((x) => x)),
    "_updatedAt": updatedAt.toIso8601String(),
    "t": t == null ? null : tValues.reverse[t],
    "groupable": groupable == null ? null : groupable,
    "actionLinks": actionLinks == null ? null : List<dynamic>.from(actionLinks.map((x) => x.toJson())),
    "reactions": reactions == null ? null : reactions.toJson(),
  };
}

class ActionLink {
  Icon icon;
  Label label;
  MethodId methodId;
  String params;

  ActionLink({
    this.icon,
    this.label,
    this.methodId,
    this.params,
  });

  factory ActionLink.fromJson(Map<String, dynamic> json) => ActionLink(
    icon: iconValues.map[json["icon"]],
    label: labelValues.map[json["label"]],
    methodId: methodIdValues.map[json["method_id"]],
    params: json["params"],
  );

  Map<String, dynamic> toJson() => {
    "icon": iconValues.reverse[icon],
    "label": labelValues.reverse[label],
    "method_id": methodIdValues.reverse[methodId],
    "params": params,
  };
}

enum Icon { ICON_VIDEOCAM }

final iconValues = EnumValues({
  "icon-videocam": Icon.ICON_VIDEOCAM
});

enum Label { CLICK_TO_JOIN }

final labelValues = EnumValues({
  "Click to Join!": Label.CLICK_TO_JOIN
});

enum MethodId { JOIN_JITSI_CALL }

final methodIdValues = EnumValues({
  "joinJitsiCall": MethodId.JOIN_JITSI_CALL
});

class Reactions {
  Smile smile;

  Reactions({
    this.smile,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
    smile: Smile.fromJson(json[":smile:"]),
  );

  Map<String, dynamic> toJson() => {
    ":smile:": smile.toJson(),
  };
}

class Smile {
  List<Username> usernames;

  Smile({
    this.usernames,
  });

  factory Smile.fromJson(Map<String, dynamic> json) => Smile(
    usernames: List<Username>.from(json["usernames"].map((x) => usernameValues.map[x])),
  );

  Map<String, dynamic> toJson() => {
    "usernames": List<dynamic>.from(usernames.map((x) => usernameValues.reverse[x])),
  };
}

enum Username { ABSOLUTE_LEGACY, THEKATLER }

final usernameValues = EnumValues({
  "Absolute_Legacy": Username.ABSOLUTE_LEGACY,
  "thekatler": Username.THEKATLER
});

enum Rid { U_H9_TT_CC_WBR_PW_C_PM_MEYIQDO_AKMB3_CC_CW_SM2 }

final ridValues = EnumValues({
  "uH9TtCcWbrPwCPmMeyiqdoAKMB3CcCwSM2": Rid.U_H9_TT_CC_WBR_PW_C_PM_MEYIQDO_AKMB3_CC_CW_SM2
});

enum T { JITSI_CALL_STARTED }

final tValues = EnumValues({
  "jitsi_call_started": T.JITSI_CALL_STARTED
});

class U {
  Id id;
  Username username;

  U({
    this.id,
    this.username,
  });

  factory U.fromJson(Map<String, dynamic> json) => U(
    id: idValues.map[json["_id"]],
    username: usernameValues.map[json["username"]],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "username": usernameValues.reverse[username],
  };
}

enum Id { U_H9_TT_CC_WBR_PW_C_PM_ME, YIQDO_AKMB3_CC_CW_SM2 }

final idValues = EnumValues({
  "uH9TtCcWbrPwCPmMe": Id.U_H9_TT_CC_WBR_PW_C_PM_ME,
  "yiqdoAKMB3CcCwSM2": Id.YIQDO_AKMB3_CC_CW_SM2
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
