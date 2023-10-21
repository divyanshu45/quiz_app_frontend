import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';

class ExamModel with GetTopicView {
  List<ExamData>? data;

  ExamModel({this.data});

  ExamModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ExamData>[];
      json['data'].forEach((v) {
        data!.add(ExamData.fromJson(v));
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
      element.examSet!.forEach((element) {
        topics.add(SetsDataView(
            timeLimit: element.examSetTime!,
            title: element.examSetName!,
            setId: element.examSetId!
            ));
      });

      subjects.add(TopicView(title: element.examName!, sets: topics));
    });
    return subjects;
  }
}

class ExamData {
  List<ExamSet>? examSet;
  String? modelName;
  int? examId;
  String? examName;

  ExamData({this.examSet, this.modelName, this.examId, this.examName});

  ExamData.fromJson(Map<String, dynamic> json) {
    if (json['exam_set'] != null) {
      examSet = <ExamSet>[];
      json['exam_set'].forEach((v) {
        examSet!.add(ExamSet.fromJson(v));
      });
    }
    modelName = json['model_name'];
    examId = json['exam_id'];
    examName = json['exam_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (examSet != null) {
      data['exam_set'] = examSet!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = modelName;
    data['exam_id'] = examId;
    data['exam_name'] = examName;
    return data;
  }
}

class ExamSet {
  int? examSetId;
  String? examSetName;
  int? examSetTime;
  int? examId;

  ExamSet({this.examSetId, this.examSetName, this.examSetTime, this.examId});

  ExamSet.fromJson(Map<String, dynamic> json) {
    examSetId = json['exam_set_id'];
    examSetName = json['exam_set_name'];
    examSetTime = json['exam_set_time'];
    examId = json['exam_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exam_set_id'] = this.examSetId;
    data['exam_set_name'] = this.examSetName;
    data['exam_set_time'] = this.examSetTime;
    data['exam_id'] = this.examId;
    return data;
  }
}
