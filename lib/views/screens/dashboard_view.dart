import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:site_management_flutter_app/models/site_model.dart';
import 'package:site_management_flutter_app/views/widgets/site_card.dart';
import 'package:site_management_flutter_app/views/widgets/site_detail_bottomsheet.dart';

/// Dashboard Screen - Main screen displaying the site management dashboard
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1419),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF0F1419),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: const Color(0xFF1E2329),
            child: Icon(Icons.person, color: Colors.cyan.shade400),
          ),
        ),
        title: const Text(
          'Site Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.cyan.shade400,
            ),
            onPressed: () {},
            tooltip: 'Notifications',
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.cyan.shade400),
            onPressed: () {},
            tooltip: 'Search',
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E2329),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                onChanged: (value) {},
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search Site Name',
                  hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey[600]),
                    onPressed: () {},
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),
            ),
          ),

          // Stats Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildDarkStatCard(
                    icon: Icons.grid_view,
                    iconColor: Colors.cyan.shade400,
                    label: 'Total Sites',
                    value: '9',
                    backgroundColor: const Color(0xFF1E2329),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDarkStatCard(
                    icon: Icons.flash_on,
                    iconColor: Colors.amber.shade400,
                    label: 'Active Sites',
                    value: '2',
                    backgroundColor: const Color(0xFF1E2329),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Recent Sites Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Sites',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Site List
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              color: Colors.cyan.shade400,
              backgroundColor: const Color(0xFF1E2329),
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 16),
                itemCount: 9,
                itemBuilder: (context, index) {
                  // final site = filteredSites[index];
                  return SiteCard(
                    site: new Site(
                      id: '3',
                      name: 'name',
                      location: 'location',
                      manager: 'manager',
                      status: 'Active',
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => SiteDetailBottomSheet(
                          site: new Site(
                            id: '3',
                            name: 'name',
                            location: 'location',
                            manager: 'manager',
                            status: 'Active',
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkStatCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
