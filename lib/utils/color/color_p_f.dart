import 'package:circular_color_picker/circular_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shem/utils/val/color.dart';
import 'package:shem/widgets/dialog/default_dialog_widget.dart';

import '../debug_print.dart';
import '../decoration/default_decoration.dart';
import 'hex_color.dart';

class ColorPWidgetF extends StatefulWidget {
  final Function(String v) color;
  String colorHex;

  ColorPWidgetF({super.key, required this.color, required this.colorHex});

  @override
  State<ColorPWidgetF> createState() => _ColorPWidgetFState();
}

class _ColorPWidgetFState extends State<ColorPWidgetF> {
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currnetPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: defaultDecoration(
        white,
        0,
        0,
        0,
        0,
        true,
        1,
        HexColor.fromHex("#E5E5E5"),
        false,
        Colors.transparent,
        0,
        0,
        0,
        0,
      ),
      child: Column(
        children: [
          Container(
              height: 28.h,
              // padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Row(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       currnetPageIndex = 0;
                  //     });
                  //   },
                  //   child: Image.asset(
                  //     "assets/images/color_back_icon.png",
                  //     width: 28.w,
                  //   ),
                  // ),
                  Expanded(
                      child: PageView(
                    controller: pageController,
                    onPageChanged: (v) {
                      setState(() {
                        currnetPageIndex = v;
                      });
                    },
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var result = await defaultDialog(
                                  true,
                                  true,
                                  200,
                                  200,
                                  999,
                                  ColorPickerDialog(
                                    currentColor: widget.colorHex,
                                  ));
                              if (result != null) {
                                dPrint(result);
                                setState(() {
                                  widget.colorHex = result;
                                });
                                widget.color(result);
                              }
                            },
                            child: Container(
                              width: 28.w,
                              height: 28.w,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/color_p_icon.png",
                                    width: 28.w,
                                  ),
                                  // if (!createBingoController.colorSet.contains(createBingoController.taskTextColor.value)) ...[
                                  //   Center(
                                  //     child: Image.asset(
                                  //       "assets/images/check_icon.png",
                                  //       width: 9.w,
                                  //       color: black,
                                  //     ),
                                  //   )
                                  // ]
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.colorHex = Colors.transparent.toHex();
                              });
                              widget.color(Colors.transparent.toHex());

                              // if (widget.textMode) {
                              //   createBingoController.taskTextColor.value = Colors.transparent.toHex();
                              // } else {
                              //   createBingoController.taskBingoBackgroundColor.value = Colors.transparent.toHex();
                              // }
                            },
                            child: Container(
                              width: 28.w,
                              height: 28.w,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/color_trans_icon.png",
                                    width: 28.w,
                                  ),
                                  if (widget.colorHex == Colors.transparent.toHex()) ...[
                                    Center(
                                      child: Image.asset(
                                        "assets/images/check_icon.png",
                                        width: 9.w,
                                        color: black,
                                      ),
                                    )
                                  ]
                                  // if (widget.textMode ? createBingoController.taskTextColor.value == "#00000000" : createBingoController.taskBingoBackgroundColor.value == "#00000000") ...[
                                  // Center(
                                  //   child: Image.asset(
                                  //     "assets/images/check_icon.png",
                                  //     width: 9.w,
                                  //     color: black,
                                  //   ),
                                  // )
                                  // ]
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              widget.color("#FFFFFF");
                              setState(() {
                                widget.colorHex = "#FFFFFF";
                              });

                              // if (widget.textMode) {
                              //   createBingoController.taskTextColor.value = "#FFFFFF";
                              // } else {
                              //   createBingoController.taskBingoBackgroundColor.value = "#FFFFFF";
                              // }
                            },
                            child: Container(
                              width: 28.w,
                              height: 28.w,
                              decoration: defaultDecoration(white, 999, 999, 999, 999, true, 1, HexColor.fromHex("#E5E5E5"), false, Colors.transparent, 0, 0, 0, 0),
                              child: widget.colorHex == "#FFFFFF"
                                  ?
                                  // (widget.colorHex ? createBingoController.taskTextColor.value == "#FFFFFF" : createBingoController.taskBingoBackgroundColor.value == "#FFFFFF")
                                  // ?
                                  Center(
                                      child: Image.asset(
                                        "assets/images/check_icon.png",
                                        width: 9.w,
                                        color: black,
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#D9D9D9");
                                setState(() {
                                  widget.colorHex = "#D9D9D9";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#D9D9D9";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#D9D9D9";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#D9D9D9"),
                                child: widget.colorHex == "#D9D9D9"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#D9D9D9" : createBingoController.taskBingoBackgroundColor.value == "#D9D9D9")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: black,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#9D9D9D");
                                setState(() {
                                  widget.colorHex = "#9D9D9D";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#9D9D9D";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#9D9D9D";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#9D9D9D"),
                                child: widget.colorHex == "#9D9D9D"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#9D9D9D" : createBingoController.taskBingoBackgroundColor.value == "#9D9D9D")
                                    //     ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#5B5B5B");
                                setState(() {
                                  widget.colorHex = "#5B5B5B";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#5B5B5B";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#5B5B5B";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#5B5B5B"),
                                child: widget.colorHex == "#5B5B5B"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#5B5B5B" : createBingoController.taskBingoBackgroundColor.value == "#5B5B5B")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#000000");
                                setState(() {
                                  widget.colorHex = "#000000";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#000000";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#000000";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#000000"),
                                child: widget.colorHex == "#000000"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#000000" : createBingoController.taskBingoBackgroundColor.value == "#000000")
                                    //     ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 14.w),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FE1600");
                                setState(() {
                                  widget.colorHex = "#FE1600";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FE1600";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FE1600";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FE1600"),
                                child: widget.colorHex == "#FE1600"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FE1600" : createBingoController.taskBingoBackgroundColor.value == "#FE1600")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FE4BB3");
                                setState(() {
                                  widget.colorHex = "#FE4BB3";
                                });

                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FE4BB3";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FE4BB3";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FE4BB3"),
                                child: widget.colorHex == "#FE4BB3"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FE4BB3" : createBingoController.taskBingoBackgroundColor.value == "#FE4BB3")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FF912C");
                                setState(() {
                                  widget.colorHex = "#FF912C";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FF912C";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FF912C";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FF912C"),
                                child: widget.colorHex == "#FF912C"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#FF912C" : createBingoController.taskBingoBackgroundColor.value == "#FF912C")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FEC200");
                                setState(() {
                                  widget.colorHex = "#FEC200";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FEC200";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FEC200";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FEC200"),
                                child: widget.colorHex == "#FEC200"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FEC200" : createBingoController.taskBingoBackgroundColor.value == "#FEC200")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#5BCF66");
                                setState(() {
                                  widget.colorHex = "#5BCF66";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#5BCF66";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#5BCF66";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#5BCF66"),
                                child: widget.colorHex == "#5BCF66"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#5BCF66" : createBingoController.taskBingoBackgroundColor.value == "#5BCF66")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#0046FE");
                                setState(() {
                                  widget.colorHex = "#0046FE";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#0046FE";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#0046FE";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#0046FE"),
                                child: widget.colorHex == "#0046FE"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#0046FE" : createBingoController.taskBingoBackgroundColor.value == "#0046FE")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#8700FF");
                                setState(() {
                                  widget.colorHex = "#8700FF";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#8700FF";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#8700FF";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#8700FF"),
                                child: widget.colorHex == "#8700FF"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#8700FF" : createBingoController.taskBingoBackgroundColor.value == "#8700FF")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 14.w),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FFB2E6");
                                setState(() {
                                  widget.colorHex = "#FFB2E6";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FFB2E6";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FFB2E6";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FFB2E6"),
                                child: widget.colorHex == "#FFB2E6"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#FFB2E6" : createBingoController.taskBingoBackgroundColor.value == "#FFB2E6")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FFB494");
                                setState(() {
                                  widget.colorHex = "#FFB494";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FFB494";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FFB494";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FFB494"),
                                child: widget.colorHex == "#FFB494"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#FFB494" : createBingoController.taskBingoBackgroundColor.value == "#FFB494")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FFE06C");
                                setState(() {
                                  widget.colorHex = "#FFE06C";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FFE06C";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FFE06C";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FFE06C"),
                                child: widget.colorHex == "#FFE06C"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FFE06C" : createBingoController.taskBingoBackgroundColor.value == "#FFE06C")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#B9E7A3");
                                setState(() {
                                  widget.colorHex = "#B9E7A3";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#B9E7A3";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#B9E7A3";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#B9E7A3"),
                                child: widget.colorHex == "#B9E7A3"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#B9E7A3" : createBingoController.taskBingoBackgroundColor.value == "#B9E7A3")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#9DD7F8");
                                setState(() {
                                  widget.colorHex = "#9DD7F8";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#9DD7F8";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#9DD7F8";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#9DD7F8"),
                                child: widget.colorHex == "#9DD7F8"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#9DD7F8" : createBingoController.taskBingoBackgroundColor.value == "#9DD7F8")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#99B4FD");
                                setState(() {
                                  widget.colorHex = "#99B4FD";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#99B4FD";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#99B4FD";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#99B4FD"),
                                child: widget.colorHex == "#99B4FD"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#99B4FD" : createBingoController.taskBingoBackgroundColor.value == "#99B4FD")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#C0B1F6");
                                setState(() {
                                  widget.colorHex = "#C0B1F6";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#C0B1F6";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#C0B1F6";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#C0B1F6"),
                                child: widget.colorHex == "#C0B1F6"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#C0B1F6" : createBingoController.taskBingoBackgroundColor.value == "#C0B1F6")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              )),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  color: currnetPageIndex == 0 ? black : HexColor.fromHex("#CCCCCC"),
                ),
              ),
              SizedBox(width: 5.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  color: currnetPageIndex == 1 ? black : HexColor.fromHex("#CCCCCC"),
                ),
              ),
              SizedBox(width: 5.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  color: currnetPageIndex == 2 ? black : HexColor.fromHex("#CCCCCC"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ColorPickerDialog extends StatelessWidget {
  final String currentColor;

  const ColorPickerDialog({super.key, required this.currentColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 200.w,
      height: 200.w,
      child: Center(
          child: CircularColorPicker(
        radius: 200.w,
        pickerOptions: CircularColorPickerOptions(
            callOnChangeFunctionOnEnd: true,
            initialColor: HexColor.fromHex(
              currentColor == "" ? "#c44c40" : currentColor,
            )),
        pickerDotOptions: PickerDotOptions(
          isInner: true,
          borderWidth: 2,
        ),
        onColorChange: (value) {
          dPrint(value.toHex());
          Get.back(result: value.toHex());
          // if (createBingoController.colorMode.value == "Text") {
          //   createBingoController.taskTextColor(value.toHex());
          // } else {
          //   createBingoController.taskBingoBackgroundColor(value.toHex());
          // }

          // createBingoController.showColorPwidget(false);
          //
          // change it as you want
          //
        },
      )),
    );
  }
}

class ColorPWidgetFNoLine extends StatefulWidget {
  final Function(String v) color;
  String colorHex;

  ColorPWidgetFNoLine({super.key, required this.color, required this.colorHex});

  @override
  State<ColorPWidgetFNoLine> createState() => _ColorPWidgetFNoLineState();
}

class _ColorPWidgetFNoLineState extends State<ColorPWidgetFNoLine> {
  PageController pageController = PageController(
    initialPage: 0,
  );
  int currnetPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      // decoration: defaultDecoration(
      //   white,
      //   0,
      //   0,
      //   0,
      //   0,
      //   true,
      //   1,
      //   HexColor.fromHex("#E5E5E5"),
      //   false,
      //   Colors.transparent,
      //   0,
      //   0,
      //   0,
      //   0,
      // ),
      child: Column(
        children: [
          Container(
              height: 28.h,
              // padding: EdgeInsets.symmetric(horizontal: 9.w),
              child: Row(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       currnetPageIndex = 0;
                  //     });
                  //   },
                  //   child: Image.asset(
                  //     "assets/images/color_back_icon.png",
                  //     width: 28.w,
                  //   ),
                  // ),
                  Expanded(
                      child: PageView(
                    controller: pageController,
                    onPageChanged: (v) {
                      setState(() {
                        currnetPageIndex = v;
                      });
                    },
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var result = await defaultDialog(
                                  true,
                                  true,
                                  200,
                                  200,
                                  999,
                                  ColorPickerDialog(
                                    currentColor: widget.colorHex,
                                  ));
                              if (result != null) {
                                dPrint(result);
                                setState(() {
                                  widget.colorHex = result;
                                });
                                widget.color(result);
                              }
                            },
                            child: Container(
                              width: 28.w,
                              height: 28.w,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/color_p_icon.png",
                                    width: 28.w,
                                  ),
                                  // if (!createBingoController.colorSet.contains(createBingoController.taskTextColor.value)) ...[
                                  //   Center(
                                  //     child: Image.asset(
                                  //       "assets/images/check_icon.png",
                                  //       width: 9.w,
                                  //       color: black,
                                  //     ),
                                  //   )
                                  // ]
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.colorHex = Colors.transparent.toHex();
                              });
                              widget.color(Colors.transparent.toHex());

                              // if (widget.textMode) {
                              //   createBingoController.taskTextColor.value = Colors.transparent.toHex();
                              // } else {
                              //   createBingoController.taskBingoBackgroundColor.value = Colors.transparent.toHex();
                              // }
                            },
                            child: Container(
                              width: 28.w,
                              height: 28.w,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/images/color_trans_icon.png",
                                    width: 28.w,
                                  ),
                                  if (widget.colorHex == Colors.transparent.toHex()) ...[
                                    Center(
                                      child: Image.asset(
                                        "assets/images/check_icon.png",
                                        width: 9.w,
                                        color: black,
                                      ),
                                    )
                                  ]
                                  // if (widget.textMode ? createBingoController.taskTextColor.value == "#00000000" : createBingoController.taskBingoBackgroundColor.value == "#00000000") ...[
                                  // Center(
                                  //   child: Image.asset(
                                  //     "assets/images/check_icon.png",
                                  //     width: 9.w,
                                  //     color: black,
                                  //   ),
                                  // )
                                  // ]
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              widget.color("#FFFFFF");
                              setState(() {
                                widget.colorHex = "#FFFFFF";
                              });

                              // if (widget.textMode) {
                              //   createBingoController.taskTextColor.value = "#FFFFFF";
                              // } else {
                              //   createBingoController.taskBingoBackgroundColor.value = "#FFFFFF";
                              // }
                            },
                            child: Container(
                              width: 28.w,
                              height: 28.w,
                              decoration: defaultDecoration(white, 999, 999, 999, 999, true, 1, HexColor.fromHex("#E5E5E5"), false, Colors.transparent, 0, 0, 0, 0),
                              child: widget.colorHex == "#FFFFFF"
                                  ?
                                  // (widget.colorHex ? createBingoController.taskTextColor.value == "#FFFFFF" : createBingoController.taskBingoBackgroundColor.value == "#FFFFFF")
                                  // ?
                                  Center(
                                      child: Image.asset(
                                        "assets/images/check_icon.png",
                                        width: 9.w,
                                        color: black,
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#D9D9D9");
                                setState(() {
                                  widget.colorHex = "#D9D9D9";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#D9D9D9";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#D9D9D9";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#D9D9D9"),
                                child: widget.colorHex == "#D9D9D9"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#D9D9D9" : createBingoController.taskBingoBackgroundColor.value == "#D9D9D9")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: black,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#9D9D9D");
                                setState(() {
                                  widget.colorHex = "#9D9D9D";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#9D9D9D";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#9D9D9D";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#9D9D9D"),
                                child: widget.colorHex == "#9D9D9D"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#9D9D9D" : createBingoController.taskBingoBackgroundColor.value == "#9D9D9D")
                                    //     ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#5B5B5B");
                                setState(() {
                                  widget.colorHex = "#5B5B5B";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#5B5B5B";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#5B5B5B";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#5B5B5B"),
                                child: widget.colorHex == "#5B5B5B"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#5B5B5B" : createBingoController.taskBingoBackgroundColor.value == "#5B5B5B")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#000000");
                                setState(() {
                                  widget.colorHex = "#000000";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#000000";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#000000";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#000000"),
                                child: widget.colorHex == "#000000"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#000000" : createBingoController.taskBingoBackgroundColor.value == "#000000")
                                    //     ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 14.w),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FE1600");
                                setState(() {
                                  widget.colorHex = "#FE1600";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FE1600";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FE1600";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FE1600"),
                                child: widget.colorHex == "#FE1600"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FE1600" : createBingoController.taskBingoBackgroundColor.value == "#FE1600")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FE4BB3");
                                setState(() {
                                  widget.colorHex = "#FE4BB3";
                                });

                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FE4BB3";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FE4BB3";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FE4BB3"),
                                child: widget.colorHex == "#FE4BB3"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FE4BB3" : createBingoController.taskBingoBackgroundColor.value == "#FE4BB3")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FF912C");
                                setState(() {
                                  widget.colorHex = "#FF912C";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FF912C";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FF912C";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FF912C"),
                                child: widget.colorHex == "#FF912C"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#FF912C" : createBingoController.taskBingoBackgroundColor.value == "#FF912C")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FEC200");
                                setState(() {
                                  widget.colorHex = "#FEC200";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FEC200";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FEC200";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FEC200"),
                                child: widget.colorHex == "#FEC200"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FEC200" : createBingoController.taskBingoBackgroundColor.value == "#FEC200")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#5BCF66");
                                setState(() {
                                  widget.colorHex = "#5BCF66";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#5BCF66";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#5BCF66";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#5BCF66"),
                                child: widget.colorHex == "#5BCF66"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#5BCF66" : createBingoController.taskBingoBackgroundColor.value == "#5BCF66")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#0046FE");
                                setState(() {
                                  widget.colorHex = "#0046FE";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#0046FE";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#0046FE";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#0046FE"),
                                child: widget.colorHex == "#0046FE"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#0046FE" : createBingoController.taskBingoBackgroundColor.value == "#0046FE")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#8700FF");
                                setState(() {
                                  widget.colorHex = "#8700FF";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#8700FF";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#8700FF";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#8700FF"),
                                child: widget.colorHex == "#8700FF"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#8700FF" : createBingoController.taskBingoBackgroundColor.value == "#8700FF")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 14.w),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FFB2E6");
                                setState(() {
                                  widget.colorHex = "#FFB2E6";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FFB2E6";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FFB2E6";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FFB2E6"),
                                child: widget.colorHex == "#FFB2E6"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#FFB2E6" : createBingoController.taskBingoBackgroundColor.value == "#FFB2E6")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FFB494");
                                setState(() {
                                  widget.colorHex = "#FFB494";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FFB494";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FFB494";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FFB494"),
                                child: widget.colorHex == "#FFB494"
                                    ?
                                    //  (widget.textMode ? createBingoController.taskTextColor.value == "#FFB494" : createBingoController.taskBingoBackgroundColor.value == "#FFB494")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#FFE06C");
                                setState(() {
                                  widget.colorHex = "#FFE06C";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#FFE06C";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#FFE06C";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#FFE06C"),
                                child: widget.colorHex == "#FFE06C"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#FFE06C" : createBingoController.taskBingoBackgroundColor.value == "#FFE06C")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#B9E7A3");
                                setState(() {
                                  widget.colorHex = "#B9E7A3";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#B9E7A3";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#B9E7A3";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#B9E7A3"),
                                child: widget.colorHex == "#B9E7A3"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#B9E7A3" : createBingoController.taskBingoBackgroundColor.value == "#B9E7A3")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#9DD7F8");
                                setState(() {
                                  widget.colorHex = "#9DD7F8";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#9DD7F8";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#9DD7F8";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#9DD7F8"),
                                child: widget.colorHex == "#9DD7F8"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#9DD7F8" : createBingoController.taskBingoBackgroundColor.value == "#9DD7F8")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#99B4FD");
                                setState(() {
                                  widget.colorHex = "#99B4FD";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#99B4FD";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#99B4FD";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#99B4FD"),
                                child: widget.colorHex == "#99B4FD"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#99B4FD" : createBingoController.taskBingoBackgroundColor.value == "#99B4FD")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                          Spacer(),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: GestureDetector(
                              onTap: () {
                                widget.color("#C0B1F6");
                                setState(() {
                                  widget.colorHex = "#C0B1F6";
                                });
                                // if (widget.textMode) {
                                //   createBingoController.taskTextColor.value = "#C0B1F6";
                                // } else {
                                //   createBingoController.taskBingoBackgroundColor.value = "#C0B1F6";
                                // }
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.w,
                                color: HexColor.fromHex("#C0B1F6"),
                                child: widget.colorHex == "#C0B1F6"
                                    ?
                                    // (widget.textMode ? createBingoController.taskTextColor.value == "#C0B1F6" : createBingoController.taskBingoBackgroundColor.value == "#C0B1F6")
                                    // ?
                                    Center(
                                        child: Image.asset(
                                          "assets/images/check_icon.png",
                                          width: 9.w,
                                          color: white,
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
                ],
              )),
          SizedBox(
            height: 12.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  color: currnetPageIndex == 0 ? black : HexColor.fromHex("#CCCCCC"),
                ),
              ),
              SizedBox(width: 5.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  color: currnetPageIndex == 1 ? black : HexColor.fromHex("#CCCCCC"),
                ),
              ),
              SizedBox(width: 5.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  color: currnetPageIndex == 2 ? black : HexColor.fromHex("#CCCCCC"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
