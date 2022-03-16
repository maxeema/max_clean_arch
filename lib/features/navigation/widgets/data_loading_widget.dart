import 'package:flutter/material.dart';
import 'package:max_clean_arch/features/navigation/widgets/progress_widget.dart';

class DataLoadingWidget extends StatelessWidget {
  const DataLoadingWidget({
    this.preferredHeight,
    Key? key,
  }) : super(key: key);

  final double? preferredHeight;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: preferredHeight ?? double.infinity,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProgressWidget.infinite(),
      ),
    );
  }
}
