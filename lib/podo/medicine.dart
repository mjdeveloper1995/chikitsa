class Medicine {
  Medicine({
    this.id,
    this.create_date,
    this.name,
    this.reason,
    this.dose,
    this.from,
    this.to,
    this.schedule,
    this.frequency,
    this.time,
    this.status,
    this.patientId,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      Medicine(
        id: json['_id'] as String ?? '',
        create_date: json['create_date'] as String ?? '',
        name: json['name'] as String ?? '',
        reason: json['reason'] as String ?? '',
        dose: json['dose'] as String ?? '',
        from: json['from'] as String ?? '',
        to: json['to'] as String ?? '',
        schedule: json['schedule'] as String ?? '',
        frequency: json['frequency'] as String ?? '',
        time: json['time'] as String ?? '',
        status: json['status'] as String ?? '',
        patientId: json['patientId'] as String ?? '',
      );

  final String id;
  final String create_date;
  final String name;
  final String reason;
  final String dose;
  final String from;
  final String to;
  final String schedule;
  final String frequency;
  final String time;
  final String status;
  final String patientId;
}
