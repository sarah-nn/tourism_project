import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:tourism_project/business_logic/favorite/favorite_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/get_favorite_model.dart';
import 'package:tourism_project/data/models/places_depend_on_category_model.dart';
import 'package:tourism_project/data/models/places_model.dart';

class PlaceItem extends StatefulWidget {
  final Place? place;
  final PlaceDependOnCategoryModel? placeCat;
  const PlaceItem({super.key, @required this.place, @required this.placeCat});

  @override
  State<PlaceItem> createState() => _PlaceItemState();
}

class _PlaceItemState extends State<PlaceItem> {
  FavoriteCubit? myBloc;
  List<FavoriteModel> fav = [];

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorite();
    myBloc = context.read<FavoriteCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
      if (state is FavoriteSuccess) {
        fav = state.favoriteModel;
      }
      if (state is FavoriteSuccess) {
      } else if (state is FavoriteFailure) {
        showAlertDialog(context, state.errMessage);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: Card(
          color: light ? Colors.white : AppColor.secoundColorDark,
          elevation: 1.5,
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
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
                                image: NetworkImage(EndPoint.imageBaseUrl +
                                    (widget.place != null
                                        ? widget.place!.images![0].image!
                                        : widget.placeCat!.images![0].image!)),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 3),
                            Expanded(
                              child: Text(
                                widget.place != null
                                    ? widget.place!.name!
                                    : widget.placeCat!.name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                                "${widget.place != null ? widget.place!.area!.country!.name! : widget.placeCat!.area!.country!.name} , ${widget.place != null ? widget.place!.area!.name : widget.placeCat!.area!.name}"),
                            const SizedBox(height: 7),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LikeButton(
                        size: 26,
                        bubblesSize: 100,
                        circleSize: 20,
                        circleColor: const CircleColor(
                            start: Color.fromARGB(255, 152, 202, 243),
                            end: Color.fromARGB(255, 229, 135, 166)),
                        bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color.fromARGB(255, 156, 204, 244),
                            dotSecondaryColor:
                                Color.fromARGB(255, 234, 165, 240),
                            dotThirdColor: Color.fromARGB(255, 248, 159, 189),
                            dotLastColor: Color.fromARGB(255, 127, 208, 245)),
                        animationDuration: Duration(milliseconds: 1500),
                        isLiked: myBloc!.favoriteId
                                    .contains(widget.place?.id.toString()) ||
                                myBloc!.favoriteId
                                    .contains(widget.placeCat?.id.toString())
                            ? true
                            : false,
                        onTap: (isLiked) async {
                          if (!(myBloc!.favoriteId
                                  .contains(widget.place?.id.toString()) ||
                              myBloc!.favoriteId
                                  .contains(widget.placeCat?.id.toString()))) {
                            widget.place != null
                                ? myBloc!
                                    .addFavorite(widget.place!.id.toString())
                                : myBloc!.addFavorite(
                                    widget.placeCat!.id.toString());
                            widget.place != null
                                ? myBloc!.favoriteId
                                    .add(widget.place!.id.toString())
                                : myBloc!.favoriteId
                                    .add(widget.placeCat!.id.toString());

                            return true;
                          } else {
                            widget.place != null
                                ? myBloc!
                                    .removeFavorite(widget.place!.id.toString())
                                : myBloc!.removeFavorite(
                                    widget.placeCat!.id.toString());
                            widget.place != null
                                ? myBloc!.favoriteId
                                    .remove(widget.place!.id.toString())
                                : myBloc!.favoriteId
                                    .remove(widget.placeCat!.id.toString());
                            return false;
                          }
                        },
                        likeBuilder: (isLiked) {
                          return Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked
                                ? Color.fromARGB(255, 226, 80, 129)
                                : Colors.grey,
                          );
                        },
                      ),
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context).push(
                                '/PlaceDesPage/${widget.place != null ? widget.place!.id : widget.placeCat!.id}');
                          },
                          icon: Icon(
                            Icons.more_horiz,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
