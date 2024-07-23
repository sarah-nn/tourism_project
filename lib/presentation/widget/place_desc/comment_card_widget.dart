import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/data/models/comment_model.dart';

class CommentCaredWidget extends StatelessWidget {
  const CommentCaredWidget({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: comment.user.image != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(EndPoint.imageBaseUrl +
                          comment.user.image!) //AssetImage(AppImage.person),
                      )
                  : const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 201, 201, 201),
                      child:
                          Icon(Icons.person_2_outlined, color: Colors.black45),
                    ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 235, 235, 235),
                    Colors.white
                  ]),
                  border: Border.all(width: 0.2, color: Colors.black45),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comment.user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          height: 1.6)),
                  Text(
                    comment.comment,
                    style: const TextStyle(
                        fontSize: 17,
                        height: 1.4,
                        color: Color.fromARGB(255, 97, 97, 97)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
