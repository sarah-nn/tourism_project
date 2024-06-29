import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';

class WidgetDialogInfoBook extends StatelessWidget {
  WidgetDialogInfoBook(
      {this.numDay,
      this.numFourCapacity,
      this.numSixCapacity,
      this.numTowCapacity,
      this.priceFourCapacity,
      this.priceSixCapacity,
      this.priceTowCapacity,
      super.key});
  int? numTowCapacity;
  int? numFourCapacity;
  int? numSixCapacity;
  int? numDay;
  int? priceFourCapacity;
  int? priceSixCapacity;
  int? priceTowCapacity;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      // AppColor.secondColor.withAlpha(200),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: 500,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                'Informatin Booking',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: AppColor.primaryColor),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Text(
                  'Name Hotel : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(' Al Manar'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  'Location : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(' Syria , Aleppo'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Number of room :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text('-->  $numTowCapacity room of Capacity tow'),
            const SizedBox(height: 10),
            Text('-->  $numFourCapacity room of Capacity four'),
            const SizedBox(height: 10),
            Text('-->  $numSixCapacity room of Capacity six'),
            const SizedBox(height: 10),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Num of day : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(' $numDay'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Total Price :  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                    '${(priceFourCapacity! * numFourCapacity! + priceSixCapacity! * numSixCapacity! + priceTowCapacity! * numTowCapacity!) * numDay!}'),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: WidgetElevatedButton(
                      height: 40,
                      onTap: () {},
                      text: 'Edit',
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 2,
                    child: WidgetElevatedButton(
                      height: 45,
                      onTap: () {},
                      text: 'ok',
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
