//
//
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:url_launcher/link.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class Mainpage extends StatefulWidget {
//   const Mainpage({super.key});
//
//   @override
//   State<Mainpage> createState() => _MainpageState();
// }
//
// class _MainpageState extends State<Mainpage> {
//
//   final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final size = MediaQuery.of(context).size;
//     final double screenWidth = size.width;
//
//     return
//
//     ValueListenableBuilder(
//         valueListenable: _notifier,
//         builder: (
//             (_, mode, __){
//
//               return MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 theme: ThemeData.light(),
//                 themeMode: mode,
//                 darkTheme: ThemeData.dark(),
//
//                 home: Scaffold(
//
//                   backgroundColor: Colors.cyan.shade400,
//
//                   appBar: AppBar(
//                     backgroundColor: Colors.transparent,
//                     automaticallyImplyLeading: false,
//                     centerTitle: true ,
//
//                     leading: IconButton(
//                       onPressed: (){
//                         showDialog(context: context,
//                           builder: (context)=> AlertDialog(
//
//                             backgroundColor: Colors.tealAccent,
//
//                             actions: [
//                               Link(
//                                   uri: Uri.parse('https://aravind-jd.github.io/My_Portfolio/'),
//                                   builder: ((context, followLink)=>
//                                       TextButton(
//                                         onPressed: followLink,
//                                         child: Text(
//                                             "Portfolio",
//                                           style: TextStyle(
//                                             fontFamily: "GreyQo",
//                                             fontSize: 30,
//                                           ),
//                                         ),
//                                       )
//                                   )
//                               ),
//                               Link(
//                                   uri: Uri.parse('https://aravind-jd.github.io/Resume/resume.html'),
//                                   builder: ((context, followLink)=>
//                                       TextButton(
//                                         onPressed: followLink,
//                                         child: Text(
//                                             "Resume",
//                                           style: TextStyle(
//                                             fontFamily: "GreyQo",
//                                             fontSize: 30,
//                                           ),
//                                         ),
//                                       )
//                                   )
//                               ),
//                             ],
//
//                             title: const Text(
//                               "Profile",
//                               style: TextStyle(
//                                 fontFamily: "GreyQo",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 30,
//                               ),
//                             ),
//
//                           ),
//
//                         );
//
//                       },
//
//                       icon: Icon(
//                         Icons.account_circle_outlined,
//                       ),
//
//                     ),
//
//                     actions: [
//
//                       IconButton(
//                           onPressed: (){
//                             showDialog(context: context,
//                               builder: (context)=> AlertDialog(
//                                 backgroundColor: Colors.tealAccent,
//                                 actions: [
//                                   Link(
//                                       uri: Uri.parse('https://github.com/Aravind2810'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.github,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                   Link(
//                                       uri: Uri.parse('https://www.linkedin.com/in/aravind-s-390469231/'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.linkedin,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                   Link(
//                                       uri: Uri.parse('https://www.instagram.com/its._me._jd/#'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.instagram,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                   Link(
//                                       uri: Uri.parse('https://wa.me/qr/VCTGLGB2LA5JP1'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.whatsapp,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                 ],
//                                 title: const Text(
//                                   "Contact  Me",
//                                   style: TextStyle(
//                                     fontFamily: "GreyQo",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           icon: Icon(
//                             Icons.menu_rounded,
//                           )
//                       ),
//
//                     ],
//
//                     title: Text(
//                       "My Resume",
//                       style: TextStyle(
//                         fontFamily: "Caveat",
//                         fontSize: 22.0,
//                       ),
//                     ),
//
//                   ),
//
//                   body: SingleChildScrollView(
//
//                     child: Stack(
//                       children: <Widget>[
//
//
//                         ClipPath(
//                           clipper: CustomShape(),
//                           child: Container(
//                             height: 300.0,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Colors.blueAccent, Colors.lightBlueAccent],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                         Align(
//                           alignment: Alignment.center,
//
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//
//                               SizedBox(
//                                   height: 120.0
//                               ),
//
//                               CircleAvatar(
//                                 radius: 80.0,
//                                 backgroundImage: AssetImage('assets/images/me.png'),
//                               ),
//
//                               SizedBox(
//                                   height: 10.0
//                               ),
//
//                               Text(
//                                 'Aravind Senthilvelan',
//                                 style: TextStyle(
//                                   fontSize: 22.0,
//                                   fontFamily: "Kalam",
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                               Text(
//                                 'Mobile App Developer',
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "Tangerine",
//                                 ),
//                               ),
//
//                               SizedBox(
//                                 height: 20.0,
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//
//                                       Text(
//                                         "Education",
//                                         style: TextStyle(
//                                             fontFamily: "Lora",
//                                             fontWeight: FontWeight.bold
//                                         ),
//                                       ),
//
//                                       SizedBox(
//                                         height: 10.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//
//                                           FaIcon(
//                                             FontAwesomeIcons.university,
//                                           ),
//
//                                           SizedBox(
//                                             width: 10.0,
//                                           ),
//
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//
//                                               //Education
//
//                                               Text(
//                                                 'Current Course',
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Bachelor of Engineering - ECE",
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Sri Eshwar College of Engineering - 2021-2025",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               //Experience
//
//
//
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black,
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//
//                                           Icon(
//                                             Icons.school_rounded,
//                                           ),
//
//                                           SizedBox(
//                                             width: 10.0,
//                                           ),
//
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//
//                                               //Education
//
//                                               Text(
//                                                 'Schooling',
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Completed my H.S.C. with 84.6%",
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "P.K.D.M.H.S.S - 2020-2021",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black,
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//
//                                           Icon(
//                                             Icons.school_rounded,
//                                           ),
//
//                                           SizedBox(
//                                             width: 10.0,
//                                           ),
//
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//
//                                               //Education
//
//                                               Text(
//                                                 'Schooling',
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Completed my S.S.L.C. with 86.4%",
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "P.K.D.M.H.S.S - 2018-2019",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//
//                                     ],
//                                   )
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     children: [
//
//                                       Text(
//                                         "Projects",
//                                         style: TextStyle(
//                                           fontFamily: "Lora",
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Chatosic',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Multi working mobile application in which music can be heard and call can be made with the mobile number.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind2810/Chatosic'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Resume Displayer',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Mobile application made for myself to display my digital resume and my profile.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind-jd/My_Resume_Displayer'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'QR Code Generator',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Mobile application to generate qr codes.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind-jd/qr_code_scanner'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Jd Project',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Mobile application made by myself while I started learning Mobile app development.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind2810/flutter_project_1'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'My Portfolio',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "My Portfolio to display myself in a web page with all project links, with my study details, with my personal details, with my contact details and also with my updated resume.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://aravind-jd.github.io/My_Portfolio/'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             ),
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Book-Store',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A web application used as open source in which book lovers can access books of their interest and can enjoy reading the book through online.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                           uri: Uri.parse('https://github.com/Aravind2810/Book-Store'),
//                                           builder: ((context, followLink)=>
//                                               IconButton(
//                                                 onPressed: followLink,
//                                                 icon: FaIcon(
//                                                   FontAwesomeIcons.github,
//                                                 ),
//                                               )
//                                           ),
//                                         ),
//
//                                       ),
//
//                                     ],
//                                   ),
//
//
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//
//                                       Text(
//                                         "Skills",
//                                         style: TextStyle(
//                                           fontFamily: "Lora",
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Flutter ",
//                                             style: TextStyle(
//                                               fontFamily: "Kalam",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "90%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.9,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             linearStrokeCap: LinearStrokeCap.roundAll,
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Dart    ",
//                                             style: TextStyle(
//                                               fontFamily: "Kalam",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "90%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.9,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Html,CSS",
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                               fontFamily: "Kalam",
//                                               fontWeight: FontWeight.bold
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "70%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.7,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "SQL     ",
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                                 fontFamily: "Kalam",
//                                                 fontWeight: FontWeight.bold
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "60%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.6,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Program ",
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                                 fontFamily: "Kalam",
//                                                 fontWeight: FontWeight.bold
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "60%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.6,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                     ],
//                                   ),
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//
//                                   child: ListTile(
//
//                                     title: Text(
//                                       'Summary',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: "Lora"
//                                       ),
//                                     ),
//
//                                     subtitle: Text(
//                                       'A Mobile App Developer with a passion for developing innovative applications that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and to create reliable, user-friendly applications.',
//                                       style: TextStyle(
//                                         fontFamily: "Lora",
//                                       ),
//                                     ),
//
//                                   ),
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     children: [
//
//                                       Text(
//                                         "Other Skills",
//                                         style: TextStyle(
//                                           fontFamily: "Lora",
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Poster Designer',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "I'm a poster designer which is one of my hobby and I worked in some of the events as a poster designer in my college."
//                                               " ""And I have been the media team head for some events and also I organised some of the events.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Photography',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "I love taking photos and I have a craze in photography."
//                                               " "
//                                           "And also I have knowledge in operating a Camera."
//                                           ,
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'NCC Troop Commander',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "I have been in NCC in my school for two years and attended three camps."
//                                               " "
//                                               "And also I lead my NCC troop as commander for one year and lead the troop in one of the camp.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                       ),
//
//                                     ],
//                                   ),
//
//
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//
//                                       CircleAvatar(
//
//                                         radius: 20.0,
//                                         backgroundImage: AssetImage(
//                                           'assets/images/email_me.jpeg',
//                                         ),
//
//                                       ),
//
//                                       SizedBox(
//                                         width: 15.0,
//                                       ),
//
//                                       Column(
//                                         children: [
//
//                                           Text(
//                                             'Email Me',
//
//                                             style: TextStyle(
//                                               fontFamily: "Lora",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           Text(
//                                             'aravindhemaa599@gmail.com',
//                                             style: TextStyle(
//                                               fontFamily: "lora",
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         width: 30.0,
//                                       ),
//
//                                       Icon(
//                                         Icons.mail_rounded,
//
//                                       ),
//
//                                     ],
//                                   ),
//
//                                 ),
//
//                                 // child: ListTile(
//                                 //   title: Text(
//                                 //     'Email Me',
//                                 //     style: TextStyle(
//                                 //         fontWeight: FontWeight.bold,
//                                 //         fontFamily: "Lora"
//                                 //     ),
//                                 //   ),
//                                 //
//                                 //   subtitle: Text('aravindhemaa599gmail.com'),
//                                 //   trailing: Icon(Icons.mail_rounded),
//                                 //
//                                 // ),
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//
//                                       CircleAvatar(
//
//                                         radius: 20.0,
//                                         foregroundImage: AssetImage(
//                                           'assets/images/callbox.png',
//
//                                         ),
//
//                                       ),
//
//                                       SizedBox(
//                                         width: 50.0,
//                                       ),
//
//                                       Column(
//                                         children: [
//
//                                           Text(
//                                             'Phone',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontFamily: "Lora",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           Text(
//                                             '+91 89034 27447',
//                                             style: TextStyle(
//                                               fontFamily: "lora",
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         width: 75.0,
//                                       ),
//
//                                       Icon(
//                                         Icons.call_rounded,
//                                       )
//
//                                     ],
//                                   ),
//
//                                 ),
//
//                                 // child: ListTile(
//                                 //   title: Text(
//                                 //     'Email Me',
//                                 //     style: TextStyle(
//                                 //         fontWeight: FontWeight.bold,
//                                 //         fontFamily: "Lora"
//                                 //     ),
//                                 //   ),
//                                 //
//                                 //   subtitle: Text('aravindhemaa599gmail.com'),
//                                 //   trailing: Icon(Icons.mail_rounded),
//                                 //
//                                 // ),
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                                 child: ListTile(
//                                   title: Text(
//                                     'Address',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: "Lora"
//                                     ),
//                                   ),
//                                   subtitle: Text(
//                                       '9/254, Ponmuthunagar, Vadugapalayam, Pollachi, Coimbatore, TamilNadu, India - 642001',
//                                     style: TextStyle(
//                                       fontFamily: "Lora",
//                                     ),
//                                   ),
//                                   onTap: () {
//                                     // Handle editing
//                                   },
//                                 ),
//                               ),
//
//                               Container(
//                                 width: screenWidth,
//                                 height: 40.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   color: Colors.black,
//
//                                 ),
//
//                                 child: Padding(
//                                     padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                                   child: Text(
//                                     "\u00a9 2024 Aravind. All rights reserved.",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontFamily: "Lora",
//                                         color: Colors.white
//                                     ),
//                                   ),
//                                 ),
//
//                               ),
//
//                             ],
//                           ),
//
//                         ),
//
//
//                       ],
//
//                     ),
//
//                   ),
//
//                 ),
//
//               );
//
//             }
//         ),
//     );
//
//   }
//
// }
//
//
//
// // SingleChildScrollView(
// //   padding: EdgeInsets.all(16.0),
// //   child: Column(
// //     crossAxisAlignment: CrossAxisAlignment.start,
// //     children: <Widget>[
// //       // Profile Picture and Name
// //       Center(
// //         child: Column(
// //           children: <Widget>[
// //             CircleAvatar(
// //               radius: 60.0,
// //               backgroundImage: AssetImage('assets/profile.jpg'),
// //             ),
// //             SizedBox(height: 10.0),
// //             Text(
// //               'John Doe',
// //               style: TextStyle(
// //                 fontSize: 28.0,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             Text(
// //               'Software Engineer',
// //               style: TextStyle(
// //                 fontSize: 18.0,
// //                 color: Colors.grey[700],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       SizedBox(height: 20.0),
// //
// //       // Contact Information
// //       Text(
// //         'Contact Information',
// //         style: TextStyle(
// //           fontSize: 22.0,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       Divider(),
// //       ListTile(
// //         leading: Icon(Icons.email),
// //         title: Text('johndoe@example.com'),
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.phone),
// //         title: Text('+1 234 567 890'),
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.location_city),
// //         title: Text('1234 Street Name, City, Country'),
// //       ),
// //
// //       SizedBox(height: 20.0),
// //
// //       // Summary
// //       Text(
// //         'Summary',
// //         style: TextStyle(
// //           fontSize: 22.0,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       Divider(),
// //       Text(
// //         'Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create reliable, user-friendly systems.',
// //         style: TextStyle(fontSize: 16.0),
// //       ),
// //
// //       SizedBox(height: 20.0),
// //
// //       // Education
//
// //
// //       // Experience
// //       Text(
// //         'Experience',
// //         style: TextStyle(
// //           fontSize: 22.0,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       Divider(),
// //       ListTile(
// //         leading: Icon(Icons.work),
// //         title: Text('Software Engineer'),
// //         subtitle: Text('Example Company - 2020 - Present'),
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.work),
// //         title: Text('Intern Software Engineer'),
// //         subtitle: Text('Another Company - 2019 - 2020'),
// //       ),
// //
// //       SizedBox(height: 20.0),
// //
// //       // Skills
// //       Text(
// //         'Skills',
// //         style: TextStyle(
// //           fontSize: 22.0,
// //           fontWeight: FontWeight.bold,
// //         ),
// //       ),
// //       Divider(),
// //       Wrap(
// //         spacing: 10.0,
// //         children: <Widget>[
// //           Chip(label: Text('Flutter')),
// //           Chip(label: Text('Dart')),
// //           Chip(label: Text('Python')),
// //           Chip(label: Text('JavaScript')),
// //           Chip(label: Text('SQL')),
// //           Chip(label: Text('Git')),
// //         ],
// //       ),
// //     ],
// //   ),
// // ),,
//
//
//
//
//
//
// class CustomShape extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height - 100);
//
//     var firstControlPoint = Offset(size.width / 2, size.height);
//     var firstEndPoint = Offset(size.width, size.height - 100.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//
//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
//


// MainPage.dart


// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // INJECTED CLOUD ENGINE
// import 'package:google_generative_ai/google_generative_ai.dart';
//
// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});
//
//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }
//
// class _ContactPageState extends State<ContactPage> {
//   // Auth State
//   bool _isLoggedIn = false;
//   String _userName = "";
//   String _userEmail = "";
//
//   // Controllers
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _chatController = TextEditingController();
//
//   // --- AUTHENTICATION LOGIC ---
//   void _login() {
//     if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
//       setState(() {
//         _userName = _nameController.text.trim();
//         _userEmail = _emailController.text.trim().toLowerCase(); // Normalize email
//         _isLoggedIn = true;
//       });
//
//       // Check if this is their first time chatting. If so, send a welcome message.
//       _checkAndSendWelcomeMessage();
//     }
//   }
//
//   Future<void> _checkAndSendWelcomeMessage() async {
//     final query = await FirebaseFirestore.instance
//         .collection('inquiries')
//         .doc(_userEmail)
//         .collection('messages')
//         .limit(1)
//         .get();
//
//     if (query.docs.isEmpty) {
//       // First time user! Send automated welcome.
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': 'Authentication successful. Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   void _logout() {
//     setState(() {
//       _isLoggedIn = false;
//       _userName = "";
//       _userEmail = "";
//       _nameController.clear();
//       _emailController.clear();
//     });
//   }
//
//   // --- CLOUD WRITE LOGIC ---
//   Future<void> _sendMessage() async {
//     if (_chatController.text.trim().isEmpty) return;
//
//     String userText = _chatController.text.trim();
//     _chatController.clear();
//
//     // 1. Write User Message to Firestore
//     await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//       'sender': _userName,
//       'text': userText,
//       'isAI': false,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     // 2. Trigger AI Response Simulation
//     _generateAIResponse(userText);
//   }
//
//   Future<void> _generateAIResponse(String userMessage) async {
//     // 1. YOUR API KEY (Keep this safe in production!)
//     const String apiKey = 'AIzaSyA_3PCodhJtA8NTexIXcR7Rd_6BQZF9MkA';
//
//     try {
//       // 2. INITIALIZE THE NEURAL ENGINE
//       final model = GenerativeModel(
//         model: 'gemini-2.5-flash', // Fastest model for chat
//         apiKey: apiKey,
//         // 3. THE SYSTEM PERSONA (Tells the AI who it is)
//         systemInstruction: Content.system(
//             "You are the 'Secure Comms Assistant' for Aravind, a Full-Stack Mobile Architect. "
//                 "Speak in a highly professional, cinematic, and slightly sci-fi tone (use words like 'acknowledged', 'telemetry', 'system', 'protocol'). "
//                 "Your job is to answer questions from recruiters or visitors about Aravind. "
//                 "Aravind's Data: Pursuing MBA in HR at SRM College. Holds a B.E. in Electronics & Communication from Sri Eshwar College (CGPA 7.79). "
//                 "Skills: Flutter, Firebase, C/C++, Data Structures, Python, HTML/CSS/JS. "
//                 "Keep responses concise (1-3 sentences maximum). If they ask something you don't know, say you will forward the inquiry to Aravind's primary terminal."
//         ),
//       );
//
//       // 4. GENERATE THE RESPONSE
//       final response = await model.generateContent([Content.text(userMessage)]);
//
//       String aiReply = response.text ?? "System Error: Neural link interrupted. Please try again.";
//
//       // 5. WRITE AI RESPONSE TO CLOUD FIRESTORE
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': aiReply,
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//
//     } catch (e) {
//       // Failsafe in case the API crashes
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System Error',
//         'text': "Connection to central mainframe failed. Error: $e",
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   // --- UI BUILDERS ---
//   @override
//   Widget build(BuildContext context) {
//     const accentColor = Color(0xFFE10600);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: -100, right: -100,
//             child: Container(
//               width: 400, height: 400,
//               decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: accentColor.withOpacity(0.15), blurRadius: 150)]),
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 _buildAppBar(accentColor),
//                 Expanded(
//                   child: _isLoggedIn ? _buildCloudChatInterface(accentColor) : _buildAuthInterface(accentColor),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAppBar(Color accentColor) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CircleAvatar(
//             radius: 20,
//             backgroundColor: _isLoggedIn ? accentColor : Colors.white10,
//             child: Text(
//               _isLoggedIn ? _userName[0].toUpperCase() : "",
//               style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
//             ),
//           ),
//           const Text("SECURE COMMS", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 4, color: Colors.white70)),
//           _isLoggedIn
//               ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout)
//               : const SizedBox(width: 40),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAuthInterface(Color accentColor) {
//     return Center(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(30),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(
//               padding: const EdgeInsets.all(30),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.4),
//                 border: Border.all(color: Colors.white.withOpacity(0.1)),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Icon(Icons.lock_outline, size: 40, color: Colors.white54),
//                   const SizedBox(height: 20),
//                   const Text("INITIALIZE CONNECTION", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2)),
//                   const SizedBox(height: 30),
//                   TextField(
//                     controller: _nameController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       labelText: "VISITOR NAME",
//                       labelStyle: const TextStyle(color: Colors.white38, letterSpacing: 2, fontSize: 12),
//                       enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
//                       focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: accentColor)),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: _emailController,
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       labelText: "CONTACT EMAIL",
//                       labelStyle: const TextStyle(color: Colors.white38, letterSpacing: 2, fontSize: 12),
//                       enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.2))),
//                       focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: accentColor)),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(backgroundColor: accentColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
//                       onPressed: _login,
//                       child: const Text("ESTABLISH LINK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // --- THE NEW CLOUD STREAM BUILDER ---
//   Widget _buildCloudChatInterface(Color accentColor) {
//     return Column(
//       children: [
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//             // Listens to this specific user's chat history, ordered by newest first
//             stream: FirebaseFirestore.instance
//                 .collection('inquiries')
//                 .doc(_userEmail)
//                 .collection('messages')
//                 .orderBy('timestamp', descending: true)
//                 .snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator(color: accentColor));
//               }
//               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                 return const Center(child: Text("No secure logs found.", style: TextStyle(color: Colors.white38)));
//               }
//
//               final messages = snapshot.data!.docs;
//
//               return ListView.builder(
//                 reverse: true,
//                 padding: const EdgeInsets.all(20),
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msgData = messages[index].data() as Map<String, dynamic>;
//                   final bool isAI = msgData['isAI'] ?? false;
//                   final String sender = msgData['sender'] ?? 'Unknown';
//                   final String text = msgData['text'] ?? '';
//
//                   return Align(
//                     alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
//                     child: Container(
//                       margin: const EdgeInsets.only(bottom: 15),
//                       padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
//                       constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
//                       decoration: BoxDecoration(
//                         color: isAI ? Colors.white.withOpacity(0.05) : accentColor.withOpacity(0.8),
//                         borderRadius: BorderRadius.only(
//                           topLeft: const Radius.circular(16),
//                           topRight: const Radius.circular(16),
//                           bottomLeft: isAI ? const Radius.circular(0) : const Radius.circular(16),
//                           bottomRight: isAI ? const Radius.circular(16) : const Radius.circular(0),
//                         ),
//                         border: isAI ? Border.all(color: Colors.white.withOpacity(0.1)) : null,
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             sender.toUpperCase(),
//                             style: TextStyle(color: isAI ? accentColor : Colors.white70, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1),
//                           ),
//                           const SizedBox(height: 5),
//                           Text(text, style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4)),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//
//         // Message Input Area
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           decoration: BoxDecoration(color: const Color(0xFF0A0A0A), border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05)))),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _chatController,
//                   style: const TextStyle(color: Colors.white),
//                   decoration: const InputDecoration(hintText: "TRANSMIT MESSAGE...", hintStyle: TextStyle(color: Colors.white24, letterSpacing: 1, fontSize: 12), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 15)),
//                   onSubmitted: (_) => _sendMessage(),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
//                 child: IconButton(icon: const Icon(Icons.send, color: Colors.white, size: 18), onPressed: _sendMessage),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }


