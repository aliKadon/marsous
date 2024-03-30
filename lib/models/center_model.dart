class CenterModel {
  String? id;
  String? name;

  CenterModel({
    this.id,
    this.name,
  });

  factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
