class ApirouteShared {
  // Api Routes
  static const String baseUrl = 'https://pet-tacker-api.vercel.app';
  static const String apiVersion = '/api/v1';
  static const String getBaseUrl = '/get';
  static const String postBaseUrl = '/post';
  static const String putBaseUrl = '/put';
  static const String deleteBaseUrl = '/delete';
  // ----------------------------------------------------------------------------------------------------------
  // ? Other Base Urls
  // ----------------------------------------------------------------------------------------------------------
  // -> Activity
  static const String activityBaseRoute = '/activity';
  // -> Activity Type
  static const String activityTypeBaseRoute = '/activitytype';
  // -> Admin
  static const String adminBaseRoute = '/admin';
  // -> Admin Role
  static const String adminRoleBaseRoute = '/adminrole';
  // -> Admin Role Permission
  static const String adminRolePermissionBaseRoute = '/adminrolepermission';
  // -> Appointment
  static const String appointmentBaseRoute = '/appointment';
  // -> Appointment Type
  static const String appointmentTypeBaseRoute = '/appointmenttype';
  // -> Pet
  static const String petBaseRoute = '/pet';
  // -> Pet Type
  static const String petTypeBaseRoute = '/pettype';
  // -> User
  static const String userBaseRoute = '/user';

  // ----------------------------------------------------------------------------------------------------------
  // ? Activity Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createActivitywithoutDateRoute =
      '$baseUrl$apiVersion$activityBaseRoute$postBaseUrl/create_activity_without_date';
  static const String createActivitywithDateRoute =
      '$baseUrl$apiVersion$activityBaseRoute$postBaseUrl/create_activity_with_date';
  // -> Get
  static const String getAllActivityRoute =
      '$baseUrl$apiVersion$activityBaseRoute$getBaseUrl/get_all_activity';
  static const String getActivityByActivtyIdRoute =
      '$baseUrl$apiVersion$activityBaseRoute$getBaseUrl/get_activity_by_aid';
  static const String getActivityByPetIdRoute =
      '$baseUrl$apiVersion$activityBaseRoute$getBaseUrl/get_activity_by_pid';
  static const String getActivityByActivityTypeRoute =
      '$baseUrl$apiVersion$activityBaseRoute$getBaseUrl/get_activity_by_activity_type';
  // -> Put
  static const String updateActivityRoute =
      '$baseUrl$apiVersion$activityBaseRoute$putBaseUrl/update_activity';
  // -> Delete
  static const String deleteActivitybyActivityIdRoute =
      '$baseUrl$apiVersion$activityBaseRoute$deleteBaseUrl/delete_activity_by_aid';
  static const String deleteActivitybyPetIdRoute =
      '$baseUrl$apiVersion$activityBaseRoute$deleteBaseUrl/delete_activity_by_pid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Activity Type Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createActivityTypeRoute =
      '$baseUrl$apiVersion$activityTypeBaseRoute$postBaseUrl/create_activity_type';
  // -> Get
  static const String getAllActivityTypeRoute =
      '$baseUrl$apiVersion$activityTypeBaseRoute$getBaseUrl/get_all_activity_type';
  static const String getActivityTypeByActivityTypeIdRoute =
      '$baseUrl$apiVersion$activityTypeBaseRoute$getBaseUrl/get_activity_type_by_atid';
  // -> Put
  static const String updateActivityTypeRoute =
      '$baseUrl$apiVersion$activityTypeBaseRoute$putBaseUrl/update_activity_type';
  // -> Delete
  static const String deleteActivityTypebyActivityIdRoute =
      '$baseUrl$apiVersion$activityTypeBaseRoute$deleteBaseUrl/delete_activity_type_by_atid';
  static const String deleteActivityTypebyPetIdRoute =
      '$baseUrl$apiVersion$activityTypeBaseRoute$deleteBaseUrl/delete_activity_type_by_pid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Admin Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createAdminRoute =
      '$baseUrl$apiVersion$adminBaseRoute$postBaseUrl/create_admin';
  // -> Get
  static const String getAllAdminRoute =
      '$baseUrl$apiVersion$adminBaseRoute$getBaseUrl/get_all_admin';
  static const String getAdminByAdminIdRoute =
      '$baseUrl$apiVersion$adminBaseRoute$getBaseUrl/get_admin_by_aid';
  static const String getAdminByUserIdRoute =
      '$baseUrl$apiVersion$adminBaseRoute$getBaseUrl/get_admin_by_uid';
  // -> Put
  static const String updateAdminRoute =
      '$baseUrl$apiVersion$adminBaseRoute$putBaseUrl/update_admin';
  // -> Delete
  static const String deleteAdminbyAdminIdRoute =
      '$baseUrl$apiVersion$adminBaseRoute$deleteBaseUrl/delete_admin_by_aid';
  static const String deleteAdminbyUserIdRoute =
      '$baseUrl$apiVersion$adminBaseRoute$deleteBaseUrl/delete_admin_by_uid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Admin Role Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createAdminRoleRoute =
      '$baseUrl$apiVersion$adminRoleBaseRoute$postBaseUrl/create_admin_role';
  // -> Get
  static const String getAllAdminRoleRoute =
      '$baseUrl$apiVersion$adminRoleBaseRoute$getBaseUrl/get_all_admin_role';
  static const String getAdminRoleByAdminRoleIdRoute =
      '$baseUrl$apiVersion$adminRoleBaseRoute$getBaseUrl/get_admin_role_by_arid';
  // -> Put
  static const String updateAdminRoleRoute =
      '$baseUrl$apiVersion$adminRoleBaseRoute$putBaseUrl/update_admin_role';
  // -> Delete
  static const String deleteAdminRolebyAdminRoleIdRoute =
      '$baseUrl$apiVersion$adminRoleBaseRoute$deleteBaseUrl/delete_admin_role_by_arid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Admin Role Permission Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createAdminRolePermissionRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$postBaseUrl/create_admin_role_permission';
  // -> Get
  static const String getAllAdminRolePermissionRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$getBaseUrl/get_all_admin_role_permission';
  static const String getAdminRolePermissionByAdminRolePermissionIdRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$getBaseUrl/get_admin_role_permission_by_arpid';
  static const String getAdminRolePermissionByUserIdRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$getBaseUrl/get_admin_role_permission_by_uid';
  // -> Put
  static const String updateAdminRolePermissionRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$putBaseUrl/update_admin_role_permission';
  // -> Delete
  static const String deleteAdminRolePermissionbyAdminRolePermissionIdRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$deleteBaseUrl/delete_admin_role_permission_by_arpid';
  static const String deleteAdminRolePermissionbyUserIdRoute =
      '$baseUrl$apiVersion$adminRolePermissionBaseRoute$deleteBaseUrl/delete_admin_role_permission_by_uid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Appointment Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createAppointmentRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$postBaseUrl/create_appointment';
  // -> Get
  static const String getAllAppointmentRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$getBaseUrl/get_all_appointment';
  static const String getAppointmentByAppointmentIdRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$getBaseUrl/get_appointment_by_aid';
  static const String getAppointmentByAppointmentTypeRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$getBaseUrl/get_appointment_by_appointment_type';
  static const String getAppointmentByPetIdRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$getBaseUrl/get_appointment_by_pid';
  static const String getAppointmentByUserIdRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$getBaseUrl/get_appointment_by_uid';
  // -> Put
  static const String updateAppointmentRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$putBaseUrl/update_appointment';
  // -> Delete
  static const String deleteAppointmentbyAppointmentIdRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$deleteBaseUrl/delete_appointment_by_aid';
  static const String deleteAppointmentbyPetIdRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$deleteBaseUrl/delete_appointment_by_pid';
  static const String deleteAppointmentbyUserIdRoute =
      '$baseUrl$apiVersion$appointmentBaseRoute$deleteBaseUrl/delete_appointment_by_uid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Appointment Type Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createAppointmentTypeRoute =
      '$baseUrl$apiVersion$appointmentTypeBaseRoute$postBaseUrl/create_appointment_type';
  // -> Get
  static const String getAllAppointmentTypeRoute =
      '$baseUrl$apiVersion$appointmentTypeBaseRoute$getBaseUrl/get_all_appointment_type';
  static const String getAppointmentTypeByAppointmentTypeIdRoute =
      '$baseUrl$apiVersion$appointmentTypeBaseRoute$getBaseUrl/get_appointment_type_by_atid';
  // -> Put
  static const String updateAppointmentTypeRoute =
      '$baseUrl$apiVersion$appointmentTypeBaseRoute$putBaseUrl/update_appointment_type';
  // -> Delete
  static const String deleteAppointmentTypebyAppointmentTypeIdRoute =
      '$baseUrl$apiVersion$appointmentTypeBaseRoute$deleteBaseUrl/delete_appointment_type_by_atid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Pet Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createPetRoute =
      '$baseUrl$apiVersion$petBaseRoute$postBaseUrl/create_pet';
  // -> Get
  static const String getAllPetRoute =
      '$baseUrl$apiVersion$petBaseRoute$getBaseUrl/get_all_pet';
  static const String getPetByPetIdRoute =
      '$baseUrl$apiVersion$petBaseRoute$getBaseUrl/get_pet_by_pid';
  static const String getPetByPetTypeRoute =
      '$baseUrl$apiVersion$petBaseRoute$getBaseUrl/get_pet_by_pet_type';
  static const String getPetByUserIdRoute =
      '$baseUrl$apiVersion$petBaseRoute$getBaseUrl/get_pet_by_uid';
  // -> Put
  static const String updatePetRoute =
      '$baseUrl$apiVersion$petBaseRoute$putBaseUrl/update_pet';
  // -> Delete
  static const String deletePetbyPetIdRoute =
      '$baseUrl$apiVersion$petBaseRoute$deleteBaseUrl/delete_pet_by_pid';
  static const String deletePetbyUserIdRoute =
      '$baseUrl$apiVersion$petBaseRoute$deleteBaseUrl/delete_pet_by_uid';

