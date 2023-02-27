import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/AlbumsModel.dart';
import '../../../service/comment_service.dart';
import '../../../service/utils_service.dart';

Widget AlbumsItem(BuildContext context, AlbumsModel albums, void Function() edit) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
            albums.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black38
            ),),
          ),
          Column(
            children: [
              IconButton(
                  onPressed: edit,
                  icon: Icon(Icons.edit)),
              SizedBox(height: 10,),
              IconButton(
                  onPressed: () async {
                    bool result = await GetCommetService.deleteCommet(albums.id);
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
    ],
  );
}