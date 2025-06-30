class DoctorModel {
  final String id;
  final String name;
  final double rating;
  final String phone;
  final String email;
  final String address;
  final String profileImage; // NEW

  DoctorModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.phone,
    required this.email,
    required this.address,
    required this.profileImage, // NEW
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json, {double? manualRating}) {
    return DoctorModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Unknown Doctor',
      email: json['email']?.toString() ?? 'Not provided',
      phone: json['phone_number']?.toString() ?? 'Not available',
      address: json['address']?.toString() ?? 'Mansoura',
      rating: manualRating ?? double.tryParse(json['rating']?.toString() ?? '') ?? 4.0,
      profileImage: json['profileImage']?.toString() ?? 'images/default.png', // fallback
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phone,
      'address': address,
      'rating': rating,
      'profileImage': profileImage, // NEW
    };
  }
}
