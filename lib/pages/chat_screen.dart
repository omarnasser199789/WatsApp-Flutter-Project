import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[

              new Divider(//ترك فراغ
                height: 10.0,
              ),
              new ListTile(
                //القسم الخاص بالصورة
                leading: new CircleAvatar(//الصورة الدائرية
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,//لون CircleAvatar
                  //get Image from url
                  backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
                ),

                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //اسم أخر شخص فام باسال رسالة
                    new Text(
                      dummyData[i].name,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //القسم الخاص بوقت أخر رسالة تم استلامها
                    new Text(
                      dummyData[i].time,
                      style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),

                subtitle: new Container(
                  //القسم الخاص بأخر رسالة يتم عرضها
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Text(
                    dummyData[i].message,
                    style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
