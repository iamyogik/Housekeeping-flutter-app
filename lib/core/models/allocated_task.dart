class AllocatedTaskData {
  String taskId;
  String assetId;
  String timeOfAllocationRaw;
  String timeOfAllocation;
  String completionByTimeRaw;
  String completionByTime;
  TaskData taskData;
  AssetData assetData;

  AllocatedTaskData(
      {this.taskId,
      this.assetId,
      this.timeOfAllocationRaw,
      this.timeOfAllocation,
      this.completionByTimeRaw,
      this.completionByTime,
      this.taskData,
      this.assetData});

  AllocatedTaskData.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    assetId = json['asset_id'];
    timeOfAllocationRaw = json['time_of_allocation_raw'];
    timeOfAllocation = json['time_of_allocation'];
    completionByTimeRaw = json['completion_by_time_raw'];
    completionByTime = json['completion_by_time'];
    taskData = json['task_data'] != null
        ? new TaskData.fromJson(json['task_data'])
        : null;
    assetData = json['asset_data'] != null
        ? new AssetData.fromJson(json['asset_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['asset_id'] = this.assetId;
    data['time_of_allocation_raw'] = this.timeOfAllocationRaw;
    data['time_of_allocation'] = this.timeOfAllocation;
    data['completion_by_time_raw'] = this.completionByTimeRaw;
    data['completion_by_time'] = this.completionByTime;
    if (this.taskData != null) {
      data['task_data'] = this.taskData.toJson();
    }
    if (this.assetData != null) {
      data['asset_data'] = this.assetData.toJson();
    }
    return data;
  }
}

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

class AssetData {
  String sId;
  String name;
  String image;
  bool isActive;

  AssetData({this.sId, this.name, this.image, this.isActive});

  AssetData.fromJson(Map<String, dynamic> json) {
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