import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Bt
import 'package:brasil_transparente_flutter/app/resources/image_resource.dart';
import 'package:brasil_transparente_flutter/app/themes/bt_color_theme.dart';
import 'package:brasil_transparente_flutter/app/helpers/text_helper.dart';
import 'package:brasil_transparente_flutter/app/constants/general_constant.dart';

class ProfileImageWidget extends StatelessWidget {
  final String? photo;
  final String? situation;

  const ProfileImageWidget({Key? key, this.photo, this.situation})
      : super(key: key);

  Widget _renderImage() {
    return Container(
      decoration: const BoxDecoration(
        color: BtColorTheme.oxfordBlue,
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.only(bottom: 15),
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
          image: photo ?? '',
          width: 110,
          height: 110,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _renderStatus() {
    Color color = BtColorTheme.tomThumb;

    if (situation != GeneralConstant.exercise) {
      color = BtColorTheme.nevada;
    }

    return Transform.translate(
      offset: const Offset(95, 20),
      child: Container(
        width: 70,
        padding: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: BtColorTheme.bunker, width: 1.5),
        ),
        child: Text(
          situation ?? '-',
          style: TextHelper.style(
            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: BtColorTheme.white,
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
          children: <Widget>[_renderImage(), _renderStatus()],
        )
      ],
    );
  }
}
