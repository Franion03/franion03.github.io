import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants.dart';

class TerminalWidget extends StatefulWidget {
  final List<String> lines;
  const TerminalWidget({super.key, required this.lines});

  @override
  State<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends State<TerminalWidget> {
  int _visible = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 150), (t) {
      if (_visible < widget.lines.length) {
        setState(() => _visible++);
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0A12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_visible, (i) {
          final line = widget.lines[i];
          final isPrompt = line.startsWith('\$');
          return Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              line,
              style: GoogleFonts.jetBrainsMono(
                color: isPrompt ? accentColor : bodyTextColor,
                fontSize: 11,
                height: 1.7,
              ),
            ),
          );
        }),
      ),
    );
  }
}
