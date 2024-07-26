import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  //profile
  XFile? profilePic;

  Future upLoadImage() async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $myToken'
      };
      var request =
          http.MultipartRequest('POST', Uri.parse(EndPoint.changeProfilePhoto));
      request.files
          .add(await http.MultipartFile.fromPath('image', profilePic!.path));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("update photo successfully========");
        print(await response.stream.bytesToString());
        CacheHelper().saveData(key: "profileImage", value: profilePic!.path);
        emit(ProfileImageChanged(myImage: profilePic!.path));
      } else {
        print("dsfasf");
        print(response.reasonPhrase);
      }
    } catch (e) {
      emit(ChangeImageFail(errMessage: e.toString()));
    }
  }

  uploadProfilePic(XFile? image) {
    profilePic = image;
    upLoadImage();
    emit(ProfileUploadProfilePic());
  }

  deleteImage() async {
    var uri = Uri.parse(EndPoint.deleteImage);
    var header = {'Authorization': 'Bearer $myToken'};
    try {
      var response = await http.post(uri, headers: header);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(
            "Profile api error with ${response.statusCode}and ${response.body}");
      }
    } catch (e) {
      print(e.toString());
      emit(ChangeImageFail(errMessage: e.toString()));
    }
  }
}
