import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:photo_view/photo_view.dart';

import 'progress_widget.dart';

final _firstAppearanceDelay = 300.ms;

class ImagePage extends HookWidget {
  const ImagePage(this.imageUrl, {Key? key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
// final imageUrl = "https://svs.gsfc.nasa.gov/vis/a030000/a030800/a030877/frames/5760x3240_16x9_01p/BlackMarble_2016_1200m_africa_s_labeled.png";
    final firstAppearanceFuture = useMemoized(() => _firstAppearanceDelay.delay.then((value) => true), [imageUrl]);
    //
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PhotoView(
            imageProvider: NetworkImage(imageUrl),
            enableRotation: true,
            gaplessPlayback: false,
            initialScale: PhotoViewComputedScale.covered,
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 2.5,
            loadingBuilder: (context, ImageChunkEvent? chunk) {
              return ProgressWidget.fromImageChunk(chunk);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: FutureBuilder<bool>(
                  future: firstAppearanceFuture,
                  builder: (context, snapshot) {
                    return AnimatedOpacity(
                      duration: 500.ms,
                      opacity: snapshot.data == true ? 0.35 : 1,
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen_exit),
                        onPressed: () => Navigator.pop(context),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
