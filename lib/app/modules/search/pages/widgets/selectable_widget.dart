import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class SelectableWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  const SelectableWidget({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  Widget _renderContent() {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: BtColorTheme.slateGray, width: 0.5),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 6, 0, 6),
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: BtColorTheme.slateGray,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Text(
                  text,
                  style: TextHelper.style(
                    fontSize: 15,
                    color: BtColorTheme.slateGray,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const Icon(
                Icons.expand_more,
                size: 28,
                color: BtColorTheme.slateGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: _renderContent(),
    );
  }
}
