import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class InputSearchWidget extends StatelessWidget {
  InputSearchWidget({Key? key}) : super(key: key);

  Widget _renderContent() {
    return Stack(
      children: <Widget>[
        TextField(
          style: TextHelper.style(
            fontSize: 15,
            color: BtColorTheme.COD_GRAY,
          ),
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: BtColorTheme.COD_GRAY,
                width: 0.2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: BtColorTheme.COD_GRAY,
                width: 0.2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            suffixIcon: Icon(Icons.search, color: BtColorTheme.COD_GRAY),
            contentPadding: EdgeInsets.fromLTRB(20, 15, 8, 15),
            hintText: StringResource.SEARCH_FOR_THE_DEPUTY_NAME,
            hintStyle: TextHelper.style(
              fontSize: 15,
              color: BtColorTheme.SILVER_CHALICE,
            ),
            filled: true,
            fillColor: BtColorTheme.LINK_WATER,
          ),
        ),
      ],
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
