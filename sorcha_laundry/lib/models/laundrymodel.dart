// class Laundry {
//   int? weight;
//   String? description;
//   String? laundryName;

//   Laundry({this.weight, this.description, this.laundryName, required bool withPickup});

//   factory Laundry.fromJson(Map<String, dynamic> json) {
//     return Laundry(
//       weight: json['weight'],
//       description: json['description'],
//       laundryName: json['laundry_name'], withPickup: null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['weight'] = this.weight;
//     data['description'] = this.description;
//     data['laundry_name'] = this.laundryName;
//     return data;
//   }
// }