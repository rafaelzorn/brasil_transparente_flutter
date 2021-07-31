import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Bt
import 'package:brasil_transparente_flutter/app/resources/image_resource.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? photo;
  final String? situation;

  ProfileImageWidget({Key? key, this.photo, this.situation}) : super(key: key);

  Widget _renderImage() {
    return Container(
      decoration: BoxDecoration(
        color: BtColorTheme.OXFORD_BLUE,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: ClipOval(
        child: FadeInImage.memoryNetwork(
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImageResource.notFound,
              fit: BoxFit.cover,
              height: 110,
              width: 110,
            );
          },
          placeholder: kTransparentImage,
          image: this.photo ?? '',
          width: 110,
          height: 110,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _renderStatus() {
    Color color = BtColorTheme.TOM_THUMB;

    if (this.situation != 'Exercício') {
      color = BtColorTheme.NEVADA;
    }

    return Transform.translate(
      offset: Offset(95, 20),
      child: Container(
        width: 70,
        padding: EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: BtColorTheme.BUNKER, width: 1.5),
        ),
        child: Text(
          this.situation ?? '-',
          style: TextHelper.style(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: BtColorTheme.WHITE,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          children: [_renderImage(), _renderStatus()],
        )
      ],
    );
  }
}
