import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:star_wars_flutter/ui/common_widgets/platform_widget.dart';

class PlatformSwitch extends PlatformWidget {
  PlatformSwitch(
      {this.value, this.onChanged, this.activeColor, this.trackColor, this.inactiveTrackColor});

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
