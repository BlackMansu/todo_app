class User_model {
  String? tittle;
  String? description;
  String? id;
  User_model({this.tittle, this.description, this.id});

  Map<String, dynamic> tomap() {
    return {"title": tittle, "descrpition": description};
  }

  User_model.fromuser(Map<String, dynamic> json, this.id)
      : tittle = json["title"],
        description = json["description"];
}
