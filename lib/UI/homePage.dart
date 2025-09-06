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
          title: Text("facebook", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromRGBO(158, 158, 158, 0.4)),
                child: IconButton(onPressed: (){}, icon: Icon(Icons.search))
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromRGBO(158, 158, 158, 0.4)),
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
            screenhome(),
            Center(child: Text("Friend Screen")),
            Center(child: Text("Messenge Screen")),
            Center(child: Text("Video Screen")),
            Center(child: Text("Notification Screen")),
            Center(child: Text("Store Screen")),
          ],
        )
    );
  }
  Widget screenhome(){
    return Column(
        children: [
            Flexible(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=0; i<30;i++)
                        Container(
                          width: 125,
                          height:double.infinity, 
                          margin: EdgeInsets.only(left: 10, top: 10), 
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15)
                          ),
                        )
                    ],
                  ),
                )
            ),
            Flexible(flex: 8,child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  for(int i=0; i<30;i++)
                    Container(
                      width: double.infinity,
                      height:500, 
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)
                      ),
                    )
                ],
              ),
            ))
        ],
    );
  }
}
