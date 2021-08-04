import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Bt
import 'package:brasil_transparente_flutter/app/modules/deputy_expenses/controllers/deputy_expenses_controller.dart';
import 'package:brasil_transparente_flutter/app/resources/string_resource.dart';

class DeputyExpensesPage extends GetView<DeputyExpensesController> {
  Widget _renderContent() {
    return Container(
      child: Text(
        StringResource.EXPENSES,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _renderContent();
  }
}
