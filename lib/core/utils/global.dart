import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

String myToken = CacheHelper().getData(key: 'token');
List<int> placeIds = [];
List<String> placeNames = [];
List<int> activities = [];
String tripDestination = '';
String goingPlaneId = '';
String returnPlaneId = '';
String onePlaneId = '';
//bool isselectePlace = true;
// String? gstartDate;
// String? gendDate;
// String? gtripname;
// String? gdistinationId;
// String? gSourceId;
// String? gsource;
// String? gdistination;
