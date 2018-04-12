import 'package:flutter/material.dart';
import 'package:flutterwhatsapp/pages/call_screen.dart';
import 'package:flutterwhatsapp/pages/camera_screen.dart';
import 'package:flutterwhatsapp/pages/chat_screen.dart';
import 'package:flutterwhatsapp/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
    //TickerProviderStateMixin يستخدم هذا الكلاس لادارة العديد من الرسومات المتحركة

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Coordinates tab selection between a TabBar and a TabBarView.
    //اي الربط بين شريط الأيقونات في الأعلى والشاشة التي تظهر تحتة
    //اي عند الضغط على tab الأول يعرض tab view الأول
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(


      appBar: new AppBar(
        title: new Text("WhatsApp"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(
              text: "STATUS",
            ),
            new Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(//من أجل ترك فراغ بين الأيقونتين
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          new Icon(Icons.more_vert)
        ],
      ),


      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),

      //flouting button
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("open chats"),
      ),



    );
  }
}
