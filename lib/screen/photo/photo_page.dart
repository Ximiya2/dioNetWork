import 'package:dio_net_work/screen/photo/widgets/photo_item.dart';
import 'package:dio_net_work/service/userId_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoPage extends StatefulWidget {
  PhotoPage({this.id,Key? key}) : super(key: key);
  int? id;
  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Album Photos', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
            future: GetUserPostService.getUserIdPhoto(widget.id!),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return PhotoItem(snapshot.data![index], id: widget.id!);
                  },
                );
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}


/*
import 'package:dio_net_work/screen/photo/widgets/photo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/photo_service.dart';

class PhotoPage extends StatefulWidget {
   PhotoPage({required int id,Key? key}) : super(key: key);
  int? id;
  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Photos', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetPhotoService.getPhoto(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                ),
                    itemBuilder: (context, index) {
                    return PhotoItem(snapshot.data![index],id: widget.id!);
              },
                );
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}

*/
