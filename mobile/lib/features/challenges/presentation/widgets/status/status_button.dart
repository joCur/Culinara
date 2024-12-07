import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isEnabled;
  final VoidCallback onPressed;

  const StatusButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton.icon(
        onPressed: isEnabled ? onPressed : null,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
