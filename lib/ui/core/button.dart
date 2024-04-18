// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      required this.text,
      this.shape,
      this.padding,
      this.color,
      this.textColor,
      this.fontSize,
      this.goToNextWidget})
      : super(key: key);
  final String text;
  final shape;
  final padding;
  final color;
  final textColor;
  final fontSize;
  final goToNextWidget;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        NavigateManage().navigateToMangaer(context, widget.goToNextWidget);
      },
      style: ElevatedButton.styleFrom(shape: widget.shape, backgroundColor: widget.color),
      child: Padding(
        padding: widget.padding,
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: widget.textColor,
                fontSize: widget.fontSize,
              ),
        ),
      ),
    );
  }
}

class NavigateManage {
  void navigateToMangaer(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ), (Route<dynamic> route) => false);
  }
}
