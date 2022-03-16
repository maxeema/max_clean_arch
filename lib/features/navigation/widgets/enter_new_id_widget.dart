import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:max_clean_arch/extensions/duration_x.dart';
import 'package:max_clean_arch/generated/l10n.dart';

class EnterNewIdWidget extends HookWidget {
  const EnterNewIdWidget({
    required this.preferredWidth,
    required this.onChanged,
    required this.onSubmitted,
    required this.expanded,
    Key? key,
  }) : super(key: key);

  final double preferredWidth;
  final void Function(String value) onChanged;
  final void Function(String value) onSubmitted;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController.fromValue(TextEditingValue.empty);
    useEffect(() {
      void listener() => onChanged(controller.text);
      controller.addListener(listener);
      return () => controller.removeListener(listener);
    }, [expanded]);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8),
      constraints: BoxConstraints(
        maxWidth: preferredWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: theme.colorScheme.surface,
      ),
      child: TextField(
        enabled: expanded,
        // autofocus: expanded,
        decoration: InputDecoration(
          hintText: S.of(context).enterId,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.secondary,
            )
          ),
        ),
        controller: controller,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
