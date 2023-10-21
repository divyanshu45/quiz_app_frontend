class TopicView {
  String title;
  List<SetsDataView> sets;
  TopicView({
    required this.title,
    required this.sets,
  });
}

class SetsDataView {
  String title;
  int timeLimit;
  int setId;
  SetsDataView(
      {required this.timeLimit, required this.title, required this.setId});
}

mixin GetTopicView {
  List<TopicView> topicViews();
}
