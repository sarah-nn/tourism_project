import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/flight/detailsTrip_cubit.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';
import 'package:tourism_project/business_logic/forgetpassword/forgetpassword_cubit.dart';
import 'package:tourism_project/business_logic/hotel/room_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/business_logic/places/place_desc_cubit.dart';
import 'package:tourism_project/business_logic/places/places_cubit.dart';
import 'package:tourism_project/business_logic/profile/profile_cubit.dart';
import 'package:tourism_project/business_logic/static_trip/book_static_trip/book_static_trip_cubit.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/business_logic/upload_image/upload_image_cubit.dart';
import 'package:tourism_project/business_logic/user/user_cubit.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';
import 'package:tourism_project/presentation/screens/auth/forget_password_page.dart';
import 'package:tourism_project/presentation/screens/flight/flight_details.dart';
import 'package:tourism_project/presentation/screens/flight/flight_page.dart';
import 'package:tourism_project/presentation/screens/flight/search_flight_page.dart';
import 'package:tourism_project/presentation/screens/hotel/hotel_details_page.dart';
import 'package:tourism_project/presentation/screens/hotel/hotel_page.dart';
import 'package:tourism_project/presentation/screens/hotel/search_hotel_page.dart';
import 'package:tourism_project/presentation/screens/place/comments.dart';
import 'package:tourism_project/presentation/screens/place/images_view_page.dart';
import 'package:tourism_project/presentation/screens/place/place_desc_page.dart';
import 'package:tourism_project/presentation/screens/place/places_page.dart';
import 'package:tourism_project/presentation/screens/place_country_page.dart';
import 'package:tourism_project/presentation/screens/profile_page.dart';
import 'package:tourism_project/presentation/screens/search_country_page.dart';
import 'package:tourism_project/presentation/screens/starting/splash_screen.dart';
import 'package:tourism_project/presentation/screens/trip/dynamic_booking_destails_page.dart';
import 'package:tourism_project/presentation/screens/trip/search_static_trip.dart';
import 'package:tourism_project/presentation/screens/trip/starting_dynamic_page.dart';
import 'package:tourism_project/presentation/screens/trip/static_details_page.dart';
import 'package:tourism_project/presentation/screens/trip/dynamic_trip_page.dart';
import 'package:tourism_project/presentation/screens/home_page.dart';
import 'package:tourism_project/presentation/screens/auth/login_page.dart';
import 'package:tourism_project/presentation/screens/starting/onboarding_page.dart';
import 'package:tourism_project/presentation/screens/auth/register_page.dart';
import 'package:tourism_project/presentation/screens/auth/reset_password_page.dart';
import 'package:tourism_project/presentation/screens/starting/starting_page.dart';
import 'package:tourism_project/presentation/screens/trip/static_trip_page.dart';
import 'package:tourism_project/presentation/screens/auth/verify_code_page.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/flight_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/profile/top_with_image.dart';
import 'package:tourism_project/test.dart';
import 'package:tourism_project/test2.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
        path: AppRoutes.test,
        builder: (context, state) => BlocProvider(
              create: (context) => PlacesCubit(),
              child: TestPage(),
            )),

    GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
    GoRoute(
        path: AppRoutes.test2,
        builder: (context, state) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => DynamicTripCubit()),
              BlocProvider(create: (context) => PlacesCubit()),
            ], child: const TestPage2())),
    GoRoute(
        path: AppRoutes.homePage,
        builder: (context, state) => const HomePage()),
    GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
              create: (context) => UserCubit(),
              child: const LoginPage(),
            )),
    GoRoute(
        path: AppRoutes.startPage,
        builder: (context, state) => const StartingPage()),

    GoRoute(
        path: AppRoutes.searchCountryPage,
        builder: (context, state) => BlocProvider(
              create: (context) => CountryCubit(),
              child: const SearchCountryPage(),
            )),
//=================== profile =============================
    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(),
          ),
          BlocProvider<UploadImageCubit>(
            create: (context) => UploadImageCubit(),
          ),
        ],
        child: const ProfilePage(),
      ),
    ),
    GoRoute(
        path: AppRoutes.viewProfileImage,
        builder: (context, state) => ViewImage()),
//=============================================================
    GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => BlocProvider(
              create: (context) => UserCubit(),
              child: const RegisterPage(),
            )),
    GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => BlocProvider(
              create: (context) => ForgetpasswordCubit(),
              child: const ForgetPasswordPage(),
            )),
    GoRoute(
        path: AppRoutes.resetpassword,
        builder: (context, state) => BlocProvider(
              create: (context) => ForgetpasswordCubit(),
              child: const ResetPasswordPage(),
            )),
    GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => OnBoardingScreens()),
    GoRoute(
        path: "/placeCommentPage/:id",
        builder: (context, state) => BlocProvider(
              create: (context) => PlaceDescCubit(),
              child: CommentPage(
                placeId: state.pathParameters['id']!,
              ),
            )),
    GoRoute(
        path: AppRoutes.verifycodesignup,
        builder: (context, state) => const VerfiyCodeSignUp()),