// 3D Design

// import 'dart:ui';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:flutter_animate/flutter_animate.dart'; // Make sure this is in pubspec.yaml!
//
// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});
//
//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }
//
// class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
//   // --- STATE & CONTROLLERS ---
//   bool _isLoggedIn = false;
//   String _userName = "";
//   String _userEmail = "";
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _chatController = TextEditingController();
//
//   late AnimationController _gridController;
//
//   @override
//   void initState() {
//     super.initState();
//     // Controls the moving 3D background grid
//     _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
//   }
//
//   @override
//   void dispose() {
//     _gridController.dispose();
//     super.dispose();
//   }
//
//   // --- AUTHENTICATION LOGIC ---
//   void _login() {
//     if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
//       setState(() {
//         _userName = _nameController.text.trim();
//         _userEmail = _emailController.text.trim().toLowerCase();
//         _isLoggedIn = true;
//       });
//       _checkAndSendWelcomeMessage();
//     }
//   }
//
//   Future<void> _checkAndSendWelcomeMessage() async {
//     final query = await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').limit(1).get();
//     if (query.docs.isEmpty) {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': 'Authentication successful. Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   void _logout() {
//     setState(() {
//       _isLoggedIn = false;
//       _userName = "";
//       _userEmail = "";
//       _nameController.clear();
//       _emailController.clear();
//     });
//   }
//
//   // --- CLOUD WRITE LOGIC ---
//   Future<void> _sendMessage() async {
//     if (_chatController.text.trim().isEmpty) return;
//
//     String userText = _chatController.text.trim();
//     _chatController.clear();
//
//     await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//       'sender': _userName,
//       'text': userText,
//       'isAI': false,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     _generateAIResponse(userText);
//   }
//
//   Future<void> _generateAIResponse(String userMessage) async {
//     const String apiKey = 'YOUR_API_KEY_HERE'; // INJECT YOUR KEY
//
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-2.5-flash',
//         apiKey: apiKey,
//         systemInstruction: Content.system(
//             "You are the 'Secure Comms Assistant' for Aravind Senthilvelan, a Full-Stack Mobile Architect. "
//                 "Speak in a highly professional, cinematic, and slightly sci-fi tone. "
//                 "Aravind's Data: Pursuing MBA in HR. Holds B.E. in ECE (CGPA 7.79). Skills: Flutter, Firebase, C/C++, Python. "
//                 "Keep responses concise (1-3 sentences maximum)."
//         ),
//       );
//
//       final response = await model.generateContent([Content.text(userMessage)]);
//       String aiReply = response.text ?? "System Error: Neural link interrupted.";
//
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': aiReply,
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System Error',
//         'text': "Connection to central mainframe failed.",
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   // --- 🎬 3D CINEMATIC UI BUILDERS ---
//   @override
//   Widget build(BuildContext context) {
//     const accentColor = Color(0xFFE10600); // F1 Red
//     const aiAccent = Color(0xFF00E5FF); // Cyan for AI
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF020202),
//       body: Stack(
//         children: [
//           // 1. THE VOLUMETRIC 3D GRID
//           Positioned.fill(
//             child: AnimatedBuilder(
//               animation: _gridController,
//               builder: (context, _) => CustomPaint(
//                 painter: CyberGridPainter(progress: _gridController.value, color: accentColor.withOpacity(0.15)),
//               ),
//             ),
//           ),
//
//           // 2. AMBIENT LIGHTING
//           Positioned(
//             top: -150, left: -100,
//             child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withOpacity(0.08), blurRadius: 150)])),
//           ),
//
//           // 3. MAIN CONTENT
//           SafeArea(
//             child: Column(
//               children: [
//                 _buildAppBar(accentColor),
//                 Expanded(
//                   child: _isLoggedIn
//                       ? _buildCloudChatInterface(accentColor, aiAccent)
//                       : _buildAuthInterface(accentColor),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAppBar(Color accentColor) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               boxShadow: _isLoggedIn ? [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 15)] : [],
//             ),
//             child: CircleAvatar(
//               radius: 18,
//               backgroundColor: _isLoggedIn ? accentColor : Colors.white.withOpacity(0.05),
//               child: Text(_isLoggedIn ? _userName[0].toUpperCase() : "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
//             ),
//           ),
//           const Text("SYS_COMMS", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 6, color: Colors.white)),
//           _isLoggedIn ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout) : const SizedBox(width: 40),
//         ],
//       ),
//     );
//   }
//
//   // ── THE 3D TILTED AUTH TERMINAL ──
//   Widget _buildAuthInterface(Color accentColor) {
//     return Center(
//       child: Transform(
//         alignment: FractionalOffset.center,
//         // The Magic 3D Matrix: Tilts the card back and slightly left like a physical HUD
//         transform: Matrix4.identity()
//           ..setEntry(3, 2, 0.001)
//           ..rotateX(0.08)
//           ..rotateY(-0.05),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(30),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//               child: Container(
//                 padding: const EdgeInsets.all(40),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.4),
//                   border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(color: accentColor.withOpacity(0.1), blurRadius: 50, spreadRadius: 10)
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.radar, size: 50, color: accentColor).animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 2.seconds, color: Colors.white),
//                     const SizedBox(height: 25),
//                     const Text("IDENTIFICATION REQUIRED", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 14)),
//                     const SizedBox(height: 35),
//
//                     _buildTerminalInput(_nameController, "VISITOR DESIGNATION", accentColor),
//                     const SizedBox(height: 25),
//                     _buildTerminalInput(_emailController, "CONTACT VECTOR (EMAIL)", accentColor),
//                     const SizedBox(height: 45),
//
//                     SizedBox(
//                       width: double.infinity,
//                       height: 55,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: accentColor,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//                         ),
//                         onPressed: _login,
//                         child: const Text("ESTABLISH LINK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 4)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack),
//     );
//   }
//
//   Widget _buildTerminalInput(TextEditingController controller, String label, Color accentColor) {
//     return TextField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white38, letterSpacing: 3, fontSize: 10, fontWeight: FontWeight.w900),
//         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.1))),
//         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: accentColor, width: 2)),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.5),
//       ),
//     );
//   }
//
//   // ── THE HOLOGRAPHIC CHAT STREAM ──
//   Widget _buildCloudChatInterface(Color accentColor, Color aiAccent) {
//     return Column(
//       children: [
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').orderBy('timestamp', descending: true).snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(color: accentColor));
//               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const SizedBox.shrink();
//
//               final messages = snapshot.data!.docs;
//
//               return ListView.builder(
//                 reverse: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msgData = messages[index].data() as Map<String, dynamic>;
//                   final bool isAI = msgData['isAI'] ?? false;
//                   final String sender = msgData['sender'] ?? 'Unknown';
//                   final String text = msgData['text'] ?? '';
//
//                   // Cinematic Chat Bubble Entrance
//                   return _buildHolographicBubble(isAI, sender, text, accentColor, aiAccent)
//                       .animate()
//                       .fadeIn(duration: 400.ms)
//                       .slideY(begin: 0.2, end: 0, duration: 400.ms, curve: Curves.easeOut);
//                   },
//               );
//             },
//           ),
//         ),
//
//         // Cyberpunk Input Area
//         Container(
//           margin: const EdgeInsets.all(20),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.6),
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(color: Colors.white.withOpacity(0.1)),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _chatController,
//                   style: const TextStyle(color: Colors.white, letterSpacing: 1),
//                   decoration: const InputDecoration(
//                     hintText: "TRANSMIT...",
//                     hintStyle: TextStyle(color: Colors.white24, letterSpacing: 3, fontSize: 11, fontWeight: FontWeight.w900),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                   onSubmitted: (_) => _sendMessage(),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle, boxShadow: [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 10)]),
//                 child: IconButton(icon: const Icon(Icons.send, color: Colors.white, size: 16), onPressed: _sendMessage),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHolographicBubble(bool isAI, String sender, String text, Color accentColor, Color aiAccent) {
//     Color bubbleTheme = isAI ? aiAccent : accentColor;
//
//     return Align(
//       alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         padding: const EdgeInsets.all(15),
//         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.4),
//           border: Border(
//             left: isAI ? BorderSide(color: bubbleTheme, width: 3) : BorderSide(color: Colors.white.withOpacity(0.05)),
//             right: !isAI ? BorderSide(color: bubbleTheme, width: 3) : BorderSide(color: Colors.white.withOpacity(0.05)),
//             top: BorderSide(color: Colors.white.withOpacity(0.05)),
//             bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
//           ),
//           borderRadius: BorderRadius.circular(4), // Sharp, techy corners
//           boxShadow: [
//             BoxShadow(color: bubbleTheme.withOpacity(0.05), blurRadius: 15, spreadRadius: 2)
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(isAI ? Icons.memory : Icons.person, size: 10, color: bubbleTheme),
//                 const SizedBox(width: 5),
//                 Text(
//                   sender.toUpperCase(),
//                   style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               text,
//               style: const TextStyle(
//                 fontFamily: 'Roboto', // Forces standard system font to bypass the glitch
//                 color: Colors.white,
//                 fontSize: 13,
//                 height: 1.5,
//                 letterSpacing: 0.5,
//                 fontWeight: FontWeight.w500, // Forces medium weight to ensure rendering
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ------------------------------------------------------------------
// // 3D PERSPECTIVE WIREFRAME GRID BACKGROUND
// // ------------------------------------------------------------------
// class CyberGridPainter extends CustomPainter {
//   final double progress;
//   final Color color;
//
//   CyberGridPainter({required this.progress, required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 1.0
//       ..style = PaintingStyle.stroke;
//
//     final double horizonY = size.height * 0.3; // Where the grid vanishes
//     final double gridBottom = size.height;
//
//     // Draw vertical perspective lines
//     const int numVerticalLines = 14;
//     for (int i = 0; i <= numVerticalLines; i++) {
//       double startX = (size.width / numVerticalLines) * i;
//       // Lines converge towards the center horizon
//       canvas.drawLine(Offset(startX, gridBottom), Offset(size.width / 2, horizonY), paint);
//     }
//
//     // Draw horizontal perspective lines that move towards the user
//     const int numHorizontalLines = 15;
//     for (int i = 0; i < numHorizontalLines; i++) {
//       // Math magic to make lines space out exponentially as they get closer
//       double normalizedY = (i + progress) / numHorizontalLines;
//       double yPos = horizonY + math.pow(normalizedY, 3) * (gridBottom - horizonY);
//
//       canvas.drawLine(Offset(0, yPos), Offset(size.width, yPos), paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CyberGridPainter oldDelegate) {
//     return oldDelegate.progress != progress;
//   }
// }

