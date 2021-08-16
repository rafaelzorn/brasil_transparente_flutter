import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class BtMainTitlePageWidget extends StatelessWidget {
  final String title;

  const BtMainTitlePageWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
