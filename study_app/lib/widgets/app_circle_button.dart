import 'package:flutter/material.dart';

class AppCircleButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double width;
  final VoidCallback?onTap;
  const AppCircleButton({super.key,required this.child,this.color,this.onTap,this.width=60});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      child: InkWell(
        onTap: (){},
        child: child,
      ),
    );
  }
}
