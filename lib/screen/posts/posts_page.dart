import 'package:dio_net_work/screen/comment/comment_page.dart';
import 'package:dio_net_work/screen/posts/widgets/post_item.dart';
import 'package:dio_net_work/service/comment_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/commentModel.dart';
import '../../models/postModel.dart';
import '../../service/post_service.dart';
import '../../service/utils_service.dart';

class PostsPage extends StatefulWidget {
   PostsPage({Key? key}) : super(key: key);
  //CommentModel? comment;
  @override
  State<PostsPage> createState() => _PostsPageState();
}
TextEditingController userIdCtr = TextEditingController();
TextEditingController titleCtr = TextEditingController();
TextEditingController bodyCtr = TextEditingController();

class _PostsPageState extends State<PostsPage> {

  // @override
  // void initState(){
  //   super.initState();
  //   GetPostService.getUser();
  // }
  //  CommentModel? comment = GetCommetService.getCommet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Posts', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: (){
              _showBottomSheet(context, () async {
                if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
                  PostModel newPost = PostModel(
                      userId: int.parse(userIdCtr.text),
                      id: 1,
                      title: titleCtr.text,
                      body: bodyCtr.text);
                  bool result = await GetPostService.createPost(newPost);

                  if(result){
                    Utils.snackBarSucces('Added successfully', context);
                    Navigator.pop(context);
                  } else {
                    Utils.snackBarError('Someting is wrong', context);
                  }
                } else {
                  Utils.snackBarError('Please fill all fileds', context);
                }
              });
            },
            icon: Icon(Icons.add),)
        ],
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: GetPostService.getPost(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: postItem(context: context, post: snapshot.data![index],
                            comment: snapshot.data![index].id,
                            edit: () {
                          userIdCtr.text = snapshot.data![index].userId.toString();
                          titleCtr.text = snapshot.data![index].title;
                          bodyCtr.text = snapshot.data![index].body;
                          _showBottomSheet(context,
                              () async {
                                if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
                                  PostModel newPost = PostModel(
                                      userId: int.parse(userIdCtr.text),
                                      id: snapshot.data![index].id,
                                      title: titleCtr.text,
                                      body: bodyCtr.text);
                                  bool result = await GetPostService.editPost(newPost);

                                  if(result){
                                    Utils.snackBarSucces('Update successfully', context);
                                    Navigator.pop(context);
                                  } else {
                                    Utils.snackBarError('Someting is wrong', context);
                                  }
                                } else {
                                  Utils.snackBarError('Please fill all fileds', context);
                                }
                              });
                            }),
                      );
                    });
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, void Function() func) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context,) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Add new post',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
                TextFormField(
                  controller: userIdCtr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'UserId'),
                ),
                TextFormField(
                  controller: titleCtr,
                  decoration: InputDecoration(labelText: 'Age'),
                ),
                TextFormField(
                  controller: bodyCtr,
                  decoration: InputDecoration(labelText: 'Salary'),
                ),
                ElevatedButton(
                  onPressed: func,
                  child: Text('Add'),
                ),
                SizedBox(height: 400,)
              ],
            ),
          ),
        );
      });
}
