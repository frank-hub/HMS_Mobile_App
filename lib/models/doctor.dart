class Doctor {
    final int id;
    final String name;

    Doctor({required this.id,required this.name});

    factory Doctor.fromJson(Map<String , dynamic> json){
      return Doctor(
          id: json['id'],
          name: json['name'],

      );
    }

}