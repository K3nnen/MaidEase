import 'package:flutter/material.dart';

class SafetySectionScreen extends StatelessWidget {
  const SafetySectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: textColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Safety Section',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: isDark
                          ? [Shadow(color: Colors.black, blurRadius: 5)]
                          : [],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '''
1.  Read Labels First – Always check the label before using a cleaning product...
2.  Wear Protective Gear – Use gloves, masks...
3.  Ensure Proper Ventilation – Keep windows open...
4.  Store Safely – Keep chemicals in their original bottles...
5.  Clean Tools Properly – Wash and dry tools after use...
                  ''',
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
