class PatientModel {
  final String name;
  final double rating; // Optional: assume 0 for now
  final String phone;
  final String email;
  final String address; // Optional: assume "Not provided" for now

  PatientModel({
    required this.name,
    required this.rating,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      name: json['name']?.toString() ?? 'Unknown Doctor',
      email: json['email']?.toString() ?? 'Not provided',
      phone: json['phone_number']?.toString() ?? 'Not available',
      address: 'Mansoura', // No address in response
      rating: 0.0, // No rating in response
    );
  }
}
