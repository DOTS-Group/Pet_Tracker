import '../../models/api/activitytype_model.dart';
import '../../models/api/token_model.dart';

class ActivitytypeApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get an activity type by Activity Type ID
  Future<ActivityTypeModel> getActivityTypeByActivityTypeId(
      int activityTypeId, TokenModel token) async {
    // Call the API to get an activity type by ID
    return ActivityTypeModel(
      activityType: 'Activity',
    );
  }

  // Get an activity type by Activity Type
  Future<ActivityTypeModel> getActivityTypeByActivityType(
      String activityType, TokenModel token) async {
    // Call the API to get an activity type by type
    return ActivityTypeModel(
      activityType: 'Activity',
    );
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new activity type
  Future<bool> createActivityType(
      ActivityTypeModel activityType, TokenModel token) async {
    // Call the API to create a new activity type
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get all
  Future<List<ActivityTypeModel>> getAllActivityType(TokenModel token) async {
    // Call the API to get all activity types
    return [
      ActivityTypeModel(
        activityType: 'Activity Type',
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update an activity type
  Future<bool> updateActivityType(
      ActivityTypeModel activityType, TokenModel token) async {
    // Call the API to update an activity type
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete an activity type by Activity Type ID
  Future<bool> deleteActivityTypeByActivityTypeId(
      int activityTypeId, TokenModel token) async {
    // Call the API to delete an activity type by ID
    return true;
  }

  // Delete an activity type by Activity Type
  Future<bool> deleteActivityTypeByActivityType(
      String activityType, TokenModel token) async {
    // Call the API to delete an activity type by type
    return true;
  }
}
