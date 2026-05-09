import 'dart:ui';
import 'package:flutter/material.dart';

class CodeExampleCard extends StatelessWidget {
  final String title;
  final String code;
  final String explanation;

  const CodeExampleCard({
    super.key,
    required this.title,
    required this.code,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF00FFFF)),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF00FFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Text(
                    code,
                    style: const TextStyle(
                      color: Color(0xFF00FF41),
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  explanation,
                  style: const TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
