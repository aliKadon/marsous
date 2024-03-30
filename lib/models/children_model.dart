class ChildrenModel {
  String? id;
  String? name;
  String? token;

  ChildrenModel({
    this.token,
    this.name,
    this.id,
  });

  factory ChildrenModel.fromJson(Map<String, dynamic> json) => ChildrenModel(
    token: json["token"],
    id: json["id"],
    name: json["name"],
  );

  Map<String,dynamic> toJson() => {
    "token" : token,
    "id" : id,
    "name" : name,
  };
}
