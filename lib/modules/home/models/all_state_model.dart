class AllStateModel {
  List<StateSet>? stateSet;
  String? modelName;
  int? stateId;
  String? stateName;
  int? imageId;

  AllStateModel(
      {this.stateSet,
        this.modelName,
        this.stateId,
        this.stateName,
        this.imageId});

  AllStateModel.fromJson(Map<String, dynamic> json) {
    if (json['state_set'] != null) {
      stateSet = <StateSet>[];
      json['state_set'].forEach((v) {
        stateSet!.add(new StateSet.fromJson(v));
      });
    }
    modelName = json['model_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stateSet != null) {
      data['state_set'] = this.stateSet!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = this.modelName;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['image_id'] = this.imageId;
    return data;
  }
}

class StateSet {
  int? stateSetId;
  String? stateSetName;
  int? stateSetTime;
  int? stateId;

  StateSet(
      {this.stateSetId, this.stateSetName, this.stateSetTime, this.stateId});

  StateSet.fromJson(Map<String, dynamic> json) {
    stateSetId = json['state_set_id'];
    stateSetName = json['state_set_name'];
    stateSetTime = json['state_set_time'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_set_id'] = this.stateSetId;
    data['state_set_name'] = this.stateSetName;
    data['state_set_time'] = this.stateSetTime;
    data['state_id'] = this.stateId;
    return data;
  }
}