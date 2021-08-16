class StateModel {
  String? initials;

  StateModel({this.initials});

  Map<String, dynamic> toMap() {
    return {'initials': initials};
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(initials: map['sigla']);
  }
}