//====================static trip=======================
    GoRoute(
        path: AppRoutes.staticTrip,
        builder: (context, state) => BlocProvider(
              create: (context) => StaticTripCubit(),
              child: const StaticTripPage(),
            )),
    GoRoute(
        path: AppRoutes.searchStaticTrip,
        builder: (context, state) => BlocProvider(
              create: (context) => StaticTripCubit(),
              child: const SearchStaticTripPage(),
            )),
    // GoRoute(
    //     path: AppRoutes.dynamicTrip,
    //     builder: (context, state) => BlocProvider(
    //           create: (context) => DynamicTripCubit(),
    //           child: const DynamicTripPage(),
    //         )),
    GoRoute(
        path: AppRoutes.dynamicTrip,
        builder: (context, state) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => DynamicTripCubit()),
              BlocProvider(create: (context) => CountryCubit()),
              BlocProvider(create: (context) => SearchHotelCubit()),
              BlocProvider(create: (context) => SearchFlightCubit())
            ], child: const DynamicTripPage())),
    GoRoute(
        path: "/StaticTripDetailsPage/:id",
        builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => StaticTripCubit()),
                BlocProvider(
                  create: (context) => BookStaticTripCubit(),
                )
              ],
              child: StaticTripDetailsPage(
                tripId: state.pathParameters['id']!,
              ),
            )),

//================ Dynamic Trip =================
    GoRoute(
        path: AppRoutes.flightTrip,
        builder: (context, state) => BlocProvider(
              create: (context) => DynamicTripCubit(),
              child: const FlightDynamicTrip(),
            )),
    GoRoute(
        path: AppRoutes.startDynamicPage,
        builder: (context, state) => const StartingDaynamicPage()),
    // GoRoute(
    //     path: AppRoutes.dynamicTripDetails,
    //     builder: (context, state) {
    //       final DynamicTripModel bookingModel = state.extra as DynamicTripModel;
    //       return BlocProvider(
    //         create: (context) => DynamicTripCubit(),
    //         child: DynamicTripDetailsPage(bookingModel: bookingModel),
    //       );
    //     }),
//============== Places ================
    GoRoute(
        path: AppRoutes.places,
        builder: (context, state) => BlocProvider(
              create: (context) => PlacesCubit(),
              child: const PlacesPage(),
            )),
    GoRoute(
        path: "/PlaceDesPage/:id",
        builder: (context, state) => BlocProvider(
              create: (context) => PlaceDescCubit(),
              child: PlaceDescPage(
                placeId: state.pathParameters['id']!,
              ),
            )),
    GoRoute(
        path: AppRoutes.imagesview,
        builder: (context, state) => ImageViewPage()),
    GoRoute(
        path: "/placeCountryPage/:id",
        builder: (context, state) {
          final String name = state.extra as String;
          return BlocProvider(
            create: (context) => PlacesCubit(),
            child: PlacesCountry(
                countryId: state.pathParameters['id']!, countryName: name),
          );
        }
        // => BlocProvider(
        //       create: (context) => PlacesCubit(),

        //       child: PlacesCountry(
        //         countryId: state.pathParameters['id']!,
        //       ),
        //     )
        ),
//====================Flight===================
    GoRoute(
        path: AppRoutes.flightPage,
        builder: (context, state) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => CountryCubit()),
              BlocProvider(create: (context) => SearchFlightCubit())
            ], child: FlightPage())),

    GoRoute(
        path: AppRoutes.searchFlightPage,
        builder: (context, state) => BlocProvider(
              create: (context) => SearchFlightCubit(),
              child: SearchFlightPage(),
            )),

    GoRoute(
      path: "/flightDetails/:id",
      builder: (context, state) => BlocProvider(
        create: (context) => DetailsPlaneTripCubit(),
        child: flightDetails(
          planeTripId: state.pathParameters['id']!,
        ),
      ),
    ),
//================ Hotel =============

    GoRoute(
        path: AppRoutes.hotelPage,
        builder: (context, state) => MultiBlocProvider(providers: [
              BlocProvider(create: (context) => CountryCubit()),
              BlocProvider(create: (context) => SearchHotelCubit())
            ], child: HotelPage())),

    GoRoute(
        path: "/SearchHotelPage/:id",
        builder: (context, state) => BlocProvider(
              create: (context) => SearchHotelCubit(),
              child: SearchHotelPage(
                countryId: state.pathParameters['id']!,
              ),
            )),

    GoRoute(
        path: "/InfoBookingHotelPage/:id",
        builder: (context, state) => BlocProvider(
              create: (context) => RoomCubit(),
              child: InfoBookingHotelPage(
                HotelId: state.pathParameters['id']!,
              ),
            )),
  ],
);



// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tourism_project/business_logic/places/places_cubit.dart';
// import 'package:tourism_project/business_logic/user/user_cubit.dart';
// import 'package:tourism_project/data/models/places_model.dart';
// import 'package:tourism_project/presentation/screens/home_page.dart';
// import 'package:tourism_project/presentation/screens/place/place_desc_page.dart';
// import 'package:tourism_project/presentation/screens/place/places_page.dart';
// import 'package:tourism_project/presentation/screens/search_area_page.dart';

// class AppRoutes {
//   Route? generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         final place = settings.arguments as Place;
//         return MaterialPageRoute(
//             builder: (_) => BlocProvider(
//                   create: (context) => PlacesCubit(),
//                   child: PlaceDescPage(
//                     placeId: place.id.toString(),
//                   ),
//                 ));
//     }
//   }
// }
