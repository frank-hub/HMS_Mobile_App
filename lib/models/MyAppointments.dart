
class MyAppointments {
  final int id;
  final String name;
  final String doctor_name;
  final String description;
  final String date;
  final String time;

  MyAppointments({ required this.id, required this.name, required this.doctor_name, required this.description,
        required this.date, required this.time});


  factory MyAppointments.fromJson(Map<String, dynamic> json){
    return MyAppointments(
      id: json['id'],
      name: json['name'],
      doctor_name: json['doctor_name'],
      description: json['description'],
      date: json['date'],
      time: json['time'],

    );
  }

}
