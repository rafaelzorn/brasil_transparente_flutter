import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class PropositionWidget extends StatelessWidget {
  final double topRadius;
  final double bottomRadius;
  final bool isLast;

  const PropositionWidget({
    Key? key,
    this.isLast = false,
    this.topRadius = 0,
    this.bottomRadius = 0,
  }) : super(key: key);

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
          const SizedBox(height: 8),
          Text(
            'Contra a apreciac¸a~o conclusiva do Projeto de Lei No 399/2015, do Deputado',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextHelper.style(
              fontSize: 11,
              height: 1.3,
              color: BtColorTheme.slateGray,
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
          constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          child: const Icon(
            Icons.visibility_outlined,
            size: 15,
            color: BtColorTheme.white,
          ),
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(
            side: BorderSide(width: 0.5, color: BtColorTheme.slateGray),
          ),
          onPressed: () => {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 10 : 0),
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      foregroundDecoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BtColorTheme.slateGray,
            width: 0.5,
            style: isLast ? BorderStyle.none : BorderStyle.solid,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: BtColorTheme.ebonyClay,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topRadius),
          topRight: Radius.circular(topRadius),
          bottomLeft: Radius.circular(bottomRadius),
          bottomRight: Radius.circular(bottomRadius),
        ),
      ),
      child: Row(
        children: <Widget>[_renderInformation(), _renderIcon()],
      ),
    );
  }
}
