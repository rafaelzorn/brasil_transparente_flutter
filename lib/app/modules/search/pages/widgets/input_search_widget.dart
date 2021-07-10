import 'package:flutter/material.dart';

class InputSearchWidget extends StatelessWidget {
  InputSearchWidget({Key? key}) : super(key: key);

  Widget _renderContent() {
    return Stack(
      children: <Widget>[
        TextField(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: _renderContent(),
    );
  }
}
