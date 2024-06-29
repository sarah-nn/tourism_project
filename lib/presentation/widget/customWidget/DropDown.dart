import 'package:flutter/material.dart';
import 'package:tourism_project/presentation/widget/customWidget/ExpandedListAnimationWidget.dart';
import 'package:tourism_project/presentation/widget/customWidget/Scrollbar.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

List<String> _list = [
  'Syria',
  "Egypet",
  "USA",
  'lebanon',
  'Syria',
  "Egypet",
  "USA",
  'lebanon'
];

class _DropDownState extends State<DropDown> {
  bool isStrechedDropDown = false;
  int? groupValue;
  String title = 'From';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffbbbbbb)),
                      borderRadius: BorderRadius.all(Radius.circular(27))),
                  child: Column(
                    children: [
                      Container(
                          // height: 45,
                          width: 400,
                          padding: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffbbbbbb),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          constraints: BoxConstraints(
                            minHeight: 45,
                            minWidth: 400,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text(
                                    title,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isStrechedDropDown = !isStrechedDropDown;
                                    });
                                  },
                                  child: Icon(isStrechedDropDown
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward))
                            ],
                          )),
                      ExpandedSection(
                        expand: isStrechedDropDown,
                        height: 100,
                        child: MyScrollbar(
                          builder: (context, scrollController2) =>
                              ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  controller: scrollController2,
                                  shrinkWrap: true,
                                  itemCount: _list.length,
                                  itemBuilder: (context, index) {
                                    return RadioListTile(
                                        title: Text(_list.elementAt(index)),
                                        value: index,
                                        groupValue: groupValue,
                                        onChanged: (val) {
                                          setState(() {
                                            groupValue = val!;
                                            title = _list.elementAt(index);
                                          });
                                        });
                                  }),
                          scrollController: ScrollController(),
                        ),
                      )
                    ],
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
