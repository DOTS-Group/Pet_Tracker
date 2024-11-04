import '../../api/appointment_model.dart';
import '../../api/token_model.dart';

class AppointmentApi {
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Post
  // ? ----------------------------------------------------------------------------------------------------------
  // Create a new appointment
  Future<bool> createAppointment(
      AppointmentModel appointment, TokenModel token) async {
    // Call the API to create a new appointment
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get an appointment by User ID
  Future<List<AppointmentModel>> getAppointmentByUserId(
      int userId, TokenModel token) async {
    // Call the API to get an appointment by ID
    return [
      AppointmentModel(
        userId: 1,
        petId: 1,
        appointmentType: 1,
        appointmentDate: '2021-01-01',
      ),
    ];
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Put
  // ? ----------------------------------------------------------------------------------------------------------
  // Update an appointment
  Future<bool> updateAppointment(
      AppointmentModel appointment, TokenModel token) async {
    // Call the API to update an appointment
    return true;
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete an appointment by Appointment ID
  Future<bool> deleteAppointmentByAppointmentId(
      int appointmentId, TokenModel token) async {
    // Call the API to delete an appointment by ID
    return true;
  }

  // ! ----------------------------------------------------------------------------------------------------------
  // ! Admin Only
  // ! ----------------------------------------------------------------------------------------------------------
  // ? ----------------------------------------------------------------------------------------------------------
  // ? Get
  // ? ----------------------------------------------------------------------------------------------------------
  // Get an appointment by Appointment ID
  Future<AppointmentModel> getAppointmentByAppointmentId(
      int appointmentId, TokenModel token) async {
    // Call the API to get an appointment by ID
    return AppointmentModel(
      userId: 1,
      petId: 1,
      appointmentType: 1,
      appointmentDate: '2021-01-01',
    );
  }

  // ? ----------------------------------------------------------------------------------------------------------
  // ? Delete
  // ? ----------------------------------------------------------------------------------------------------------
  // Delete an appointment by User ID
  Future<bool> deleteAppointmentByUserId(int userId, TokenModel token) async {
    // Call the API to delete an appointment by ID
    return true;
  }

  // Delete an appointment by Pet ID
  Future<bool> deleteAppointmentByPetId(int petId, TokenModel token) async {
    // Call the API to delete an appointment by ID
    return true;
  }
}
