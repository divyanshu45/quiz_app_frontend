class AllExamModel {
  List<ExamSet>? examSet;
  String? modelName;
  int? examId;
  String? examName;
  int? imageId;

  AllExamModel(
      {this.examSet, this.modelName, this.examId, this.examName, this.imageId});

  AllExamModel.fromJson(Map<String, dynamic> json) {
    if (json['exam_set'] != null) {
      examSet = <ExamSet>[];
      json['exam_set'].forEach((v) {
        examSet!.add(new ExamSet.fromJson(v));
      });
    }
    modelName = json['model_name'];
    examId = json['exam_id'];
    examName = json['exam_name'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.examSet != null) {
      data['exam_set'] = this.examSet!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = this.modelName;
    data['exam_id'] = this.examId;
    data['exam_name'] = this.examName;
    data['image_id'] = this.imageId;
    return data;
  }
}

class ExamSet {
  int? examSetId;
  String? examSetName;
  int? examSetTime;
  int? examId;

  ExamSet(
      {this.examId, this.examSetId, this.examSetName, this.examSetTime});

  ExamSet.fromJson(Map<String, dynamic> json) {
    examId = json['exam_set_id'];
    examSetName = json['exam_set_name'];
    examSetTime = json['exam_set_time'];
    examSetId = json['exam_id'];
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