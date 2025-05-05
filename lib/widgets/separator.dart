import 'package:flutter/material.dart';


class SeparatorWidget extends StatefulWidget {
  const SeparatorWidget(
      {super.key, required this.size});
  final double size;
 
  @override
  // ignore: library_private_types_in_public_api
  _SeparatorWidgetState createState() => _SeparatorWidgetState();
}


class _SeparatorWidgetState extends State<SeparatorWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: widget.size));
  }
}