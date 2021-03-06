import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// Bt
import 'package:brasil_transparente_flutter/app/widgets/bt_spinner_widget.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_notification_widget.dart';
import 'package:brasil_transparente_flutter/app/widgets/bt_close_button_modal_widget.dart';
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

  const SelectableModalWidget({
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

  Widget _renderItem({required int index}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: BtColorTheme.slateGray,
              width: 0.5,
              style: items.length != (index + 1)
                  ? BorderStyle.solid
                  : BorderStyle.none,
            ),
          ),
        ),
        child: TextButton(
          onPressed: () => handleSelect(items[index]),
          child: Text(
            items[index].toMap()[showPropName],
            style: TextHelper.style(
              fontSize: 15,
              color: BtColorTheme.slateGray,
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderLazyLoadScrollView() {
    return LazyLoadScrollView(
      onEndOfPage: () => nextPage!(),
      isLoading: lastPage!,
      child: RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _renderItem(index: index);
          },
          itemCount: items.length,
        ),
        onRefresh: () => refresh!(),
      ),
    );
  }

  Widget _renderList() {
    if (isLoading) {
      return const Center(
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
        text: StringResource.somethingWrongHasHappened,
        iconSize: 70,
        textButton: StringResource.tryAgain,
        onPress: reload,
      );
    }

    if (hasPagination) {
      return _renderLazyLoadScrollView();
    }

    return ListView.builder(
      itemBuilder: (context, index) => _renderItem(index: index),
      itemCount: items.length,
    );
  }

  Widget _renderContent() {
    return Column(children: <Widget>[
      Container(
        padding: const EdgeInsets.only(top: 25, bottom: 15),
        child: Text(
          title,
          style: TextHelper.style(
            fontSize: 20,
            color: BtColorTheme.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      Expanded(child: _renderList()),
      const BtCloseButtonModalWidget(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: (MediaQuery.of(context).size.height * 0.6),
      child: _renderContent(),
    );
  }
}
