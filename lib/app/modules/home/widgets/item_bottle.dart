import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:water_bottle/water_bottle.dart';

class ItemBottle extends StatefulWidget {
  final double percent;
  final bool isDanger;
  final Color color;
  final PhosphorIconData iconData;
  const ItemBottle(
      {Key? key,
      required this.percent,
      required this.iconData,
      required this.color,
      required this.isDanger})
      : super(key: key);

  @override
  State<ItemBottle> createState() => _ItemBottleState();
}

class _ItemBottleState extends State<ItemBottle> {
  @override
  final plainBottleRef = GlobalKey<WaterBottleState>();

  @override
  Widget build(BuildContext context) {
    plainBottleRef.currentState?.waterLevel = widget.percent;

    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
            right: -25,
            top: 0,
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        widget.color,
                        widget.color.withOpacity(0.1),
                      ],
                    )),
                child: Center(
                  child: Icon(widget.iconData, color: Colors.white, size: 15),
                ))),
        Column(
          // alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 35),
              child: Container(
                height: 60,
                width: 60,
                child: WaterBottle(
                  key: plainBottleRef,
                  waterColor: widget.color,
                  bottleColor: widget.color.withOpacity(0.2),
                  capColor: widget.color.withOpacity(0.2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '${widget.percent * 100}%',
                  style: AppTextStyle.textBoldStyle.copyWith(
                      fontSize: 16,
                      color: widget.isDanger
                          ? Colors.red.withOpacity(0.8)
                          : Colors.green.withOpacity(0.8)),
                ),
                SizedBox(width: 10),
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.isDanger
                          ? Colors.red.withOpacity(0.8)
                          : Colors.green.withOpacity(0.8),
                    ))
              ],
            ),
            SizedBox(height: 20),
            // Container(
            //   height: 70,
            //   width: 70,
            //   padding: EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //       color: Colors.red,
            //       gradient: LinearGradient(
            //         begin: Alignment.topRight,
            //         end: Alignment.bottomLeft,
            //         colors: [
            //           Colors.white,
            //           widget.isDanger ? Colors.red : Colors.green
            //         ],
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           color: widget.isDanger
            //               ? Colors.red.withOpacity(0.3)
            //               : Colors.green.withOpacity(0.3),
            //           spreadRadius: 5,
            //           blurRadius: 7,
            //           offset: Offset(0, 3), // changes position of shadow
            //         ),
            //       ],
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            //   child: Padding(
            //     padding: const EdgeInsets.all(1.0),
            //     child: Container(
            //       height: 50,
            //       width: 50,
            //       decoration: BoxDecoration(
            //           image: DecorationImage(
            //               image: AssetImage(widget.isDanger
            //                   ? 'assets/images/pig-face.png'
            //                   : 'assets/images/fun-pig-face.png'))),
            //     ),
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}
