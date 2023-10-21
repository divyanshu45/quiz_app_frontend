import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';

class LearningModel with GetTopicView {
  List<LearningData>? data;

  LearningModel({this.data});

  LearningModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LearningData>[];
      json['data'].forEach((v) {
        data!.add(LearningData.fromJson(v));
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
      element.practice!.forEach((element) {
        topics.add(SetsDataView(
            timeLimit: 0,
            title: element.practiceName!,
            setId: element.practiceId!));
      });

      subjects.add(TopicView(title: element.gkName!, sets: topics));
    });
    return subjects;
  }
}

class LearningData {
  List<Practice>? practice;
  String? modelName;
  int? gkId;
  String? gkName;
  int? gkImageId;

  LearningData(
      {this.practice, this.modelName, this.gkId, this.gkName, this.gkImageId});

  LearningData.fromJson(Map<String, dynamic> json) {
    if (json['practice'] != null) {
      practice = <Practice>[];
      json['practice'].forEach((v) {
        practice!.add(Practice.fromJson(v));
      });
    }
    modelName = json['model_name'];
    gkId = json['gk_id'];
    gkName = json['gk_name'];
    gkImageId = json['gk_image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (practice != null) {
      data['practice'] = practice!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = modelName;
    data['gk_id'] = gkId;
    data['gk_name'] = gkName;
    data['gk_image_id'] = gkImageId;
    return data;
  }
}

class Practice {
  int? practiceId;
  String? practiceName;
  int? gkId;

  Practice({this.practiceId, this.practiceName, this.gkId});

  Practice.fromJson(Map<String, dynamic> json) {
    practiceId = json['practice_id'];
    practiceName = json['practice_name'];
    gkId = json['gk_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['practice_id'] = this.practiceId;
    data['practice_name'] = this.practiceName;
    data['gk_id'] = this.gkId;
    return data;
  }
}
