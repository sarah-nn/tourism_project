import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/favorite/favorite_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/get_favorite_model.dart';

// ignore: must_be_immutable
class PlaceFavorite extends StatefulWidget {
  FavoriteModel? favoriteModel;
  final VoidCallback onDelete;

  PlaceFavorite(
      {required this.onDelete, required this.favoriteModel, super.key});

  @override
  State<PlaceFavorite> createState() => _PlaceFavoriteState();
}

class _PlaceFavoriteState extends State<PlaceFavorite> {
  late FavoriteCubit myBloc;

  @override
  void initState() {
    super.initState();
    myBloc = BlocProvider.of<FavoriteCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
      if (state is RemoveFavoriteSuccess) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
        widget.onDelete();
      } else if (state is RemoveFavoriteFailure) {
        showAlertDialog(context, state.errMessage);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 13),
        child: Card(
          elevation: 1.5,
          child: Container(
            color: light ? AppColor.secondColor : AppColor.secoundColorDark,
            //color: light ? AppColor.secondColor : AppColor.secoundColorDark,
            padding: const EdgeInsets.all(10),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 97,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        elevation: 8,
                        child: Image(
                          image: NetworkImage(
                            EndPoint.imageBaseUrl +
                                widget.favoriteModel!.place.images[1].image,
                          ),
                          height: 95,
                          width: 95,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        Text(
                          '${widget.favoriteModel?.place.namePlace}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        Text(
                            "${widget.favoriteModel?.place.area.country.name} , ${widget.favoriteModel?.place.area.name}"),
                        const SizedBox(height: 7),
                        // Expanded(
                        //   child: Row(
                        //     children: [
                        //       ...List.generate(
                        //           3,
                        //           (index) => const Icon(
                        //                 Icons.star,
                        //                 color: Colors.amber,
                        //                 size: 19,
                        //               )),
                        //       ...List.generate(
                        //           2,
                        //           (index) => const Icon(
                        //                 Icons.star,
                        //                 size: 19,
                        //                 color: Colors.grey,
                        //               )),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        myBloc.removeFavorite(
                            widget.favoriteModel!.placeId.toString());
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: Color.fromARGB(255, 235, 124, 146),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                            '/PlaceDesPage/${widget.favoriteModel?.place.id}');
                      },
                      child: Icon(
                        Icons.more_horiz,
                        color: AppColor.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
