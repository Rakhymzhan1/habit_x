import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_x/screens/finance_page.dart';
import 'package:habit_x/screens/goals_page.dart';
import 'package:habit_x/screens/notes_page.dart';
import 'package:habit_x/screens/todo_list_page.dart';
import 'package:habit_x/screens/tracker_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  static MaterialPageRoute get route =>
      MaterialPageRoute(builder: (context) => BottomNavigationBarPage());
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final pages = [GoalsPage(),
    const TodoListPage(),
    const TrackerPage(),
    const NotesPage(),
    const FinancePage(),
  ];

  final List<PageAppBar> appBars = [
    PageAppBar('Goals', Icons.article, Icons.article_outlined),
    PageAppBar('Todo List', Icons.edit_calendar_outlined, Icons.more_vert_sharp),
    PageAppBar('Tracker',Icons.article, Icons.article_outlined),
    PageAppBar('Notes', Icons.edit_calendar_outlined, Icons.search),
    PageAppBar('Finance', Icons.auto_graph_sharp, Icons.pie_chart_sharp),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:  Icon(appBars[currentIndex].icon1, size: 35,),
            onPressed: () {},
          ),
          IconButton(
            icon:  Icon(appBars[currentIndex].icon2, size: 35,),
            onPressed: () {},
          ),
          SizedBox(width: 10,),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, size: 35,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        title: Text(appBars[currentIndex].title, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),),
        drawer: MyDrawer(),
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _bottomNavBarItem('lib/assets/goals.png', () {
                      setState(() {
                        currentIndex = 0;
                      });
                    }),
                    _bottomNavBarItem('lib/assets/todo_list.png', () {
                      setState(() {
                        currentIndex = 1;
                      });
                    }),
                    _bottomNavBarItem('lib/assets/tracker.png', () {
                      setState(() {
                        currentIndex = 2;
                      });
                    }),
                    _bottomNavBarItem('lib/assets/notes.png', () {
                      setState(() {
                        currentIndex = 3;
                      });
                    }),
                    _bottomNavBarItem('lib/assets/finance.png', () {
                      setState(() {
                        currentIndex = 4;
                      });
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottomNavBarItem(String image, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(width: 80, child: Image.asset(image)),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 45,),
           Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20,),
                InkWell(onTap: (){
                  Navigator.pop(context);
                },child: Container(height: 50, alignment: Alignment.center, child: Icon(Icons.arrow_back_ios, color: Theme.of(context).colorScheme.primary, size: 20,))),
                SizedBox(width: 20,),
                Text('Habit X', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 30, fontWeight: FontWeight.w600),),
              ],
            ),
            Container(
              height: 60,
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width - 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Icon(Icons.nights_stay_outlined, color: Theme.of(context).colorScheme.primary, size: 30,),
              ),
            ),
          ListTile(
            leading:  Icon(Icons.star, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('HabitX Premium', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading:  Icon(CupertinoIcons.paintbrush, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('Themes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading:  Icon(Icons.language, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('Language', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading:  Icon(Icons.settings, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('Settings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading:  Icon(Icons.share, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('Share', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading:  Icon(Icons.feedback_outlined, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('Feedback', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading:  Icon(Icons.star, size: 35,color: Theme.of(context).colorScheme.primary,),
            title: Text('Rate Us', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary),),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
        ],
      ),
    );
  }
}

final class PageAppBar{
  final String title;
  final IconData icon1;
  final IconData icon2;

  PageAppBar(this.title, this.icon1, this.icon2);
}
