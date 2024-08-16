import 'package:tourism_project/core/database/cach_helper.dart';

String myToken = CacheHelper().getData(key: 'token');
String globalFcm = '';
List<int> placeIds = [];
List<String> placeNames = [];
List<int> activities = [];
String tripDestination = '';
String goingPlaneId = '';
String returnPlaneId = '';
String onePlaneId = '';
bool light = true;

//bool isselectePlace = true;
// String? gstartDate;
// String? gendDate;
// String? gtripname;
// String? gdistinationId;
// String? gSourceId;
// String? gsource;
// String? gdistination;
