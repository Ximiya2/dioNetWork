import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/postModel.dart';
import '../../../service/post_service.dart';
import '../../../service/utils_service.dart';

Widget postItem({required BuildContext context, required PostModel post, required void Function() edit}) {
  return Column(
    children: [
      Text(
        post.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Colors.black
        ),
      ),
      SizedBox(height: 5,),
      Row(
        children: [
          Expanded(
              child: Text(
                post.body,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black38
                ),
              ),
          ),
          Column(
            children: [
              IconButton(
                  onPressed: edit,
                  icon: Icon(Icons.edit)),
              SizedBox(height: 10,),
              IconButton(
                  onPressed: () async {
                    bool result = await GetPostService.deletePost(post.id);
                    if(result){
                      Utils.snackBarSucces('Deleted successfully', context);
                    } else {
                      Utils.snackBarError('Someting is wrong', context);
                    }
                  },
                  icon: Icon(Icons.delete)),
            ],
          )
        ],
      ),
      // Text(
      //   post.userId.toString(),
      //   style: TextStyle(
      //       fontWeight: FontWeight.w700,
      //       fontSize: 16,
      //       color: Colors.black38
      //   ),),
      Divider(thickness: 1,)
    ],
  );
}