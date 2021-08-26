import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';
import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/procedure_model.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/format_helper.dart';

class ProcedureWidget extends StatelessWidget {
  final ProcedureModel procedure;
  final bool isLastUpdate;

  const ProcedureWidget({
    Key? key,
    required this.procedure,
    required this.isLastUpdate,
  }) : super(key: key);

  Widget _renderIsLastUpdate() {
    if (!isLastUpdate) {
      return Container();
    }

    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.update,
            size: 12,
            color: BtColorTheme.white,
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              StringResource.lastUpdate,
              style: TextHelper.style(
                fontSize: 11,
                color: BtColorTheme.tomThumb,
                fontWeight: FontWeight.w900,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderContent() {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: BtColorTheme.ebonyClay),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.calendar_today,
                      size: 13,
                      color: BtColorTheme.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      FormatHelper.formatDate(
                        procedure.date,
                        format: 'dd/MM/yyyy HH:mm',
                      ),
                      style: TextHelper.style(
                        fontSize: 11,
                        height: 1.3,
                        color: BtColorTheme.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  procedure.initialsOrgan ?? '-',
                  style: TextHelper.style(
                    fontSize: 11,
                    height: 1.3,
                    color: BtColorTheme.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${StringResource.processing}: ',
              style: TextHelper.style(
                fontSize: 11,
                height: 1.3,
                color: BtColorTheme.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
              child: Text(
                procedure.description ?? '-',
                style: TextHelper.style(
                  fontSize: 11,
                  height: 1.3,
                  color: BtColorTheme.slateGray,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              '${StringResource.dispatch}: ',
              style: TextHelper.style(
                fontSize: 11,
                height: 1.3,
                color: BtColorTheme.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              procedure.dispatch ?? '-',
              style: TextHelper.style(
                fontSize: 11,
                height: 1.3,
                color: BtColorTheme.slateGray,
              ),
            ),
            _renderIsLastUpdate(),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: BtColorTheme.oxfordBlue,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 2,
          color: BtColorTheme.tomThumb,
          style: isLastUpdate ? BorderStyle.solid : BorderStyle.none,
        ),
      ),
      child: _renderContent(),
    );
  }
}
