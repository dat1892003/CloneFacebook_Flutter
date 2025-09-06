import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.arrow_back),
      ),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, child: Row(
                      children: [
                        Text("Tiếng việt",style: TextStyle(color: Colors.black)),
                        Icon(Icons.arrow_drop_down_outlined, color: Colors.black,),
                      ],
                    ))
                  ],
                ),
              ),
              Flexible(flex: 1,child: Container( margin: EdgeInsets.only(top: 20), child: Icon(Icons.facebook, color: Colors.blueAccent,size: 100,)),),
              Flexible(
                  flex: 5,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10, top: 50),
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(15)),
                              child: TextField(decoration: InputDecoration(labelText: "Nhập vào email hoặc số điện thoại", border: InputBorder.none),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(15)),
                              child: TextField(decoration: InputDecoration(labelText: "Nhập vào mật khẩu", border: InputBorder.none),),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    minimumSize: Size(double.infinity, 50),
                                  ),
                                  onPressed: (){},
                                  child: Text("Đăng nhập", style: TextStyle(color: Colors.white),)
                              ),
                            ),
                            TextButton(onPressed: (){},style: TextButton.styleFrom(padding:EdgeInsets.only(top: 15)),
                                child: Text("Quên mật khẩu?", style: TextStyle(color: Colors.black),))
                          ],
                        )

                      ],
                    ),
                  )
              ),
              Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 2),borderRadius: BorderRadius.circular(20) ),
                          child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                              child: Text("Tạo tài khoản mới",style: TextStyle(color: Colors.blue),))
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.facebookMessenger, color: Colors.pinkAccent,),
                            SizedBox(width: 10,),
                            Text("From Meta")
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}
