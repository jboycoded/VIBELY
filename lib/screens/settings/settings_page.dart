import 'package:flutter/material.dart';
import '../widgets/vibely_background.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool privateAccount = false;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VibelyBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                // 🔙 HEADER
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 ACCOUNT SECTION
                sectionTitle("Account"),
                glassTile(
                  icon: Icons.person,
                  title: "Edit Profile",
                  onTap: () {
                    // Navigate to Edit Profile
                  },
                ),

                glassTile(
                  icon: Icons.lock,
                  title: "Change Password",
                  onTap: () {},
                ),

                const SizedBox(height: 20),

                // 🔹 NOTIFICATIONS
                sectionTitle("Notifications"),
                switchTile(
                  icon: Icons.notifications,
                  title: "Push Notifications",
                  value: notifications,
                  onChanged: (val) {
                    setState(() => notifications = val);
                  },
                ),

                const SizedBox(height: 20),

                // 🔹 PRIVACY
                sectionTitle("Privacy"),
                switchTile(
                  icon: Icons.visibility_off,
                  title: "Private Account",
                  value: privateAccount,
                  onChanged: (val) {
                    setState(() => privateAccount = val);
                  },
                ),

                glassTile(
                  icon: Icons.block,
                  title: "Blocked Users",
                  onTap: () {},
                ),

                const SizedBox(height: 20),

                // 🔹 APPEARANCE
                sectionTitle("Appearance"),
                switchTile(
                  icon: Icons.dark_mode,
                  title: "Dark Mode",
                  value: darkMode,
                  onChanged: (val) {
                    setState(() => darkMode = val);
                  },
                ),

                const SizedBox(height: 20),

                // 🔹 LOGOUT
                GestureDetector(
                  onTap: () => showLogoutDialog(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 SECTION TITLE
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }

  // 🔹 GLASS TILE
  Widget glassTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.white),
        title: Text(title,
            style: const TextStyle(color: Colors.white)),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Colors.white54),
      ),
    );
  }

  // 🔹 SWITCH TILE
  Widget switchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.pinkAccent,
        secondary: Icon(icon, color: Colors.white),
        title: Text(title,
            style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  // 🔐 LOGOUT DIALOG
  void showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: const Text("Logout",
            style: TextStyle(color: Colors.white)),
        content: const Text(
          "Are you sure you want to logout?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel",
                style: TextStyle(color: Colors.grey)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Logout",
                style: TextStyle(color: Colors.redAccent)),
            onPressed: () {
              Navigator.pop(context);
              // Handle logout logic
            },
          ),
        ],
      ),
    );
  }
}
