class TaskData {
  String sId;
  String name;
  String assetId;
  String description;
  List<String> skills;
  int time;
  bool isActive;

  TaskData(
      {this.sId,
      this.name,
      this.assetId,
      this.description,
      this.skills,
      this.time,
      this.isActive});

  TaskData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    assetId = json['asset_id'];
    description = json['description'];
    skills = json['skills'].cast<String>();
    time = json['time'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['asset_id'] = this.assetId;
    data['description'] = this.description;
    data['skills'] = this.skills;
    data['time'] = this.time;
    data['is_active'] = this.isActive;
    return data;
  }
}