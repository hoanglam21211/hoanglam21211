import 'package:flutter/cupertino.dart';

class ItemDots extends StatelessWidget {
  final Color color;
  const ItemDots({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
