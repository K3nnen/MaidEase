import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart'; // Import ProfileScreen

class Tracker extends StatelessWidget {
  const Tracker({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final tileColor = isDark ? Colors.grey[900]! : Colors.grey[200]!;
    final avatarColor = isDark ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Family Tracker",
          style: GoogleFonts.dancingScript(
            fontSize: 24,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            _buildMemberTile(context, "Me", "Guardian", true, tileColor,
                avatarColor, textColor),
            _buildMemberTile(context, "Gian", "Guardian", false, tileColor,
                avatarColor, textColor),
            _buildMemberTile(context, "Maru", "Children", false, tileColor,
                avatarColor, textColor),
            _buildMemberTile(context, "Dominic", "Children", false, tileColor,
                avatarColor, textColor),
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
    BuildContext context,
    String name,
    String role,
    bool isCurrentUser,
    Color tileColor,
    Color avatarBg,
    Color textColor,
  ) {
    return GestureDetector(
      onTap: isCurrentUser
          ? () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              )
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: avatarBg,
            child: Icon(Icons.person, color: textColor),
          ),
          title: Text(name, style: TextStyle(color: textColor, fontSize: 18)),
          subtitle: Text(role,
              style:
                  TextStyle(color: textColor.withOpacity(0.7), fontSize: 14)),
          trailing: isCurrentUser
              ? Icon(Icons.arrow_outward, color: textColor)
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
