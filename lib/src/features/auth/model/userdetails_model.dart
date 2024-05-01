import 'dart:developer';

class UserDetailModel {
  String? firstName;
  String? lastName;
  String? email;
  String? cropName;
  String? landSize;
  String? unit;
  String? address;
  double? latitude;
  double? longitude;

  UserDetailModel({
    this.firstName,
    this.lastName,
    this.email,
    this.cropName,
    this.landSize,
    this.unit,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    try {
      
      return UserDetailModel(
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['userEmail'] as String?,
        cropName: json['cropName'] as String?,
        landSize: json['landSize'] as String?,
        unit: json['unit'] as String?,
        address: json['address'] as String?,
        latitude: (json['latitdue'] ?? 0.0) as double?,
        longitude: (json['longitude'] ?? 0.0) as double?,
      );
    } catch (e) {
      log("Error parsing UserDetailModel from JSON: $e");
      // Return a default instance if parsing fails
      return UserDetailModel(
        firstName: "first name",
        lastName: "Last name",
        email: "email",
        cropName: "cropName",
        landSize: "landSize",
        unit: "unit",
        address: "address",
        latitude: 1.0,
        longitude: 1.0,
      );
    }
  }
}
