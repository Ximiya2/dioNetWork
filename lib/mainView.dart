import 'package:dio_net_work/screen/albums/albums_page.dart';
import 'package:dio_net_work/screen/comment/comment_page.dart';
import 'package:dio_net_work/screen/photo/photo_page.dart';
import 'package:dio_net_work/screen/posts/posts_page.dart';
import 'package:dio_net_work/screen/users/usres_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  var _pages = [
    PostsPage(),
    UsersPage(),
    AlbumsPage(),
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Main'),),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Posts'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Users'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: 'Albums'
          ),
        ],
      ),

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(width: double.infinity,),
      //     InkWell(
      //       onTap: (){
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => UsersPage()));
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(15),
      //         height: 60,
      //         width: MediaQuery.of(context).size.width*0.6,
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Center(child: Text('Users')),
      //       ),
      //     ),
      //     InkWell(
      //       onTap: (){
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => PostsPage()));
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(15),
      //         height: 60,
      //         width: MediaQuery.of(context).size.width*0.6,
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Center(child: Text('Posts')),
      //       ),
      //     ),
      //     InkWell(
      //       onTap: (){
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => CommentPage()));
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(15),
      //         height: 60,
      //         width: MediaQuery.of(context).size.width*0.6,
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Center(child: Text('Comment')),
      //       ),
      //     ),
      //     InkWell(
      //       onTap: (){
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => PhotoPage()));
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(15),
      //         height: 60,
      //         width: MediaQuery.of(context).size.width*0.6,
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Center(child: Text('Photo')),
      //       ),
      //     ),
      //     InkWell(
      //       onTap: (){
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => AlbumsPage()));
      //       },
      //       child: Container(
      //         margin: EdgeInsets.all(15),
      //         height: 60,
      //         width: MediaQuery.of(context).size.width*0.6,
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         child: Center(child: Text('Albums')),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
