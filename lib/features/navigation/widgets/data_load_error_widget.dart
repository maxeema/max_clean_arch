import 'package:flutter/material.dart';
import 'package:max_clean_arch/generated/assets.gen.dart';
import 'package:max_clean_arch/generated/l10n.dart';
import 'package:websafe_svg/websafe_svg.dart';

const _kFailedImageHeight = 100.0;

class DataLoadErrorWidget extends StatelessWidget {
  const DataLoadErrorWidget({
    required this.message,
    required this.onRetryClicked,
    Key? key,
  }) : super(key: key);

  final String message;
  final VoidCallback onRetryClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: _kFailedImageHeight,
            child: WebsafeSvg.asset(Assets.offline, height: _kFailedImageHeight),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              child: Text(
                S.of(context).retryButton,
              ),
              onPressed: onRetryClicked,
            ),
          )
        ],
      ),
    );
  }
}
