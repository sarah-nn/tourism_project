import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

class DynamicTripBookingDetailsPage extends StatefulWidget {
  final String tripId;
  const DynamicTripBookingDetailsPage({
    super.key,
    required this.tripId,
  });

  @override
  State<DynamicTripBookingDetailsPage> createState() =>
      _DynamicTripBookingDetailsPageState();
}

class _DynamicTripBookingDetailsPageState
    extends State<DynamicTripBookingDetailsPage> {
  Data? mymodel;

  @override
  void initState() {
    super.initState();
    context.read<DynamicTripCubit>().dynamicTripBookingdetails(widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        if (state is DynamicTripBookingSuccess) {
          mymodel = (state).dynamicbookingModel;
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Center(
                child: state is DynamicTripBookingSuccess
                    ? Text(mymodel!.tripName)
                    : const Center(
                        child: CircularProgressIndicator(),
                      )));
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:tourism_project/core/utils/global.dart';
// import 'dart:convert';

// import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

// class DynamicTripDetailsPage extends StatefulWidget {
//   @override
//   _DynamicTripDetailsPageState createState() => _DynamicTripDetailsPageState();
// }

// class _DynamicTripDetailsPageState extends State<DynamicTripDetailsPage> {
//   DynamicTripModel? tripData;
//   @override
//   void initState() {
//     super.initState();
//     fetchTripDetails();
//   }

//   Future<void> fetchTripDetails() async {
//     final response = await http.get(
//         Uri.parse('http://192.168.43.119:8000/api/user/show_dynamic_trip/3'),
//         headers: {'Authorization': 'Bearer $myToken'});

//     var jsonResponse;
//     if (response.statusCode == 200) {
//       // jsonResponse = json.decode(response.body);
//       // setState(() {
//       //   tripData = DynamicTripModel.fromJson(jsonResponse['data']);
//       // });
//     } else {
//       print(jsonResponse);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (tripData == null) {
//       return Center(child: CircularProgressIndicator());
//     }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Text('Trip Name: ${tripData!.tripName}',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 10),
//             Text('Price: ${tripData!.price}'),
//             Text('Number of People: ${tripData!.numberOfPeople}'),
//             Text('Start Date: ${tripData!.startDate}'),
//             Text('End Date: ${tripData!.endDate}'),
//             Text('Trip Note: ${tripData!.tripNote}'),
//             Text('Type: ${tripData!.type}'),
//             Text('Rooms Count: ${tripData!.roomsCount}'),
//             SizedBox(height: 20),
//             Text('Plane Trips:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             ...List.generate(tripData!.planeTrips.length, (index) {
//               var planeTrip = tripData!.planeTrips[index];
//               return Card(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Flight ${index + 1}:',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold)),
//                       Text('Source: ${planeTrip.airportSource.name}'),
//                       Text('Destination: ${planeTrip.airportDestination.name}'),
//                       Text('Current Price: ${planeTrip.currentPrice}'),
//                       Text('Available Seats: ${planeTrip.availableSeats}'),
//                       Text('Flight Date: ${planeTrip.flightDate}'),
//                       Text('Landing Date: ${planeTrip.landingDate}'),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
