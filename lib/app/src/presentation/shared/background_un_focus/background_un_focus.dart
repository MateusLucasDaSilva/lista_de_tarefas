import 'package:flutter/material.dart';

class BackgroundUnFocus extends StatelessWidget {
  final Widget child;
  final Alignment? alignment;
  final Color? backgroundColor;

  const BackgroundUnFocus({
    required this.child,
    this.alignment,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return GestureDetector(
        onTap: () => _onRequestUnFocus(context),
        child: Container(
          alignment: alignment,
          width: constraints.biggest.width,
          height: constraints.biggest.height,
          color: backgroundColor ?? Theme.of(context).colorScheme.background,
          child: child,
        ),
      );
    });
  }

  void _onRequestUnFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