  // ----------------------------------------------------------------------------------------------------------
  // ? Pet Type Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createPetTypeRoute =
      '$baseUrl$apiVersion$petTypeBaseRoute$postBaseUrl/create_pet_type';
  // -> Get
  static const String getAllPetTypeRoute =
      '$baseUrl$apiVersion$petTypeBaseRoute$getBaseUrl/get_all_pet_type';
  static const String getPetTypeByPetTypeIdRoute =
      '$baseUrl$apiVersion$petTypeBaseRoute$getBaseUrl/get_pet_type_by_ptid';
  // -> Put
  static const String updatePetTypeRoute =
      '$baseUrl$apiVersion$petTypeBaseRoute$putBaseUrl/update_pet_type';
  // -> Delete
  static const String deletePetTypebyPetTypeIdRoute =
      '$baseUrl$apiVersion$petTypeBaseRoute$deleteBaseUrl/delete_pet_type_by_ptid';

  // ----------------------------------------------------------------------------------------------------------
  // ? User Routes
  // ----------------------------------------------------------------------------------------------------------
  // -> Post
  static const String createUserRoute =
      '$baseUrl$apiVersion$userBaseRoute$postBaseUrl/create_user';
  // -> Get
  static const String getAllUserRoute =
      '$baseUrl$apiVersion$userBaseRoute$getBaseUrl/get_all_user';
  static const String getUserByUserIdRoute =
      '$baseUrl$apiVersion$userBaseRoute$getBaseUrl/get_user_by_uid';
  static const String getUserByPhoneNumberRoute =
      '$baseUrl$apiVersion$userBaseRoute$getBaseUrl/get_user_by_phone_number';
  static const String getUserByMailAddressRoute =
      '$baseUrl$apiVersion$userBaseRoute$getBaseUrl/get_user_by_mail_address';
  // -> Put
  static const String updateUserRoute =
      '$baseUrl$apiVersion$userBaseRoute$putBaseUrl/update_user';
  // -> Delete
  static const String deleteUserbyUserIdRoute =
      '$baseUrl$apiVersion$userBaseRoute$deleteBaseUrl/delete_user_by_uid';
  static const String deleteUserbyPhoneNumberRoute =
      '$baseUrl$apiVersion$userBaseRoute$deleteBaseUrl/delete_user_by_phone_number';
  static const String deleteUserbyMailAddressRoute =
      '$baseUrl$apiVersion$userBaseRoute$deleteBaseUrl/delete_user_by_mail_address';
}
