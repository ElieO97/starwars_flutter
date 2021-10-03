import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation/common_widgets/platform_widget.dart';

class PlatformSwitch extends PlatformWidget {
  PlatformSwitch(
      {required this.value,
      required this.onChanged,
      required this.activeColor,
      required this.trackColor,
      required this.inactiveTrackColor});

  final Color activeColor;
  final Color trackColor;
  final Color inactiveTrackColor;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: (bool value) {
        onChanged(value);
      },
      activeColor: activeColor,
      trackColor: trackColor,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (bool value) {
        onChanged(value);
      },
      activeTrackColor: trackColor,
      activeColor: activeColor,
      inactiveTrackColor: inactiveTrackColor,
    );
  }
}
