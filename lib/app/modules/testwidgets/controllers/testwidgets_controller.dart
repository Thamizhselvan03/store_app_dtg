import 'package:get/get.dart';

class TestwidgetsController extends GetxController {
  //TODO: Implement TestwidgetsController

  // All users
  final List<User> allUsers = List.generate(
    50,
        (index) => User(
      name: 'User $index',
      email: 'user$index@example.com',
      role: index % 3 == 0 ? 'Admin' : index % 3 == 1 ? 'Cashier' : 'Worker',
      lastLogin: '2024-04-0${index % 9 + 1}',
      avatarUrl:
      'https://i.pravatar.cc/150?img=${index + 1}', // Placeholder avatar
    ),
  );

  // Observable filtered list
  var filteredUsers = <User>[].obs;

  // Search query
  var searchQuery = ''.obs;

  // Pagination control
  int itemsPerPage = 10;
  int currentPage = 1;

  // Loading state
  var isLoadingMore = false.obs;

  @override
  void onInit() {
    super.onInit();
    filterUsers();
  }

  // Filter users based on search query
  void filterUsers() {
    List<User> temp = allUsers
        .where((user) =>
    user.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
        user.email
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase()))
        .toList();

    // Reset pagination
    currentPage = 1;
    filteredUsers.value = temp.take(itemsPerPage).toList();
  }

  // Load more users (pagination)
  void loadMore() async {
    if (isLoadingMore.value) return;
    isLoadingMore.value = true;
    await Future.delayed(Duration(seconds: 1)); // Simulate delay

    final start = currentPage * itemsPerPage;
    final end = start + itemsPerPage;
    final moreUsers = allUsers
        .where((user) =>
    user.name
        .toLowerCase()
        .contains(searchQuery.value.toLowerCase()) ||
        user.email
            .toLowerCase()
            .contains(searchQuery.value.toLowerCase()))
        .skip(start)
        .take(itemsPerPage)
        .toList();

    if (moreUsers.isNotEmpty) {
      filteredUsers.addAll(moreUsers);
      currentPage++;
    }
    isLoadingMore.value = false;
  }

  // Add user (for demo purpose)
  void addUser() {
    final newUser = User(
      name: 'New User',
      email: 'newuser@example.com',
      role: 'Viewer',
      lastLogin: '2024-04-10',
      avatarUrl: 'https://i.pravatar.cc/150?img=100',
    );
    allUsers.insert(0, newUser);
    filterUsers();
  }

  // Delete user
  void deleteUser(User user) {
    allUsers.remove(user);
    filterUsers();
  }

  // Edit user (simple demo)
  void editUser(User user) {
    // For demo, just change name
    final index = allUsers.indexOf(user);
    if (index != -1) {
      allUsers[index] = User(
        name: user.name + ' (Edited)',
        email: user.email,
        role: user.role,
        lastLogin: user.lastLogin,
        avatarUrl: user.avatarUrl,
      );
      filterUsers();
    }
  }
}



// Dummy User Model
class User {
  final String name;
  final String email;
  final String role;
  final String lastLogin;
  final String avatarUrl;

  User({
    required this.name,
    required this.email,
    required this.role,
    required this.lastLogin,
    required this.avatarUrl,
  });
}