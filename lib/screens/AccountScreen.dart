import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.blueAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150', // Profile image URL
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'johndoe@example.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Account Settings Section
            Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Change Password
            _buildAccountOption(
              context,
              Icons.lock,
              'Change Password',
              () {
                // Navigate to Change Password Screen or handle logic
              },
            ),
            _buildAccountOption(
              context,
              Icons.email,
              'Update Email',
              () {
                // Navigate to Update Email Screen or handle logic
              },
            ),
            _buildAccountOption(
              context,
              Icons.phone,
              'Update Phone Number',
              () {
                // Navigate to Update Phone Number Screen or handle logic
              },
            ),
            _buildAccountOption(
              context,
              Icons.location_on,
              'Update Address',
              () {
                // Navigate to Update Address Screen or handle logic
              },
            ),
            _buildAccountOption(
              context,
              Icons.exit_to_app,
              'Log Out',
              () {
                // Handle Log Out logic here
              },
            ),

            // Additional Section (Optional)
            SizedBox(height: 30),
            Text(
              'App Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildAccountOption(
              context,
              Icons.notifications,
              'Notifications',
              () {
                // Navigate to Notifications Settings Screen or handle logic
              },
            ),
            _buildAccountOption(
              context,
              Icons.help,
              'Help & Support',
              () {
                // Navigate to Help & Support Screen or handle logic
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Account Settings Options
  Widget _buildAccountOption(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 28),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
