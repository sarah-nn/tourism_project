import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CustomTextFormAuth extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final bool isNumber;
  final bool? isPassword;
  bool? passToggle;
  final String? Function(String?) valid;

  CustomTextFormAuth({
    super.key,
    required this.hintText,
    required this.labelText,
    @required this.iconData,
    @required this.mycontroller,
    required this.valid,
    required this.isNumber,
    this.isPassword = false,
    this.passToggle,
  });

  @override
  State<CustomTextFormAuth> createState() => _CustomTextFormAuthState();
}

class _CustomTextFormAuthState extends State<CustomTextFormAuth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.labelText,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText:
                widget.passToggle! || widget.passToggle == true ? true : false,
            validator: widget.valid,
            controller: widget.mycontroller,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.thirdColor.withOpacity(0.2),
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 9, horizontal: 35),
              suffixIcon: widget.isPassword == true
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          widget.passToggle =
                              widget.passToggle == true ? false : true;
                        });
                      },
                      child: Icon(
                        widget.passToggle!
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.primaryColor,
                      ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  widget.iconData,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
