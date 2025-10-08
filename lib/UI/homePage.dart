import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          title: Text("facebook",
              style:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(Icons.add_box_outlined),
              onPressed: () async {
                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;
                final Offset offset =
                    button.localToGlobal(Offset.zero, ancestor: overlay);
                final Size size = button.size;

                final double left = offset.dx + size.width / 2;
                final double top = offset.dy - size.height * 2;

                final result = await showMenu(
                  context: context,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.transparent)),
                  position: RelativeRect.fromLTRB(
                    left,
                    top,
                    left,
                    0,
                  ),
                  items: [
                    PopupMenuItem(
                        value: "bai_viet",
                        child: Row(
                          children: [
                            Icon(Icons.border_color_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Tạo bài viết")
                          ],
                        )),
                    PopupMenuItem(
                        value: "story",
                        child: Row(
                          children: [
                            Icon(Icons.image),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Tạo story")
                          ],
                        )),
                    PopupMenuItem(
                        value: "room",
                        child: Row(
                          children: [
                            Icon(Icons.video_camera_back_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Tạo phòng họp mặt")
                          ],
                        )),
                  ],
                );
                if (result != null) {
                  print("Bạn chọn: $result");
                }
              },
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.facebookMessenger)),
          ],
          pinned: true,
          floating: true,
          snap: true,
          bottom: TabBar(
            controller: tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(
                  icon: Stack(children: [
                    Container(child: Icon(Icons.home)),
                    Container(
                  width: 10,
                  height: 10,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                ),
              ])),
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
          videoView(),
          Center(child: Text("Store Screen")),
          buildGroupView(),
          Center(child: Text("Notification Screen")),
          Center(child: Text("More Screen")),
        ],
      ),
    );
  }

  Column buildGroupView() {
    List<String> button = ["Khám phá","Nhóm của bạn","Bài Viết","Kết nối", "Chia sẻ"];
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text("Nhóm", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.add_box), color: Colors.black,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.settings), color: Colors.black,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.search), color: Colors.black,),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(left: 10),
                  child: ListView.builder(
                    itemCount: button.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        Container(margin: EdgeInsets.only(right: 5,bottom: 5),child: ElevatedButton(onPressed: (){}, child: Text("${button[index]}", style: TextStyle(color: Colors.black),))),
                  )),
              Divider(),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nhóm của bạn", style: TextStyle(fontSize: 20),),
                    TextButton(onPressed: (){}, child: Text("Xem tất cả", style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),))
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                  itemCount: button.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Icon(Icons.group, size: 50,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Nhóm ${button[index]}", style: TextStyle(fontSize: 20),),
                          Row(
                            children: [
                              Icon(Icons.push_pin),
                              Text("Đã ghim"),
                              SizedBox(width: 10,),
                              Text("Số thành viên: 30")
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Divider(thickness: 15,),
            Container(margin: EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Từ nhóm của bạn", style: TextStyle(fontSize: 20),),
                    TextButton(onPressed: (){}, child: Text("Ẩn đi", style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),))
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(Icons.groups),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nhóm bạn đã tham gia"),
                      Row(
                        children: [
                          Text("Người đăng ẩn danh"),
                          Container(margin: EdgeInsets.only(left: 5, right: 5),child: Icon(Icons.circle, size: 5,)),
                          Text("Vừa xong"),
                          Container( margin:EdgeInsets.only(left: 5),child: Icon(FontAwesomeIcons.earthAmericas)),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Container(margin: EdgeInsets.only(right: 5),child: Icon(Icons.more_horiz)),
                  Container(margin: EdgeInsets.only(right: 5),child: Icon(Icons.close)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text("Đây là nội dung của bài viết"),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red,),
                    Text("Yêu thích")
                  ],)),
                TextButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.comment,),
                    Text("Bình luận")
                  ],)),
                TextButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(FontAwesomeIcons.share,),
                    Text("Chia sẻ")
                  ],)),
              ],
            ),
            Divider(),
          ],
        );
  }

  Widget videoView() {
    return SafeArea(
      child: PageView.builder(
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Stack(
              children: [
                Container(height: double.infinity,child: Image(image: NetworkImage("https://m.yodycdn.com/blog/hinh-nen-thien-nhien-4k-yody-vn-51.jpg"),fit: BoxFit.cover,)),
                Container(
                    margin: EdgeInsetsGeometry.directional(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0x40000000), minimumSize: Size(50, 45)), child: Text("Dành cho bạn", style: TextStyle(color: Colors.white),)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(backgroundColor: Color(0x40000000), minimumSize: Size(50, 45)), child: Text("Khám phá", style: TextStyle(color: Colors.white),)),
                        ),
                        Spacer(),
                        CircleAvatar(child: Icon(Icons.search, size: 30,color: Colors.white,),backgroundColor: Color(0x40000000)),
                        Container(margin: EdgeInsets.only(left: 10),child: CircleAvatar(child: Icon(Icons.account_circle, size: 30,color: Colors.white,),backgroundColor: Color(0x40000000),)),
                  ],
                ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(margin: EdgeInsets.only(right: 10),decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0x40000000)
                      ) ,child: Icon(Icons.replay_10,size: 50, color: Colors.white,)),
                      Container(margin: EdgeInsets.only(right: 10),decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0x40000000)
                      ) ,child: Icon(Icons.play_arrow,size: 50, color: Colors.white,)),
                      Container(margin: EdgeInsets.only(left: 10),decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0x40000000)
                      ) ,child: Icon(Icons.forward_10,size: 50, color: Colors.white,)),
                    ],
                  ),
                ),
                Align(
                    alignment: AlignmentGeometry.directional(1, 1),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      color: Color(0x40000000),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 5,),
                          Column(
                            children: [
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Icon(Icons.account_circle, size: 40, color: Colors.white,),
                                  SizedBox(width: 5,),
                                  Text("Người dùng $index", style: TextStyle(color: Colors.white),),
                                  SizedBox(width: 5,),
                                  TextButton(onPressed: (){}, child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Đang theo dõi", style: TextStyle(color: Colors.white),),
                                      Icon(Icons.arrow_drop_down_outlined, color: Colors.white,)
                                    ],
                                  ),
                                    style: TextButton.styleFrom(
                                      side: BorderSide(width: 1, color: Colors.white,),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("Đây là nội dung hiển thị của đoạn video", style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(width: 50, height: 50,margin: EdgeInsets.only(bottom: 10),padding: EdgeInsets.only(top: 4),decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey[600]) ,child: Icon(Icons.favorite,size: 40, color: Colors.red,)),
                                Container(width: 50, height: 50,margin: EdgeInsets.only(bottom: 10),padding: EdgeInsets.only(top: 4),decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey[600]) ,child: Icon(Icons.comment,size: 40, color: Colors.white,)),
                                Container(width: 50, height: 50,margin: EdgeInsets.only(bottom: 10),decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey[600]) ,child: Center(child: Icon(Icons.share,size: 40, color: Colors.white,))),
                                Container(width: 50, height: 50,margin: EdgeInsets.only(bottom: 10), decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey[600]) ,child: Center(child: Icon(Icons.more_horiz,size: 40, color: Colors.white,))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                )
              ],
            ),
          ),
    );
  }


  Widget screenhome() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black, width: 1)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.account_circle,
                          size: 30,
                        ))),
                Flexible(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Bạn đang nghỉ gì ?"),
                        ))),
                Flexible(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.only(left: 30),
                        child: Icon(
                          Icons.image,
                          color: Colors.green,
                          size: 30,
                        )))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 125,
                  height: 200,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                  child: Stack(
                    children: [
                      Align(
                          alignment: AlignmentGeometry.directional(0, 1),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                color: Colors.grey,
                                border: Border(
                                    bottom:
                                        BorderSide(style: BorderStyle.none))),
                          )),
                      Align(
                        alignment: AlignmentGeometry.directional(0, 0.7),
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < 10; i++)
                  Container(
                    width: 125,
                    height: 200,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlDB1hO8FqRaZVH7KowcauXAU9k5Moyt8xLQ&s"),
                            fit: BoxFit.cover)),
                    child: Align(
                      alignment: AlignmentGeometry.directional(-0.9, -0.9),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle, // hình tròn
                          border: Border.all(
                            color: Colors.blue,
                            width: 3,
                          ),
                          color: Colors.transparent, // rỗng ruột
                        ),
                        child: Icon(
                          Icons.account_circle,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                for (int i = 0; i < 10; i++)
                  Container(
                    width: double.infinity,
                    height: 500,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        border: Border(
                            bottom: BorderSide(width: 1),
                            top: BorderSide(width: 1))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Icon(
                                              Icons.account_circle,
                                              size: 50,
                                            ))
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Người dùng"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text("12 phút"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(FontAwesomeIcons.earthAmericas)
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_horiz)),
                                    IconButton(
                                        onPressed: () {}, icon: Icon(Icons.close))
                                  ],
                                )
                              ],
                            ),
                        ),
                        SizedBox(height: 10,),
                        Container( margin: EdgeInsets.only(left: 10),
                          child: Text("Đây là đoạn văn bản có thể thu gọn lại, bạn có thể kích vào để hiển thị thêm văn bản đã đc ẩn",maxLines: 1,overflow: TextOverflow.ellipsis)),
                        SizedBox(height: 10,),
                        Expanded(
                            child: Image(
                              image: NetworkImage(
                                  "https://images2.thanhnien.vn/528068263637045248/2024/1/25/e093e9cfc9027d6a142358d24d2ee350-65a11ac2af785880-17061562929701875684912.jpg"),
                              fit: BoxFit.cover,
                            )),
                        SizedBox(height: 10,),
                        Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                TextButton(onPressed: (){}, child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.favorite,color: Colors.red,),
                                    Container(margin: EdgeInsets.only(left: 5),child: Text("Yêu thích", style: TextStyle(color: Colors.black),))
                                  ],
                                )),
                                TextButton(onPressed: (){
                                  showModalBottomSheet(context: context,
                                      backgroundColor: Colors.white,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadiusGeometry.circular(15)
                                      ),
                                      builder: (context){
                                        return DraggableScrollableSheet(
                                          expand: true,
                                          initialChildSize: 1,
                                          minChildSize: 0.8,
                                          maxChildSize: 1,
                                          builder: (context,scroll){
                                            return Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(vertical: 8),
                                                  height: 5,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    controller: scroll,
                                                    itemCount: 10,
                                                    itemBuilder: (context, index) {
                                                      return ListTile(
                                                        leading: CircleAvatar(child: Icon(Icons.account_circle)),
                                                        title: Text("Bình luận số ${index+1}"),
                                                        subtitle: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                  Text("Nội dung bình luận ở đây..."),
                                                                Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(margin: EdgeInsets.only(top: 5),child: Text("Thích",style: TextStyle(fontSize: 12,color: Colors.grey[700]))),
                                                                    SizedBox(width: 10,),
                                                                    Container(margin: EdgeInsets.only(top: 5),child: Text("Trả lời",style: TextStyle(fontSize: 12,color: Colors.grey[700]),)),
                                                                    Spacer(),
                                                                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite, color: Colors.red,))
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Divider(color: Colors.black,),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadiusGeometry.circular(20),
                                                              border: Border.all(color: Colors.black, width: 1)
                                                            ),
                                                            padding: EdgeInsets.only(left: 10),
                                                            child: TextField(
                                                              decoration: InputDecoration(border: InputBorder.none, labelText: "Viết bình luận ..."),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt)),
                                                        IconButton(onPressed: (){}, icon: Icon(Icons.gif_box_outlined)),
                                                        IconButton(onPressed: (){}, icon: Icon(Icons.insert_emoticon)),
                                                        IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                                                        Spacer(),
                                                        IconButton(onPressed: (){}, icon: Icon(Icons.send))
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                  });
                                  }, child: Row(
                                   children: [
                                    Icon(FontAwesomeIcons.comment, color: Colors.blue,),
                                    Container(margin: EdgeInsets.only(left: 5),child: Text("Bình luận",style: TextStyle(color: Colors.black),))
                                  ],
                                ),
                                ),
                                TextButton(onPressed: (){}, child: Row(
                                  children: [
                                    Icon(FontAwesomeIcons.share,color: Colors.blue,),
                                    Container(margin: EdgeInsets.only(left: 5), child: Text("Chia sẻ", style: TextStyle(color: Colors.black),))
                                  ],
                                )),
                                SizedBox()
                              ],
                            ),
                        SizedBox(height: 5,),
                      ],
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
