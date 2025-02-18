import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle whiteTextStyle14 = TextStyle(color: Colors.white, fontSize: 14.sp);
TextStyle whiteTextStyle15 = TextStyle(color: Colors.white, fontSize: 15.sp);
TextStyle titleTextStyle15 = TextStyle(color: Colors.black, fontSize: 15.sp);
TextStyle blackTextStyle13 = TextStyle(fontSize: 13.sp, color: Colors.black);
Text normalText(String? text) {
  return Text(
    text ?? "",
    style: titleTextStyle15,
  );
}

Widget commonInput({
  String? labelText,
  TextEditingController? controller,
  ValueChanged<String>? onChanged,
  bool? obscureText,
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    obscureText: obscureText ?? false,
    style: TextStyle(color: Colors.white, fontSize: 14.sp),
    cursorColor: Colors.white,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 0.5.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 1.r),
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
    ),
  );
}

Widget whiteBorderButton({required String title, GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 45.h,
      margin: EdgeInsets.only(left: 40.w, right: 40.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(22.5.r),
        ),
        border: Border.all(color: Colors.white, width: 1.r),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 15.sp),
      ),
    ),
  );
}

Widget collectImage(bool? collect, {GestureTapCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Image.asset(
      collect == true
          ? "assets/images/img_collect"
              ".png"
          : "assets/images/img_collect_grey.png",
      width: 25.r,
      height: 25.r,
    ),
  );
}
