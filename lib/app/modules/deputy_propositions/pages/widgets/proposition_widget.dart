import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class PropositionWidget extends StatelessWidget {
  final double topRadius;
  final double bottomRadius;
  final bool isLast;

  PropositionWidget({
    this.isLast = false,
    this.topRadius = 0,
    this.bottomRadius = 0,
  });

  Widget _renderInformation() {
    return Expanded(
      flex: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'REC 29/2021',
            style: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Contra a apreciac¸a~o conclusiva do Projeto de Lei No 399/2015, do Deputado',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextHelper.style(
              fontSize: 11,
              height: 1.3,
              color: BtColorTheme.SLATE_GRAY,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderIcon() {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: RawMaterialButton(
          constraints: BoxConstraints(minWidth: 0, minHeight: 0),
          child: Icon(
            Icons.visibility_outlined,
            size: 15,
            color: BtColorTheme.WHITE,
          ),
          padding: EdgeInsets.all(10),
          shape: CircleBorder(
            side: BorderSide(width: 0.5, color: BtColorTheme.SLATE_GRAY),
          ),
          onPressed: () => {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: this.isLast ? 10 : 0),
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      foregroundDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BtColorTheme.SLATE_GRAY,
            width: 0.5,
            style: this.isLast ? BorderStyle.none : BorderStyle.solid,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: BtColorTheme.EBONY_CLAY,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(this.topRadius),
          topRight: Radius.circular(this.topRadius),
          bottomLeft: Radius.circular(this.bottomRadius),
          bottomRight: Radius.circular(this.bottomRadius),
        ),
      ),
      child: Row(
        children: <Widget>[_renderInformation(), _renderIcon()],
      ),
    );
  }
}