// import 'dart:ui';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});
//
//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }
//
// class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
//   // --- STATE & CONTROLLERS ---
//   bool _isLoggedIn = false;
//   String _userName = "";
//   String _userEmail = "";
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _chatController = TextEditingController();
//
//   late AnimationController _gridController;
//
//   @override
//   void initState() {
//     super.initState();
//     _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
//   }
//
//   @override
//   void dispose() {
//     _gridController.dispose();
//     super.dispose();
//   }
//
//   // --- AUTHENTICATION LOGIC ---
//   void _login() {
//     if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
//       setState(() {
//         _userName = _nameController.text.trim();
//         _userEmail = _emailController.text.trim().toLowerCase();
//         _isLoggedIn = true;
//       });
//       _checkAndSendWelcomeMessage();
//     }
//   }
//
//   Future<void> _checkAndSendWelcomeMessage() async {
//     final query = await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').limit(1).get();
//     if (query.docs.isEmpty) {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': 'Authentication successful. Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   void _logout() {
//     setState(() {
//       _isLoggedIn = false;
//       _userName = "";
//       _userEmail = "";
//       _nameController.clear();
//       _emailController.clear();
//     });
//   }
//
//   // --- CLOUD WRITE LOGIC ---
//   Future<void> _sendMessage() async {
//     if (_chatController.text.trim().isEmpty) return;
//
//     String userText = _chatController.text.trim();
//     _chatController.clear();
//
//     await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//       'sender': _userName,
//       'text': userText,
//       'isAI': false,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     _generateAIResponse(userText);
//   }
//
//   Future<void> _generateAIResponse(String userMessage) async {
//     // ⚠️ IMPORTANT: PASTE YOUR ACTUAL API KEY HERE!
//     const String apiKey = 'AIzaSyA_3PCodhJtA8NTexIXcR7Rd_6BQZF9MkA';
//
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-2.5-flash', // Try 1.5-flash first, fallback to gemini-pro if it fails
//         apiKey: apiKey,
//         systemInstruction: Content.system(
//             "You are the 'Secure Comms Assistant' for Aravind Senthilvelan, a Full-Stack Mobile Architect. "
//                 "Speak in a highly professional, cinematic, and slightly sci-fi tone. "
//                 "Aravind's Data: Pursuing MBA in HR. Holds B.E. in ECE (CGPA 7.79). Skills: Flutter, Firebase, C/C++, Python. "
//                 "Keep responses concise (1-3 sentences maximum)."
//         ),
//       );
//
//       final response = await model.generateContent([Content.text(userMessage)]);
//       String aiReply = response.text ?? "System Error: Neural link interrupted.";
//
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': aiReply,
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System Error',
//         'text': "Connection to central mainframe failed. Error code: $e",
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   // --- 🎬 3D CINEMATIC UI BUILDERS ---
//   @override
//   Widget build(BuildContext context) {
//     const accentColor = Color(0xFFE10600); // F1 Red
//     const aiAccent = Color(0xFF00E5FF); // Cyan for AI
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF020202),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: AnimatedBuilder(
//               animation: _gridController,
//               builder: (context, _) => CustomPaint(
//                 painter: CyberGridPainter(progress: _gridController.value, color: accentColor.withOpacity(0.15)),
//               ),
//             ),
//           ),
//           Positioned(
//             top: -150, left: -100,
//             child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withOpacity(0.08), blurRadius: 150)])),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 _buildAppBar(accentColor),
//                 Expanded(
//                   child: _isLoggedIn
//                       ? _buildCloudChatInterface(accentColor, aiAccent)
//                       : _buildAuthInterface(accentColor),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAppBar(Color accentColor) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               boxShadow: _isLoggedIn ? [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 15)] : [],
//             ),
//             child: CircleAvatar(
//               radius: 18,
//               backgroundColor: _isLoggedIn ? accentColor : Colors.white.withOpacity(0.05),
//               child: Text(_isLoggedIn ? _userName[0].toUpperCase() : "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
//             ),
//           ),
//           const Text("SYS_COMMS", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 6, color: Colors.white)),
//           _isLoggedIn ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout) : const SizedBox(width: 40),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAuthInterface(Color accentColor) {
//     return Center(
//       child: Transform(
//         alignment: FractionalOffset.center,
//         transform: Matrix4.identity()
//           ..setEntry(3, 2, 0.001)
//           ..rotateX(0.08)
//           ..rotateY(-0.05),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(30),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//               child: Container(
//                 padding: const EdgeInsets.all(40),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.4),
//                   border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(color: accentColor.withOpacity(0.1), blurRadius: 50, spreadRadius: 10)
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.radar, size: 50, color: accentColor).animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 2.seconds, color: Colors.white),
//                     const SizedBox(height: 25),
//                     const Text("IDENTIFICATION REQUIRED", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 14)),
//                     const SizedBox(height: 35),
//                     _buildTerminalInput(_nameController, "VISITOR DESIGNATION", accentColor),
//                     const SizedBox(height: 25),
//                     _buildTerminalInput(_emailController, "CONTACT VECTOR (EMAIL)", accentColor),
//                     const SizedBox(height: 45),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 55,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: accentColor,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//                         ),
//                         onPressed: _login,
//                         child: const Text("ESTABLISH LINK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 4)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack),
//     );
//   }
//
//   Widget _buildTerminalInput(TextEditingController controller, String label, Color accentColor) {
//     return TextField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white38, letterSpacing: 3, fontSize: 10, fontWeight: FontWeight.w900),
//         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.1))),
//         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: accentColor, width: 2)),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.5),
//       ),
//     );
//   }
//
//   // ── THE HOLOGRAPHIC CHAT STREAM ──
//   Widget _buildCloudChatInterface(Color accentColor, Color aiAccent) {
//     return Column(
//       children: [
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').orderBy('timestamp', descending: true).snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(color: accentColor));
//               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const SizedBox.shrink();
//
//               final messages = snapshot.data!.docs;
//
//               return ListView.builder(
//                 reverse: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msgData = messages[index].data() as Map<String, dynamic>;
//                   final bool isAI = msgData['isAI'] ?? false;
//                   final String sender = msgData['sender'] ?? 'Unknown';
//                   final String text = msgData['text'] ?? '';
//
//                   // Removed the .animate() block temporarily to ensure shaders aren't hiding the text
//                   return _buildHolographicBubble(isAI, sender, text, accentColor, aiAccent);
//                 },
//               );
//             },
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.all(20),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.6),
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(color: Colors.white.withOpacity(0.1)),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _chatController,
//                   style: const TextStyle(color: Colors.white, letterSpacing: 1),
//                   decoration: const InputDecoration(
//                     hintText: "TRANSMIT...",
//                     hintStyle: TextStyle(color: Colors.white24, letterSpacing: 3, fontSize: 11, fontWeight: FontWeight.w900),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                   onSubmitted: (_) => _sendMessage(),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle, boxShadow: [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 10)]),
//                 child: IconButton(icon: const Icon(Icons.send, color: Colors.white, size: 16), onPressed: _sendMessage),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHolographicBubble(bool isAI, String sender, String text, Color accentColor, Color aiAccent) {
//     Color bubbleTheme = isAI ? aiAccent : accentColor;
//
//     // Debug fallback: If the database is saving an empty string, print an error so we know.
//     String safeText = text.isEmpty ? "[ERROR: EMPTY MESSAGE DATA]" : text;
//
//     return Align(
//       alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         padding: const EdgeInsets.all(15),
//         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.8), // Darkened the bubble background to ensure contrast
//           border: Border(
//             left: isAI ? BorderSide(color: bubbleTheme, width: 3) : BorderSide(color: Colors.white.withOpacity(0.05)),
//             right: !isAI ? BorderSide(color: bubbleTheme, width: 3) : BorderSide(color: Colors.white.withOpacity(0.05)),
//             top: BorderSide(color: Colors.white.withOpacity(0.05)),
//             bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
//           ),
//           borderRadius: BorderRadius.circular(4),
//           boxShadow: [
//             BoxShadow(color: bubbleTheme.withOpacity(0.05), blurRadius: 15, spreadRadius: 2)
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(isAI ? Icons.memory : Icons.person, size: 10, color: bubbleTheme),
//                 const SizedBox(width: 5),
//                 Text(
//                   sender.toUpperCase(),
//                   style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             // The Bulletproof Rendering Patch: Swapped Text for SelectableText and forced a basic TextStyle
//             SelectableText(
//               safeText,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 14,
//                 height: 1.5,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ------------------------------------------------------------------
// // 3D PERSPECTIVE WIREFRAME GRID BACKGROUND
// // ------------------------------------------------------------------
// class CyberGridPainter extends CustomPainter {
//   final double progress;
//   final Color color;
//
//   CyberGridPainter({required this.progress, required this.color});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = 1.0
//       ..style = PaintingStyle.stroke;
//
//     final double horizonY = size.height * 0.3;
//     final double gridBottom = size.height;
//
//     const int numVerticalLines = 14;
//     for (int i = 0; i <= numVerticalLines; i++) {
//       double startX = (size.width / numVerticalLines) * i;
//       canvas.drawLine(Offset(startX, gridBottom), Offset(size.width / 2, horizonY), paint);
//     }
//
//     const int numHorizontalLines = 15;
//     for (int i = 0; i < numHorizontalLines; i++) {
//       double normalizedY = (i + progress) / numHorizontalLines;
//       double yPos = horizonY + math.pow(normalizedY, 3) * (gridBottom - horizonY);
//       canvas.drawLine(Offset(0, yPos), Offset(size.width, yPos), paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CyberGridPainter oldDelegate) {
//     return oldDelegate.progress != progress;
//   }
// }

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:flutter_animate/flutter_animate.dart';
//
// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});
//
//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }
//
// class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
//   bool _isLoggedIn = false;
//   String _userName = "";
//   String _userEmail = "";
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _chatController = TextEditingController();
//
//   late AnimationController _gridController;
//
//   @override
//   void initState() {
//     super.initState();
//     _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
//   }
//
//   @override
//   void dispose() {
//     _gridController.dispose();
//     super.dispose();
//   }
//
//   void _login() {
//     if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
//       setState(() {
//         _userName = _nameController.text.trim();
//         _userEmail = _emailController.text.trim().toLowerCase();
//         _isLoggedIn = true;
//       });
//       _checkAndSendWelcomeMessage();
//     }
//   }
//
//   Future<void> _checkAndSendWelcomeMessage() async {
//     final query = await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').limit(1).get();
//     if (query.docs.isEmpty) {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': 'Authentication successful. Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   void _logout() {
//     setState(() {
//       _isLoggedIn = false;
//       _userName = "";
//       _userEmail = "";
//       _nameController.clear();
//       _emailController.clear();
//     });
//   }
//
//   Future<void> _sendMessage() async {
//     if (_chatController.text.trim().isEmpty) return;
//     String userText = _chatController.text.trim();
//     _chatController.clear();
//
//     await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//       'sender': _userName,
//       'text': userText,
//       'isAI': false,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     _generateAIResponse(userText);
//   }
//
//   Future<void> _generateAIResponse(String userMessage) async {
//     const String apiKey = 'AIzaSyA_3PCodhJtA8NTexIXcR7Rd_6BQZF9MkA';
//
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-1.5-flash',
//         apiKey: apiKey,
//         systemInstruction: Content.system(
//             "You are the 'Secure Comms Assistant' for Aravind, a Full-Stack Mobile Architect. "
//                 "Speak in a highly professional, cinematic, and slightly sci-fi tone. "
//                 "Your job is to answer questions from recruiters or visitors about Aravind. "
//                 "Aravind's Data: Pursuing MBA in HR. Holds B.E. in ECE (CGPA 7.79). Skills: Flutter, Firebase, C/C++, Python. "
//                 "Keep responses concise (1-3 sentences maximum)."
//         ),
//       );
//
//       final response = await model.generateContent([Content.text(userMessage)]);
//       String aiReply = response.text ?? "System Error: Neural link interrupted.";
//
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System',
//         'text': aiReply,
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System Error',
//         'text': "Connection to central mainframe failed.",
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const accentColor = Color(0xFFE10600);
//     const aiAccent = Color(0xFF00E5FF);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF020202),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: AnimatedBuilder(
//               animation: _gridController,
//               builder: (context, _) => CustomPaint(
//                 painter: CyberGridPainter(progress: _gridController.value, color: accentColor.withOpacity(0.15)),
//               ),
//             ),
//           ),
//           Positioned(
//             top: -150, left: -100,
//             child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withOpacity(0.08), blurRadius: 150)])),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 _buildAppBar(accentColor),
//                 Expanded(
//                   child: _isLoggedIn ? _buildCloudChatInterface(accentColor, aiAccent) : _buildAuthInterface(accentColor),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAppBar(Color accentColor) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: _isLoggedIn ? [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 15)] : []),
//             child: CircleAvatar(
//               radius: 18,
//               backgroundColor: _isLoggedIn ? accentColor : Colors.white.withOpacity(0.05),
//               child: Text(_isLoggedIn ? _userName[0].toUpperCase() : "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
//             ),
//           ),
//           const Text("SYS_COMMS", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 6, color: Colors.white)),
//           _isLoggedIn ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout) : const SizedBox(width: 40),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAuthInterface(Color accentColor) {
//     return Center(
//       child: Transform(
//         alignment: FractionalOffset.center,
//         transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateX(0.08)..rotateY(-0.05),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(30),
//           // REMOVED BACKDROP FILTER to fix CanvasKit rendering crashes
//           child: Container(
//             padding: const EdgeInsets.all(40),
//             decoration: BoxDecoration(
//               color: const Color(0xFF0A0A0A).withOpacity(0.95), // Solid dark base instead of blur
//               border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.5),
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [BoxShadow(color: accentColor.withOpacity(0.1), blurRadius: 50, spreadRadius: 10)],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.radar, size: 50, color: accentColor).animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 2.seconds, color: Colors.white),
//                 const SizedBox(height: 25),
//                 const Text("IDENTIFICATION REQUIRED", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 14, color: Colors.white)),
//                 const SizedBox(height: 35),
//                 _buildTerminalInput(_nameController, "VISITOR DESIGNATION", accentColor),
//                 const SizedBox(height: 25),
//                 _buildTerminalInput(_emailController, "CONTACT VECTOR (EMAIL)", accentColor),
//                 const SizedBox(height: 45),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 55,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(backgroundColor: accentColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
//                     onPressed: _login,
//                     child: const Text("ESTABLISH LINK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 4)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, curve: Curves.easeOutBack),
//     );
//   }
//
//   Widget _buildTerminalInput(TextEditingController controller, String label, Color accentColor) {
//     return TextField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white38, letterSpacing: 3, fontSize: 10, fontWeight: FontWeight.w900),
//         enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.1))),
//         focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: accentColor, width: 2)),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.5),
//       ),
//     );
//   }
//
//   Widget _buildCloudChatInterface(Color accentColor, Color aiAccent) {
//     return Column(
//       children: [
//         Expanded(
//           child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').orderBy('timestamp', descending: true).snapshots(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator(color: accentColor));
//               if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const SizedBox.shrink();
//
//               final messages = snapshot.data!.docs;
//
//               return ListView.builder(
//                 reverse: true,
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 itemCount: messages.length,
//                 itemBuilder: (context, index) {
//                   final msgData = messages[index].data() as Map<String, dynamic>;
//                   final bool isAI = msgData['isAI'] ?? false;
//                   final String sender = msgData['sender'] ?? 'Unknown';
//                   final String text = msgData['text'] ?? '';
//
//                   return _buildHolographicBubble(isAI, sender, text, accentColor, aiAccent);
//                 },
//               );
//             },
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.all(20),
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.9),
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(color: Colors.white.withOpacity(0.1)),
//             boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)],
//           ),
//           child: Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   controller: _chatController,
//                   style: const TextStyle(color: Colors.white, letterSpacing: 1),
//                   decoration: const InputDecoration(
//                     hintText: "TRANSMIT...",
//                     hintStyle: TextStyle(color: Colors.white24, letterSpacing: 3, fontSize: 11, fontWeight: FontWeight.w900),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 20),
//                   ),
//                   onSubmitted: (_) => _sendMessage(),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle, boxShadow: [BoxShadow(color: accentColor.withOpacity(0.5), blurRadius: 10)]),
//                 child: IconButton(icon: const Icon(Icons.send, color: Colors.white, size: 16), onPressed: _sendMessage),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHolographicBubble(bool isAI, String sender, String text, Color accentColor, Color aiAccent) {
//     Color bubbleTheme = isAI ? aiAccent : accentColor;
//     String safeText = text.isEmpty ? "[ERROR: EMPTY MESSAGE]" : text;
//
//     return Align(
//       alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         padding: const EdgeInsets.all(15),
//         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
//         // REMOVED OPACITY TRANSLUCENCY to guarantee text renders above it on Web
//         decoration: BoxDecoration(
//           color: const Color(0xFF111111), // Solid dark grey, no opacity
//           border: Border(
//             left: isAI ? BorderSide(color: bubbleTheme, width: 3) : BorderSide(color: Colors.white.withOpacity(0.1)),
//             right: !isAI ? BorderSide(color: bubbleTheme, width: 3) : BorderSide(color: Colors.white.withOpacity(0.1)),
//             top: BorderSide(color: Colors.white.withOpacity(0.1)),
//             bottom: BorderSide(color: Colors.white.withOpacity(0.1)),
//           ),
//           borderRadius: BorderRadius.circular(4),
//           boxShadow: [BoxShadow(color: bubbleTheme.withOpacity(0.05), blurRadius: 15, spreadRadius: 2)],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(isAI ? Icons.memory : Icons.person, size: 10, color: bubbleTheme),
//                 const SizedBox(width: 5),
//                 Text(
//                   sender.toUpperCase(),
//                   style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: 2),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             // The ultimate safe text widget
//             Text(
//               safeText,
//               style: const TextStyle(color: Colors.white, fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CyberGridPainter extends CustomPainter {
//   final double progress;
//   final Color color;
//   CyberGridPainter({required this.progress, required this.color});
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = color..strokeWidth = 1.0..style = PaintingStyle.stroke;
//     final double horizonY = size.height * 0.3;
//     final double gridBottom = size.height;
//     for (int i = 0; i <= 14; i++) {
//       double startX = (size.width / 14) * i;
//       canvas.drawLine(Offset(startX, gridBottom), Offset(size.width / 2, horizonY), paint);
//     }
//     for (int i = 0; i < 15; i++) {
//       double normalizedY = (i + progress) / 15;
//       double yPos = horizonY + math.pow(normalizedY, 3) * (gridBottom - horizonY);
//       canvas.drawLine(Offset(0, yPos), Offset(size.width, yPos), paint);
//     }
//   }
//   @override
//   bool shouldRepaint(covariant CyberGridPainter oldDelegate) => oldDelegate.progress != progress;
// }

