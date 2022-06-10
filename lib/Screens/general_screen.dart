import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient/Screens/Home.dart';
import 'package:patient/Screens/aboutconsultation.dart';
import 'package:patient/Screens/contact_us_form.dart';
import 'package:patient/Screens/patient_home_page_4.dart';
import 'package:patient/Screens/search_screen.dart';
import 'package:patient/Utils/colorsandstyles.dart';
import 'package:patient/firebase/notification_handling.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    FirebaseNotificationHandling().setupFirebase(context);
    //     // TODO: implement initState
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      AboutConsultation(),
      // HomeScreen(),
      SearchScreen(),
      PatientHomePage4(),
      ContactUsForm(
        fromHome: true,
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          opacity: 0.8,
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: appyellowColor,
          inactiveColorPrimary: appyellowColor,
          activeColorSecondary: appblackColor),
      PersistentBottomNavBarItem(
          opacity: 0.8,
          icon: Icon(Icons.person),
          title: ("Doctor"),
          activeColorPrimary: appyellowColor,
          inactiveColorPrimary: appyellowColor,
          activeColorSecondary: appblackColor),
      PersistentBottomNavBarItem(
          opacity: 0.8,
          icon: Icon(Icons.search),
          title: ("Search"),
          activeColorPrimary: appyellowColor,
          inactiveColorPrimary: appyellowColor,
          activeColorSecondary: appblackColor),
      PersistentBottomNavBarItem(
          opacity: 0.8,
          icon: Icon(Icons.medical_services_outlined),
          title: ("Home Care"),
          activeColorPrimary: appyellowColor,
          inactiveColorPrimary: appyellowColor,
          activeColorSecondary: appblackColor),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.question_mark),
          opacity: 0.8,
          title: ("Need Help"),
          activeColorPrimary: appyellowColor,
          inactiveColorPrimary: appyellowColor,
          activeColorSecondary: appblackColor),
    ];
  }

  Future<bool> setpage(BuildContext) async {
    if (_controller.index == 0) {
      return true;
    } else {
      setState(() {
        _controller.index = 0;
      });
      return false;
    }
  }

  int _selected_index = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PersistentTabView(
        context,
        padding: NavBarPadding.all(8),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        controller: _controller,
        screens: _buildScreens(),
        navBarHeight: navbarht,
        items: _navBarsItems(),

        confineInSafeArea: true,
        backgroundColor: appblackColor, // Default is appyellowColor.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          adjustScreenBottomPaddingOnCurve: true,
          colorBehindNavBar: Colors.transparent,
          borderRadius: BorderRadius.circular(200.0),
        ),

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style7,
        onWillPop: setpage,
        // Choose the nav bar style with this property.
      ),
    );
    // Scaffold(
    //   extendBody: true,
    //   // appBar: (_selected_index == 0)
    //   //     ? AppBar(
    //   //         centerTitle: false,
    //   //         title: commonAppBarTitle(),
    //   //         backgroundColor: appyellowColor,
    //   //         elevation: 0,
    //   //         leading: Builder(
    //   //           builder: (context) => commonAppBarLeading(
    //   //               iconData: Icons.menu,
    //   //               onPressed: () {
    //   //                 setState(() {
    //   //                   Scaffold.of(context).openDrawer();
    //   //                 });
    //   //               }),
    //   //         ))
    //   //     : null,
    //   // drawer: commonDrawer(),
    //
    //   body: WillPopScope(
    //     onWillPop: () async {
    //       if (_selected_index == 0) {
    //         return true;
    //       } else {
    //         setState(() {
    //           _selected_index = 0;
    //         });
    //       }
    //       return false;
    //     },
    //     child: Stack(
    //       children: [
    //         _buildScreens().elementAt(_selected_index),
    //       ],
    //     ),
    //   ),
    //
    //   bottomNavigationBar: ClipRRect(
    //     child: BackdropFilter(
    //       filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
    //       child: Container(
    //         height: 70,
    //         decoration:
    //             BoxDecoration(color: Colors.grey.shade200.withOpacity(0.5)),
    //         width: MediaQuery.of(context).size.width,
    //         child: FABBottomAppBar(
    //           centerItemText: 'Search',
    //           selectedColor: appblackColor,
    //           notchedShape: CircularNotchedRectangle(),
    //           onTabSelected: (int index) {
    //             setState(() {
    //               _selected_index = index;
    //             });
    //           },
    //           items: [
    //             FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
    //             FABBottomAppBarItem(iconData: Icons.person, text: 'Doctor'),
    //             FABBottomAppBarItem(
    //                 iconData: Icons.account_circle, text: 'Medicine'),
    //             FABBottomAppBarItem(iconData: Icons.more_horiz, text: 'Lab'),
    //           ],
    //           color: Colors.black,
    //           // backgroundColor: Colors.purple,
    //         ),
    //       ),
    //     ),
    //   ),
    //   // bottomNavigationBar: ClipRRect(
    //   //   child: BackdropFilter(
    //   //     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //   //     child: Container(
    //   //       height: 64,
    //   //       width: MediaQuery.of(context).size.width,
    //   //       child: FABBottomAppBar(
    //   //         centerItemText: 'Search',
    //   //         backgroundColor: Colors.transparent,
    //   //         selectedColor: appblackColor,
    //   //         notchedShape: CircularNotchedRectangle(),
    //   //         onTabSelected: (int index) {
    //   //           setState(() {
    //   //             _selected_index = index;
    //   //           });
    //   //         },
    //   //         items: [
    //   //           FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
    //   //           FABBottomAppBarItem(iconData: Icons.search, text: 'Doctor'),
    //   //           FABBottomAppBarItem(
    //   //               iconData: Icons.account_circle, text: 'Medicine'),
    //   //           FABBottomAppBarItem(iconData: Icons.more_horiz, text: 'Lab'),
    //   //         ],
    //   //         color: Colors.black,
    //   //       ),
    //   //     ),
    //   //   ),
    //   // ),
    //   floatingActionButton: Container(
    //     height: 60,
    //     width: 60,
    //     child: FittedBox(
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.circular(50),
    //         clipBehavior: Clip.antiAlias,
    //         // clipBehavior: Clip.hardEdge,
    //         child: BackdropFilter(
    //           filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Colors.grey.shade200.withOpacity(0.5),
    //               border: Border.all(color: appyellowColor, width: 2),
    //               borderRadius: BorderRadius.circular(100),
    //             ),
    //             child: FloatingActionButton(
    //               //isExtended: true,
    //               backgroundColor: Colors.transparent,
    //               onPressed: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => SearchScreen()));
    //                 // Push(context, SearchScreen());
    //               },
    //               child: Icon(
    //                 Icons.search,
    //                 size: 40,
    //                 color: appblackColor,
    //               ),
    //               elevation: 0,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   // bottomNavigationBar:
    // );
  }
}
