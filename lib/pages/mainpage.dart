import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:url_launcher/link.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final bool isPortrait = screenHeight > screenWidth;

    return

    ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (
            (_, mode, __){

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                themeMode: mode,
                darkTheme: ThemeData.dark(),

                home: Scaffold(

                  backgroundColor: Colors.cyan.shade400,

                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    centerTitle: true ,
                    leading: IconButton(
                      onPressed: (){
                        showDialog(context: context,
                          builder: (context)=> AlertDialog(

                            backgroundColor: Colors.tealAccent,

                            actions: [
                              Link(
                                  uri: Uri.parse('https://aravind-jd.github.io/My_Portfolio/'),
                                  builder: ((context, followLink)=>
                                      TextButton(
                                        onPressed: followLink,
                                        child: Text(
                                            "Portfolio",
                                          style: TextStyle(
                                            fontFamily: "GreyQo",
                                            fontSize: 30,
                                          ),
                                        ),
                                      )
                                  )
                              ),
                              Link(
                                  uri: Uri.parse('https://aravind-jd.github.io/Resume/resume.html'),
                                  builder: ((context, followLink)=>
                                      TextButton(
                                        onPressed: followLink,
                                        child: Text(
                                            "Resume",
                                          style: TextStyle(
                                            fontFamily: "GreyQo",
                                            fontSize: 30,
                                          ),
                                        ),
                                      )
                                  )
                              ),
                            ],

                            title: const Text(
                              "Profile",
                              style: TextStyle(
                                fontFamily: "GreyQo",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),

                          ),
                        );
                      },
                      icon: Icon(
                        Icons.account_circle_outlined,
                      ),
                    ),


                    actions: [

                      IconButton(
                          onPressed: (){
                            showDialog(context: context,
                              builder: (context)=> AlertDialog(
                                backgroundColor: Colors.tealAccent,
                                actions: [
                                  Link(
                                      uri: Uri.parse('https://github.com/Aravind2810'),
                                      builder: ((context, followLink)=>
                                          IconButton(
                                            onPressed: followLink,
                                            icon: FaIcon(
                                              FontAwesomeIcons.github,
                                            ),
                                          )
                                      )
                                  ),
                                  Link(
                                      uri: Uri.parse('https://www.linkedin.com/in/aravind-s-390469231/'),
                                      builder: ((context, followLink)=>
                                          IconButton(
                                            onPressed: followLink,
                                            icon: FaIcon(
                                              FontAwesomeIcons.linkedin,
                                            ),
                                          )
                                      )
                                  ),
                                  Link(
                                      uri: Uri.parse('https://www.instagram.com/its._me._jd/#'),
                                      builder: ((context, followLink)=>
                                          IconButton(
                                            onPressed: followLink,
                                            icon: FaIcon(
                                              FontAwesomeIcons.instagram,
                                            ),
                                          )
                                      )
                                  ),
                                  Link(
                                      uri: Uri.parse('https://wa.me/qr/VCTGLGB2LA5JP1'),
                                      builder: ((context, followLink)=>
                                          IconButton(
                                            onPressed: followLink,
                                            icon: FaIcon(
                                              FontAwesomeIcons.whatsapp,
                                            ),
                                          )
                                      )
                                  ),
                                ],
                                title: const Text(
                                  "Contact  Me",
                                  style: TextStyle(
                                    fontFamily: "GreyQo",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.menu_rounded,
                          )
                      ),

                    ],


                    title: Text(
                      "My Resume",
                      style: TextStyle(
                        fontFamily: "Caveat",
                        fontSize: 22.0,
                      ),
                    ),

                  ),

                  body: SingleChildScrollView(

                    child: Stack(
                      children: <Widget>[


                        ClipPath(
                          clipper: CustomShape(),
                          child: Container(
                            height: 300.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),


                        Align(
                          alignment: Alignment.center,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[

                              SizedBox(
                                  height: 120.0
                              ),

                              CircleAvatar(
                                radius: 80.0,
                                backgroundImage: AssetImage('assets/images/me.png'),
                              ),

                              SizedBox(height: 10.0),

                              Text(
                                'Aravind Senthilvelan',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontFamily: "Kalam",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Text(
                                'Mobile App Developer',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Tangerine",
                                ),
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

                                child: Padding(
                                    padding: EdgeInsets.all(10),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Text(
                                        "Education",
                                        style: TextStyle(
                                            fontFamily: "Lora",
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          FaIcon(
                                            FontAwesomeIcons.university,
                                          ),

                                          SizedBox(
                                            width: 10.0,
                                          ),

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              //Education

                                              Text(
                                                'Current Course',
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              Text(
                                                "Bachelor of Engineering - ECE",
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                ),
                                              ),

                                              Text(
                                                "Sri Eshwar College of Engineering - 2021-2025",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontFamily: "Lora",
                                                ),
                                              ),

                                              //Experience



                                            ],
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Divider(
                                        color: Colors.black,
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Icon(
                                            Icons.school_rounded,
                                          ),

                                          SizedBox(
                                            width: 10.0,
                                          ),

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              //Education

                                              Text(
                                                'Schooling',
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              Text(
                                                "Completed my H.S.C. with 84.6%",
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                ),
                                              ),

                                              Text(
                                                "P.K.D.M.H.S.S - 2020-2021",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontFamily: "Lora",
                                                ),
                                              ),


                                            ],
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Divider(
                                        color: Colors.black,
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Icon(
                                            Icons.school_rounded,
                                          ),

                                          SizedBox(
                                            width: 10.0,
                                          ),

                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              //Education

                                              Text(
                                                'Schooling',
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              Text(
                                                "Completed my S.S.L.C. with 86.4%",
                                                style: TextStyle(
                                                  fontFamily: "Lora",
                                                ),
                                              ),

                                              Text(
                                                "P.K.D.M.H.S.S - 2018-2019",
                                                style: TextStyle(
                                                  fontSize: 10.0,
                                                  fontFamily: "Lora",
                                                ),
                                              ),


                                            ],
                                          ),

                                        ],
                                      ),

                                    ],
                                  )

                                ),

                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

                                child: Padding(
                                  padding: EdgeInsets.all(10),

                                  child: Column(
                                    children: [

                                      Text(
                                        "Projects",
                                        style: TextStyle(
                                          fontFamily: "Lora",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'Chatosic',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "A Multi working mobile application in which music can be heard and call can be made using google accounts.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                        trailing: Link(
                                            uri: Uri.parse('https://github.com/Aravind2810/Chatosic'),
                                            builder: ((context, followLink)=>
                                                IconButton(
                                                  onPressed: followLink,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.github,
                                                  ),
                                                )
                                            )
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'Resume Displayer',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "A Mobile application made for myself to display my digital resume and my profile.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                        trailing: Link(
                                            uri: Uri.parse('https://github.com/Aravind2810'),
                                            builder: ((context, followLink)=>
                                                IconButton(
                                                  onPressed: followLink,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.github,
                                                  ),
                                                )
                                            )
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'QR Code Generator',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "A Mobile application to generate qr codes.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                        trailing: Link(
                                            uri: Uri.parse('https://github.com/Aravind-jd/qr_code_scanner'),
                                            builder: ((context, followLink)=>
                                                IconButton(
                                                  onPressed: followLink,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.github,
                                                  ),
                                                )
                                            )
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'Jd Project',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "A Mobile application made by myself while I started learning Mobile app development.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                        trailing: Link(
                                            uri: Uri.parse('https://github.com/Aravind2810/flutter_project_1'),
                                            builder: ((context, followLink)=>
                                                IconButton(
                                                  onPressed: followLink,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.github,
                                                  ),
                                                )
                                            )
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'My Portfolio',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "My Portfolio to display myself in a web page with all project links, with my study details, with my personal details, with my contact details and also with my updated resume.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                        trailing: Link(
                                            uri: Uri.parse('https://github.com/Aravind2810'),
                                            builder: ((context, followLink)=>
                                                IconButton(
                                                  onPressed: followLink,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.github,
                                                  ),
                                                )
                                            ),
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'Book-Store',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "A web application used as open source in which book lovers can access books of their interest and can enjoy reading the book through online.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                        trailing: Link(
                                          uri: Uri.parse('https://github.com/Aravind2810/Book-Store'),
                                          builder: ((context, followLink)=>
                                              IconButton(
                                                onPressed: followLink,
                                                icon: FaIcon(
                                                  FontAwesomeIcons.github,
                                                ),
                                              )
                                          ),
                                        ),

                                      ),

                                    ],
                                  ),



                                ),

                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

                                child: Padding(
                                  padding: EdgeInsets.all(10),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Text(
                                        "Skills",
                                        style: TextStyle(
                                          fontFamily: "Lora",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          Text(
                                            "Flutter ",
                                            style: TextStyle(
                                              fontFamily: "Kalam",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          LinearPercentIndicator(
                                            width: 200.0,
                                            trailing: Text(
                                              "90%",
                                              style: TextStyle(
                                                fontFamily: "Lora",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            lineHeight: 5.0,
                                            percent: 0.9,
                                            animation: true,
                                            animationDuration: 2000,
                                            barRadius: Radius.circular(10),
                                            linearStrokeCap: LinearStrokeCap.roundAll,
                                            backgroundColor: Colors.grey,
                                            progressColor: Colors.redAccent,
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Divider(),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          Text(
                                            "Dart    ",
                                            style: TextStyle(
                                              fontFamily: "Kalam",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          LinearPercentIndicator(
                                            width: 200.0,
                                            trailing: Text(
                                              "90%",
                                              style: TextStyle(
                                                fontFamily: "Lora",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            lineHeight: 5.0,
                                            percent: 0.9,
                                            animation: true,
                                            animationDuration: 2000,
                                            barRadius: Radius.circular(10),
                                            backgroundColor: Colors.grey,
                                            progressColor: Colors.redAccent,
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Divider(),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          Text(
                                            "Html,CSS",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontFamily: "Kalam",
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          LinearPercentIndicator(
                                            width: 200.0,
                                            trailing: Text(
                                              "70%",
                                              style: TextStyle(
                                                fontFamily: "Lora",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            lineHeight: 5.0,
                                            percent: 0.7,
                                            animation: true,
                                            animationDuration: 2000,
                                            barRadius: Radius.circular(10),
                                            backgroundColor: Colors.grey,
                                            progressColor: Colors.redAccent,
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Divider(),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          Text(
                                            "SQL     ",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: "Kalam",
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          LinearPercentIndicator(
                                            width: 200.0,
                                            trailing: Text(
                                              "60%",
                                              style: TextStyle(
                                                fontFamily: "Lora",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            lineHeight: 5.0,
                                            percent: 0.6,
                                            animation: true,
                                            animationDuration: 2000,
                                            barRadius: Radius.circular(10),
                                            backgroundColor: Colors.grey,
                                            progressColor: Colors.redAccent,
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Divider(),

                                      SizedBox(
                                        height: 5.0,
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [

                                          Text(
                                            "Program ",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: "Kalam",
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          LinearPercentIndicator(
                                            width: 200.0,
                                            trailing: Text(
                                              "60%",
                                              style: TextStyle(
                                                fontFamily: "Lora",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            lineHeight: 5.0,
                                            percent: 0.6,
                                            animation: true,
                                            animationDuration: 2000,
                                            barRadius: Radius.circular(10),
                                            backgroundColor: Colors.grey,
                                            progressColor: Colors.redAccent,
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),

                                ),

                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

                                child: Padding(
                                    padding: EdgeInsets.all(10),

                                  child: ListTile(

                                    title: Text(
                                      'Summary',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Lora"
                                      ),
                                    ),

                                    subtitle: Text(
                                      'A Mobile App Developer with a passion for developing innovative applications that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and to create reliable, user-friendly applications.',
                                      style: TextStyle(
                                        fontFamily: "Lora",
                                      ),
                                    ),

                                  ),

                                ),

                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),

                                child: Padding(
                                  padding: EdgeInsets.all(10),

                                  child: Column(
                                    children: [

                                      Text(
                                        "Other Skills",
                                        style: TextStyle(
                                          fontFamily: "Lora",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'Poster Designer',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "I'm a poster designer which is one of my hobby and I worked in some of the events as a poster designer in my college."
                                              " ""And I have been the media team head for some events and also I organised some of the events.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'Photography',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "I love taking photos and I have a craze in photography."
                                              " "
                                          "And also I have knowledge in operating a Camera."
                                          ,
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                      ),

                                      Divider(
                                        color: Colors.black87,
                                      ),

                                      ListTile(

                                        title: Text(
                                          'NCC Troop Commander',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Lora"
                                          ),
                                        ),

                                        subtitle: Text(
                                          "I have been in NCC in my school for two years and attended three camps."
                                              " "
                                              "And also I lead my NCC troop as commander for one year and lead the troop in one of the camp.",
                                          style: TextStyle(
                                            fontFamily: "Lora",
                                          ),
                                        ),

                                      ),

                                    ],
                                  ),



                                ),

                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

                                child: Padding(
                                  padding: EdgeInsets.all(10),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      CircleAvatar(

                                        radius: 20.0,
                                        backgroundImage: AssetImage(
                                          'assets/images/email_me.jpeg',
                                        ),

                                      ),

                                      SizedBox(
                                        width: 15.0,
                                      ),

                                      Column(
                                        children: [

                                          Text(
                                            'Email Me',

                                            style: TextStyle(
                                              fontFamily: "Lora",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          Text(
                                            'aravindhemaa599@gmail.com',
                                            style: TextStyle(
                                              fontFamily: "lora",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        width: 30.0,
                                      ),

                                      Icon(
                                        Icons.mail_rounded,

                                      ),

                                    ],
                                  ),

                                ),

                                // child: ListTile(
                                //   title: Text(
                                //     'Email Me',
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontFamily: "Lora"
                                //     ),
                                //   ),
                                //
                                //   subtitle: Text('aravindhemaa599gmail.com'),
                                //   trailing: Icon(Icons.mail_rounded),
                                //
                                // ),
                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

                                child: Padding(
                                  padding: EdgeInsets.all(10),

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      CircleAvatar(

                                        radius: 20.0,
                                        foregroundImage: AssetImage(
                                          'assets/images/callbox.png',

                                        ),

                                      ),

                                      SizedBox(
                                        width: 50.0,
                                      ),

                                      Column(
                                        children: [

                                          Text(
                                            'Phone',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: "Lora",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          Text(
                                            '+91 89034 27447',
                                            style: TextStyle(
                                              fontFamily: "lora",
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),

                                        ],
                                      ),

                                      SizedBox(
                                        width: 75.0,
                                      ),

                                      Icon(
                                        Icons.call_rounded,
                                      )

                                    ],
                                  ),

                                ),

                                // child: ListTile(
                                //   title: Text(
                                //     'Email Me',
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontFamily: "Lora"
                                //     ),
                                //   ),
                                //
                                //   subtitle: Text('aravindhemaa599gmail.com'),
                                //   trailing: Icon(Icons.mail_rounded),
                                //
                                // ),
                              ),

                              Card(
                                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                child: ListTile(
                                  title: Text(
                                    'Address',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Lora"
                                    ),
                                  ),
                                  subtitle: Text(
                                      '9/254, Ponmuthunagar, Vadugapalayam, Pollachi, Coimbatore, TamilNadu, India - 642001',
                                    style: TextStyle(
                                      fontFamily: "Lora",
                                    ),
                                  ),
                                  onTap: () {
                                    // Handle editing
                                  },
                                ),
                              ),

                              Container(
                                width: screenWidth,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.black,

                                ),

                                child: Padding(
                                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: Text(
                                    "\u00a9 2024 Aravind. All rights reserved.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Lora",
                                        color: Colors.white
                                    ),
                                  ),
                                ),

                              ),

                            ],
                          ),

                        ),


                      ],

                    ),


                  ),






                ),

              );

            }
        ),
    );

  }

}



// SingleChildScrollView(
//   padding: EdgeInsets.all(16.0),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       // Profile Picture and Name
//       Center(
//         child: Column(
//           children: <Widget>[
//             CircleAvatar(
//               radius: 60.0,
//               backgroundImage: AssetImage('assets/profile.jpg'),
//             ),
//             SizedBox(height: 10.0),
//             Text(
//               'John Doe',
//               style: TextStyle(
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Software Engineer',
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.grey[700],
//               ),
//             ),
//           ],
//         ),
//       ),
//       SizedBox(height: 20.0),
//
//       // Contact Information
//       Text(
//         'Contact Information',
//         style: TextStyle(
//           fontSize: 22.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Divider(),
//       ListTile(
//         leading: Icon(Icons.email),
//         title: Text('johndoe@example.com'),
//       ),
//       ListTile(
//         leading: Icon(Icons.phone),
//         title: Text('+1 234 567 890'),
//       ),
//       ListTile(
//         leading: Icon(Icons.location_city),
//         title: Text('1234 Street Name, City, Country'),
//       ),
//
//       SizedBox(height: 20.0),
//
//       // Summary
//       Text(
//         'Summary',
//         style: TextStyle(
//           fontSize: 22.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Divider(),
//       Text(
//         'Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create reliable, user-friendly systems.',
//         style: TextStyle(fontSize: 16.0),
//       ),
//
//       SizedBox(height: 20.0),
//
//       // Education

//
//       // Experience
//       Text(
//         'Experience',
//         style: TextStyle(
//           fontSize: 22.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Divider(),
//       ListTile(
//         leading: Icon(Icons.work),
//         title: Text('Software Engineer'),
//         subtitle: Text('Example Company - 2020 - Present'),
//       ),
//       ListTile(
//         leading: Icon(Icons.work),
//         title: Text('Intern Software Engineer'),
//         subtitle: Text('Another Company - 2019 - 2020'),
//       ),
//
//       SizedBox(height: 20.0),
//
//       // Skills
//       Text(
//         'Skills',
//         style: TextStyle(
//           fontSize: 22.0,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Divider(),
//       Wrap(
//         spacing: 10.0,
//         children: <Widget>[
//           Chip(label: Text('Flutter')),
//           Chip(label: Text('Dart')),
//           Chip(label: Text('Python')),
//           Chip(label: Text('JavaScript')),
//           Chip(label: Text('SQL')),
//           Chip(label: Text('Git')),
//         ],
//       ),
//     ],
//   ),
// ),,






class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 100.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}