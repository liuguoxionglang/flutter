// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: ImagePickerPage(),
//     );
//   }
// }


// class ImagePickerPage extends StatefulWidget {
//   ImagePickerPage({Key key}) : super(key: key);

//   _ImagePickerPageState createState() => _ImagePickerPageState();
// }

// class _ImagePickerPageState extends State<ImagePickerPage> {
//   //记录选择的照片
//   File _image;

//   //拍照
//   Future _getImageFromCamera() async {
//     var image =
//         await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);

//     setState(() {
//       _image = image;
//     });
//   }

//   //相册选择
//   Future _getImageFromGallery() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       _image = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("选择图片并上传")),
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//             RaisedButton(
//               onPressed: () {
//                 _getImageFromCamera();
//               },
//               child: Text("照相机"),
//             ),
//             SizedBox(height: 10),
//             RaisedButton(
//               onPressed: () {
//                 _getImageFromGallery();
//               },
//               child: Text("相册"),
//             ),
//             SizedBox(height: 10),
//             /**
//              * 展示选择的图片
//              */
//             _image == null
//                 ? Text("no image selected")
//                 : Image.file(
//                     _image,
//                     fit: BoxFit.cover,
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }