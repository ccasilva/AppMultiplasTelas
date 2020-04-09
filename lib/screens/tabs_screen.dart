import 'package:flutter/material.dart';
import 'package:navagacaomultiplastelas/screens/categories_screen.dart';
import 'categories_meals_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectScreenIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );

//    return DefaultTabController(
//      length: 2,
//      //initialIndex: 1, // È possivel definir uma aba inicial.
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Vamos Cozinhar?'),
//          bottom: TabBar(
//            tabs: <Widget>[
//              Tab(
//                icon: Icon(Icons.category),
//                text: 'Categorias',
//              ),
//              Tab(
//                icon: Icon(Icons.star),
//                text: 'Favoritos',
//              )
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: <Widget>[
//            CategoriesScreen(),
//            FavoriteScreen(),
//          ],
//        ),
//      ),
//    );
  }
}
