import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class InputSearchWidget extends StatelessWidget {
  final TextEditingController controller;

  InputSearchWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget _renderContent() {
    return TextField(
      autocorrect: false,
      controller: this.controller,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.done,
      style: TextHelper.style(
        fontSize: 15,
        color: BtColorTheme.SLATE_GRAY,
        height: 1.3,
      ),
      decoration: InputDecoration(
        hintText: StringResource.SEARCH_FOR_THE_DEPUTY_NAME,
        hintStyle: TextHelper.style(
          fontSize: 15,
          color: BtColorTheme.SLATE_GRAY,
        ),
        suffixIcon: Icon(
          Icons.search,
          color: BtColorTheme.SLATE_GRAY,
          size: 28,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BtColorTheme.SLATE_GRAY, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: BtColorTheme.SLATE_GRAY, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        filled: true,
        fillColor: BtColorTheme.BUNKER,
        contentPadding: EdgeInsets.fromLTRB(15, 18, 8, 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 50),
      child: _renderContent(),
    );
  }
}
