import 'package:app_lampara/popups/popup_widgets/popup_alert_dialog.dart';
import 'package:app_lampara/popups/popup_widgets/popup_icon.dart';
import 'package:app_lampara/popups/popup_widgets/popup_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:app_lampara/popups/popup_widgets.dart';

class PopupState extends StatelessWidget {
  const PopupState({
    Key? key,
    required this.popupIcon,
    required this.popupIconColor,
    required this.popupTitle,
    this.popupSubtitle,
    this.popupActions,
  }) : super(key: key);

  final IconData popupIcon;
  final Color popupIconColor;
  final String popupTitle;
  final String? popupSubtitle;
  final List<Widget>? popupActions;

  @override
  Widget build(BuildContext context) {
    return PopupAlertDialog(
      popupTopWidget: PopupIcon(
        icon: popupIcon,
        iconColor: popupIconColor,
      ),
      popupContent: PopupListTile(
        popupTitle: popupTitle,
        popupSubtitle: popupSubtitle,
      ),
      popupActions: popupActions,
    );
  }
}
