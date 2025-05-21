import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Icon(Icons.person, color: textColor, size: 40),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Me",
                    style: TextStyle(color: textColor, fontSize: 18),
                  ),
                  Text(
                    "Guardian",
                    style: TextStyle(
                        color: textColor.withOpacity(0.7), fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[900] : Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "To Do List",
                    style: GoogleFonts.dancingScript(
                      fontSize: 20,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(color: textColor.withOpacity(0.5)),
                  _buildTaskItem("10:00AM", "Cook Meal", textColor),
                  _buildTaskItem("12:00NN", "Laundry Cleaning", textColor),
                  _buildTaskItem("4:00PM", "Clean Living Room", textColor),
                  _buildTaskItem("4:00PM", "Make The Bed", textColor),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton("+ Add Task", Colors.green),
                _buildActionButton("- Remove Task", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String time, String task, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: textColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time, style: TextStyle(color: textColor, fontSize: 14)),
            Text("• $task", style: TextStyle(color: textColor, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, Color color) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: 16),
      ),
    );
  }
}

