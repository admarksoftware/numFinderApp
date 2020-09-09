import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/contact/search_contact.dart';
import 'package:flutter_app/demo_api.dart';
import 'package:flutter_app/screen/invite_friends_screen.dart';
import 'package:flutter_app/screen/spam.dart';
import 'package:flutter_app/styles/text.dart';
import 'package:flutter_app/widgets%20/contact_list.dart';
import 'package:flutter_app/widgets%20/user_profile.dart';
import 'buying_processes.dart';
import 'match_up.dart';
import 'premium_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SearchContact(),
    MatchUp(),
    ContactList(),
    Spam(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: MultiLevelDrawer(
          rippleColor: Colors.grey,
          subMenuBackgroundColor: Colors.grey,
          divisionColor: Colors.grey,
          header: UserProfile(),
          children: [
            MLMenuItem(
                content: Text("Premium'a yükseltin", style: TextStyles.body),
                onClick: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PremiumPage()))),
            MLMenuItem(
                content: Text("Arkadaşları Davet Et", style: TextStyles.body),
                onClick: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => InvitefriendsScreen()))),
            MLMenuItem(
                content: Text("Satın Alma İşlemleri", style: TextStyles.body),
                onClick: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BuyingProcessesScreen()))),
            MLMenuItem(content: Text("Destek", style: TextStyles.body)),
            MLMenuItem(content: Text("Hakkında", style: TextStyles.body)),
            MLMenuItem(content: Text("", style: TextStyles.body)),
            MLMenuItem(content: Text("", style: TextStyles.body)),
            MLMenuItem(
                content: Text("Çıkış", style: TextStyles.body),
                onClick: () async{
                  await authBloc.logout();
                  await Navigator.pushNamed(context, "/login");
                }
            ),
          ],
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              title: Text('Ara', style: TextStyles.body),
              icon: Icon(Icons.search, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              title: Text('Eşleştir', style: TextStyles.body),
              icon: Icon(Icons.refresh, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              title: Text('Kişiler', style: TextStyles.body),
              icon: Icon(Icons.person, color: Colors.grey),
            ),
            BottomNavigationBarItem(
              title: Text('Spam', style: TextStyles.body),
              icon: Icon(Icons.beenhere, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiLevelDrawer extends StatefulWidget {
  final Widget header;
  final List<MLMenuItem> children;
  final Color backgroundColor;
  final Color subMenuBackgroundColor;
  final Color divisionColor;
  final LinearGradient gradient;
  final Color rippleColor;

  const MultiLevelDrawer(
      {@required this.header,
      @required this.children,
      this.backgroundColor,
      this.gradient,
      this.divisionColor,
      this.rippleColor,
      this.subMenuBackgroundColor});

  @override
  _MultiLevelDrawerState createState() => _MultiLevelDrawerState();
}

class _MultiLevelDrawerState extends State<MultiLevelDrawer> {
  ScrollController scrollController = ScrollController();
  GlobalKey globalKey = GlobalKey();
  List<double> positions = [];
  List<MLMenuItem> drawerItems = [];
  double itemSize = 0;

  int selectedPosition = -1, lastPosition = 0;
  bool openSubMenu = false;

  @override
  void initState() {
    positions = [0, 0, 0, 0];
    drawerItems = widget.children;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(getPositions);
  }

  getPositions(duration) {
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    double dy = renderBox.localToGlobal(Offset.zero).dy;
    double start = dy - 24;
    double end = renderBox.size.height + start;
    double step = (end - start) / drawerItems.length;
    itemSize = step;
    positions = [];
    for (double x = start; x < end; x = x + step) {
      positions.add(x);
    }
    setState(() {});
  }

  openSubDrawer(position) {
    bool isSamePosition = selectedPosition == position;
    setState(() {
      lastPosition = selectedPosition != -1 ? selectedPosition : 0;
      selectedPosition = isSamePosition ? -1 : position;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Stack(
        children: <Widget>[
          if (selectedPosition != -1 &&
              drawerItems[selectedPosition].subMenuItems != null) ...[
            AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                left: selectedPosition == -1 ? 0 : size.width / 2,
                top: selectedPosition != -1
                    ? positions[selectedPosition]
                    : positions[lastPosition],
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: size.width / 2,
                      height: itemSize *
                          drawerItems[selectedPosition].subMenuItems.length,
                    ),
                    Positioned(
                      top: 0,
                      left: 10,
                      child: Container(
                        width: size.width / 2 - 10,
                        child: Column(
                          children: drawerItems[selectedPosition]
                              .subMenuItems
                              .map<Widget>((subMenuItem) {
                            return _MLChoiceItem(
                              color:
                                  widget.subMenuBackgroundColor ?? Colors.white,
                              divisionColor: widget.divisionColor,
                              rippleColor: widget.rippleColor,
                              onTap: () {
                                subMenuItem.onClick();
                              },
                              child: subMenuItem.submenuContent,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        child: CustomPaint(
                          size: Size(10, itemSize),
                          painter: _ArrowPainter(
                              arrowColor: widget.subMenuBackgroundColor),
                        ))
                  ],
                )),
          ],
          Container(
            decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                gradient: widget.gradient),
            width: size.width / 2 + 50,
            height: size.height,
            child: Column(
              children: <Widget>[
                widget.header,
                Container(
                  key: globalKey,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: drawerItems.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      MLMenuItem item = drawerItems[index];
                      return _MLChoiceItem(
                        width: size.width / 2,
                        rippleColor: widget.rippleColor,
                        child: item.content,
                        onTap: () {
                          if (item.subMenuItems != null) {
                            openSubDrawer(index);
                          } else {
                            item.onClick();
                            openSubDrawer(selectedPosition);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MLChoiceItem extends StatelessWidget {
  final Function onTap;
  final Widget leading;
  final Widget child;
  final Widget trailing;
  final Color color;
  final Color rippleColor;
  final Color divisionColor;
  final double width;

  const _MLChoiceItem(
      {this.onTap,
      this.child,
      this.leading,
      this.trailing,
      this.color,
      this.rippleColor,
      this.divisionColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.white,
      child: InkWell(
        highlightColor: Colors.white,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArrowPainter extends CustomPainter {
  final Color arrowColor;

  _ArrowPainter({@required this.arrowColor});

  @override
  void paint(Canvas canvas, Size size) {
    Color paintColor = arrowColor ?? Colors.white;
    Paint paint = Paint()
      ..color = paintColor.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class MLMenuItem {
  final Widget content;
  final Widget leading, trailing;
  final Function onClick;
  final List<MLSubmenu> subMenuItems;

  const MLMenuItem(
      {@required this.content,
      @required this.onClick,
      this.subMenuItems,
      this.leading,
      this.trailing});
}

class MLSubmenu {
  final Widget submenuContent;
  final Function onClick;

  MLSubmenu({@required this.submenuContent, this.onClick});
}
