class PoliticalPartyModel {
  String? initials;

  PoliticalPartyModel({this.initials});

  Map<String, dynamic> toMap() {
    return {'initials': initials};
  }

  factory PoliticalPartyModel.fromMap(Map<String, dynamic> map) {
    return PoliticalPartyModel(
      initials: map['sigla'] ?? null,
    );
  }
}
