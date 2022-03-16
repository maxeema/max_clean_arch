import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/const.dart';

const _preferredSplashWidth = 300.0;

class SplashPage extends HookWidget {
  const SplashPage({required this.splashImage, this.onFirstFrame, Key? key}) : super(key: key);

  final ImageProvider splashImage;
  final VoidCallback? onFirstFrame;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final preferredWidth = math.min(size.width * .8, _preferredSplashWidth);
    final onFirstFrameCallbackRef = useRef(onFirstFrame);
    return Scaffold(
      backgroundColor: kSplashColor,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(64),
        child: Image(
          key: const Key('splash-image'),
          image: splashImage,
          fit: BoxFit.contain,
          width: preferredWidth,
          frameBuilder: (context, child, int? frame, wasSynchronouslyLoaded) {
            if (frame == 0 && onFirstFrameCallbackRef.value != null) {
              onFirstFrameCallbackRef.value!();
              onFirstFrameCallbackRef.value = null;
            }
            return child;
          },
        ),
      ),
    );
  }
}
