import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Responsive Layout")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          if (width < 600) {
            // 📱 Mobile layout
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildCard("Mobile View", Icons.phone_android, Colors.green),
                _buildCard("Another Section", Icons.settings, Colors.orange),
              ],
            );
          } else if (width >= 600 && width  < 1024) {
            // 📱 Tablet layout (2-column grid)
            return GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCard("Tablet View", Icons.tablet, Colors.blue),
                _buildCard("Settings", Icons.settings, Colors.purple),
                _buildCard("More", Icons.more_horiz, Colors.teal),
                _buildCard("Info", Icons.info, Colors.indigo),
              ],
            );
          } else {
            // 🖥️ Desktop/Web layout (4-column grid)
            return GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildCard("Desktop View", Icons.desktop_windows, Colors.red),
                _buildCard("Analytics", Icons.analytics, Colors.green),
                _buildCard("Reports", Icons.bar_chart, Colors.orange),
                _buildCard("Settings", Icons.settings, Colors.blue),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
