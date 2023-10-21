import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';

class StateModel with GetTopicView {
  List<StateData>? data;

  StateModel({this.data});

  StateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <StateData>[];
      json['data'].forEach((v) {
        data!.add(StateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<TopicView> topicViews() {
    List<TopicView> subjects = [];
    data?.forEach((element) {
      List<SetsDataView> topics = [];
      element.stateSet!.forEach((element) {
        topics.add(SetsDataView(
            timeLimit: element.stateSetTime!,
            title: element.stateSetName!,
            setId: element.stateSetId!));
      });

      subjects.add(TopicView(title: element.stateName!, sets: topics));
    });
    return subjects;
  }
}

class StateData {
  List<StateSet>? stateSet;
  String? modelName;
  int? stateId;
  String? stateName;

  StateData({this.stateSet, this.modelName, this.stateId, this.stateName});

  StateData.fromJson(Map<String, dynamic> json) {
    if (json['state_set'] != null) {
      stateSet = <StateSet>[];
      json['state_set'].forEach((v) {
        stateSet!.add(StateSet.fromJson(v));
      });
    }
    modelName = json['model_name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (stateSet != null) {
      data['state_set'] = stateSet!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = modelName;
    data['state_id'] = stateId;
    data['state_name'] = stateName;
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
