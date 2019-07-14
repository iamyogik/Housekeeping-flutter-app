class AllocationData {
  String taskId;
  String assetId;
  String timeOfAllocationRaw;
  String timeOfAllocation;
  String completionByTimeRaw;
  String completionByTime;

  AllocationData(
      {this.taskId,
      this.assetId,
      this.timeOfAllocationRaw,
      this.timeOfAllocation,
      this.completionByTimeRaw,
      this.completionByTime});

  AllocationData.fromJson(Map<String, dynamic> json) {
    taskId = json['task_id'];
    assetId = json['asset_id'];
    timeOfAllocationRaw = json['time_of_allocation_raw'];
    timeOfAllocation = json['time_of_allocation'];
    completionByTimeRaw = json['completion_by_time_raw'];
    completionByTime = json['completion_by_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task_id'] = this.taskId;
    data['asset_id'] = this.assetId;
    data['time_of_allocation_raw'] = this.timeOfAllocationRaw;
    data['time_of_allocation'] = this.timeOfAllocation;
    data['completion_by_time_raw'] = this.completionByTimeRaw;
    data['completion_by_time'] = this.completionByTime;
    return data;
  }
}