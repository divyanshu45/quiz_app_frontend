// class HistoryModel {
//   List<HistoryData>? data;

//   HistoryModel({this.data});

//   HistoryModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <HistoryData>[];
//       json['data'].forEach((v) {
//         data!.add(HistoryData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class HistoryData {
//   HistoryData();

//   HistoryData.fromJson(Map<String, dynamic> json) {}

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     return data;
//   }
// }
