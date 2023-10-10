class AllPracticeModel {
  List<Topic>? topic;
  String? modelName;
  int? subjectId;
  String? subjectName;
  int? imageId;

  AllPracticeModel(
      {this.topic,
        this.modelName,
        this.subjectId,
        this.subjectName,
        this.imageId});

  AllPracticeModel.fromJson(Map<String, dynamic> json) {
    if (json['topic'] != null) {
      topic = <Topic>[];
      json['topic'].forEach((v) {
        topic!.add(new Topic.fromJson(v));
      });
    }
    modelName = json['model_name'];
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topic != null) {
      data['topic'] = this.topic!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = this.modelName;
    data['subject_id'] = this.subjectId;
    data['subject_name'] = this.subjectName;
    data['image_id'] = this.imageId;
    return data;
  }
}

class Topic {
  List<Practice>? practice;
  int? topicId;
  String? topicName;
  int? subjectId;

  Topic({this.practice, this.topicId, this.topicName, this.subjectId});

  Topic.fromJson(Map<String, dynamic> json) {
    if (json['practice'] != null) {
      practice = <Practice>[];
      json['practice'].forEach((v) {
        practice!.add(new Practice.fromJson(v));
      });
    }
    topicId = json['topic_id'];
    topicName = json['topic_name'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.practice != null) {
      data['practice'] = this.practice!.map((v) => v.toJson()).toList();
    }
    data['topic_id'] = this.topicId;
    data['topic_name'] = this.topicName;
    data['subject_id'] = this.subjectId;
    return data;
  }
}

class Practice {
  int? practiceId;
  String? practiceName;
  int? topicId;

  Practice({this.practiceId, this.practiceName, this.topicId});

  Practice.fromJson(Map<String, dynamic> json) {
    practiceId = json['practice_id'];
    practiceName = json['practice_name'];
    topicId = json['topic_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['practice_id'] = this.practiceId;
    data['practice_name'] = this.practiceName;
    data['topic_id'] = this.topicId;
    return data;
  }
}