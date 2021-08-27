import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/search/controllers/search_controller.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';

class InputSearchWidget extends StatelessWidget {
  const InputSearchWidget({Key? key}) : super(key: key);

  Widget _renderContent() {
    return TextField(
      autocorrect: false,
      controller: SearchController.to.nameController,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.done,
      style: TextHelper.style(
        fontSize: 15,
        color: BtColorTheme.slateGray,
        height: 1.3,
      ),
      decoration: InputDecoration(
        hintText: StringResource.searchForTheDeputyName,
        hintStyle: TextHelper.style(
          fontSize: 15,
          color: BtColorTheme.slateGray,
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: BtColorTheme.slateGray,
          size: 28,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: BtColorTheme.slateGray, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: BtColorTheme.slateGray, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        filled: true,
        fillColor: BtColorTheme.bunker,
        contentPadding: const EdgeInsets.fromLTRB(15, 18, 8, 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: _renderContent(),
    );
  }
}
