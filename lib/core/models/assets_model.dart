class AssetsData {
  String sId;
  String name;
  String image;
  bool isActive;

  AssetsData({this.sId, this.name, this.image, this.isActive});

  AssetsData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['is_active'] = this.isActive;
    return data;
  }
}