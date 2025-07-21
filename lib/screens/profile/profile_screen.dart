import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              _showSettingsDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 24),
            _buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Text(
              'JD',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'john.doe@email.com',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          _buildStatsRow(),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('Items Sold', '12'),
        Container(width: 1, height: 40, color: Colors.grey[300]),
        _buildStatItem('Items Bought', '8'),
        Container(width: 1, height: 40, color: Colors.grey[300]),
        _buildStatItem('Rating', '4.9★'),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
        children: [
        _buildMenuItem(Icons.inventory, 'My Listings', () {}),
    _buildMenuItem(Icons.shopping_bag, 'Purchase History', () {}),
    Widget _buildMenuItems(BuildContext context) {
    return Column(
    children: [
    _buildMenuItem(Icons.inventory, 'My Listings', () {}),
    _buildMenuItem(Icons.shopping_bag, 'Purchase History', () {}),
    _buildMenuItem(Icons.favorite, 'Favorites', () {}),
    _buildMenuItem(Icons.payment, 'Payment Methods', () {}),
    _buildMenuItem(Icons.location_on, 'Addresses', () {}),
    _buildMenuItem(Icons.help, 'Help & Support', () {}),
    _buildMenuItem(Icons.info, 'About', () {}),
    SizedBox(height: 16),
    _buildMenuItem(Icons.logout, 'Logout', () {
    _showLogoutDialog(context);
    }, isDestructive: true),
    ],
    );
    }

    Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return Container(
    margin: EdgeInsets.only(bottom: 8),
    child: ListTile(
    leading: Icon(
    icon,
    color: isDestructive ? Colors.red : Colors.blue,
    ),
    title: Text(
    title,
    style: TextStyle(
    color: isDestructive ? Colors.red : Colors.black,
    fontWeight: FontWeight.w500,
    ),
    ),
    trailing: Icon(
    Icons.arrow_forward_ios,
    size: 16,
    color: Colors.grey[400],
    ),
    onTap: onTap,
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    ),
    );
    }

    void _showSettingsDialog(BuildContext context) {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Settings'),
    content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    ListTile(
    leading: Icon(Icons.notifications),
    title: Text('Notifications'),
    onTap: () {
    Navigator.of(context).pop();
    },
    ),
    ListTile(
    leading: Icon(Icons.privacy_tip),
    title: Text('Privacy'),
    onTap: () {
    Navigator.of(context).pop();
    },
    ),
    ListTile(
    leading: Icon(Icons.security),
    title: Text('Security'),
    onTap: () {
    Navigator.of(context).pop();
    },
    ),
    ],
    ),
    actions: [
    TextButton(
    child: Text('Close'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    ],
    );
    },
    );
    }

    void _showLogoutDialog(BuildContext context) {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Logout'),
    content: Text('Are you sure you want to logout?'),
    actions: [
    TextButton(
    child: Text('Cancel'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    TextButton(
    child: Text('Logout', style: TextStyle(color: Colors.red)),
    onPressed: () {
    Navigator.of(context).pop();
    Navigator.pushReplacementNamed(context, '/login');
    },
    ),
    ],
    );
    },
    );
    }
  }
