import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/model/raw_data.dart';
import 'package:flutter_dynamic_theme/utils/utils_importer.dart';
import 'package:flutter_dynamic_theme/widgets/custom_theme.dart';

class SettingsView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsViewState();
  }
}

class SettingsViewState extends State<SettingsView> {
  bool isDarkThemeMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 80, right: 20, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  UtilsImporter().stringUtils.settings,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: UtilsImporter().stringUtils.HKGrotesk,
                      fontSize: 30),
                ),
                InkWell(
                  onTap: () {
                    if (isDarkThemeMode == true) {
                      setState(() {
                        isDarkThemeMode = false;
                      });

                      _changeTheme(context, MyThemeKeys.LIGHT);
                    } else {
                      setState(() {
                        isDarkThemeMode = true;
                      });

                      _changeTheme(context, MyThemeKeys.DARK);
                    }
                  },
                  child: Image.asset(
                      isDarkThemeMode == false
                          ? 'assets/sun.png'
                          : 'assets/moon.png',
                      width: 30,
                      height: 30),
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
              UtilsImporter().stringUtils.settings_descrip,
              style: TextStyle(
                  color: UtilsImporter().colorUtils.greycolor,
                  fontWeight: FontWeight.w400,
                  fontFamily: UtilsImporter().stringUtils.HKGrotesk,
                  fontSize: 17),
            ),
            Expanded(
              child: ListView.builder(
                primary: false,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: settingsAry == null ? 0 : settingsAry.length,
                itemBuilder: (BuildContext context, int index) {
                  IconData icon;

                  if (index == 0) {
                    icon = Icons.person;
                  } else if (index == 1) {
                    icon = Icons.lock;
                  } else if (index == 2) {
                    icon = Icons.share;
                  } else {
                    icon = Icons.power_settings_new;
                  }

                  return new GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => _onTileClicked(index),
                    child: SettingsCard(
                      title: settingsAry[index]['title'],
                      description: settingsAry[index]['description'],
                      index: index,
                      iconData: icon,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to be called on click
  void _onTileClicked(int index) {
    debugPrint("You tapped on item $index");
  }
}

class SettingsCard extends StatefulWidget {
  String title;
  String description;
  int index;
  IconData iconData;

  SettingsCard({this.title, this.description, this.index, this.iconData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsCardState();
  }
}

class SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(widget.iconData,
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.4))
                ],
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily:
                                      UtilsImporter().stringUtils.HKGrotesk,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.description,
                              style: TextStyle(
                                  color: UtilsImporter().colorUtils.greycolor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily:
                                      UtilsImporter().stringUtils.HKGrotesk,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.chevron_right,
                              color: Theme.of(context)
                                  .primaryColorDark
                                  .withOpacity(0.4))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(height: 4),
            Divider()
          ],
        ),
      ),
    );
  }
}
