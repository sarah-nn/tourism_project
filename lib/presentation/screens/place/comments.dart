import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/places/place_desc_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/comment_model.dart';
import 'package:tourism_project/presentation/widget/place_desc/comment_card_widget.dart';
import 'package:tourism_project/presentation/widget/place_desc/write_comment_field.dart';

class CommentPage extends StatefulWidget {
  final String placeId;
  const CommentPage({super.key, required this.placeId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Comment> myCommentsList = [];
  bool validComment = true;
  @override
  void initState() {
    super.initState();
    context.read<PlaceDescCubit>().getAllComments(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceDescCubit, PlaceDescState>(
      listener: (context, state) {
        if (state is PLaceCommentsList) {
          myCommentsList = (state).commentsList;
        }
        if (state is PlaceDescFailure) {
          setState(() {
            validComment = false;
          });
          showAlertDialog(context, "Your Blocked beacuse of nothing");
        }
      },
      builder: (context, state) {
        var commentCubit = BlocProvider.of<PlaceDescCubit>(context);
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: light ? Colors.white : AppColor.primaryColorDark,
              elevation: light ? 0 : null,
              title: Text(
                "Comments (${myCommentsList.length})",
                style: MyTextStyle.headers.copyWith(
                    fontSize: 26, color: light ? Colors.black : Colors.white),
              ),
              leading: Icon(
                Icons.arrow_back_rounded,
                color: light ? Colors.black : Colors.white,
                size: 30,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height - 150,
                      child: state is PLaceCommentsList
                          ? myCommentsList.isNotEmpty
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: myCommentsList.length,
                                  itemBuilder: (context, index) {
                                    return CommentCaredWidget(
                                        comment: myCommentsList[index]);
                                  },
                                )
                              : const Text(
                                  "No Comment Added",
                                  style: TextStyle(
                                      height: 15,
                                      fontSize: 20,
                                      color: Colors.grey),
                                )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
                  WriteCommentField(
                      placeId: widget.placeId,
                      commentController: commentCubit.comment,
                      onPressed: () {
                        commentCubit.writeComment(widget.placeId);
                        Navigator.pop(context);
                      })
                ],
              ),
            ));
      },
    );
  }
}
