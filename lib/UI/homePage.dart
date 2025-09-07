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
    return Scaffold(body: buildNestedScrollView());
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: Text("facebook",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () async {
                final RenderBox button = context.findRenderObject() as RenderBox;
                final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

                final result = await showMenu(
                  context: context,
                  position: RelativeRect.fromRect(
                    Rect.fromPoints(
                      button.localToGlobal(Offset.zero, ancestor: overlay),
                      button.localToGlobal(Offset.zero, ancestor: overlay),
                    ),
                    Offset.zero & overlay.size,
                  ),
                  items: [
                    PopupMenuItem(value: "bai_viet", child: Text("Tạo bài viết")),
                    PopupMenuItem(value: "story", child: Text("Tạo story")),
                    PopupMenuItem(value: "room", child: Text("Tạo phòng họp mặt")),
                  ],
                );

                if (result != null) {
                  print("Bạn chọn: $result");
                }
              },
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ],
          pinned: true,
          floating: true,
          snap: true,
          bottom: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.video_library)),
              Tab(icon: Icon(Icons.store)),
              Tab(icon: Icon(Icons.group)),
              Tab(icon: Icon(Icons.notifications)),
              Tab(icon: Icon(Icons.menu)),
            ],
          ),
        ),
      ],
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
      ),
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
        controller: tabController,
        children: [
          screenhome(),
          Center(child: Text("Friend Screen")),
          Center(child: Text("Messenge Screen")),
          Center(child: Text("Video Screen")),
          Center(child: Text("Notification Screen")),
          Center(child: Text("Store Screen")),
        ],
      );
  }
  
  Widget screenhome(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i=0; i<30;i++)
                    Container(
                      width: 125,
                      height:200,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    )
                ],
              ),
              ),
            SingleChildScrollView(
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
            )
          ],
      ),
    );
  }
}
