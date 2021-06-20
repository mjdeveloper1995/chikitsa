class AppointmentItem {
   String id;
   String create_date;
   String date;
   String doctorId;
   String doctorName;
   String patientComment;
   String patientId;
   String patientName;
   String status;
   String time;

  AppointmentItem(
      {this.id,
      this.create_date,
      this.date,
      this.doctorId,
      this.doctorName,
      this.patientComment,
      this.patientId,
      this.patientName,
      this.status,
      this.time});

  factory AppointmentItem.fromJson(Map<String, dynamic> json) {
    return AppointmentItem(
      id: json['_id'] as String ?? '',
      create_date: json['create_date'] as String ?? '',
      date: json['date'] as String ?? '',
      doctorId: json['doctorId'] as String ?? '',
      doctorName: json['doctorName'] as String ?? '',
      patientComment: json['patientComment'] as String ?? '',
      patientId: json['patientId'] as String ?? '',
      patientName: json['patientName'] as String ?? '',
      status: json['status'] as String ?? '',
      time: json['time'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['create_date'] = this.create_date;
    data['date'] = this.date;
    data['doctorId'] = this.doctorId;
    data['doctorName'] = this.doctorName;
    data['patientComment'] = this.patientComment;
    data['patientId'] = this.patientId;
    data['patientName'] = this.patientName;
    data['status'] = this.status;
    data['time'] = this.time;
    return data;
  }
}
