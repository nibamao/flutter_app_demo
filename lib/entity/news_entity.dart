// To parse this JSON data, do
//
//     final newsEntity = newsEntityFromJson(jsonString);

import 'dart:convert';

NewsEntity newsEntityFromJson(String str) => NewsEntity.fromJson(json.decode(str));

String newsEntityToJson(NewsEntity data) => json.encode(data.toJson());

class NewsEntity {
  String text;
  int isTop;
  String lang;
  int isShow;
  String title;
  String newsColumn;
  String images;
  int replyNum;
  int readNum;
  String authorname;
  DateTime createTime;
  int isCollect;
  String shareLink;
  String textios;
  String describe;
  String id;

  NewsEntity({
    this.text,
    this.isTop,
    this.lang,
    this.isShow,
    this.title,
    this.newsColumn,
    this.images,
    this.replyNum,
    this.readNum,
    this.authorname,
    this.createTime,
    this.isCollect,
    this.shareLink,
    this.textios,
    this.describe,
    this.id,
  });

  factory NewsEntity.fromJson(Map<String, dynamic> json) => NewsEntity(
    text: json["text"],
    isTop: json["isTop"],
    lang: json["lang"],
    isShow: json["isShow"],
    title: json["title"],
    newsColumn: json["newsColumn"],
    images: json["images"],
    replyNum: json["replyNum"],
    readNum: json["read_num"],
    authorname: json["authorname"],
    createTime: DateTime.parse(json["createTime"]),
    isCollect: json["isCollect"],
    shareLink: json["share_link"],
    textios: json["textios"],
    describe: json["describe"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "isTop": isTop,
    "lang": lang,
    "isShow": isShow,
    "title": title,
    "newsColumn": newsColumn,
    "images": images,
    "replyNum": replyNum,
    "read_num": readNum,
    "authorname": authorname,
    "createTime": createTime.toIso8601String(),
    "isCollect": isCollect,
    "share_link": shareLink,
    "textios": textios,
    "describe": describe,
    "id": id,
  };
}
