import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/comment_model.dart';
import 'package:tourism_project/data/models/place_desc_model.dart';

part 'place_desc_state.dart';

class PlaceDescCubit extends Cubit<PlaceDescState> {
  PlaceDescCubit() : super(PlaceDescInitial());

  TextEditingController comment = TextEditingController();

  var data = [];
  List<PlaceDescModel> placeDesList = [];
  List<Comment> commentsList = [];

  Future<List<PlaceDescModel>> getAllPlace(String placeId) async {
    var uri = Uri.parse(EndPoint.placeDesc + placeId);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);
    try {
      emit(PlaceDescLoading());
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['data'];
        emit(PlaceDescSuccess(PlaceDescModel.fromJson(data)));
      } else {
        print("api error${response.statusCode}");
      }
    } catch (e) {
      print("$e");
      emit(PlaceDescFailure(errMessage: e.toString()));
    }
    print(placeDesList);
    return placeDesList;
  }

  Future<List<Comment>> getAllComments(String placeId) async {
    var uri = Uri.parse(EndPoint.placeComments + placeId);
    var header = {'Authorization': 'Bearer $myToken'};
    var response = await http.get(uri, headers: header);

    try {
      emit(PlaceDescLoading());
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final commentsJson = data['data']['comments'] as List;
        commentsList = commentsJson
            .map((commentJson) => Comment.fromJson(commentJson))
            .toList();
        emit(PLaceCommentsList(commentsList: commentsList));
        print(commentsJson);
      } else {
        print("api error : ${response.statusCode} and ${response.body}");
      }
    } catch (e) {
      print("$e");
      print(response.body);
      emit(PlaceDescFailure(errMessage: e.toString()));
    }
    return commentsList;
  }

  writeComment(String placeId) async {
    emit(PlaceDescLoading());
    http.Response response =
        await http.post(Uri.parse(EndPoint.writeComment), body: {
      'place_id': placeId,
      'comment': comment.text
    }, headers: {
      'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Accept': 'application/json',
      'Authorization': 'Bearer $myToken'
    });
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body);
      final newComment = Comment.fromJson(jsonDecode(response.body)['data']);
      commentsList.add(newComment);
      emit(PLaceCommentsList(commentsList: commentsList));
      print(message);
      //  emit(CommentAddSuccess());
    } else {
      var message = jsonDecode(response.body)['message'];
      print(message);
      emit(PlaceDescFailure(errMessage: message));
    }
  }
}
