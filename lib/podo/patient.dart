class Patient {
  Patient({
    this.id,
    this.create_date,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.password,
    this.doctoradded,
    this.doctorId,
    this.fcm_token,
    this.address,
    this.age,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json['_id'] as String ?? '',
    create_date: json['create_date'] as String ?? '',
    name: json['name'] as String ?? '',
    email: json['email'] as String ?? '',
    phone: json['phone'] as String ?? '',
    type: json['type'] as String ?? '',
    password: json['password'] as String ?? '',
    doctoradded: json['doctoradded'] as bool ?? false,
    doctorId: json['doctorId'] as String ?? '',
    fcm_token: json['fcm_token'] as String ?? '',
    age: json['age'] as int ?? 0,
    address: json['address'] as String ?? '',
  );

  final String id;
  final String create_date;
  final String name;
  final String email;
  final String phone;
  final String type;
  final int age;
  final String address;
  final String password;
  final bool doctoradded;
  final String doctorId;
  final String fcm_token;
}
