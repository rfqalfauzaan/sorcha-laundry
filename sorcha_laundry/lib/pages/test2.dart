// import 'package:d_info/d_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../config/app_session.dart';
// import '../models/user_model.dart';

// // Import your necessary packages and models here

// class YourDataModel {
//   final String title;
//   final String subtitle;

//   YourDataModel({required this.title, required this.subtitle});
// }

// final yourDataProvider = StateProvider<List<YourDataModel>>((ref) => []);

// class YourDataView extends ConsumerStatefulWidget {
//   const YourDataView({Key? key}) : super(key: key);

//   @override
//   _YourDataViewState createState() => _YourDataViewState();
// }

// class _YourDataViewState extends ConsumerState<YourDataView> {
//   late UserModel user; // Import your user model

//   getData() {
//     // Simulating data fetching, replace this with your actual data fetching logic
//     List<YourDataModel> dummyData = [
//       YourDataModel(title: 'Item 1', subtitle: 'Subtitle 1'),
//       YourDataModel(title: 'Item 2', subtitle: 'Subtitle 2'),
//       YourDataModel(title: 'Item 3', subtitle: 'Subtitle 3'),
//     ];

//     // Update the state with the fetched data
//     ref.read(yourDataProvider).state = dummyData;
//   }

//   @override
//   void initState() {
//     AppSession.getUser().then((value) {
//       user = value!;
//       getData();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Data'), // Customize the title
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 30),
//           Expanded(
//             child: RefreshIndicator(
//               onRefresh: () async => getData(),
//               child: Consumer(
//                 builder: (_, wiRef, __) {
//                   // Customize your UI based on data fetching status
//                   List<YourDataModel> yourDataList = wiRef.watch(yourDataProvider);

//                   return YourCustomListView(yourDataList: yourDataList); // Replace with your list view
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class YourCustomListView extends StatelessWidget {
//   final List<YourDataModel> yourDataList;

//   YourCustomListView({required this.yourDataList});

//   @override
//   Widget build(BuildContext context) {
//     // Customize the UI to display your data
//     return ListView.builder(
//       itemCount: yourDataList.length,
//       itemBuilder: (context, index) {
//         YourDataModel data = yourDataList[index];
//         return ListTile(
//           title: Text(data.title),
//           subtitle: Text(data.subtitle),
//           // Customize the ListTile based on your data structure
//         );
//       },
//     );
//   }
// }

// void main() {
//   runApp(
//     ProviderScope(
//       child: MaterialApp(
//         home: YourDataView(),
//       ),
//     ),
//   );
// }
