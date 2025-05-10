class DoctorModel {
  final String name;
  final double rating;
  final String phone;
  final String email;
  final String address;

  DoctorModel({
    required this.name,
    required this.rating,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final profile = json['profile'] ?? {};

    // Combine first and last name into one 'name' field
    final firstName = json['first_name']?.toString().trim() ?? '';
    final lastName = json['last_name']?.toString().trim() ?? '';
    final fullName = '$firstName $lastName'.trim();

    return DoctorModel(
      name: fullName.isEmpty ? 'Unknown Doctor' : fullName,
      email: json['email']?.toString() ?? '',
      phone: profile['phone']?.toString() ?? 'Not available',
      address: profile['address']?.toString() ?? 'Mansoura',
      rating: _parseRating(profile['rating']),
    );
  }

  static double _parseRating(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble();
    if (value is double) return value;
    if (value is String) {
      final parsed = double.tryParse(value);
      return parsed ?? 0.0;
    }
    return 0.0;
  }
}
