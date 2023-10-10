class AllQuizModel {
  List<Topic>? topics;
  String? modelName;
  int? subjectId;
  String? subjectName;
  int? imageId;

  AllQuizModel({this.topics, this.modelName, this.subjectId, this.subjectName,this.imageId});

  AllQuizModel.fromJson(Map<String, dynamic> json) {
    if (json['topic'] != null) {
      topics = <Topic>[];
      json['topic'].forEach((v) {
        topics!.add(new Topic.fromJson(v));
      });
    }
    modelName = json['model_name'];
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
    imageId = json['image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.topics != null) {
      data['topic'] = this.topics!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = this.modelName;
    data['subject_id'] = this.subjectId;
    data['subject_name'] = this.subjectName;
    data['image_id'] = this.imageId;
    return data;
  }
}

class Topic {
  List<Quiz>? quiz;
  int? topicId;
  String? topicName;
  int? subjectId;

  Topic({this.quiz, this.topicId, this.topicName, this.subjectId});

  Topic.fromJson(Map<String, dynamic> json) {
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(new Quiz.fromJson(v));
      });
    }
    topicId = json['topic_id'];
    topicName = json['topic_name'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quiz != null) {
      data['quiz'] = this.quiz!.map((v) => v.toJson()).toList();
    }
    data['topic_id'] = this.topicId;
    data['topic_name'] = this.topicName;
    data['subject_id'] = this.subjectId;
    return data;
  }
}

class Quiz {
  int? quizId;
  String? quizName;
  int? quizTime;
  int? topicId;

  Quiz({this.quizId, this.quizName, this.quizTime, this.topicId});

  Quiz.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    quizName = json['quiz_name'];
    quizTime = json['quiz_time'];
    topicId = json['topic_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz_id'] = this.quizId;
    data['quiz_name'] = this.quizName;
    data['quiz_time'] = this.quizTime;
    data['topic_id'] = this.topicId;
    return data;
  }
}