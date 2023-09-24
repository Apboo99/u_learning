// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import '../../../sign-in/sign_in_widgets.dart';
// import 'dart:io';
//
// class Newest extends StatefulWidget {
//   const Newest({Key? key}) : super(key: key);
//
//   @override
//   State<Newest> createState() => _NewestState();
// }
//
// class _NewestState extends State<Newest> {
//   late VideoPlayerController _controller;
//   bool isReused = true;
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.file(File("assets/icons/vv.mp4"))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized
//         setState(() {});
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Colors.deepPurpleAccent,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: reusableText(
//             text: "Newest",
//             fontSize: 23,
//             fontWeight: FontWeight.bold,
//             color: Colors.black),
//       ),
//       body: ResponsiveContainer(isTotalWidth: false, bgColor: Colors.black, textColor: Colors.white,
//           size: 100,iconColor: Colors.orange,icon: Icon(Icons.account_balance_sharp),title: "hello", isColumn: true),
//     );
//   }
// }
//
// Widget ResponsiveContainer(
//     {required bool isTotalWidth,
//       required bool isColumn,
//     required Color bgColor,
//     required Color textColor,
//     Color? iconColor,
//     String? title,
//     Icon? icon,
//     required double size}) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 60, horizontal: 95),
//     height: isTotalWidth == true ? size*.8: size*.8,
//     width: isTotalWidth == true ? double.maxFinite : size,
//     child: Flexible(
//       child: Container(
//         color:isTotalWidth == true ?Colors.red:Colors.green,
//         child:isColumn?Column(
//           mainAxisAlignment: isTotalWidth == true
//               ? MainAxisAlignment.spaceEvenly
//               : MainAxisAlignment.center,
//           children: [
//             isTotalWidth == true
//                 ?Text(title??"notitle")
//                 : SizedBox(),
//
//             Icon(Icons.account_circle_sharp)
//
//           ],
//         ): Row(
//           mainAxisAlignment: isTotalWidth == true
//               ? MainAxisAlignment.spaceEvenly
//               : MainAxisAlignment.center,
//           children: [
//             isTotalWidth == true
//                 ?Text(title??"notitle")
//                 : SizedBox(),
//
//                   Icon(Icons.account_circle_sharp)
//
//           ],
//         ),
//       ),
//     ),
//   );
// }
