import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class SelectableModalWidget extends StatelessWidget {
  final bool isLoading;
  final bool isError;
  final List items;
  final String title;
  final Function handleSelect;
  final String showPropName;
  final bool hasPagination;
  final Function reload;
  final Function? nextPage;
  final bool? lastPage;
  final Function? refresh;

  SelectableModalWidget({
    Key? key,
    required this.isLoading,
    required this.isError,
    required this.items,
    required this.title,
    required this.handleSelect,
    required this.showPropName,
    required this.reload,
    this.hasPagination = false,
    this.nextPage,
    this.lastPage,
    this.refresh,
  }) : super(key: key);

  Widget _renderCloseButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: TextButton(
              onPressed: () => Get.back(),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: BtColorTheme.WHITE,
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 10),
                side: BorderSide(color: BtColorTheme.SLATE_GRAY, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderItem({required int index}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: BtColorTheme.SLATE_GRAY,
              width: 0.5,
              style: items.length != (index + 1)
                  ? BorderStyle.solid
                  : BorderStyle.none,
            ),
          ),
        ),
        child: TextButton(
          onPressed: () => this.handleSelect(items[index]),
          child: Text(
            items[index].toMap()[this.showPropName],
            style: TextHelper.style(
              fontSize: 15,
              color: BtColorTheme.SLATE_GRAY,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderLazyLoadScrollView({
    required nextPage,
    required lastPage,
    required refresh,
  }) {
    return LazyLoadScrollView(
      onEndOfPage: nextPage,
      isLoading: lastPage,
      child: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _renderItem(index: index);
          },
          itemCount: items.length,
        ),
        onRefresh: refresh,
      ),
    );
  }

  Widget _renderList() {
    if (isLoading) {
      return Center(
        child: SizedBox(
          height: 30,
          width: 30,
          child: BtSpinnerWidget(),
        ),
      );
    }

    if (isError) {
      return BtNotificationWidget(
        icon: Icons.error_outline,
        text: StringResource.SOMETHING_WRONG_HAS_HAPPENED,
        iconSize: 70,
        textButton: StringResource.TRY_AGAIN,
        onPress: this.reload,
      );
    }

    if (this.hasPagination) {
      return _renderLazyLoadScrollView(
        nextPage: this.nextPage,
        lastPage: this.lastPage,
        refresh: this.refresh,
      );
    }

    return ListView.builder(
      itemBuilder: (context, index) => _renderItem(index: index),
      itemCount: items.length,
    );
  }

  Widget _renderContent() {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 25, bottom: 15),
        child: Text(
          this.title,
          style: TextHelper.style(
            fontSize: 20,
            color: BtColorTheme.WHITE,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Expanded(child: _renderList()),
      _renderCloseButton(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: (MediaQuery.of(context).size.height * 0.7),
      child: _renderContent(),
    );
  }
}
