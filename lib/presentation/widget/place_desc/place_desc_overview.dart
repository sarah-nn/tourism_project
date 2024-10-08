import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';

class DescriptionAndOverview extends StatelessWidget {
  final String placeId;
  const DescriptionAndOverview({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2, color: light ? Colors.black : Colors.white))),
          child: Text(
            "Description",
            style: MyTextStyle.headers.copyWith(
                fontSize: 20, color: light ? Colors.black : Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: InkWell(
            onTap: () {
              // goRoute(context, AppRoutes.comments);
              GoRouter.of(context).push('/placeCommentPage/$placeId');
            },
            child: Text(
              "Overview",
              style: MyTextStyle.headers
                  .copyWith(fontSize: 20, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
