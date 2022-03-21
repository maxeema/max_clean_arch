import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashPage extends HookWidget {
  const SplashPage({required this.splashImage, this.onFirstFrame, Key? key}) : super(key: key);

  final ImageProvider splashImage;
  final VoidCallback? onFirstFrame;

  @override
  Widget build(BuildContext context) {
    final onFirstFrameCallbackRef = useRef(onFirstFrame);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(64),
        child: Image(
          image: splashImage,
          frameBuilder: (context, child, int? frame, wasSynchronouslyLoaded) {
            if (frame == 0 && onFirstFrameCallbackRef.value != null) {
              onFirstFrameCallbackRef.value!();
              onFirstFrameCallbackRef.value = null;
            }
            return child;
          },
          fit: BoxFit.contain,
          key: const Key('splash-image'),
        ),
      ),
    );
  }
}
