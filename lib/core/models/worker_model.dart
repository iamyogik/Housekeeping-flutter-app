class WorkerData {
  String sId;
  String name;
  List<String> skills;

  WorkerData({this.sId, this.name, this.skills});

  WorkerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    skills = json['skills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['skills'] = this.skills;
    return data;
  }
}