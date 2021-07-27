import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/search/controllers/search_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_header_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/input_search_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/selectable_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/selectable_modal_widget.dart';

class SearchPage extends GetView<SearchController> {
  Widget _renderHeader() {
    return BtHeaderWidget(
      leftIcon: Icons.chevron_left,
      leftOnPress: () => Get.back(),
    );
  }

  Widget _renderForm() {
    return Form(
      key: controller.formKey,
      child: Expanded(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    InputSearchWidget(controller: controller.nameController),
                    _renderTitle(),
                    _renderSelectableStates()
                  ],
                ),
              ),
            ),
            _renderButtons(),
          ],
        ),
      ),
    );
  }

  Widget _renderTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          StringResource.FILTERS,
          style: TextHelper.style(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _renderSelectableStates() {
    return Obx(
      () => SelectableWidget(
        text: controller.selectedState.initials ?? StringResource.SELECT_STATE,
        onTap: () {
          controller.handleGetStates();

          BtModalWidget.bottomSheet(
            content: Obx(
              () => SelectableModalWidget(
                isLoading: controller.statesIsLoading,
                isError: controller.statesIsError,
                items: controller.states,
                title: StringResource.STATES,
                handleSelect: controller.handleSelectState,
                showPropName: 'initials',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderButtons() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _renderButtonCleanFilter(),
          _renderButtonApplyFilters(),
        ],
      ),
    );
  }

  Widget _renderButtonCleanFilter() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(right: 5),
        child: TextButton(
          child: Text(StringResource.CLEAN),
          onPressed: controller.clear,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            primary: BtColorTheme.WHITE,
            backgroundColor: BtColorTheme.CINDER,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: BtColorTheme.SILVER, width: 0.5),
            ),
            textStyle: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderButtonApplyFilters() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: TextButton(
          child: Text(StringResource.APPLY_FILTERS),
          onPressed: controller.search,
          style: TextButton.styleFrom(
            padding: EdgeInsets.all(15),
            primary: BtColorTheme.WHITE,
            backgroundColor: BtColorTheme.DODGER_BLUE,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            textStyle: TextHelper.style(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderContent() {
    return SafeArea(
      child: Column(
        children: <Widget>[_renderHeader(), _renderForm()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(resizeToAvoidBottomInset: false, body: _renderContent()),
    );
  }
}
