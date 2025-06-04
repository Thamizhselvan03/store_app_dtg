import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../admin_main/views/widgets/drawer_admin.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(title: const Text('DashboardView'), centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          // Sales Summary Card
          FadeTransition(
            opacity: const AlwaysStoppedAnimation(1),
            // Simple fade-in, can be animated
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.lightGreen[50],
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.green[700],
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Sales Summary',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Today\'s Sales: \$XXX',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'This Week\'s Sales: \$XXXX',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'This Month\'s Sales: \$XXXXX',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    // Sales trend chart could go here
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // Inventory Alerts Card
          FadeTransition(
            opacity: const AlwaysStoppedAnimation(1),
            // Simple fade-in, can be animated
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.red[50],
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.warning, color: Colors.red[700], size: 30),
                        SizedBox(width: 10),
                        Text(
                          'Inventory Alerts',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Low Stock Items: X',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Expired Products: Y',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    // List of low stock/expired products could go here
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // Quick Actions Card
          FadeTransition(
            opacity: const AlwaysStoppedAnimation(1),
            // Simple fade-in, can be animated
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.blue[50],
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(Icons.flash_on, color: Colors.blue[700], size: 30),
                        SizedBox(width: 10),
                        Text(
                          'Quick Actions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Navigate to Add Sale
                            },
                            icon: Icon(Icons.receipt, size: 20),
                            label: Text('New Sale'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[400],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Navigate to Add Product
                            },
                            icon: Icon(Icons.add_box, size: 20),
                            label: Text('Add Product'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[400],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // Navigate to Product Location
                            },
                            icon: Icon(Icons.search, size: 20),
                            label: Text('Find Product'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange[400],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 8,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
