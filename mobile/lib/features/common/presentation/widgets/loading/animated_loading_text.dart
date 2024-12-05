import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedLoadingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration startDelay;

  const AnimatedLoadingText({
    super.key,
    required this.text,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 50),
    this.startDelay = const Duration(milliseconds: 200),
  });

  @override
  State<AnimatedLoadingText> createState() => _AnimatedLoadingTextState();
}

class _AnimatedLoadingTextState extends State<AnimatedLoadingText>
    with SingleTickerProviderStateMixin {
  String _displayedText = '';
  Timer? _timer;
  int _charIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didUpdateWidget(AnimatedLoadingText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _charIndex = 0;
      _displayedText = '';
      _startAnimation();
    }
  }

  void _startAnimation() {
    _timer?.cancel();
    Future.delayed(widget.startDelay, () {
      _timer = Timer.periodic(widget.typingSpeed, (timer) {
        if (_charIndex < widget.text.length) {
          setState(() {
            _displayedText += widget.text[_charIndex];
            _charIndex++;
          });
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_displayedText|',
      style: widget.style,
    );
  }
}
