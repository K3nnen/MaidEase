import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart'; // Import ProfileScreen

class Tracker extends StatelessWidget {
  // Change 'tracker' to 'Tracker'
  const Tracker({super.key}); // Fix constructor

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
        title: Text(
          "Family Tracker",
          style: GoogleFonts.dancingScript(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildMemberTile(context, "Me", "Guardian", true),
            _buildMemberTile(context, "Gian", "Guardian", false),
            _buildMemberTile(context, "Maru", "Children", false),
            _buildMemberTile(context, "Dominic", "Children", false),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton("+ Add member", Colors.green),
                _buildActionButton("- Remove member", Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberTile(
      BuildContext context, String name, String role, bool isCurrentUser) {
    return GestureDetector(
      onTap: isCurrentUser
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          subtitle: Text(
            role,
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          trailing: isCurrentUser
              ? Icon(Icons.arrow_outward, color: Colors.white)
              : null,
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
