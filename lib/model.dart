class Model {
  String? id;
  String? name;
  String? age;
  String? division;
  String? schoolName;

  Model(
      {required this.age,
      this.id,
      required this.name,
      required this.division,
      required this.schoolName});

  factory Model.frombase(Map<String, dynamic> base, String id) {
    return Model(
        id: id,
        age: base['age'],
        name: base['name'],
        division: base['division'],
        schoolName: base['schoolName']);
  }
  Map<String, dynamic> toBase() {
    return {
      'name': name,
      'age': age,
      'division': division,
      'schoolName': schoolName
    };
  }
}
