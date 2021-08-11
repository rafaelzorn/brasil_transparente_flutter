import 'package:flutter/material.dart';

class ProceedingsModalWidget extends StatelessWidget {
  const ProceedingsModalWidget({Key? key}) : super(key: key);

  Widget _renderContent() {
    return const Text('MODAL');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: (MediaQuery.of(context).size.height * 0.8),
      child: _renderContent(),
    );
  }
}
