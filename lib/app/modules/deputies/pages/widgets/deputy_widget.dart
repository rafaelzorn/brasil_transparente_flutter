import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/data/models/deputy_model.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/resources/image_resource.dart';
import 'package:brasil_transparente_flutter/app/helpers/string_helper.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/routes/bt_routes.dart';

class DeputyWidget extends StatelessWidget {
  final DeputyModel deputy;

  DeputyWidget({Key? key, required this.deputy}) : super(key: key);

  Widget _renderListImage() {
    return Container(
      decoration: BoxDecoration(
        color: BtColorTheme.WHITE,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: FadeInImage.memoryNetwork(
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImageResource.notFound,
              fit: BoxFit.cover,
              height: 45,
              width: 45,
            );
          },
          placeholder: kTransparentImage,
          image: deputy.photo ?? '',
          width: 45,
          height: 45,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _renderListTitle() {
    return ListTile(
      onTap: () => Get.toNamed(
        BtRoutes.DEPUTY_DETAIL.replaceAll(':id', deputy.id.toString()),
      ),
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: _renderListImage(),
      title: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: Text(
          StringHelper.capitalize(deputy.name ?? '-', allWords: true),
          style: TextHelper.style(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ), // BtTextTheme.nameDeputyList,
        ),
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.location_on,
            size: 15,
            color: BtColorTheme.SILVER,
          ),
          SizedBox(width: 3),
          Text(
            deputy.state ?? '-',
            style: TextHelper.style(
              fontSize: 11,
              color: BtColorTheme.SILVER,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      trailing: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: BtColorTheme.SILVER, width: 0.3),
        ),
        child: Text(
          deputy.politicalParty ?? '-',
          style: TextHelper.style(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: BtColorTheme.SILVER,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _renderListTitle());
  }
}
