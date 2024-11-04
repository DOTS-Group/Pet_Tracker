class UserModel {
  final int userId;
  final String userName;
  final bool isEmailVerified, isPhoneNumberVerified;
  String? userEmail, userPhoneNumber;

  UserModel({
    required this.userId,
    required this.userName,
    required this.isEmailVerified,
    required this.isPhoneNumberVerified,
    this.userEmail,
    this.userPhoneNumber,
  });
}
