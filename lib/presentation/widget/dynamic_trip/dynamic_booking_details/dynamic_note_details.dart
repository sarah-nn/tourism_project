import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/update_trip/update_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

class DynamicNoteDetails extends StatefulWidget {
  const DynamicNoteDetails({super.key, required this.mymodel});
  final DataModel mymodel;

  @override
  State<DynamicNoteDetails> createState() => _DynamicNoteDetailsState();
}

class _DynamicNoteDetailsState extends State<DynamicNoteDetails> {
  bool isAddEdit = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var noteController = context.read<DynamicTripCubit>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Trip Note ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isAddEdit = true;
                  });
                },
                child: Icon(
                  Icons.edit,
                  color: AppColor.primaryColor,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 4),
                child: Text(
                  widget.mymodel.dynamicTrip!.tripNote!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              isAddEdit ? SizedBox(height: 10) : Container(),
              isAddEdit
                  ? ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: 40.0, maxHeight: 200.0),
                      child: IntrinsicHeight(
                        child: TextField(
                          controller: noteController.tripNote,
                          focusNode: _focusNode,
                          maxLines:
                              null, // Allows the TextField to grow in height
                          expands: true,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isAddEdit = false;
                                  });
                                  context.read<UpdateTripCubit>().addednotes =
                                      noteController.tripNote.text;
                                },
                                icon: const Icon(Icons.check)),
                            border: OutlineInputBorder(),
                            hintText: 'Add additional notes',
                          ),
                        ),
                      ),
                    )
                  : Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        "add : ${noteController.tripNote.text}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    )
            ],
          ),
        ],
      ),
    );
  }
}
