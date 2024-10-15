class AppointmentModel {
  final int userId, appointmentType, petId;
  final String appointmentDate;
  AppointmentModel({
    required this.userId,
    required this.appointmentType,
    required this.petId,
    required this.appointmentDate,
  });
}
