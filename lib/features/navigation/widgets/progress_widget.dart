import 'package:flutter/material.dart';

const _compatSize = 20.0;
const _normalSize = 30.0;

const _compatStrokeWidth = 1.5;
const _normalStrokeWidth = 2.5;

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({this.progress, this.compact, this.color, Key? key}) : super(key: key);

  final double? progress;
  final bool? compact;
  final Animation<Color>? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = this.color?.value ?? theme.progressIndicatorTheme.circularTrackColor ?? theme.colorScheme.secondary;
    final size = compact == true ? _compatSize : _normalSize;
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator.adaptive(
          value: progress,
          strokeWidth: compact == true ? _compatStrokeWidth : _normalStrokeWidth,
          backgroundColor: color.withOpacity(.5),
          valueColor: this.color ?? AlwaysStoppedAnimation(color) as Animation<Color>,
        ),
      ),
    );
  }

  factory ProgressWidget.infinite({bool? compact, Animation<Color>? color, Key? key}) {
    return ProgressWidget(
      compact: compact,
      color: color,
      key: key,
    );
  }

  factory ProgressWidget.fromImageChunk(ImageChunkEvent? chunk, {bool? compact, Animation<Color>? color, Key? key}) {
    final expectedTotalBytes = chunk?.expectedTotalBytes;
    final cumulativeBytesLoaded = chunk?.cumulativeBytesLoaded;
    final double? progress;
    if (chunk != null && expectedTotalBytes != null && cumulativeBytesLoaded != null) {
      progress = cumulativeBytesLoaded / expectedTotalBytes;
    } else {
      progress = null;
    }
    return ProgressWidget(progress: progress, compact: compact, color: color, key: key);
  }
}
