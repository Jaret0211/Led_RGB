import 'package:app_lampara/provider/base_view.dart';
import 'package:app_lampara/view/smart_light_view_model.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SmartLight extends StatelessWidget {
  static String routeName = '/smart-light';
  const SmartLight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartLightViewModel>(
      onModelReady: (model) => {},
      builder: (context, model, child) {
        return Material(
          child: Body(
            model: model,
          ),
        );
      },
    );
  }
}
