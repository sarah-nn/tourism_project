import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/favorite/favorite_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/get_favorite_model.dart';
import 'package:tourism_project/presentation/widget/favorite/favorite_place_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<FavoriteModel> favorite = [];

  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorite();
  }

  void _handleDelete(int id) {
    setState(() {
      favorite.removeWhere((fav) => fav.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
      if (state is FavoriteSuccess) {
        favorite = (state).favoriteModel;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is FavoriteFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor:
              light ? AppColor.primaryColor : AppColor.primaryColorDark,

          // light ? AppColor.primaryColor : AppColor.primaryColorDark,
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(
              fontFamily: 'Philosopher',
            ),
          ),
          // elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: state is FavoriteSuccess
              ? favorite.isNotEmpty
                  ? ListView.builder(
                      itemCount: favorite.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BlocProvider(
                          create: (context) => FavoriteCubit(),
                          child: PlaceFavorite(
                            favoriteModel: favorite[index],
                            onDelete: () => _handleDelete(favorite[index].id),
                          ),
                        );
                      })
                  : Center(
                      child: Text(
                        'Not found any favorite',
                        style: TextStyle(
                          fontFamily: 'normal',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: light ? Colors.black54 : Colors.white60,
                          // light ? Colors.black54 : Colors.white60
                        ),
                      ),
                    )
              : Center(
                  child: Container(
                      height: 200,
                      width: 200,
                      child: Lottie.asset(AppImage.loading))),
        ),
      );
    });
  }
}
