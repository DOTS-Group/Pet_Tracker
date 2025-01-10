import '../../models/api/activity_model.dart';
import '../../models/api/token_model.dart';

class ActivityApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new activity
  Future<bool> createActivity(ActivityModel activity, TokenModel token) async {
    // Call the API to create a new activity
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get an activity by Activity ID
  Future<ActivityModel> getActivityByActivityId(
      int activityId, TokenModel token) async {
    // Call the API to get an activity by ID
    return ActivityModel(
      activityType: 1,
      petId: 1,
      activityNote: 'Note',
      activityDate: '2021-01-01',
    );
  }

  // Get an activity by Pet ID
  Future<List<ActivityModel>> getActivityByPetId(
      int petId, TokenModel token) async {
    // Call the API to get an activity by ID
    return [
      ActivityModel(
        activityType: 1,
        petId: 1,
        activityNote: 'Note',
        activityDate: '2021-01-01',
      ),
    ];
  }

  // Get an activity by User ID
  Future<List<ActivityModel>> getActivityByUserId(
      int userId, TokenModel token) async {
    // Call the API to get an activity by ID
    return [
      ActivityModel(
        activityType: 1,
        petId: 1,
        activityNote: 'Note',
        activityDate: '2021-01-01',
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update an activity
  Future<bool> updateActivity(ActivityModel activity, TokenModel token) async {
    // Call the API to update an activity
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete  an activity by Activity ID
  Future<bool> deleteActivityByActivityId(
      int activityId, TokenModel token) async {
    // Call the API to delete an activity by ID
    return true;
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get all activity
  Future<List<ActivityModel>> getAllActivity(TokenModel token) async {
    // Call the API to get all activity
    return [
      ActivityModel(
        activityType: 1,
        petId: 1,
        activityNote: 'Note',
        activityDate: '2021-01-01',
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete an activity by Pet ID
  Future<bool> deleteActivityByPetId(int petId, TokenModel token) async {
    // Call the API to delete an activity by ID
    return true;
  }

  // Delete an activity by User ID
  Future<bool> deleteActivityByUserId(int userId, TokenModel token) async {
    // Call the API to delete an activity by ID
    return true;
  }
}
