class LinksData {
  List<Link>? data;

  LinksData({this.data});

  LinksData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Link>[];
      json['data'].forEach((v) {
        data!.add(Link.fromJson(v));
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

  Link findWithLinkName(String linkName) {
    return data!.firstWhere((element) => element.linkName == linkName);
  }

  bool isLinkPresent(String linkName) {
    return data!.any((element) => element.linkName == linkName);
  }
}

class Link {
  int? linkId;
  String? linkName;
  String? linkUrl;

  Link({this.linkId, this.linkName, this.linkUrl});

  Link.fromJson(Map<String, dynamic> json) {
    linkId = json['link_id'];
    linkName = json['link_name'];
    linkUrl = json['link_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['link_id'] = linkId;
    data['link_name'] = linkName;
    data['link_url'] = linkUrl;
    return data;
  }
}
