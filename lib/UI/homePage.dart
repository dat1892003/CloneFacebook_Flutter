import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("facebook"),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(0.4)),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.search))
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey.withOpacity(0.4)),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.menu))
            ),
          ],
          bottom: TabBar(
              controller: tabController,
              tabs: [
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.group),),
                Tab(icon: Icon(FontAwesomeIcons.facebookMessenger),),
                Tab(icon: Icon(Icons.video_library)),
                Tab(icon: Icon(Icons.notifications)),
                Tab(icon: Icon(Icons.storefront)),
              ]) ,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Center(child: Text("Home Screen")),
            Center(child: Text("Favorite Screen")),
            Center(child: Text("Settings Screen")),
            Center(child: Text("Settings Screen")),
            Center(child: Text("Settings Screen")),
            Center(child: Text("Settings Screen")),
          ],
        )
    );
  }
}