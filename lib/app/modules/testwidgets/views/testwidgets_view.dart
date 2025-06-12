import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/testwidgets_controller.dart';

class TestwidgetsView extends GetView<TestwidgetsController> {
  const TestwidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Text('Users', style: TextStyle(fontSize: 20)),
        actions: [
          // IconButton(icon: Icon(Icons.search), onPressed: () => _showSearch()),
          IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.addUser(),
        tooltip: 'Add User',
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Search Bar
         Padding(padding: const EdgeInsets.all(8.0), child: _buildSearchBar()),
          // User List
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {

                },
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(child:  Obx(() {
                    if (controller.filteredUsers.isEmpty) {
                      return Center(child: Text('No users found'));
                    }
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.filteredUsers.length + 1,
                      itemBuilder: (context, index) {
                        if (index == controller.filteredUsers.length) {
                          // Load More Button
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: controller.loadMore,
                                child: Obx(
                                      () => controller.isLoadingMore.value
                                      ? CircularProgressIndicator(color: Colors.white)
                                      : Text('Load More'),
                                ),
                              ),
                            ),
                          );
                        }
                        final user = controller.filteredUsers[index];
                        return _buildUserItem(user);
                      },
                    );
                  }),)
                ],),
              ),
            ),

        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search users...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
      onChanged: (value) {
        controller.searchQuery.value = value;
        controller.filterUsers();
      },
    );
  }

  void _showSearch() {
    // Optional: Implement a modal search dialog
  }

  Widget _buildUserItem(User user) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
          radius: 25,
        ),
        title: Text(user.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.email,
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRoleBadge(user.role),

                Text(
                  'Last login: ${user.lastLogin}',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),

        // trailing: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     IconButton(
        //       constraints: BoxConstraints.tight(Size.fromWidth(35.w)),
        //       icon: Icon(Icons.edit, color: Colors.blue),
        //       onPressed: () => controller.editUser(user),
        //     ),
        //     IconButton(
        //       constraints: BoxConstraints.tight(Size.fromWidth(25.w)),
        //       icon: Icon(Icons.delete, color: Colors.red),
        //       onPressed: () => controller.deleteUser(user),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget _buildRoleBadge(String role) {
    Color color;
    switch (role) {
      case 'Admin':
        color = Colors.redAccent;
        break;
      case 'Cashier':
        color = Colors.blueAccent;
        break;
      case 'Worker':
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        role,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
