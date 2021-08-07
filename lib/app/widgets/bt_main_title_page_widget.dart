import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtMainTitlePageWidget extends StatelessWidget {
  final String title;
  final double marginBottom;

  const BtMainTitlePageWidget({
    Key? key,
    required this.title,
    this.marginBottom = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title,
          style: TextHelper.style(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
