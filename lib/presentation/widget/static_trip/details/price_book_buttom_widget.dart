import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/static_trip/book_static_trip/book_static_trip_cubit.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/presentation/widget/static_trip/check_static_book_widget.dart';

class PriceAndBookButtom extends StatelessWidget {
  final String price;
  final String tripId;
  const PriceAndBookButtom(
      {super.key, required this.price, required this.tripId});

  @override
  Widget build(BuildContext context) {
    String errMessage = '';
    return BlocConsumer<BookStaticTripCubit, BookStaticTripState>(
      listener: (context, state) {
        if (state is BookFail) {
          errMessage = (state).errMessage;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.primaryColor, width: 2.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "$price\n/ Person",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 17),
                    ),
                  )),
              const SizedBox(width: 10),
              Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: () {
                      final staticTripCubit =
                          context.read<BookStaticTripCubit>();
                      showModalBottomSheet(
                          isScrollControlled: true,
                          showDragHandle: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            // Pass the cubit instance to the bottom sheet
                            return BlocProvider.value(
                              value: staticTripCubit,
                              child: CheckStaticBookWidget(
                                cubit: staticTripCubit,
                                tripId: tripId,
                                //  state: errMessage,
                              ),
                            );
                          });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.primaryColor),
                      child: Text(
                        "Book Now",
                        style: MyTextStyle.Audiowide.copyWith(
                            fontSize: 19,
                            color: Colors.white,
                            letterSpacing: 1.5),
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
