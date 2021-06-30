import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Bt
import 'package:brasil_transparente_flutter/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/themes/colors.dart';
import 'package:brasil_transparente_flutter/themes/texts_styles.dart';

class DeputyWidget extends StatelessWidget {
  final DeputyModel deputy;

  DeputyWidget({Key? key, required this.deputy}) : super(key: key);

  Widget _renderListImage() {
    return Container(      
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: BtColors.TUNDORA,
        border: Border.all(color: BtColors.TUNDORA),
        shape: BoxShape.circle,
      ),
      child: ClipOval(        
        child: FadeInImage.memoryNetwork(          
          placeholder: kTransparentImage,
          image: deputy.photo,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _renderListTitle() {
    return ListTile(
      onTap: () {},
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: _renderListImage(),
      title: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Text(deputy.name, style: BtTextStyles.nameDeputyList),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, size: 15),
          SizedBox(width: 5),
          Text(deputy.state, style: BtTextStyles.stateDeputyList),
        ],
      ),
      trailing: Container(
        width: 115,
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: BtColors.BLACK),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          deputy.politicalParty,
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
