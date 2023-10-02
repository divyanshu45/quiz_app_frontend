class AllQuizModel {
  List<Data>? data;
  String? modelName;

  AllQuizModel({this.data, this.modelName});

  AllQuizModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    modelName = json['model_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = this.modelName;
    return data;
  }
}

class Data {
  List<Topic>? topic;
  int? subjectId;
  String? subjectName;

  Data({this.topic, this.subjectId, this.subjectName});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['topic'] != null) {
      topic = <Topic>[];
      json['topic'].forEach((v) {
        topic!.add(new Topic.fromJson(v));
      });
    }
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.topic != null) {
      data['topic'] = this.topic!.map((v) => v.toJson()).toList();
    }
    data['subject_id'] = this.subjectId;
    data['subject_name'] = this.subjectName;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['quiz_id'] = this.quizId;
    data['quiz_name'] = this.quizName;
    data['quiz_time'] = this.quizTime;
    data['topic_id'] = this.topicId;
    return data;
  }
}