// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// // Dummy User Model
// class User {
//   final String name;
//   final String email;
//   final String role;
//   final String lastLogin;
//   final String avatarUrl;
//
//   User({
//     required this.name,
//     required this.email,
//     required this.role,
//     required this.lastLogin,
//     required this.avatarUrl,
//   });
// }
//
// // Controller with GetX
// class UserController extends GetxController {
//   // All users
//   final List<User> allUsers = List.generate(
//     50,
//         (index) => User(
//       name: 'User $index',
//       email: 'user$index@example.com',
//       role: index % 3 == 0 ? 'Admin' : index % 3 == 1 ? 'Editor' : 'Viewer',
//       lastLogin: '2024-04-0${index % 9 + 1}',
//       avatarUrl:
//       'https://i.pravatar.cc/150?img=${index + 1}', // Placeholder avatar
//     ),
//   );
//
//   // Observable filtered list
//   var filteredUsers = <User>[].obs;
//
//   // Search query
//   var searchQuery = ''.obs;
//
//   // Pagination control
//   int itemsPerPage = 10;
//   int currentPage = 1;
//
//   // Loading state
//   var isLoadingMore = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     filterUsers();
//   }
//
//   // Filter users based on search query
//   void filterUsers() {
//     List<User> temp = allUsers
//         .where((user) =>
//     user.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
//         user.email
//             .toLowerCase()
//             .contains(searchQuery.value.toLowerCase()))
//         .toList();
//
//     // Reset pagination
//     currentPage = 1;
//     filteredUsers.value = temp.take(itemsPerPage).toList();
//   }
//
//   // Load more users (pagination)
//   void loadMore() async {
//     if (isLoadingMore.value) return;
//     isLoadingMore.value = true;
//     await Future.delayed(Duration(seconds: 1)); // Simulate delay
//
//     final start = currentPage * itemsPerPage;
//     final end = start + itemsPerPage;
//     final moreUsers = allUsers
//         .where((user) =>
//     user.name
//         .toLowerCase()
//         .contains(searchQuery.value.toLowerCase()) ||
//         user.email
//             .toLowerCase()
//             .contains(searchQuery.value.toLowerCase()))
//         .skip(start)
//         .take(itemsPerPage)
//         .toList();
//
//     if (moreUsers.isNotEmpty) {
//       filteredUsers.addAll(moreUsers);
//       currentPage++;
//     }
//     isLoadingMore.value = false;
//   }
//
//   // Add user (for demo purpose)
//   void addUser() {
//     final newUser = User(
//       name: 'New User',
//       email: 'newuser@example.com',
//       role: 'Viewer',
//       lastLogin: '2024-04-10',
//       avatarUrl: 'https://i.pravatar.cc/150?img=100',
//     );
//     allUsers.insert(0, newUser);
//     filterUsers();
//   }
//
//   // Delete user
//   void deleteUser(User user) {
//     allUsers.remove(user);
//     filterUsers();
//   }
//
//   // Edit user (simple demo)
//   void editUser(User user) {
//     // For demo, just change name
//     final index = allUsers.indexOf(user);
//     if (index != -1) {
//       allUsers[index] = User(
//         name: user.name + ' (Edited)',
//         email: user.email,
//         role: user.role,
//         lastLogin: user.lastLogin,
//         avatarUrl: user.avatarUrl,
//       );
//       filterUsers();
//     }
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'User List Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: UserListPage(),
//     );
//   }
// }
//
// class UserListPage extends StatelessWidget {
//   final UserController controller = Get.put(UserController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 64,
//         title: Text('Users', style: TextStyle(fontSize: 20)),
//         actions: [
//           IconButton(icon: Icon(Icons.search), onPressed: () => _showSearch()),
//           IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => controller.addUser(),
//         child: Icon(Icons.add),
//         tooltip: 'Add User',
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: _buildSearchBar(),
//           ),
//           // User List
//           Expanded(
//             child: Obx(() {
//               if (controller.filteredUsers.isEmpty) {
//                 return Center(child: Text('No users found'));
//               }
//               return ListView.builder(
//                 itemCount: controller.filteredUsers.length + 1,
//                 itemBuilder: (context, index) {
//                   if (index == controller.filteredUsers.length) {
//                     // Load More Button
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Center(
//                         child: ElevatedButton(
//                           onPressed: controller.loadMore,
//                           child: Obx(() => controller.isLoadingMore.value
//                               ? CircularProgressIndicator(
//                             color: Colors.white,
//                           )
//                               : Text('Load More')),
//                         ),
//                       ),
//                     );
//                   }
//                   final user = controller.filteredUsers[index];
//                   return _buildUserItem(user);
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBar() {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: 'Search users...',
//         prefixIcon: Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//       ),
//       onChanged: (value) {
//         controller.searchQuery.value = value;
//         controller.filterUsers();
//       },
//     );
//   }
//
//   void _showSearch() {
//     // Optional: Implement a modal search dialog
//   }
//
//   Widget _buildUserItem(User user) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       elevation: 2,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(user.avatarUrl),
//           radius: 25,
//         ),
//         title: Text(user.name, style: TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(user.email, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//               SizedBox(height: 4),
//               Row(
//                 children: [
//                   _buildRoleBadge(user.role),
//                   SizedBox(width: 8),
//                   Text('Last login: ${user.lastLogin}', style: TextStyle(fontSize: 10, color: Colors.grey)),
//                 ],
//               ),
//             ]),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(Icons.edit, color: Colors.blue),
//               onPressed: () => controller.editUser(user),
//             ),
//             IconButton(
//               icon: Icon(Icons.delete, color: Colors.red),
//               onPressed: () => controller.deleteUser(user),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRoleBadge(String role) {
//     Color color;
//     switch (role) {
//       case 'Admin':
//         color = Colors.redAccent;
//         break;
//       case 'Editor':
//         color = Colors.blueAccent;
//         break;
//       case 'Viewer':
//         color = Colors.green;
//         break;
//       default:
//         color = Colors.grey;
//     }
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(role,
//           style: TextStyle(
//             color: color,
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           )),
//     );
//   }
// }