import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class SelectableWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  SelectableWidget({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  Widget _renderContent() {
    return GestureDetector(
      onTap: () => this.onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: BtColorTheme.SLATE_GRAY, width: 0.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 6, 0, 6),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: BtColorTheme.SLATE_GRAY,
                      width: 0.5,
                    ),
                  ),
                ),
                child: Text(
                  this.text,
                  style: TextHelper.style(
                    fontSize: 15,
                    color: BtColorTheme.SLATE_GRAY,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.expand_more,
                size: 28,
                color: BtColorTheme.SLATE_GRAY,
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
      margin: EdgeInsets.only(bottom: 20),
      child: _renderContent(),
    );
  }
}
