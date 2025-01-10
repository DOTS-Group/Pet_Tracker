import '../../models/api/admintype_model.dart';
import '../../models/api/token_model.dart';

class AdmintypeApi {
  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new admin type
  Future<bool> createAdminType(
      AdminTypeModel adminType, TokenModel token) async {
    // Call the API to create a new admin type
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get an admin type by Admin Type ID
  Future<AdminTypeModel> getAdminTypeByAdminTypeId(
      int adminTypeId, TokenModel token) async {
    // Call the API to get an admin type by ID
    return AdminTypeModel(
      adminType: 'Admin',
    );
  }

  // Get an admin type by Admin Type
  Future<AdminTypeModel> getAdminTypeByAdminType(
      String adminType, TokenModel token) async {
    // Call the API to get an admin type by type
    return AdminTypeModel(
      adminType: 'Admin',
    );
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update an admin type
  Future<bool> updateAdminType(
      AdminTypeModel adminType, TokenModel token) async {
    // Call the API to update an admin type
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete an admin type by Admin Type ID
  Future<bool> deleteAdminTypeByAdminTypeId(
      int adminTypeId, TokenModel token) async {
    // Call the API to delete an admin type by ID
    return true;
  }

  // Delete an admin type by Admin Type
  Future<bool> deleteAdminTypeByAdminType(
      String adminType, TokenModel token) async {
    // Call the API to delete an admin type by type
    return true;
  }
}
