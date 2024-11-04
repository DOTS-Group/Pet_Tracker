import 'package:pet_tracker/api/token_model.dart';

import '../../api/user_model.dart';

class UserApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new user
  Future<bool> createUser(UserModel user) async {
    // Call the API to create a new user
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get a user by User ID
  Future<UserModel> getUserByUserId(int userId, TokenModel token) async {
    // Call the API to get a user by ID
    return UserModel(
      userId: 1,
      userName: 'John Doe',
      isEmailVerified: true,
      isPhoneNumberVerified: true,
      userEmail: '',
    );
  }

  // Get a user by User Name
  Future<UserModel> getUserByUserName(String userName, TokenModel token) async {
    // Call the API to get a user by name
    return UserModel(
      userId: 1,
      userName: 'John Doe',
      isEmailVerified: true,
      isPhoneNumberVerified: true,
      userEmail: '',
    );
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update a user
  Future<bool> updateUser(UserModel user, TokenModel token) async {
    // Call the API to update a user
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete a user by User ID
  Future<bool> deleteUserByUserId(int userId, TokenModel token) async {
    // Call the API to delete a user by ID
    return true;
  }

  // Delete a user by User Name
  Future<bool> deleteUserByUserName(String userName, TokenModel token) async {
    // Call the API to delete a user by name
    return true;
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // Get all users
  Future<List<UserModel>> getAllUsers(TokenModel token) async {
    // Call the API to get all users
    return [];
  }

  // Get user by email
  Future<UserModel> getUserByEmail(String email, TokenModel token) async {
    // Call the API to get a user by email
    return UserModel(
      userId: 1,
      userName: 'John Doe',
      isEmailVerified: true,
      isPhoneNumberVerified: true,
      userEmail: '',
    );
  }

  // Get user by phone number
  Future<UserModel> getUserByPhoneNumber(
      String phoneNumber, TokenModel token) async {
    // Call the API to get a user by phone number
    return UserModel(
      userId: 1,
      userName: 'John Doe',
      isEmailVerified: true,
      isPhoneNumberVerified: true,
      userEmail: '',
    );
  }
}
