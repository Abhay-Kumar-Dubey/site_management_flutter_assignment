import '../models/site_model.dart';

class SiteRepository {
  static final List<Map<String, dynamic>> _mockData = [
    {
      "id": "1",
      "name": "Bangalore Logistics Hub",
      "location": "Whitefield",
      "manager": "Sumit Gupta",
      "status": "Active",
    },
    {
      "id": "2",
      "name": "Mumbai Port Terminal",
      "location": "JNPT",
      "manager": "Ananya R.",
      "status": "Maintenance",
    },
    {
      "id": "3",
      "name": "Delhi Express Center",
      "location": "Okhla",
      "manager": "Rahul S.",
      "status": "Active",
    },
    {
      "id": "4",
      "name": "Chennai Distribution",
      "location": "Adyar",
      "manager": "Priya M.",
      "status": "Active",
    },
    {
      "id": "5",
      "name": "Hyderabad Tech Park",
      "location": "HITEC City",
      "manager": "Vikram K.",
      "status": "Maintenance",
    },
    {
      "id": "6",
      "name": "Pune Warehousing",
      "location": "Chakan",
      "manager": "Sneha P.",
      "status": "Active",
    },
    {
      "id": "7",
      "name": "Kolkata Fulfillment Center",
      "location": "Howrah",
      "manager": "Amit D.",
      "status": "Active",
    },
    {
      "id": "8",
      "name": "Ahmedabad Sorting Hub",
      "location": "Sanand",
      "manager": "Rishi T.",
      "status": "Maintenance",
    },
    {
      "id": "9",
      "name": "Jaipur Regional Office",
      "location": "Malviya Nagar",
      "manager": "Kavita J.",
      "status": "Active",
    },
    {
      "id": "10",
      "name": "Surat Textile Hub",
      "location": "Varachha",
      "manager": "Deepak G.",
      "status": "Active",
    },
  ];

  Future<List<Site>> fetchSites() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockData.map((json) => Site.fromJson(json)).toList();
  }

  Future<Site> updateSiteStatus(Site site, String newStatus) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return site.copyWith(status: newStatus);
  }
}
