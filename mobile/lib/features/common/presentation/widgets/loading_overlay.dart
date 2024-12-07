import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final Color? barrierColor;
  final Color? progressColor;

  const LoadingOverlay({
    super.key,
    required this.child,
    this.barrierColor,
    this.progressColor,
  });

  static LoadingController of(BuildContext context) {
    final state = context.findAncestorStateOfType<_LoadingOverlayState>();
    if (state == null) {
      throw FlutterError(
        'LoadingOverlay.of() was called with a context that does not contain a LoadingOverlay.\n'
        'No LoadingOverlay ancestor could be found starting from the context that was passed '
        'to LoadingOverlay.of(). This can happen because you are using a widget that looks for a '
        'LoadingOverlay ancestor, but no such ancestor exists.\n'
        'The context used was: $context',
      );
    }
    return state.controller;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _LoadingOverlayWidget(
      barrierColor: barrierColor ?? theme.colorScheme.scrim.withOpacity(0.32),
      progressColor: progressColor ?? theme.colorScheme.primary,
      child: child,
    );
  }
}

class _LoadingOverlayWidget extends StatefulWidget {
  final Widget child;
  final Color barrierColor;
  final Color progressColor;

  const _LoadingOverlayWidget({
    required this.child,
    required this.barrierColor,
    required this.progressColor,
  });

  @override
  State<_LoadingOverlayWidget> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<_LoadingOverlayWidget> {
  late final LoadingController controller;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = LoadingController(
      show: () => setState(() => _isLoading = true),
      hide: () => setState(() => _isLoading = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          widget.child,
          if (_isLoading)
            Container(
              color: widget.barrierColor,
              child: Center(
                child: CircularProgressIndicator(
                  color: widget.progressColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class LoadingController {
  final VoidCallback show;
  final VoidCallback hide;

  const LoadingController({
    required this.show,
    required this.hide,
  });
}
