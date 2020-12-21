import 'package:flutter/material.dart';

class AnimatedMoreButtonWidget extends AnimatedWidget {
  static final _shadowColorOpacityTween = ColorTween(
    begin: Colors.black.withOpacity(0.8),
    end: Colors.black.withOpacity(0.0),
  );

  final int index;

  AnimatedMoreButtonWidget(this.index, {Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: [
          BoxShadow(
            color: _shadowColorOpacityTween.evaluate(animation),
            spreadRadius: -8,
            blurRadius: 13,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: animation,
          size: 18.0,
          color: (index == 2) ? Colors.red : Colors.black54),
    );
  }
}
