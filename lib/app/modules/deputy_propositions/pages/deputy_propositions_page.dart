import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_propositions/controllers/deputy_propositions_controller.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class DeputyPropositionsPage extends GetView<DeputyPropositionsController> {
  Widget _renderContent() {
    return Container(
      child: Text(
        StringResource.PROPOSITIONS,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderContent();
  }
}
