class EndPoint {
  //static const String baseUrl = 'http://192.168.43.119:8000/api';
  static const String baseUrl = 'http://192.168.43.176:8000/api';
  static const String imageBaseUrl = 'http://192.168.43.119:8000/';

//======================== Auth ========================
  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String verifyCodeSignup = '$baseUrl/confirm-Code';

//======================== ForgetPassword ==============
  static const String checkemail = '$baseUrl/forget-password';
  static const String resetPassword = '$baseUrl/set-new-password';

//======================== Profile ====================
  static const String profile = '$baseUrl/profile';
  static const String changeProfilePhoto = '$baseUrl/user/change-profile-photo';
  static const String updateProfile = '$baseUrl/user/update-profile';

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

  //====================Flight==========================
  static const String searchFlight = '$baseUrl/user/search-for-plane-trip';
  static const String flightDetails = '$baseUrl/user/show-plane-trip-details/';

//======================== Hotel=====================
  static const String searchHotel = '$baseUrl/user/get_Hotel_By_Country/';
  static const String roomHotel = '$baseUrl/user/get_all_room/';
}
