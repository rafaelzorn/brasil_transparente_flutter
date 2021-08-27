import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/search/controllers/search_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/states_controller.dart';
import 'package:brasil_transparente_flutter/app/modules/search/controllers/political_parties_controller.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_app_bar_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_modal_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/input_search_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/selectable_widget.dart';
import 'package:brasil_transparente_flutter/app/modules/search/pages/widgets/selectable_modal_widget.dart';

class SearchPage extends GetView<SearchController> {
  final formKey = GlobalKey<FormState>();

  SearchPage({Key? key}) : super(key: key);

  Widget _renderTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          StringResource.filters,
          style: TextHelper.style(fontSize: 22, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _renderForm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            const InputSearchWidget(),
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
        text: StatesController.to.selectedState.initials ??
            StringResource.selectState,
        onTap: () {
          BtModalWidget.bottomSheet(
            content: SelectableModalWidget(
              isLoading: StatesController.to.isLoading,
              isError: StatesController.to.isError,
              items: StatesController.to.states,
              title: StringResource.states,
              handleSelect: StatesController.to.handleSelectState,
              reload: StatesController.to.handleGetStates,
              showPropName: 'initials',
            ),
          );
        },
      ),
    );
  }

  Widget _renderSelectablePoliticalParties() {
    return Obx(
      () => SelectableWidget(
        text: PoliticalPartiesController.to.selectedPoliticalParty.initials ??
            StringResource.selectThePoliticalParty,
        onTap: () {
          BtModalWidget.bottomSheet(
            content: SelectableModalWidget(
              isLoading: PoliticalPartiesController.to.isLoading,
              isError: PoliticalPartiesController.to.isError,
              items: PoliticalPartiesController.to.politicalParties,
              title: StringResource.politicalParties,
              handleSelect:
                  PoliticalPartiesController.to.handleSelectPoliticalParty,
              nextPage: PoliticalPartiesController.to.nextPage,
              lastPage: PoliticalPartiesController.to.lastPage,
              refresh: PoliticalPartiesController.to.refresh,
              reload: PoliticalPartiesController.to.reload,
              hasPagination: true,
              showPropName: 'initials',
            ),
          );
        },
      ),
    );
  }

  Widget _renderButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        padding: const EdgeInsets.only(right: 5),
        child: TextButton(
          child: const Text(StringResource.clean),
          onPressed: controller.clear,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(15),
            primary: BtColorTheme.white,
            backgroundColor: BtColorTheme.bunker,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: const BorderSide(color: BtColorTheme.slateGray, width: 0.5),
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
        padding: const EdgeInsets.only(left: 5),
        child: TextButton(
          child: const Text(StringResource.applyFilters),
          onPressed: controller.search,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(15),
            primary: BtColorTheme.white,
            backgroundColor: BtColorTheme.oxfordBlue,
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
    return SingleChildScrollView(child: _renderForm());
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
