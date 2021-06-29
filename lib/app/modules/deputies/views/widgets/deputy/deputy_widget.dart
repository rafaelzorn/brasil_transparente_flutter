import 'package:flutter/material.dart';

// Bt
import 'package:brasil_transparente_flutter/app/theme/colors.dart';
import 'package:brasil_transparente_flutter/app/theme/texts_styles.dart';

class DeputyWidget extends StatelessWidget {
  DeputyWidget();

  Widget _renderListTitle() {
    return ListTile(
      onTap: () {
        print('TODO');
      },
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://www.camara.leg.br/internet/deputado/bandep/204554.jpg',
        ),
      ),
      title: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Text('Abílio Santana', style: BtTextStyles.nameDeputyList),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, size: 15),
          SizedBox(width: 5),
          Text('BA', style: BtTextStyles.stateDeputyList),
        ],
      ),
      trailing: Container(
        width: 80,
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: BtColors.BLACK),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          'PL',
          style: BtTextStyles.politicalPartyDeputyList,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.1, color: BtColors.TUNDORA),
        ),
      ),
      child: _renderListTitle(),
    );
  }
}
