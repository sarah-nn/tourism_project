class EndPoint {
  static const String baseUrl = 'http://192.168.43.119:8000/api'; //for me
  //static const String baseUrl = 'http://192.168.43.76:8000/api'; //for Oula
  static const String imageBaseUrl = 'http://192.168.43.119:8000/';
  //static const String imageBaseUrl = 'http://192.168.43.76:8000/';

//======================== Auth ========================
  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String verifyCodeSignup = '$baseUrl/confirm-Code';
  static const String logOut = '$baseUrl/logout';

//======================== ForgetPassword ==============
  static const String checkemail = '$baseUrl/forget-password';
  static const String resetPassword = '$baseUrl/set-new-password';

//======================== Profile ====================
  static const String profile = '$baseUrl/profile';
  static const String changeProfilePhoto = '$baseUrl/user/change-profile-photo';
  static const String updateProfile = '$baseUrl/user/update-profile';
  static const String deleteImage = '$baseUrl/user/delete-profile-photo';

//======================== Places ====================
  static const String places = '$baseUrl/user/places';
  static const String placeDesc = '$baseUrl/user/show/';
  static const String placeRealtedToCountry =
      '$baseUrl/user/places-depending-on-country/';
  static const String placeComments = '$baseUrl/user/show/';
  static const String writeComment = '$baseUrl/user/add-comment';
  static const String allCategory = '$baseUrl/user/get_all_category';
  static const String placeDependOnCategory =
      '$baseUrl/user/places-depending-on-category/';

//======================== Country ====================
  static const String allCountries = '$baseUrl/user/get_all_country';

//======================== Area ====================
  static const String area = '$baseUrl/user/get_all_area';

//======================== Static Trip =================
  static const String allStaticTrip = '$baseUrl/user/all-static-trip';
  static const String staticTripDetails = '$baseUrl/user/show-static-trip/';
  static const String checkStaticTrip = '$baseUrl/user/check-static-trip/';
  static const String bookingStaticTrip = '$baseUrl/user/book-static-trip';
  static const String searchTrip = '$baseUrl/user/search-for-static-trip';

//======================= Dynamic Trip ==================
  static const String dynamicBooking = '$baseUrl/user/Add_booking_User';
  static const String dynamicBookingDetails =
      '$baseUrl/user/show_dynamic_trip/';
  static const String getAllDynamicList = '$baseUrl/user/all_my_dynamic_trip';
  static const String updateDynamicTrip = '$baseUrl/user/update_dynamic_trip/';
  static const String deleteDynamicTrip = '$baseUrl/user/delete_dynamic_trip/';

//==================== Flight ==========================
  static const String searchFlight = '$baseUrl/user/search-for-plane-trip';
  static const String flightDetails = '$baseUrl/user/show-plane-trip-details/';
  static const String bookPlane = '$baseUrl/user/plane_book';

//======================== Hotel=====================
  static const String searchHotel = '$baseUrl/user/get_Hotel_By_Country/';
  static const String roomHotel = '$baseUrl/user/get_all_room/';
  static const String bookHotel = '$baseUrl/user/hotel_book';

//===================details booking=================
  static const String detailsBookHotel = '$baseUrl/user/all_my_hotel_trip';
  static const String showDetailsBookHotel = '$baseUrl/user/show_hotel_trip/';
  static const String deleteBookinHotel = '$baseUrl/user/delete_dynamic_trip/';
  static const String editBookHotel = '$baseUrl/user/update_hotel_book/';
  static const String detailsBookPlane = '$baseUrl/user/all_my_plane_trip';
  static const String showDetailsBookPlane = '$baseUrl/user/show_plane_trip/';
  static const String editBookPlane = '$baseUrl/user/update_plane_book/';
  static const String detailsBookStaticTrip =
      '$baseUrl/user/show-all-my-staic-trip-books';
  static const String deleteBookStaticTrip =
      '$baseUrl/user/delete-static-trip-book/';
  static const String showDetailPriceTrippStatic =
      '$baseUrl/user/show-price-details/';
  static const String editStaticTrip = '$baseUrl/user/edit-static-trip-book/';

//======================== Activity =====================
  static const String getAllActivity = '$baseUrl/user/get-all-activity/';

//======================== Notes =============
  static const String getAllNotes = '$baseUrl/user/get-notes';
  //====================favorite=========================
  static const String getFavorite = '$baseUrl/get-all-favorite';
  static const String addFavorite = '$baseUrl/set-favorite';
  static const String deleteFavorite = '$baseUrl/delete-favorite';
  static const String dontMiss = '$baseUrl/get-trip-depending-on-favorite';
}
