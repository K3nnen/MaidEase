import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Me",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Guardian",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // To-Do List Section
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "To Do List",
                    style: GoogleFonts.dancingScript(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(color: Colors.white54),
                  _buildTaskItem("10:00AM", "Cook Meal"),
                  _buildTaskItem("12:00NN", "Laundry Cleaning"),
                  _buildTaskItem("4:00PM", "Clean Living Room"),
                  _buildTaskItem("4:00PM", "Make The Bed"),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Add & Remove Task Buttons
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

  // Task Item Widget
  Widget _buildTaskItem(String time, String task) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              "• $task",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  // Action Button Widget
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