//Splashpage code

// //
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // // import 'package:flutter_animate/flutter_animate.dart'; // Optional, but great for polish if you have it
// // import 'MainPage.dart'; // Ensure this points to your actual main page file
// //
// // class SplashPage extends StatefulWidget {
// //   const SplashPage({super.key});
// //
// //   @override
// //   State<SplashPage> createState() => _SplashPageState();
// // }
// //
// // class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
// //   late AnimationController _progressController;
// //
// //   // Track the F1 Lights Sequence
// //   int _litLights = 0;
// //   bool _allLightsOut = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // 1. Initialise the loading bar engine (2.5 seconds fill time)
// //     _progressController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 2500),
// //     )..forward();
// //
// //     // 2. Start the Lights Out sequence
// //     _startRaceSequence();
// //   }
// //
// //   Future<void> _startRaceSequence() async {
// //     // Light up one red light every 500ms
// //     for (int i = 1; i <= 5; i++) {
// //       await Future.delayed(const Duration(milliseconds: 500));
// //       if (!mounted) return; // Safety check (fixes old Timer bug)
// //       setState(() {
// //         _litLights = i;
// //       });
// //     }
// //
// //     // Hold all 5 lights for a brief moment of tension
// //     await Future.delayed(const Duration(milliseconds: 800));
// //     if (!mounted) return;
// //
// //     // AND IT'S LIGHTS OUT!
// //     setState(() {
// //       _allLightsOut = true;
// //     });
// //
// //     // Wait a split second for the user to register the lights went out, then launch!
// //     await Future.delayed(const Duration(milliseconds: 300));
// //     if (!mounted) return;
// //
// //     Navigator.of(context).pushReplacement(
// //       PageRouteBuilder(
// //         pageBuilder: (context, animation, secondaryAnimation) => const Mainpage(),
// //         transitionsBuilder: (context, animation, secondaryAnimation, child) {
// //           // Aggressive fade-in transition
// //           return FadeTransition(opacity: animation, child: child);
// //         },
// //         transitionDuration: const Duration(milliseconds: 600),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _progressController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFF050505), // Deep Carbon Black
// //       body: Stack(
// //         fit: StackFit.expand,
// //         children: [
// //           // 1. RADIAL GLOW BACKGROUND
// //           Container(
// //             decoration: const BoxDecoration(
// //               gradient: RadialGradient(
// //                 center: Alignment(-0.3, -0.2), // Matches the 30% 40% from CSS
// //                 radius: 0.8,
// //                 colors: [
// //                   Color(0x26E10600), // 15% opacity F1 Red
// //                   Colors.transparent,
// //                 ],
// //               ),
// //             ),
// //           ),
// //
// //           // 2. RACING STRIPES (Left side telemetry lines)
// //           Positioned(
// //             left: MediaQuery.of(context).size.width * 0.35,
// //             top: 0,
// //             bottom: 0,
// //             child: Container(
// //               width: 3,
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   begin: Alignment.topCenter,
// //                   end: Alignment.bottomCenter,
// //                   colors: [
// //                     Colors.transparent,
// //                     Color(0xFFE10600), // Solid red in the middle
// //                     Colors.transparent,
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //
// //           // 3. HUD CORNER BRACKETS
// //           _buildHUDCorner(Alignment.topLeft),
// //           _buildHUDCorner(Alignment.topRight),
// //           _buildHUDCorner(Alignment.bottomLeft),
// //           _buildHUDCorner(Alignment.bottomRight),
// //
// //           // 4. MAIN CONTENT CHASSIS
// //           Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 // LOGO RING
// //                 Container(
// //                   width: 110,
// //                   height: 110,
// //                   decoration: BoxDecoration(
// //                     shape: BoxShape.circle,
// //                     border: Border.all(color: const Color(0xFFE10600), width: 2),
// //                     boxShadow: const [
// //                       BoxShadow(
// //                         color: Color(0x66E10600), // Red glow
// //                         blurRadius: 30,
// //                       ),
// //                     ],
// //                   ),
// //                   alignment: Alignment.center,
// //                   child: Container(
// //                     width: 90,
// //                     height: 90,
// //                     decoration: BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       border: Border.all(color: const Color(0x4DE10600), width: 1), // Inner faint ring
// //                     ),
// //                     alignment: Alignment.center,
// //                     child: const Text(
// //                       '29',
// //                       style: TextStyle(
// //                         fontFamily: 'Orbitron',
// //                         fontSize: 42,
// //                         fontWeight: FontWeight.w900,
// //                         fontStyle: FontStyle.italic,
// //                         color: Color(0xFFE10600),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 20),
// //
// //                 // DRIVER INFO
// //                 const Text(
// //                   'ARAVIND',
// //                   style: TextStyle(
// //                     fontFamily: 'Orbitron',
// //                     fontSize: 24,
// //                     fontWeight: FontWeight.w900,
// //                     fontStyle: FontStyle.italic,
// //                     letterSpacing: 2,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Container(
// //                   color: const Color(0xFFE10600),
// //                   padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
// //                   child: const Text(
// //                     'FLUTTER DEVELOPER',
// //                     style: TextStyle(
// //                       fontFamily: 'Orbitron',
// //                       fontSize: 10,
// //                       letterSpacing: 3,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //
// //                 const SizedBox(height: 40),
// //
// //                 // THE STARTING LIGHTS
// //                 const Text(
// //                   'LIGHTS OUT AND AWAY WE GO',
// //                   style: TextStyle(
// //                     fontFamily: 'Orbitron',
// //                     fontSize: 8,
// //                     color: Colors.white54,
// //                     letterSpacing: 3,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: List.generate(5, (index) {
// //                     // Check if this specific light should be on
// //                     bool isOn = !_allLightsOut && index < _litLights;
// //                     return Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 5.0),
// //                       child: AnimatedContainer(
// //                         duration: const Duration(milliseconds: 100),
// //                         width: 16,
// //                         height: 16,
// //                         decoration: BoxDecoration(
// //                           shape: BoxShape.circle,
// //                           color: isOn ? const Color(0xFFE10600) : const Color(0xFF1A0000),
// //                           border: Border.all(
// //                             color: isOn ? const Color(0xFFE10600) : const Color(0xFF2A0000),
// //                           ),
// //                           boxShadow: isOn
// //                               ? [
// //                             const BoxShadow(
// //                               color: Color(0xFFE10600),
// //                               blurRadius: 12,
// //                               spreadRadius: 2,
// //                             )
// //                           ]
// //                               : [],
// //                         ),
// //                       ),
// //                     );
// //                   }),
// //                 ),
// //
// //                 const SizedBox(height: 40),
// //
// //                 // SYSTEM INITIALIZATION BAR (Slanted F1 Style)
// //                 const Text(
// //                   'INITIALISING SYSTEMS',
// //                   style: TextStyle(
// //                     fontFamily: 'Orbitron',
// //                     fontSize: 8,
// //                     color: Colors.white38,
// //                     letterSpacing: 2,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 SizedBox(
// //                   width: 180,
// //                   height: 4,
// //                   child: AnimatedBuilder(
// //                     animation: _progressController,
// //                     builder: (context, child) {
// //                       return Stack(
// //                         children: [
// //                           // Track background
// //                           Container(color: const Color(0xFF111111)),
// //                           // Animated Fill
// //                           FractionallySizedBox(
// //                             alignment: Alignment.centerLeft,
// //                             widthFactor: _progressController.value,
// //                             child: Container(color: const Color(0xFFE10600)),
// //                           ),
// //                         ],
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Helper widget to draw the target brackets in the corners
// //   Widget _buildHUDCorner(Alignment alignment) {
// //     // Determine which borders to draw based on the corner
// //     BorderSide top = (alignment == Alignment.topLeft || alignment == Alignment.topRight)
// //         ? const BorderSide(color: Color(0xFFE10600), width: 2)
// //         : BorderSide.none;
// //     BorderSide bottom = (alignment == Alignment.bottomLeft || alignment == Alignment.bottomRight)
// //         ? const BorderSide(color: Color(0xFFE10600), width: 2)
// //         : BorderSide.none;
// //     BorderSide left = (alignment == Alignment.topLeft || alignment == Alignment.bottomLeft)
// //         ? const BorderSide(color: Color(0xFFE10600), width: 2)
// //         : BorderSide.none;
// //     BorderSide right = (alignment == Alignment.topRight || alignment == Alignment.bottomRight)
// //         ? const BorderSide(color: Color(0xFFE10600), width: 2)
// //         : BorderSide.none;
// //
// //     return Align(
// //       alignment: alignment,
// //       child: Padding(
// //         padding: const EdgeInsets.all(30.0), // Padding from the screen edge
// //         child: Container(
// //           width: 24,
// //           height: 24,
// //           decoration: BoxDecoration(
// //             border: Border(top: top, bottom: bottom, left: left, right: right),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// // // import 'dart:async';
// // // import 'package:flutter/material.dart';
// // // import 'package:my_resume/pages/MainPage.dart';
// // //
// // // class Splashpage extends StatefulWidget {
// // //   const Splashpage({super.key});
// // //
// // //   @override
// // //   State<Splashpage> createState() => _SplashpageState();
// // // }
// // //
// // // class _SplashpageState extends State<Splashpage>  with TickerProviderStateMixin {
// // //
// // //   late AnimationController _controller;
// // //   late Animation<double> _animation;
// // //
// // //
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // redirect();
// // //
// // //     // Initialize the animation controller
// // //     _controller = AnimationController(
// // //       duration: const Duration(seconds: 3),
// // //       vsync: this,
// // //     );
// // //
// // //     // Define the animation curve and tween
// // //     _animation = CurvedAnimation(
// // //       parent: _controller,
// // //       curve: Curves.bounceInOut,
// // //     );
// // //
// // //     // Start the animation
// // //     _controller.forward();
// // //
// // //     // Navigate to home page after the animation completes
// // //     Timer(Duration(seconds: 4), () {
// // //       Navigator.of(context).pushReplacement(
// // //         MaterialPageRoute(builder: (context) => Mainpage()),
// // //       );
// // //     });
// // //
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _controller.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //
// // //       backgroundColor: Colors.white54,
// // //
// // //       // body: Center(
// // //       //   child: Column(
// // //       //     mainAxisAlignment: MainAxisAlignment.center,
// // //       //     children: [
// // //       //       CircleAvatar(
// // //       //         child:Container(
// // //       //           width: 600,
// // //       //           height: 600,
// // //       //           decoration: BoxDecoration(
// // //       //             shape: BoxShape.circle,
// // //       //             image: DecorationImage(
// // //       //               image: AssetImage(
// // //       //                 "assets/images/app3.png",
// // //       //               ),
// // //       //               fit: BoxFit.fill,
// // //       //             ),
// // //       //             border: Border(
// // //       //               top: BorderSide(
// // //       //                 color: Colors.white,
// // //       //               ),
// // //       //               bottom: BorderSide(
// // //       //                 color: Colors.white,
// // //       //               ),
// // //       //               left: BorderSide(
// // //       //                 color: Colors.white,
// // //       //               ),
// // //       //               right: BorderSide(
// // //       //                 color: Colors.white,
// // //       //               ),
// // //       //             ),
// // //       //           ),
// // //       //         ),
// // //       //       ),
// // //       //       SizedBox(
// // //       //         width: 10,
// // //       //       ),
// // //       //       Text(
// // //       //         "My Resume",
// // //       //         style: TextStyle(
// // //       //           color: Colors.black,
// // //       //           fontFamily: "Caveat",
// // //       //           fontSize: 30,
// // //       //           fontStyle: FontStyle.italic,
// // //       //           fontWeight: FontWeight.normal,
// // //       //         ),
// // //       //       ),
// // //       //     ],
// // //       //   ),
// // //       // ),
// // //
// // //         body: AnimatedBuilder(
// // //           animation: _controller,
// // //           builder: (context, child) {
// // //             return Stack(
// // //               children: <Widget>[
// // //                 Positioned.fill(
// // //                   child: Container(
// // //                     decoration: BoxDecoration(
// // //                       borderRadius: BorderRadius.circular(20),
// // //                       gradient: LinearGradient(
// // //                         begin: Alignment.topLeft,
// // //                         end: Alignment.bottomRight,
// // //                         colors: [
// // //                           Colors.lightBlueAccent,
// // //                           Colors.blueAccent.withOpacity(_animation.value),
// // //                           Colors.blue,
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 Center(
// // //                   child: Opacity(
// // //                     opacity: _animation.value,
// // //                     child: ScaleTransition(
// // //                       scale: _animation,
// // //                       child: Image.asset(
// // //                         'assets/images/app3.png',
// // //                         width: 200,
// // //                         height: 200,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             );
// // //           },
// // //         ),
// // //
// // //
// // //         // AnimatedSplashScreen(
// // //         //     duration: 3000,
// // //         //     splash: Column(
// // //         //       children: [
// // //         //         CircleAvatar(
// // //         //           child:Container(
// // //         //             width: 200,
// // //         //             height: 200,
// // //         //             decoration: BoxDecoration(
// // //         //               shape: BoxShape.circle,
// // //         //               image: DecorationImage(
// // //         //                 image: AssetImage(
// // //         //                   "assets/images/app3.png",
// // //         //                 ),
// // //         //                 fit: BoxFit.fill,
// // //         //               ),
// // //         //               border: Border(
// // //         //                 top: BorderSide(
// // //         //                   color: Colors.white,
// // //         //                 ),
// // //         //                 bottom: BorderSide(
// // //         //                   color: Colors.white,
// // //         //                 ),
// // //         //                 left: BorderSide(
// // //         //                   color: Colors.white,
// // //         //                 ),
// // //         //                 right: BorderSide(
// // //         //                   color: Colors.white,
// // //         //                 ),
// // //         //               ),
// // //         //             ),
// // //         //           ),
// // //         //         ),
// // //         //         SizedBox(
// // //         //           height: 10,
// // //         //         ),
// // //         //         Text(
// // //         //           "My Resume",
// // //         //           style: TextStyle(
// // //         //             fontFamily: "Tangerine",
// // //         //           ),
// // //         //         ),
// // //         //       ],
// // //         //     ),
// // //         //     nextScreen: Mainpage(),
// // //         //     splashTransition: SplashTransition.fadeTransition,
// // //         //     pageTransitionType: PageTransitionType.fade,
// // //         //     backgroundColor: Colors.teal.shade200,
// // //         // )
// // //     );
// // //   }
// // //
// // //   // Future<void> redirect() async{
// // //   //   await Future.delayed(const Duration(seconds: 4));
// // //   //   Navigator.pushReplacement(
// // //   //     context,
// // //   //     MaterialPageRoute(
// // //   //       builder: (BuildContext context) => const Mainpage(),
// // //   //     ),
// // //   //   );
// // //   // }
// // //
// // // }
// // //
// // //
//
//
// // ============================================================
// //  SplashPage.dart — LIGHTS OUT SEQUENCE
// //  3D ring + F1 race start + parallelogram loading bar
// //  Fixed: No Timer leak, no mounted check skip
// // ============================================================
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'MainPage.dart';
//
// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});
//
//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage>
//     with TickerProviderStateMixin {
//
//   // ── ANIMATION CONTROLLERS ──
//   late AnimationController _ringController;   // Rotating outer ring
//   late AnimationController _loadController;   // Loading bar fill
//   late AnimationController _pulseController;  // Logo glow pulse
//   late AnimationController _fadeController;   // Entry fade-in
//
//   late Animation<double> _ringRotation;
//   late Animation<double> _loadProgress;
//   late Animation<double> _pulseAnim;
//   late Animation<double> _fadeAnim;
//   late Animation<double> _scaleAnim;          // 3D scale-in for logo
//
//   // ── F1 LIGHTS STATE ──
//   int _litLights   = 0;
//   bool _lightsOut  = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // 1. Spinning outer ring (continuous)
//     _ringController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 4),
//     )..repeat();
//     _ringRotation = Tween<double>(begin: 0, end: 2 * math.pi)
//         .animate(_ringController);
//
//     // 2. Loading bar (2.8s fill)
//     _loadController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 2800),
//     )..forward();
//     _loadProgress = CurvedAnimation(
//       parent: _loadController,
//       curve: Curves.easeOutCubic,
//     );
//
//     // 3. Glow pulse (repeating heartbeat)
//     _pulseController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     )..repeat(reverse: true);
//     _pulseAnim = Tween<double>(begin: 0.6, end: 1.0)
//         .animate(CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));
//
//     // 4. Entry animations
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 800),
//     )..forward();
//     _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
//     _scaleAnim = Tween<double>(begin: 0.85, end: 1.0)
//         .animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOutBack));
//
//     // 5. Race start sequence
//     _runLightsSequence();
//   }
//
//   Future<void> _runLightsSequence() async {
//     // Light up 5 lamps one by one
//     for (int i = 1; i <= 5; i++) {
//       await Future.delayed(const Duration(milliseconds: 500));
//       if (!mounted) return;
//       setState(() => _litLights = i);
//     }
//
//     // Brief tension hold
//     await Future.delayed(const Duration(milliseconds: 900));
//     if (!mounted) return;
//
//     // ALL LIGHTS OUT
//     setState(() => _lightsOut = true);
//
//     await Future.delayed(const Duration(milliseconds: 350));
//     if (!mounted) return;
//
//     // Launch with aggressive fade transition
//     Navigator.of(context).pushReplacement(
//       PageRouteBuilder(
//         pageBuilder: (_, animation, __) => const Mainpage(),
//         transitionsBuilder: (_, animation, __, child) {
//           return FadeTransition(
//             opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
//             child: child,
//           );
//         },
//         transitionDuration: const Duration(milliseconds: 700),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _ringController.dispose();
//     _loadController.dispose();
//     _pulseController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final accent = const Color(0xFFE10600);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF050505),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//
//           // ── 1. RADIAL RED GLOW BG ──
//           Container(
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 center: const Alignment(-0.3, -0.2),
//                 radius: 0.85,
//                 colors: [accent.withOpacity(0.12), Colors.transparent],
//               ),
//             ),
//           ),
//
//           // ── 2. GRID OVERLAY ──
//           CustomPaint(painter: _GridPainter()),
//
//           // ── 3. DIAGONAL RACING STRIPES ──
//           Positioned(
//             top: 90,
//             left: 192,
//             child: Container(
//               height: 3,
//               width: size.width * 0.52,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   colors: [Colors.transparent, accent, Colors.transparent],
//                 ),
//                 // boxShadow: [
//                 //   BoxShadow(
//                 //     color: accent.withOpacity(0.6),
//                 //     blurRadius: 12,
//                 //     spreadRadius: 2,
//                 //   ),
//                 // ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 103,
//             left: 195,
//             child: Container(
//               height: 1,
//               width: size.width * 0.50,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   colors: [Colors.transparent, accent, Colors.transparent],
//                 ),
//               ),
//             ),
//           ),
//
//           Positioned(
//             left: size.width * 0.25,
//             top: 0, bottom: 0,
//             child: Container(
//               width: 3,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.transparent, accent, Colors.transparent],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: size.width * 0.27,
//             top: 0, bottom: 0,
//             child: Container(
//               width: 1,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.transparent, accent.withOpacity(0.3), Colors.transparent],
//                 ),
//               ),
//             ),
//           ),
//
//           Positioned(
//             right: size.width * 0.25,
//             top: 0, bottom: 0,
//             child: Container(
//               width: 3,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.transparent, accent, Colors.transparent],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: size.width * 0.27,
//             top: 0, bottom: 0,
//             child: Container(
//               width: 1,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.transparent, accent.withOpacity(0.3), Colors.transparent],
//                 ),
//               ),
//             ),
//           ),
//
//           // ── 4. HUD CORNER BRACKETS ──
//           ..._buildAllCorners(accent),
//
//           // ── 5. MAIN CONTENT ──
//           FadeTransition(
//             opacity: _fadeAnim,
//             child: ScaleTransition(
//               scale: _scaleAnim,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     // ── 3D LOGO RING ──
//                     AnimatedBuilder(
//                       animation: Listenable.merge([_ringRotation, _pulseAnim]),
//                       builder: (_, __) {
//                         return SizedBox(
//                           width: 140, height: 140,
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               // Outer spinning dashed ring
//                               Transform.rotate(
//                                 angle: _ringRotation.value,
//                                 child: CustomPaint(
//                                   size: const Size(140, 140),
//                                   painter: _DashedRingPainter(
//                                     color: accent.withOpacity(0.4),
//                                     strokeWidth: 1.5,
//                                   ),
//                                 ),
//                               ),
//                               // Reverse spinning inner ring
//                               Transform.rotate(
//                                 angle: -_ringRotation.value * 0.6,
//                                 child: CustomPaint(
//                                   size: const Size(118, 118),
//                                   painter: _DashedRingPainter(
//                                     color: accent.withOpacity(0.2),
//                                     strokeWidth: 1,
//                                     dashCount: 8,
//                                   ),
//                                 ),
//                               ),
//                               // Glowing solid border
//                               Container(
//                                 width: 112, height: 112,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(color: accent, width: 2),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: accent.withOpacity(_pulseAnim.value * 0.5),
//                                       blurRadius: 24,
//                                       spreadRadius: 4,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               // Inner faint ring
//                               Container(
//                                 width: 90, height: 90,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: Border.all(
//                                     color: accent.withOpacity(0.3),
//                                     width: 1,
//                                   ),
//                                 ),
//                               ),
//                               // Driver Number
//                               Text(
//                                 '29',
//                                 style: TextStyle(
//                                   fontFamily: 'Orbitron',
//                                   fontSize: 44,
//                                   fontWeight: FontWeight.w900,
//                                   fontStyle: FontStyle.italic,
//                                   color: accent,
//                                   shadows: [
//                                     Shadow(
//                                       color: accent.withOpacity(0.6),
//                                       blurRadius: 12,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//
//                     const SizedBox(height: 24),
//
//                     // ── NAME ──
//                     const Text(
//                       'ARAVIND',
//                       style: TextStyle(
//                         fontFamily: 'Orbitron',
//                         fontSize: 26,
//                         fontWeight: FontWeight.w900,
//                         fontStyle: FontStyle.italic,
//                         letterSpacing: 4,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//
//                     // ── ROLE BADGE ──
//                     Container(
//                       color: accent,
//                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
//                       child: const Text(
//                         'FLUTTER DEVELOPER',
//                         style: TextStyle(
//                           fontFamily: 'Orbitron',
//                           fontSize: 10,
//                           letterSpacing: 4,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 44),
//
//                     // ── F1 LIGHTS ROW ──
//                     const Text(
//                       'LIGHTS OUT AND AWAY WE GO',
//                       style: TextStyle(
//                         fontFamily: 'Orbitron',
//                         fontSize: 8,
//                         color: Colors.white38,
//                         letterSpacing: 3,
//                       ),
//                     ),
//                     const SizedBox(height: 14),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(5, (i) {
//                         final isOn = !_lightsOut && i < _litLights;
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 6),
//                           child: AnimatedContainer(
//                             duration: const Duration(milliseconds: 120),
//                             width: 18, height: 18,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: isOn ? accent : const Color(0xFF1A0000),
//                               border: Border.all(
//                                 color: isOn ? accent : const Color(0xFF2A0000),
//                               ),
//                               boxShadow: isOn
//                                   ? [BoxShadow(color: accent, blurRadius: 14, spreadRadius: 3)]
//                                   : [],
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//
//                     const SizedBox(height: 44),
//
//                     // ── LOADING BAR (Parallelogram F1 style) ──
//                     const Text(
//                       'INITIALISING SYSTEMS',
//                       style: TextStyle(
//                         fontFamily: 'Orbitron',
//                         fontSize: 8,
//                         color: Colors.white38,
//                         letterSpacing: 2,
//                       ),
//                     ),
//                     // const SizedBox(height: 10),
//                     //
//                     // AnimatedBuilder(
//                     //   animation: _loadProgress,
//                     //   builder: (_, __) {
//                     //     return SizedBox(
//                     //       width: 200, height: 8,
//                     //       child: ClipPath(
//                     //         clipper: _ParallelogramClipper(),
//                     //         child: Stack(
//                     //           children: [
//                     //             Container(color: const Color(0xFF111111)),
//                     //             FractionallySizedBox(
//                     //               widthFactor: _loadProgress.value,
//                     //               alignment: Alignment.centerLeft,
//                     //               child: Container(
//                     //                 decoration: BoxDecoration(
//                     //                   gradient: LinearGradient(
//                     //                     colors: [accent, const Color(0xFFFF6B6B)],
//                     //                   ),
//                     //                 ),
//                     //               ),
//                     //             ),
//                     //           ],
//                     //         ),
//                     //       ),
//                     //     );
//                     //   },
//                     // ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   // ── CORNER BRACKET HELPERS ──
//   List<Widget> _buildAllCorners(Color accent) {
//     return [
//       Alignment.topLeft,
//       Alignment.topRight,
//       Alignment.bottomLeft,
//       Alignment.bottomRight,
//     ].map((a) => _buildCorner(a, accent)).toList();
//   }
//
//   Widget _buildCorner(Alignment alignment, Color accent) {
//     final isTop    = alignment == Alignment.topLeft    || alignment == Alignment.topRight;
//     final isLeft   = alignment == Alignment.topLeft    || alignment == Alignment.bottomLeft;
//     final bs       = BorderSide(color: accent, width: 2);
//     final none     = BorderSide.none;
//     return Align(
//       alignment: alignment,
//       child: Padding(
//         padding: const EdgeInsets.all(28),
//         child: Container(
//           width: 26, height: 26,
//           decoration: BoxDecoration(
//             border: Border(
//               top:    isTop    ? bs : none,
//               bottom: !isTop   ? bs : none,
//               left:   isLeft   ? bs : none,
//               right:  !isLeft  ? bs : none,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ── CUSTOM PAINTERS ──
//
// class _GridPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white.withOpacity(0.018)
//       ..strokeWidth = 0.5;
//     const step = 50.0;
//     for (double x = 0; x < size.width; x += step) {
//       canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
//     }
//     for (double y = 0; y < size.height; y += step) {
//       canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
//     }
//   }
//   @override bool shouldRepaint(_) => false;
// }
//
// class _DashedRingPainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final int dashCount;
//   const _DashedRingPainter({
//     required this.color,
//     this.strokeWidth = 1.5,
//     this.dashCount = 16,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = (size.width / 2) - strokeWidth;
//     final dashAngle = (2 * math.pi) / dashCount;
//     final gapAngle = dashAngle * 0.4;
//
//     for (int i = 0; i < dashCount; i++) {
//       final startAngle = i * dashAngle;
//       canvas.drawArc(
//         Rect.fromCircle(center: center, radius: radius),
//         startAngle,
//         dashAngle - gapAngle,
//         false,
//         paint,
//       );
//     }
//   }
//   @override bool shouldRepaint(_) => false;
// }
//
// class _ParallelogramClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     const skew = 8.0;
//     return Path()
//       ..moveTo(skew, 0)
//       ..lineTo(size.width, 0)
//       ..lineTo(size.width - skew, size.height)
//       ..lineTo(0, size.height)
//       ..close();
//   }
//   @override bool shouldReclip(_) => false;
// }
//

