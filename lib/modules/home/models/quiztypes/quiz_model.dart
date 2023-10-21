import 'package:quiz_app/modules/home/models/quiztypes/mixin/topics_mixin.dart';

class QuizModel {
  List<QuizData>? data;
  String? modelName;

  QuizModel({this.data, this.modelName});

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <QuizData>[];
      json['data'].forEach((v) {
        data!.add(QuizData.fromJson(v));
      });
    }
    modelName = json['model_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['model_name'] = modelName;
    return data;
  }
}

class QuizData with GetTopicView {
  List<Topic>? topic;
  int? subjectId;
  String? subjectName;

  QuizData({this.topic, this.subjectId, this.subjectName});

  QuizData.fromJson(Map<String, dynamic> json) {
    if (json['topic'] != null) {
      topic = <Topic>[];
      json['topic'].forEach((v) {
        topic!.add(Topic.fromJson(v));
      });
    }
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (topic != null) {
      data['topic'] = topic!.map((v) => v.toJson()).toList();
    }
    data['subject_id'] = subjectId;
    data['subject_name'] = subjectName;
    return data;
  }

  @override
  List<TopicView> topicViews() {
    List<TopicView> subjects = [];
    topic?.forEach((element) {
      List<SetsDataView> topics = [];
      element.quiz!.forEach((element) {
        topics.add(SetsDataView(
            timeLimit: element.quizTime!,
            title: element.quizName!,
            setId: element.quizId!));
      });

      subjects.add(TopicView(title: element.topicName!, sets: topics));
    });
    return subjects;
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
        quiz!.add(Quiz.fromJson(v));
      });
    }
    topicId = json['topic_id'];
    topicName = json['topic_name'];
    subjectId = json['subject_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (quiz != null) {
      data['quiz'] = quiz!.map((v) => v.toJson()).toList();
    }
    data['topic_id'] = topicId;
    data['topic_name'] = topicName;
    data['subject_id'] = subjectId;
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
    final Map<String, dynamic> data = {};
    data['quiz_id'] = quizId;
    data['quiz_name'] = quizName;
    data['quiz_time'] = quizTime;
    data['topic_id'] = topicId;
    return data;
  }
}
