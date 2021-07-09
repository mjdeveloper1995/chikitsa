class NotificationsData {
  NotificationsData({
    this.id,
    this.create_date,
    this.patientId,
    this.doctorId,
    this.message,
    this.sentBy,
  });

  factory NotificationsData.fromJson(Map<String, dynamic> json) => NotificationsData(
    id: json['_id'] as String ?? '',
    create_date: json['create_date'] as String ?? '',
    patientId: json['patientId'] as String ?? '',
    doctorId: json['doctorId'] as String ?? '',
    message: json['message'] as String ?? '',
    sentBy: json['sentBy'] as String ?? '',
  );

  final id;
  final create_date;
  final patientId;
  final doctorId;
  final message;
  final sentBy;

}