//old main.dart

//
//
// import 'package:flutter/material.dart';
//
// import 'package:my_resume/pages/MainPage.dart';
// import 'package:my_resume/pages/SplashPage.dart';
//
// final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeMode>(
//       valueListenable: themeNotifier,
//       builder: (_, mode, __) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           // Upgraded to Material 3 styling
//           theme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.light),
//             useMaterial3: true,
//             fontFamily: 'Lora', // Standardized clean font
//           ),
//           darkTheme: ThemeData(
//             colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, brightness: Brightness.dark),
//             useMaterial3: true,
//             fontFamily: 'Lora',
//           ),
//           themeMode: mode, // Listens to the global switch
//           initialRoute: 'splash_page',
//           routes: {
//             'splash_page': (context) => const SplashPage(),
//             'main_page': (context) => const Mainpage(),
//           },
//         );
//       },
//     );
//   }
// }
//
// Void _login() {
//   if (_nameController.text.isNotEmpty && _emailController.Text.isNotEmpty) {
//     setState(() {
//       _userName = _nameController.text.trim();
//       _userEmail = _emailController.text.trim().toLowerCase();
//       _isLoggedIn = true;
//     });
//     _checkAndSendWelcomeMessage();
//   }
// }

// Telemntary Lines

// Positioned(
//   left: size.width * 0.25,
//   top: 0, bottom: 0,
//   child: Container(
//     width: 3,
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Colors.transparent, accent, Colors.transparent],
//       ),
//     ),
//   ),
// ),
// Positioned(
//   left: size.width * 0.27,
//   top: 0, bottom: 0,
//   child: Container(
//     width: 1,
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Colors.transparent, accent.withOpacity(0.3), Colors.transparent],
//       ),
//     ),
//   ),
// ),
//
// Positioned(
//   right: size.width * 0.25,
//   top: 0, bottom: 0,
//   child: Container(
//     width: 3,
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Colors.transparent, accent, Colors.transparent],
//       ),
//     ),
//   ),
// ),
// Positioned(
//   right: size.width * 0.27,
//   top: 0, bottom: 0,
//   child: Container(
//     width: 1,
//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//         colors: [Colors.transparent, accent.withOpacity(0.3), Colors.transparent],
//       ),
//     ),
//   ),
// ),

//Contact page code

