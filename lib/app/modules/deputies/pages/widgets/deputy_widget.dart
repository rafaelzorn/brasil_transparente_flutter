import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_text_theme.dart';
import 'package:brasil_transparente_flutter/app/resources/image_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/string_helper.dart';

class DeputyWidget extends StatelessWidget {
  final DeputyModel deputy;

  DeputyWidget({Key? key, required this.deputy}) : super(key: key);

  Widget _renderListImage() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: BtColorTheme.TUNDORA,
        border: Border.all(color: BtColorTheme.TUNDORA),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: FadeInImage.memoryNetwork(
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImageResource.notFound,
              fit: BoxFit.cover,
              height: 40,
              width: 40,
            );
          },
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
        child: Text(
          StringHelper.capitalize(deputy.name, allWords: true),
          style: BtTextTheme.nameDeputyList,
        ),
      ),
      subtitle: Row(
        children: <Widget>[
          Icon(Icons.location_on, size: 15),
          SizedBox(width: 5),
          Text(deputy.state, style: BtTextTheme.stateDeputyList),
        ],
      ),
      trailing: Container(
        width: 115,
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: BtColorTheme.BLACK),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          deputy.politicalParty,
          style: BtTextTheme.politicalPartyDeputyList,
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
          bottom: BorderSide(width: 0.1, color: BtColorTheme.TUNDORA),
        ),
      ),
      child: _renderListTitle(),
    );
  }
}
