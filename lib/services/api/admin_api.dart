import '../../api/admin_model.dart';
import '../../api/token_model.dart';

class AdminApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new admin
  Future<bool> createAdmin(AdminModel admin, TokenModel token) async {
    // Call the API to create a new admin
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get an admin by Admin ID
  Future<AdminModel> getAdminByAdminId(int adminId, TokenModel token) async {
    // Call the API to get an admin by ID
    return AdminModel(
      adminType: 1,
      userId: 1,
    );
  }

  // Get an admin by User ID
  Future<List<AdminModel>> getAdminByUserId(
      int userId, TokenModel token) async {
    // Call the API to get an admin by ID
    return [
      AdminModel(
        adminType: 1,
        userId: 1,
      ),
    ];
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get all admins
  Future<List<AdminModel>> getAllAdmin(TokenModel token) async {
    // Call the API to get all admins
    return [
      AdminModel(
        adminType: 1,
        userId: 1,
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update an admin
  Future<bool> updateAdmin(AdminModel admin, TokenModel token) async {
    // Call the API to update an admin
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete an admin by Admin ID
  Future<bool> deleteAdminByAdminId(int adminId, TokenModel token) async {
    // Call the API to delete an admin by ID
    return true;
  }

  // Delete an admin by User ID
  Future<bool> deleteAdminByUserId(int userId, TokenModel token) async {
    // Call the API to delete an admin by ID
    return true;
  }
}