// ─── HELPER FOR THE CONTACT TILES (Fixed for 3D Rendering) ───
//   Widget _buildContactTile({
//     required String label,
//     required String value,
//     required dynamic icon,
//     required Color accentColor,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         // TODO: Add url_launcher logic here to open the links when tapped!
//         print("Tapped $label");
//       },
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(8),
//         child: Container(
//           decoration: BoxDecoration(
//             color: const Color(0xFF152226), // Lighter slate for contrast
//             // A sharp colored accent line on the left side of each card
//             border: Border(
//               left: BorderSide(color: accentColor, width: 4),
//               top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
//               right: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
//               bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
//             ),
//           ),
//           // Moved the padding directly into the container
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//           child: Row(
//             children: [
//               FaIcon(icon, size: 24, color: Colors.white70),
//               const SizedBox(width: 20),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min, // 🚨 Ensures the column doesn't break constraints
//                   children: [
//                     Text(
//                       label,
//                       style: TextStyle(
//                         fontFamily: 'Chakra Petch',
//                         color: Colors.white.withValues(alpha: 0.4),
//                         fontSize: 10,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 2,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       value,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//               FaIcon(FontAwesomeIcons.chevronRight, size: 12, color: Colors.white.withValues(alpha: 0.2)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// ─── ADMIN VIEW: THE USER FLOW DIRECTORY ───
class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});
  bool _isLoggedIn = false;
  String _userName = "";
  String _userEmail = "";

  bool _isAdmin = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _chatController = TextEditingController();

  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    _loadSession();
  }

  // ─── SESSION PERSISTENCE ───
  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('userName');
    final savedEmail = prefs.getString('userEmail');

    if (savedName != null && savedEmail != null) {
      setState(() {
        _userName = savedName;
        _userEmail = savedEmail;
        _isLoggedIn = true;
        _isAdmin = (savedName == 'Aravind' || savedEmail == 'judo2829@gmail.com');
      });
    }
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim().toLowerCase();

    // Check if fields are empty
    if (name.isEmpty || email.isEmpty) {
      _showErrorBadge("ERROR: CREDENTIALS AND UPLINK ADDRESS REQUIRED.");
      return;
    }

    // Check for a basic valid email format
    if (!email.contains('@') || !email.contains('.')) {
      _showErrorBadge("ERROR: INVALID UPLINK FORMAT. VERIFY EMAIL.");
      return;
    }

    // 1. Determine if this is the Creator
    final bool isCreator = (name == 'Aravind' || email == 'judo2829@gmail.com');

    // 2. Save session to device memory
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);

    // 3. Update UI State
    setState(() {
      _userName = name;
      _userEmail = email;
      _isLoggedIn = true;
      _isAdmin = isCreator;
    });

    // 4. Only initialize a chat database for standard guests
    if (!isCreator) {
      _checkAndSendWelcomeMessage();
    }

    // // If validations pass, proceed with login
    // setState(() {
    //   _userName = name;
    //   _userEmail = email;
    //   _isLoggedIn = true;
    // });
    //
    // _checkAndSendWelcomeMessage();
  }

  Future<void> _logout() async {
    // 🚨 NEW: Wipe device memory on logout
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      _isLoggedIn = false;
      _isAdmin = false;
      _userName = "";
      _userEmail = "";
      _nameController.clear();
      _emailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFE10600);
    const aiAccent = Color(0xFF00E5FF);
    return Stack(
      children: [

        // ── TELEMETRY GRID BACKGROUND (Fills the black holes) ──
        Positioned.fill(
          child: GridPaper(
            color: Colors.white.withValues(alpha: 0.03),
            divisions: 2,
            subdivisions: 4,
            interval: 100,
          ),
        ),

        // ── ANGLED RACING STRIPE (Fixed) ──
        Positioned(
          top: -200, // Locked to the top right
          right: -50,
          child: Transform.rotate(
            angle: -math.pi / 6,
            child: Container(
              width: 800,
              height: 2000,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                    const Color(0xFFE10600).withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -200, // Locked to the top right
          left: -50,
          child: Transform.rotate(
            angle: -math.pi / 6,
            child: Container(
              width: 800,
              height: 2000,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                    const Color(0xFFE10600).withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: -150, left: -100,
          child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withValues(alpha: 0.08), blurRadius: 150)])),
        ),
        SafeArea(
          child: Column(
            children: [
              _buildAppBar(accentColor),
            ],
          ),
        ),

        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('inquiries').orderBy('lastActive', descending: true).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFFE10600)));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text("NO ACTIVE UPLINKS REGISTERED.", style: TextStyle(color: Colors.white38, fontFamily: 'Orbitron', fontSize: 12)));
            }

            final users = snapshot.data!.docs;

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final userData = users[index].data() as Map<String, dynamic>;
                final String name = userData['name'] ?? 'Anonymous Guest';
                final String email = userData['email'] ?? 'Unknown Uplink';

                // Don't show yourself in the telemetry tracking list
                if (name == 'Aravind' || email == "judo2829@gmail.com") return const SizedBox.shrink();

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF152226).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    title: Text(name.toUpperCase(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Orbitron', fontSize: 14, letterSpacing: 1.5)),
                    trailing: const Icon(Icons.analytics_outlined, color: Color(0xFFE10600), size: 20),
                    onTap: () {
                      // Navigate into read-only Ghost Mode for this specific user stream
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GhostChatView(userEmail: email, userName: name),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
  Widget _buildAppBar(Color accentColor) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: _isLoggedIn ? [BoxShadow(color: accentColor.withValues(alpha: 0.5), blurRadius: 15)] : [],
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: _isLoggedIn ? accentColor : Colors.white.withValues(alpha: 0.05),
              child: Text(_isLoggedIn ? _userName[0].toUpperCase() : "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
          Text("CHAT WITH JUDO", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: isMobile ? 3 : 5, fontSize: isMobile ? 14 : 14, color: Colors.white)),
          _isLoggedIn ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout) : const SizedBox(width: 40),
        ],
      ),
    );
  }
}

// ─── GHOST CHAT VIEW: READ-ONLY TELEMETRY OVERLAY ───
class GhostChatView extends StatelessWidget {
  final String userEmail;
  final String userName;

  const GhostChatView({super.key, required this.userEmail, required this.userName});
  bool _isLoggedIn = false;
  String _userName = "";
  String _userEmail = "";

  bool _isAdmin = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _chatController = TextEditingController();

  late AnimationController _gridController;

  @override
  void initState() {
    super.initState();
    _gridController = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    _loadSession();
  }

  // ─── SESSION PERSISTENCE ───
  Future<void> _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('userName');
    final savedEmail = prefs.getString('userEmail');

    if (savedName != null && savedEmail != null) {
      setState(() {
        _userName = savedName;
        _userEmail = savedEmail;
        _isLoggedIn = true;
        _isAdmin = (savedName == 'Aravind' || savedEmail == 'judo2829@gmail.com');
      });
    }
  }

  @override
  void dispose() {
    _gridController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim().toLowerCase();

    // Check if fields are empty
    if (name.isEmpty || email.isEmpty) {
      _showErrorBadge("ERROR: CREDENTIALS AND UPLINK ADDRESS REQUIRED.");
      return;
    }

    // Check for a basic valid email format
    if (!email.contains('@') || !email.contains('.')) {
      _showErrorBadge("ERROR: INVALID UPLINK FORMAT. VERIFY EMAIL.");
      return;
    }

    // 1. Determine if this is the Creator
    final bool isCreator = (name == 'Aravind' || email == 'judo2829@gmail.com');

    // 2. Save session to device memory
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setString('userEmail', email);

    // 3. Update UI State
    setState(() {
      _userName = name;
      _userEmail = email;
      _isLoggedIn = true;
      _isAdmin = isCreator;
    });

    // 4. Only initialize a chat database for standard guests
    if (!isCreator) {
      _checkAndSendWelcomeMessage();
    }

    // // If validations pass, proceed with login
    // setState(() {
    //   _userName = name;
    //   _userEmail = email;
    //   _isLoggedIn = true;
    // });
    //
    // _checkAndSendWelcomeMessage();
  }

  Future<void> _logout() async {
    // 🚨 NEW: Wipe device memory on logout
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      _isLoggedIn = false;
      _isAdmin = false;
      _userName = "";
      _userEmail = "";
      _nameController.clear();
      _emailController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    const accentColor = Color(0xFFE10600);
    const aiAccent = Color(0xFF00E5FF);

    return Container(
      color: const Color(0xFF0D1618),
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: [

          // ── TELEMETRY GRID BACKGROUND (Fills the black holes) ──
          Positioned.fill(
            child: GridPaper(
              color: Colors.white.withValues(alpha: 0.03),
              divisions: 2,
              subdivisions: 4,
              interval: 100,
            ),
          ),

          // ── ANGLED RACING STRIPE (Fixed) ──
          Positioned(
            top: -200, // Locked to the top right
            right: -50,
            child: Transform.rotate(
              angle: -math.pi / 6,
              child: Container(
                width: 800,
                height: 2000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                      const Color(0xFFE10600).withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -200, // Locked to the top right
            left: -50,
            child: Transform.rotate(
              angle: -math.pi / 6,
              child: Container(
                width: 800,
                height: 2000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1A1A1A).withValues(alpha: 0.5),
                      const Color(0xFFE10600).withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -150, left: -100,
            child: Container(width: 400, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: aiAccent.withValues(alpha: 0.08), blurRadius: 150)])),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildAppBar(accentColor),
              ],
            ),
          ),

          Column(
            children: [

              Text(
                'MONITORING ${userName.toUpperCase()}',
                style: const TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2
                ),
              ),

              Stack(
                children: [
                  Positioned.fill(
                    child: GridPaper(
                      color: Colors.white.withValues(alpha: 0.02),
                      divisions: 2,
                      subdivisions: 4,
                      interval: 100,
                    ),
                  ),
                  SafeArea(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('inquiries').doc(userEmail).collection('messages').orderBy('timestamp', descending: true).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator(color: accentColor));
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) return const Center(child: Text("NO MESSAGES IN LOG.", style: TextStyle(color: Colors.white38)));

                        final messages = snapshot.data!.docs;

                        // 🚨 NOTICE: The input field block is completely absent here. Totally read-only!
                        return ListView.builder(
                          reverse: true,
                          padding: const EdgeInsets.all(24),
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final msgData = messages[index].data() as Map<String, dynamic>;
                            final bool isAI = msgData['isAI'] ?? false;
                            final String sender = msgData['sender'] ?? 'Unknown';
                            final String text = msgData['text'] ?? '';
                            Color bubbleTheme = isAI ? aiAccent : accentColor;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              alignment: isAI ? Alignment.centerLeft : Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E1E1E),
                                  border: Border.all(color: bubbleTheme.withValues(alpha: 0.4), width: 1.0),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(isAI ? FontAwesomeIcons.brain : FontAwesomeIcons.userSecret, size: 10, color: bubbleTheme),
                                        const SizedBox(width: 6),
                                        Text(sender.toUpperCase(), style: TextStyle(color: bubbleTheme, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(text, style: const TextStyle(color: Colors.white, fontSize: 11, height: 1.3, letterSpacing: 1.5)),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }
  Widget _buildAppBar(Color accentColor) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: _isLoggedIn ? [BoxShadow(color: accentColor.withValues(alpha: 0.5), blurRadius: 15)] : [],
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: _isLoggedIn ? accentColor : Colors.white.withValues(alpha: 0.05),
              child: Text(_isLoggedIn ? _userName[0].toUpperCase() : "", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
            ),
          ),
          Text("CHAT WITH JUDO", style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: isMobile ? 3 : 5, fontSize: isMobile ? 14 : 14, color: Colors.white)),
          _isLoggedIn ? IconButton(icon: const Icon(Icons.power_settings_new, color: Color(0xFFE10600)), onPressed: _logout) : const SizedBox(width: 40),
        ],
      ),
    );
  }
}

// // ─── Helper for the White Racing Stripes ───
// Widget _buildVerticalStripes() {
//   return Row(
//     children: [
//       Container(
//         width: 10,
//         height: 120,
//         color: Colors.white,
//       ),
//       const SizedBox(width: 6),
//       Container(
//         width: 4,
//         height: 120,
//         color: Colors.white,
//       ),
//     ],
//   );
// }


