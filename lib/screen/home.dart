import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendor/component/colors.dart';
import 'package:vendor/service/authService.dart';
import 'package:vendor/screen/login.dart';
import 'package:vendor/screen/productPage.dart';
import 'package:vendor/screen/profilePage.dart';
import 'package:vendor/screen/homePage.dart';

enum menuItem { about, logout }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final List<Widget> pages = [HomePage(), ProfilePage(), ProductPage()];
  void onItemTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    bool login = authService.user != null;
    if(!login) return Login();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mSeller300,
        leading: Icon(Icons.menu, color: mSeller900),
        title: Text('myVendor', style: Theme.of(context).textTheme.title),
        actions: <Widget>[
          PopupMenuButton<menuItem>(
              icon: Icon(Icons.settings, color: mSeller900),
              offset: Offset(0, 100),
              elevation: 8.0,
              onSelected: (menuItem menu) {
                switch (menu) {
                  case menuItem.about:
                    Navigator.pushNamed(context, '/add');
                    break;
                  case menuItem.logout:
                    print('logout');
                    break;
                }
              },
              itemBuilder: (context) => <PopupMenuEntry<menuItem>>[
                    PopupMenuItem(
                      child: Text('About',
                          style: Theme.of(context).textTheme.caption),
                      value: menuItem.about,
                    ),
                    PopupMenuItem(
                      child: Text('Logout',
                          style: Theme.of(context).textTheme.caption),
                      value: menuItem.logout,
                    )
                  ])
        ],
      ),
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: menuStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile', style: menuStyle),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Text('Product', style: menuStyle),
          ),
        ],
        currentIndex: _selectedPage,
        backgroundColor: mSeller300,
        selectedItemColor: mSellerBackgroundWhite,
        onTap: onItemTap,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mSeller900,
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/add');
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
