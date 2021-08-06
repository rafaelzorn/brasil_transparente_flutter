import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtMainTitlePageWidget extends StatelessWidget {
  final String title;
  final double marginBottom;

  BtMainTitlePageWidget({required this.title, this.marginBottom = 25});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: this.marginBottom),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          this.title,
          style: TextHelper.style(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