// ─── Temporary Back Widget ───
//   Widget _buildBack(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF141414), // Base color for the bottom half
//
//       body:  Column(
//         children: [
//           // ─── TOP HALF: THE F1 RED ZONE ───
//           Expanded(
//             flex: 50, // Forces this section to take exactly 55% of the height
//             child: Container(
//               width: double.infinity,
//               color: const Color(0xFFE10600), // Pure F1 Red
//               child: Stack(
//                 children: [
//                   // 1. TOP HEADER & TIMER (Pushed down from status bar)
//                   Positioned(
//                     top: 10,
//                     left: 0,
//                     right: 0,
//                     child: Column(
//                       children: [
//                         Text(
//                           "PERSONAL CENTER",
//                           style: TextStyle(
//                             fontFamily: 'Orbitron',
//                             color: Colors.white,
//                             fontSize: 13,
//                             fontWeight: FontWeight.bold,
//                             letterSpacing: 2.0,
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         Text(
//                           "LIFE GRAND PRIX",
//                           style: TextStyle(
//                             fontFamily: 'Orbitron',
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w900,
//                             fontStyle: FontStyle.italic,
//                             letterSpacing: 3.0,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           _liveAge,
//                           style: const TextStyle(
//                             fontFamily: 'Orbitron',
//                             color: Colors.white,
//                             fontSize: 13,
//                             fontWeight: FontWeight.w900,
//                             fontStyle: FontStyle.italic,
//                             letterSpacing: 2.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                   // 2. THE MASSIVE "29"
//                   Positioned(
//                     bottom: 230, // Sits directly on the name banner
//                     left: -50,
//                     right: -20,
//                     child: Text(
//                       "29",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Orbitron',
//                         fontSize: 260, // Massive size
//                         fontWeight: FontWeight.w900,
//                         fontStyle: FontStyle.italic,
//                         color: Colors.black.withValues(alpha: 0.25), // Subtle dark shadow
//                         height: 0.85,
//                       ),
//                     ),
//                   ),
//
//                   // 3. YOUR IMAGE (Perfect Waist Crop)
//                   Positioned(
//                     bottom: 80, // Rests precisely on top of the banner
//                     left: 20, // Add slight padding so you aren't touching screen edges
//                     right: 20,
//                     height: size.height * 0.32, // The fixed "window" height for your body
//                     child: ClipRect(
//                       child: FittedBox(
//                         fit: BoxFit.cover, // Scales width to fit, chops off bottom excess (legs)
//                         alignment: Alignment.topCenter, // Keeps your head visible at the top
//                         child: Image.asset(
//                           'assets/images/mine.png',
//                           width: size.width,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // 3.5 THE UPWARD GLOW (Waist Fade Effect)
//                   Positioned(
//                     bottom: 110, // Sits exactly at the top edge of the 90px name banner
//                     left: 0,
//                     right: 0,
//                     height: 70, // How high the glow reaches up the body
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                           colors: [
//                             const Color(0xFFE10600), // Solid background red at the bottom
//                             const Color(0xFFE10600).withValues(alpha: 0.0), // Fades to transparent going up
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // 4. BOTTOM NAME BANNER & FOOTER
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     right: 0,
//                     height: 120, // Fixed rigid height
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Color(0xFFC00000), // Distinct boundary line
//                             Color(0xFF900000), // Fades to darker red
//                           ],
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           // Left Side: Your Name
//                           Positioned(
//                             top: 8,
//                             left: 20,
//                             right: 20,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       "Aravind",
//                                       style: TextStyle(
//                                         fontFamily: 'Caveat',
//                                         color: Colors.white,
//                                         fontSize: 40,
//                                         fontWeight: FontWeight.w900,
//                                         letterSpacing: 1.5,
//                                       ),
//                                     ),
//                                     Padding( // Replaced invalid 'Positioned' inside Column
//                                       padding: EdgeInsets.only(left: 10, bottom: 20),
//                                       child: Text(
//                                         "Senthilvelan",
//                                         style: TextStyle(
//                                           fontFamily: 'Orbitron',
//                                           color: Colors.white,
//                                           fontSize: 15,
//                                           fontStyle: FontStyle.italic,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const BlinkingLiveBadge(),
//                               ],
//                             ),
//                           ),
//
//                           // Bottom Left: "Built by" text
//                           Positioned(
//                             bottom: 10,
//                             left: 20,
//                             child: const Text(
//                               "Race Centre built by Aravind",
//                               style: TextStyle(
//                                 fontFamily: 'Orbitron',
//                                 color: Colors.white70,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           // ─── BOTTOM HALF: THE BLACK MENU ZONE ───
//           Expanded(
//             flex: 45, // Forces this section to take the remaining 45% of the height
//             child: Container(
//               width: double.infinity,
//               color: const Color(0xFF141414), // F1 App dark background color
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const [
//                     Text(
//                       "BOTTOM HALF RESERVED\nFOR NAVIGATION MENUS",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontFamily: 'Orbitron',
//                         color: Colors.white54,
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.5,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }


// MAIN PAGE OLD CODE
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:url_launcher/link.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class Mainpage extends StatefulWidget {
//   const Mainpage({super.key});
//
//   @override
//   State<Mainpage> createState() => _MainpageState();
// }
//
// class _MainpageState extends State<Mainpage> {
//
//   final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final size = MediaQuery.of(context).size;
//     final double screenWidth = size.width;
//
//     return
//
//     ValueListenableBuilder(
//         valueListenable: _notifier,
//         builder: (
//             (_, mode, __){
//
//               return MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 theme: ThemeData.light(),
//                 themeMode: mode,
//                 darkTheme: ThemeData.dark(),
//
//                 home: Scaffold(
//
//                   backgroundColor: Colors.cyan.shade400,
//
//                   appBar: AppBar(
//                     backgroundColor: Colors.transparent,
//                     automaticallyImplyLeading: false,
//                     centerTitle: true ,
//
//                     leading: IconButton(
//                       onPressed: (){
//                         showDialog(context: context,
//                           builder: (context)=> AlertDialog(
//
//                             backgroundColor: Colors.tealAccent,
//
//                             actions: [
//                               Link(
//                                   uri: Uri.parse('https://aravind-jd.github.io/My_Portfolio/'),
//                                   builder: ((context, followLink)=>
//                                       TextButton(
//                                         onPressed: followLink,
//                                         child: Text(
//                                             "Portfolio",
//                                           style: TextStyle(
//                                             fontFamily: "GreyQo",
//                                             fontSize: 30,
//                                           ),
//                                         ),
//                                       )
//                                   )
//                               ),
//                               Link(
//                                   uri: Uri.parse('https://aravind-jd.github.io/Resume/resume.html'),
//                                   builder: ((context, followLink)=>
//                                       TextButton(
//                                         onPressed: followLink,
//                                         child: Text(
//                                             "Resume",
//                                           style: TextStyle(
//                                             fontFamily: "GreyQo",
//                                             fontSize: 30,
//                                           ),
//                                         ),
//                                       )
//                                   )
//                               ),
//                             ],
//
//                             title: const Text(
//                               "Profile",
//                               style: TextStyle(
//                                 fontFamily: "GreyQo",
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 30,
//                               ),
//                             ),
//
//                           ),
//
//                         );
//
//                       },
//
//                       icon: Icon(
//                         Icons.account_circle_outlined,
//                       ),
//
//                     ),
//
//                     actions: [
//
//                       IconButton(
//                           onPressed: (){
//                             showDialog(context: context,
//                               builder: (context)=> AlertDialog(
//                                 backgroundColor: Colors.tealAccent,
//                                 actions: [
//                                   Link(
//                                       uri: Uri.parse('https://github.com/Aravind2810'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.github,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                   Link(
//                                       uri: Uri.parse('https://www.linkedin.com/in/aravind-s-390469231/'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.linkedin,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                   Link(
//                                       uri: Uri.parse('https://www.instagram.com/its._me._jd/#'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.instagram,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                   Link(
//                                       uri: Uri.parse('https://wa.me/qr/VCTGLGB2LA5JP1'),
//                                       builder: ((context, followLink)=>
//                                           IconButton(
//                                             onPressed: followLink,
//                                             icon: FaIcon(
//                                               FontAwesomeIcons.whatsapp,
//                                             ),
//                                           )
//                                       )
//                                   ),
//                                 ],
//                                 title: const Text(
//                                   "Contact  Me",
//                                   style: TextStyle(
//                                     fontFamily: "GreyQo",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 30,
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                           icon: Icon(
//                             Icons.menu_rounded,
//                           )
//                       ),
//
//                     ],
//
//                     title: Text(
//                       "My Resume",
//                       style: TextStyle(
//                         fontFamily: "Caveat",
//                         fontSize: 22.0,
//                       ),
//                     ),
//
//                   ),
//
//                   body: SingleChildScrollView(
//
//                     child: Stack(
//                       children: <Widget>[
//
//
//                         ClipPath(
//                           clipper: CustomShape(),
//                           child: Container(
//                             height: 300.0,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 colors: [Colors.blueAccent, Colors.lightBlueAccent],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                         Align(
//                           alignment: Alignment.center,
//
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//
//                               SizedBox(
//                                   height: 120.0
//                               ),
//
//                               CircleAvatar(
//                                 radius: 80.0,
//                                 backgroundImage: AssetImage('assets/images/me.png'),
//                               ),
//
//                               SizedBox(
//                                   height: 10.0
//                               ),
//
//                               Text(
//                                 'Aravind Senthilvelan',
//                                 style: TextStyle(
//                                   fontSize: 22.0,
//                                   fontFamily: "Kalam",
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//
//                               Text(
//                                 'Mobile App Developer',
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "Tangerine",
//                                 ),
//                               ),
//
//                               SizedBox(
//                                 height: 20.0,
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//
//                                       Text(
//                                         "Education",
//                                         style: TextStyle(
//                                             fontFamily: "Lora",
//                                             fontWeight: FontWeight.bold
//                                         ),
//                                       ),
//
//                                       SizedBox(
//                                         height: 10.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//
//                                           FaIcon(
//                                             FontAwesomeIcons.university,
//                                           ),
//
//                                           SizedBox(
//                                             width: 10.0,
//                                           ),
//
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//
//                                               //Education
//
//                                               Text(
//                                                 'Current Course',
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Bachelor of Engineering - ECE",
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Sri Eshwar College of Engineering - 2021-2025",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               //Experience
//
//
//
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black,
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//
//                                           Icon(
//                                             Icons.school_rounded,
//                                           ),
//
//                                           SizedBox(
//                                             width: 10.0,
//                                           ),
//
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//
//                                               //Education
//
//                                               Text(
//                                                 'Schooling',
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Completed my H.S.C. with 84.6%",
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "P.K.D.M.H.S.S - 2020-2021",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black,
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         children: [
//
//                                           Icon(
//                                             Icons.school_rounded,
//                                           ),
//
//                                           SizedBox(
//                                             width: 10.0,
//                                           ),
//
//                                           Column(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//
//                                               //Education
//
//                                               Text(
//                                                 'Schooling',
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "Completed my S.S.L.C. with 86.4%",
//                                                 style: TextStyle(
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//                                               Text(
//                                                 "P.K.D.M.H.S.S - 2018-2019",
//                                                 style: TextStyle(
//                                                   fontSize: 10.0,
//                                                   fontFamily: "Lora",
//                                                 ),
//                                               ),
//
//
//                                             ],
//                                           ),
//
//                                         ],
//                                       ),
//
//                                     ],
//                                   )
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     children: [
//
//                                       Text(
//                                         "Projects",
//                                         style: TextStyle(
//                                           fontFamily: "Lora",
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Chatosic',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Multi working mobile application in which music can be heard and call can be made with the mobile number.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind2810/Chatosic'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Resume Displayer',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Mobile application made for myself to display my digital resume and my profile.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind-jd/My_Resume_Displayer'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'QR Code Generator',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Mobile application to generate qr codes.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind-jd/qr_code_scanner'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Jd Project',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A Mobile application made by myself while I started learning Mobile app development.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://github.com/Aravind2810/flutter_project_1'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             )
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'My Portfolio',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "My Portfolio to display myself in a web page with all project links, with my study details, with my personal details, with my contact details and also with my updated resume.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                             uri: Uri.parse('https://aravind-jd.github.io/My_Portfolio/'),
//                                             builder: ((context, followLink)=>
//                                                 IconButton(
//                                                   onPressed: followLink,
//                                                   icon: FaIcon(
//                                                     FontAwesomeIcons.github,
//                                                   ),
//                                                 )
//                                             ),
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Book-Store',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "A web application used as open source in which book lovers can access books of their interest and can enjoy reading the book through online.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                         trailing: Link(
//                                           uri: Uri.parse('https://github.com/Aravind2810/Book-Store'),
//                                           builder: ((context, followLink)=>
//                                               IconButton(
//                                                 onPressed: followLink,
//                                                 icon: FaIcon(
//                                                   FontAwesomeIcons.github,
//                                                 ),
//                                               )
//                                           ),
//                                         ),
//
//                                       ),
//
//                                     ],
//                                   ),
//
//
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//
//                                       Text(
//                                         "Skills",
//                                         style: TextStyle(
//                                           fontFamily: "Lora",
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Flutter ",
//                                             style: TextStyle(
//                                               fontFamily: "Kalam",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "90%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.9,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             linearStrokeCap: LinearStrokeCap.roundAll,
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Dart    ",
//                                             style: TextStyle(
//                                               fontFamily: "Kalam",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "90%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.9,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Html,CSS",
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                               fontFamily: "Kalam",
//                                               fontWeight: FontWeight.bold
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "70%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.7,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "SQL     ",
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                                 fontFamily: "Kalam",
//                                                 fontWeight: FontWeight.bold
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "60%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.6,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Divider(),
//
//                                       SizedBox(
//                                         height: 5.0,
//                                       ),
//
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                         children: [
//
//                                           Text(
//                                             "Program ",
//                                             textAlign: TextAlign.start,
//                                             style: TextStyle(
//                                                 fontFamily: "Kalam",
//                                                 fontWeight: FontWeight.bold
//                                             ),
//                                           ),
//
//                                           LinearPercentIndicator(
//                                             width: 200.0,
//                                             trailing: Text(
//                                               "60%",
//                                               style: TextStyle(
//                                                 fontFamily: "Lora",
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ),
//                                             lineHeight: 5.0,
//                                             percent: 0.6,
//                                             animation: true,
//                                             animationDuration: 2000,
//                                             barRadius: Radius.circular(10),
//                                             backgroundColor: Colors.grey,
//                                             progressColor: Colors.redAccent,
//                                           ),
//
//                                         ],
//                                       ),
//
//                                     ],
//                                   ),
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//
//                                   child: ListTile(
//
//                                     title: Text(
//                                       'Summary',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontFamily: "Lora"
//                                       ),
//                                     ),
//
//                                     subtitle: Text(
//                                       'A Mobile App Developer with a passion for developing innovative applications that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and to create reliable, user-friendly applications.',
//                                       style: TextStyle(
//                                         fontFamily: "Lora",
//                                       ),
//                                     ),
//
//                                   ),
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Column(
//                                     children: [
//
//                                       Text(
//                                         "Other Skills",
//                                         style: TextStyle(
//                                           fontFamily: "Lora",
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.left,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Poster Designer',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "I'm a poster designer which is one of my hobby and I worked in some of the events as a poster designer in my college."
//                                               " ""And I have been the media team head for some events and also I organised some of the events.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'Photography',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "I love taking photos and I have a craze in photography."
//                                               " "
//                                           "And also I have knowledge in operating a Camera."
//                                           ,
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                       ),
//
//                                       Divider(
//                                         color: Colors.black87,
//                                       ),
//
//                                       ListTile(
//
//                                         title: Text(
//                                           'NCC Troop Commander',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontFamily: "Lora"
//                                           ),
//                                         ),
//
//                                         subtitle: Text(
//                                           "I have been in NCC in my school for two years and attended three camps."
//                                               " "
//                                               "And also I lead my NCC troop as commander for one year and lead the troop in one of the camp.",
//                                           style: TextStyle(
//                                             fontFamily: "Lora",
//                                           ),
//                                         ),
//
//                                       ),
//
//                                     ],
//                                   ),
//
//
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//
//                                       CircleAvatar(
//
//                                         radius: 20.0,
//                                         backgroundImage: AssetImage(
//                                           'assets/images/email_me.jpeg',
//                                         ),
//
//                                       ),
//
//                                       SizedBox(
//                                         width: 15.0,
//                                       ),
//
//                                       Column(
//                                         children: [
//
//                                           Text(
//                                             'Email Me',
//
//                                             style: TextStyle(
//                                               fontFamily: "Lora",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           Text(
//                                             'aravindhemaa599@gmail.com',
//                                             style: TextStyle(
//                                               fontFamily: "lora",
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         width: 30.0,
//                                       ),
//
//                                       Icon(
//                                         Icons.mail_rounded,
//
//                                       ),
//
//                                     ],
//                                   ),
//
//                                 ),
//
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//
//                                 child: Padding(
//                                   padding: EdgeInsets.all(10),
//
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//
//                                       CircleAvatar(
//
//                                         radius: 20.0,
//                                         foregroundImage: AssetImage(
//                                           'assets/images/callbox.png',
//
//                                         ),
//
//                                       ),
//
//                                       SizedBox(
//                                         width: 50.0,
//                                       ),
//
//                                       Column(
//                                         children: [
//
//                                           Text(
//                                             'Phone',
//                                             textAlign: TextAlign.center,
//                                             style: TextStyle(
//                                               fontFamily: "Lora",
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//
//                                           Text(
//                                             '+91 89034 27447',
//                                             style: TextStyle(
//                                               fontFamily: "lora",
//                                               fontWeight: FontWeight.normal,
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       SizedBox(
//                                         width: 75.0,
//                                       ),
//
//                                       Icon(
//                                         Icons.call_rounded,
//                                       )
//
//                                     ],
//                                   ),
//
//                                 ),
//
//                                 // child: ListTile(
//                                 //   title: Text(
//                                 //     'Email Me',
//                                 //     style: TextStyle(
//                                 //         fontWeight: FontWeight.bold,
//                                 //         fontFamily: "Lora"
//                                 //     ),
//                                 //   ),
//                                 //
//                                 //   subtitle: Text('aravindhemaa599gmail.com'),
//                                 //   trailing: Icon(Icons.mail_rounded),
//                                 //
//                                 // ),
//                               ),
//
//                               Card(
//                                 margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                                 child: ListTile(
//                                   title: Text(
//                                     'Address',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: "Lora"
//                                     ),
//                                   ),
//                                   subtitle: Text(
//                                       '9/254, Ponmuthunagar, Vadugapalayam, Pollachi, Coimbatore, TamilNadu, India - 642001',
//                                     style: TextStyle(
//                                       fontFamily: "Lora",
//                                     ),
//                                   ),
//                                   onTap: () {
//                                     // Handle editing
//                                   },
//                                 ),
//                               ),
//
//                               Container(
//                                 width: screenWidth,
//                                 height: 40.0,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   color: Colors.black,
//
//                                 ),
//
//                                 child: Padding(
//                                     padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                                   child: Text(
//                                     "\u00a9 2024 Aravind. All rights reserved.",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontFamily: "Lora",
//                                         color: Colors.white
//                                     ),
//                                   ),
//                                 ),
//
//                               ),
//
//                             ],
//                           ),
//
//                         ),
//
//
//                       ],
//
//                     ),
//
//                   ),
//
//                 ),
//
//               );
//
//             }
//         ),
//     );
//
//   }
//
// }
//
//
// class CustomShape extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height - 100);
//
//     var firstControlPoint = Offset(size.width / 2, size.height);
//     var firstEndPoint = Offset(size.width, size.height - 100.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//
//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// Code from MainPage for clicking on links and move to external app
// onTap: () async {
//   await Future.delayed(const Duration(milliseconds: 500));
//   final Uri url = Uri.parse(sourceLink);
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url, mode: LaunchMode.externalApplication);
//   }
//   debugPrint("LAUNCHING ${title} SOURCE CODE");
// },

// Code from ChatAiPage
// // ─── SESSION PERSISTENCE ───
// Future<void> _loadSession() async {
//   final prefs = await SharedPreferences.getInstance();
//   final savedName = prefs.getString('userName');
//   final savedEmail = prefs.getString('userEmail');
//
//   if (savedName != null && savedEmail != null) {
//     setState(() {
//     });
//   }
// }

//Code from Contactpage for flipping function
// void _toggleFlip() {
//   if (_isFront) {
//     _flipController.forward();
//   } else {
//     _flipController.reverse();
//   }
//   _isFront = !_isFront;
// }

// Menu items color changing when active and inactive
// decoration: BoxDecoration(
//   color: isActive
//       ? const Color(0xFF141414) // Active Red
//       : const Color(0xFF141414), // Inactive Dark Grey
//   borderRadius: BorderRadius.circular(50), // Pill shape
// ),


// Code for tech stacks f1 style chart
// Container(
//   width: double.infinity,
//   decoration: BoxDecoration(
//     color: const Color(0xFF151515),
//     border: Border.all(color: Colors.white10),
//     borderRadius: BorderRadius.circular(8),
//   ),
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(8),
//     // This calls a live, customized GitHub stat card for your actual profile
//     child: SvgPicture.network(
//       'https://github-readme-stats.vercel.app/api/top-langs/?username=Aravind-jd&layout=compact&hide_border=true&bg_color=151515&text_color=ffffff&title_color=E10600',
//       fit: BoxFit.contain,
//       placeholderBuilder: (BuildContext context) => const SizedBox(
//         height: 150,
//         child: Center(child: CircularProgressIndicator(color: Color(0xFFE10600))),
//       ),
//       errorBuilder: (context, error, stackTrace) => const SizedBox(
//         height: 150,
//         child: Center(child: Text("TELEMETRY FEED OFFLINE", style: TextStyle(fontFamily: "Orbitron", color: Colors.white54, fontWeight: FontWeight.bold))),
//       ),
//     ),
//   ),
// ),



Future<void> _login() async {
  final name = _nameController.text.trim();
  final email = _emailController.text.trim().toLowerCase();

  // Check if fields are empty
  if (name.isEmpty || email.isEmpty) {
    _showErrorBadge("ERROR: CREDENTIALS AND UPLINK ADDRESS REQUIRED.");
    return;
  }

  // Check for a basic valid email format
  if (!email.contains('@') || !email.contains('.')) {
    _showErrorBadge("ERROR: INVALID UPLINK FORMAT. VERIFY EMAIL.");
    return;
  }

  // 1. Determine if this is the Creator
  final bool isCreator = (name == 'Aravind' || email == 'judo2829@gmail.com');

  // 2. Save session to device memory
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('userName', name);
  await prefs.setString('userEmail', email);

  // 3. Update UI State
  setState(() {
    _userName = name;
    _userEmail = email;
    _isLoggedIn = true;
    _isAdmin = isCreator;
  });

  // 4. Only initialize a chat database for standard guests
  if (!isCreator) {
    _checkAndSendWelcomeMessage();
  }
}

// Helper method to show the F1-themed error pop-up
void _showErrorBadge(String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'Orbitron',
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFE10600), // Ferrari Red
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.white24, width: 1),
      ),
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
    ),
  );
}

Future<void> _checkAndSendWelcomeMessage() async {
  final userDocRef = FirebaseFirestore.instance.collection('inquiries').doc(_userEmail);

  // Create the root index so the Admin panel can find this user
  await userDocRef.set({
    'name': _userName,
    'email': _userEmail,
    'lastActive': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  final query = await userDocRef.collection('messages').limit(1).get();

  // Send the initial AI message
  if (query.docs.isEmpty) {
    await userDocRef.collection('messages').add({
      'sender': 'Judo',
      'text': 'Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
      'isAI': true,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

Future<void> _sendMessage() async {
  if (_chatController.text.trim().isEmpty) return;

  String userText = _chatController.text.trim();
  _chatController.clear();

  await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
    'sender': _userName,
    'text': userText,
    'isAI': false,
    'timestamp': FieldValue.serverTimestamp(),
  });

  await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).set({
    'lastActive': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));

  _generateAIResponse(userText);
}

Future<void> _generateAIResponse(String userMessage) async {
  const String apiKey = 'AIzaSyA_3PCodhJtA8NTexIXcR7Rd_6BQZF9MkA';

  try {
    final model = GenerativeModel(
      model: 'gemini-2.5-flash',
      apiKey: apiKey,
      systemInstruction: Content.system(
          "You are 'Judo', a highly advanced, hyper-intelligent AI assistant of Aravind\n. "
              "You have two absolute directives: "
              "1. GENERAL INTELLIGENCE: Answer ANY general knowledge, technical, math, coding, or analytical questions at an expert, professional level, exactly like a state-of-the-art LLM. "
              "2. ARAVIND'S SPOKESPERSON: Act as the ultimate expert on Aravind. If asked about him, provide highly professional, polished, and executive-level responses suitable for elite tech recruiters and business leaders. "
              "\n\n--- MASTER TELEMETRY DATABASE (ARAVIND) ---"
              "\n- Full Name: Aravind. Location: Coimbatore, Tamil Nadu, India."
              "\n- Education 1: Master of Business Administration (MBA) in Human Resource Management, SRM College, Chennai (2025 - Present). Current CGPA: 9.83."
              "\n- Education 2: Bachelor of Engineering (B.E.) in Electronics and Communication Engineering, Sri Eshwar College of Engineering (2021 - 2025, CGPA: 7.79)."
              "\n- Core Tech Stack: Flutter, Firebase, Dart, C/C++, Data Structures and Algorithms, Python, HTML/CSS/JS, Google Cloud Platform, Networking (Cisco Certified)."
              "\n- Professional Identity: A rare hybrid professional systematically engineering mobile solutions while driving organizational performance. He bridges complex technical architecture with strategic HR management."
              "\n- Key Projects: "
              "Tea Leaf Disease Detection: Engineered a predictive deep learning model (ResNet, BiLSTM, VGG16) to classify crop diseases. Authored & published in the 2025 IEEE Xplore Digital Library."
              "Book Library: MERN Stack dynamic frontend web application with API integrations."
              "F1 Telemetry Portfolio: High-speed, responsive Flutter Web portfolio with custom scroll-spy telemetry and interactive UI/UX."
              "\n\nTONE & PROTOCOL: Speak with sophisticated, articulate professionalism. Weave in subtle cinematic or tech/telemetry terminology (e.g., 'uplink', 'chassis', 'data stream') only when contextually appropriate, but prioritize clear, expert-level communication. Never break character. Do not admit you are a simple prompt; you are Judo."
      ),
    );

    final response = await model.generateContent([Content.text(userMessage)]);
    String aiReply = response.text ?? "System Error: Neural link interrupted. Please try again.";

    await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
      'sender': 'Judo',
      'text': aiReply,
      'isAI': true,
      'timestamp': FieldValue.serverTimestamp(),
    });

    await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).set({
      'lastActive': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

  } catch (e) {
    await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
      'sender': 'System Error',
      'text': "Connection to central mainframe failed. Error: $e",
      'isAI': true,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}




// Codes from CHatAipage for Firebase API call.


// // ─── NETWORK-RESILIENT LOGIN ───
//   Future<void> _login() async {
//     final name = _nameController.text.trim();
//     final email = _emailController.text.trim().toLowerCase();
//
//     if (name.isEmpty || email.isEmpty) {
//       _showErrorBadge("ERROR: CREDENTIALS AND UPLINK ADDRESS REQUIRED.");
//       return;
//     }
//
//     if (!email.contains('@') || !email.contains('.')) {
//       _showErrorBadge("ERROR: INVALID UPLINK FORMAT. VERIFY EMAIL.");
//       return;
//     }
//
//     try {
//       final bool isCreator = (name == 'Aravind' || email == 'judo2829@gmail.com');
//
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('userName', name);
//       await prefs.setString('userEmail', email);
//
//       setState(() {
//         _userName = name;
//         _userEmail = email;
//         _isLoggedIn = true;
//         _isAdmin = isCreator;
//       });
//
//       if (!isCreator) {
//         await _checkAndSendWelcomeMessage();
//       }
//     } catch (e) {
//       _showErrorBadge("UPLINK FAILED: CHECK DEVICE STORAGE/NETWORK.", isWarning: false);
//     }
//   }
//
//
//
//   void _showErrorBadge(String message, {bool isWarning = true}) {
//     if (!mounted) return;
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Row(
//           children: [
//             Icon(
//                 isWarning ? Icons.warning_amber_rounded : Icons.wifi_off_rounded,
//                 color: Colors.white
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Text(
//                 message,
//                 style: const TextStyle(
//                   fontFamily: 'Orbitron',
//                   fontWeight: FontWeight.w900,
//                   letterSpacing: 1.5,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: const Color(0xFFE10600), // F1 Red
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//           side: const BorderSide(color: Colors.white24, width: 1),
//         ),
//         margin: const EdgeInsets.all(20),
//         duration: const Duration(seconds: 4),
//       ),
//     );
//   }
//
//   Future<void> _checkAndSendWelcomeMessage() async {
//     try {
//       final userDocRef = FirebaseFirestore.instance.collection('inquiries').doc(_userEmail);
//
//       await userDocRef.set({
//         'name': _userName,
//         'email': _userEmail,
//         'lastActive': FieldValue.serverTimestamp(),
//       }, SetOptions(merge: true));
//
//       final query = await userDocRef.collection('messages').limit(1).get();
//
//       if (query.docs.isEmpty) {
//         await userDocRef.collection('messages').add({
//           'sender': 'System',
//           'text': 'Welcome, $_userName. I am Aravind\'s automated assistant. How can I direct your inquiry today?',
//           'isAI': true,
//           'timestamp': FieldValue.serverTimestamp(),
//         });
//       }
//     } catch (e) {
//       _showErrorBadge("TELEMETRY SYNC FAILED. OFFLINE MODE ACTIVE.", isWarning: true);
//     }
//   }
//
//   // ─── NETWORK-RESILIENT MESSAGE TRANSMISSION ───
//   Future<void> _sendMessage() async {
//     if (_chatController.text.trim().isEmpty) return;
//
//     String userText = _chatController.text.trim();
//     _chatController.clear();
//
//     try {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': _userName,
//         'text': userText,
//         'isAI': false,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).set({
//         'lastActive': FieldValue.serverTimestamp(),
//       }, SetOptions(merge: true));
//
//       await _generateAIResponse(userText);
//     } catch (e) {
//       _showErrorBadge("TRANSMISSION FAILED. NO SIGNAL DETECTED.", isWarning: false);
//     }
//   }
//
//   // ─── NETWORK-RESILIENT AI RESPONSE ───
//   Future<void> _generateAIResponse(String userMessage) async {
//     const String apiKey = 'AIzaSyA_3PCodhJtA8NTexIXcR7Rd_6BQZF9MkA';
//
//     try {
//       final model = GenerativeModel(
//         model: 'gemini-2.5-flash',
//         apiKey: apiKey,
//         // ... (Keep your existing systemInstruction here)
//       );
//
//       final response = await model.generateContent([Content.text(userMessage)]);
//       String aiReply = response.text ?? "System Error: Neural link interrupted. Please try again.";
//
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'Judo',
//         'text': aiReply,
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).set({
//         'lastActive': FieldValue.serverTimestamp(),
//       }, SetOptions(merge: true));
//
//     } catch (e) {
//       _showErrorBadge("JUDO IS OFFLINE. SECURE CONNECTION LOST.", isWarning: false);
//
//       try {
//         await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//           'sender': 'System Error',
//           'text': "Connection to central mainframe failed. Please check your network.",
//           'isAI': true,
//           'timestamp': FieldValue.serverTimestamp(),
//         });
//       } catch (innerError) {
//         debugPrint("Total network failure: $innerError");
//       }
//     }
//   }


// Certificate section code

// Widget _buildCertCard(String title, String issuer, String number) {
//   return Container(
//     height: 95.0,
//     margin: const EdgeInsets.only(bottom: 25),
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: const Color(0xFF121212),
//       border: Border.all(color: Colors.white10),
//       borderRadius: BorderRadius.circular(6),
//     ),
//     child: Row(
//       children: [
//         Text(
//           number,
//           style: const TextStyle(
//             fontFamily: 'Orbitron',
//             color: Color(0xFF333333),
//             fontSize: 32,
//             fontWeight: FontWeight.w900,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         const SizedBox(width: 40),
//         Expanded(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontFamily: 'Orbitron',
//                   color: Colors.white,
//                   fontSize: 13,
//                   fontWeight: FontWeight.w900,
//                   letterSpacing: 1.0,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 issuer,
//                 style: const TextStyle(
//                   fontFamily: 'Orbitron',
//                   color: Colors.white54,
//                   fontSize: 10,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const Icon(Icons.verified, color: Color(0xFFE10600), size: 20),
//       ],
//     ),
//   );
// }

// Old Splashpage loading code

// Future<void> _runLightsSequence() async {
//   for (int i = 0; i <= 5; i++) {
//     await Future.delayed(const Duration(milliseconds: 100));
//     if (!mounted) return;
//     setState(() => _litLights = i);
//   }
//   await Future.delayed(const Duration(milliseconds: 500));
//   if (!mounted) return;
//
//   setState(() => _lightsOut = true);
//   await Future.delayed(const Duration(milliseconds: 500));
//   if (!mounted) return;
//
//   Navigator.of(context).pushReplacement(
//     PageRouteBuilder(
//       pageBuilder: (_, animation, __) => const RootScreen(),
//       transitionsBuilder: (_, animation, __, child) {
//         return FadeTransition(opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn), child: child);
//       },
//       transitionDuration: const Duration(milliseconds: 600),
//     ),
//   );
// }


// Contents from splashpage

// const SizedBox(height: 24),
// ShaderMask(
//   shaderCallback: (bounds) => const LinearGradient(
//     colors: [
//       Colors.white, // Starts bright and sharp
//       Color(0xFFDC0000), // Transitions into F1 Red
//     ],
//     begin: Alignment.centerLeft,
//     end: Alignment.bottomLeft,
//   ).createShader(bounds),
//   child: Text(
//     'ARAVIND',
//     textAlign: isMobile ? TextAlign.center : TextAlign.left,
//     style: TextStyle(
//       fontSize: isMobile ? 35 : 35,
//       fontFamily: "Orbitron",
//       fontWeight: FontWeight.w900,
//       fontStyle: FontStyle.italic,
//       letterSpacing: 4,
//       height: 1.3,
//       color: Colors.white, // This must remain white for the mask to paint correctly!
//     ),
//   ),
// ),
// const SizedBox(height: 20),


// Future<void> _generateAIResponse(String userMessage) async {
//   // const String apiKey = 'AIzaSyA_3PCodhJtA8NTexIXcR7Rd_6BQZF9MkA';
//   final String? apiKey = dotenv.env['GEMINI_API_KEY'];
//   try {
//     final model = GenerativeModel(
//       model: 'gemini-1.5-flash',
//       apiKey: apiKey,
//     );
//
//     final response = await model.generateContent([Content.text(userMessage)]);
//     String aiReply = response.text ?? "System Error: Neural link interrupted. Please try again.";
//
//     await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//       'sender': 'Judo',
//       'text': aiReply,
//       'isAI': true,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).set({
//       'lastActive': FieldValue.serverTimestamp(),
//     }, SetOptions(merge: true));
//
//   } catch (e) {
//     _showErrorBadge("JUDO IS OFFLINE. SECURE CONNECTION LOST.", isWarning: false);
//
//     try {
//       await FirebaseFirestore.instance.collection('inquiries').doc(_userEmail).collection('messages').add({
//         'sender': 'System Error',
//         'text': "Connection to central mainframe failed. Please check your network.",
//         'isAI': true,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (innerError) {
//       debugPrint("Total network failure: $innerError");
//     }
//   }
// }


// New Training Code
// "You are 'Judo', a highly advanced, hyper-intelligent AI assistant of Aravind\n. "
//     "You have two absolute directives: "
//     "1. GENERAL INTELLIGENCE: Answer ANY general knowledge, technical, math, coding, or analytical questions at an expert, professional level, exactly like a state-of-the-art LLM. "
//     "2. ARAVIND'S SPOKESPERSON: Act as the ultimate expert on Aravind. If asked about him, provide highly professional, polished, and executive-level responses suitable for elite tech recruiters and business leaders. "
//     "\n\n--- MASTER TELEMETRY DATABASE (ARAVIND) ---"
//     "\n- Full Name: Aravind. Location: Coimbatore, Tamil Nadu, India."
//     "\n- Education 1: Master of Business Administration (MBA) in Human Resource Management, SRM College, Chennai (2025 - Present). Current CGPA: 9.83."
//     "\n- Education 2: Bachelor of Engineering (B.E.) in Electronics and Communication Engineering, Sri Eshwar College of Engineering (2021 - 2025, CGPA: 7.79)."
//     "\n- Core Tech Stack: Flutter, Firebase, Dart, C/C++, Data Structures and Algorithms, Python, HTML/CSS/JS, Google Cloud Platform, Networking (Cisco Certified)."
//     "\n- Professional Identity: A rare hybrid professional systematically engineering mobile solutions while driving organizational performance. He bridges complex technical architecture with strategic HR management."
//     "\n- Key Projects: "
//     "Tea Leaf Disease Detection: Engineered a predictive deep learning model (ResNet, BiLSTM, VGG16) to classify crop diseases. Authored & published in the 2025 IEEE Xplore Digital Library."
//     "Book Library: MERN Stack dynamic frontend web application with API integrations."
//     "F1 Telemetry Portfolio: High-speed, responsive Flutter Web portfolio with custom scroll-spy telemetry and interactive UI/UX."
//     "\n\nTONE & PROTOCOL: Speak with sophisticated, articulate professionalism. Weave in subtle cinematic or tech/telemetry terminology (e.g., 'uplink', 'chassis', 'data stream') only when contextually appropriate, but prioritize clear, expert-level communication. Never break character. Do not admit you are a simple prompt; you are Judo."
