import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/search/controllers/search_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/select_state_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/select_political_party_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/input_search_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/selectable_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/selectable_modal_widget.dart';

class SearchPage extends GetView<SearchController> {
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

  Widget _renderForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: <Widget>[
            InputSearchWidget(controller: controller.nameController),
            _renderTitle(),
            _renderSelectableStates(),
            _renderSelectablePoliticalParties(),
          ],
        ),
      ),
    );
  }

  Widget _renderSelectableStates() {
    return Obx(
      () => SelectableWidget(
        text: SelectStateController.to.selectedState.initials ??
            StringResource.SELECT_STATE,
        onTap: () {
          SelectStateController.to.handleGetStates();

          BtModalWidget.bottomSheet(
            content: Obx(
              () => SelectableModalWidget(
                isLoading: SelectStateController.to.isLoading,
                isError: SelectStateController.to.isError,
                items: SelectStateController.to.states,
                title: StringResource.STATES,
                handleSelect: SelectStateController.to.handleSelectState,
                showPropName: 'initials',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderSelectablePoliticalParties() {
    return Obx(
      () => SelectableWidget(
        text:
            SelectPoliticalPartyController.to.selectedPoliticalParty.initials ??
                StringResource.SELECT_THE_POLITICAL_PARTY,
        onTap: () {
          SelectPoliticalPartyController.to.handleGetPoliticalParties();

          BtModalWidget.bottomSheet(
            content: Obx(
              () => SelectableModalWidget(
                isLoading: SelectPoliticalPartyController.to.isLoading,
                isError: SelectPoliticalPartyController.to.isError,
                items: SelectPoliticalPartyController.to.politicalParties,
                title: StringResource.POLITICAL_PARTIES,
                handleSelect: SelectPoliticalPartyController
                    .to.handleSelectPoliticalParty,
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
            backgroundColor: BtColorTheme.BUNKER,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: BtColorTheme.SLATE_GRAY, width: 0.5),
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
            backgroundColor: BtColorTheme.OXFORD_BLUE,
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
    return SingleChildScrollView(
      child: _renderForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: BtAppBarWidget(
          leftIcon: Icons.chevron_left,
          leftOnPress: () => Get.back(),
        ),
        resizeToAvoidBottomInset: false,
        body: _renderContent(),
        bottomNavigationBar: _renderButtons(),
      ),
    );
  }
}
