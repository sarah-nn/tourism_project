import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism_project/business_logic/upload_image/upload_image_cubit.dart';

class EditImage extends StatefulWidget {
  const EditImage({super.key});

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        if (state is ProfileImageChanged) {
          print("image changed successfully");
        }
        if (state is ChangeImageFail) {
          print("image change problem ${state.errMessage}");
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ImagePicker().pickImage(source: ImageSource.gallery).then(
                      (value) => context
                          .read<UploadImageCubit>()
                          .uploadProfilePic(value ?? null));
                },
                child: const Text(
                  "edit image ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
              ),
              const Icon(
                Iconsax.edit_2_copy,
                color: Colors.blue,
              )
            ],
          ),
        );
      },
    );
  }
}
