import 'package:flutter/material.dart';
import 'package:local_database/FavoritePage.dart';
import 'package:local_database/HomePage.dart';
import 'package:local_database/SearchPage.dart';
import 'package:local_database/ShoppingPage.dart';
import 'package:provider/provider.dart';
import 'CategoryProvider.dart';
import 'ProductProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context) => ProductProvider(),),ChangeNotifierProvider(create: (context) => CategoryProvider()),],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );


  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int currentPageIndex = 0;

  /*List page = [
     const HomePage(title: '',),
     const SearchPage(title: '',),
     const ShoppingPage(title: '',),
     const FavoritePage(title: '',),
  ];*/


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: <Widget>[
        const HomePage(title: '',),
        const SearchPage(title: '',),
        const ShoppingPage(title: '',),
        const FavoritePage(title: '',),
      ][currentPageIndex],

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },indicatorColor: Colors.deepOrange,
        indicatorShape: const CircleBorder(side: BorderSide.none),
        selectedIndex: currentPageIndex,
        destinations: const<Widget>[
          NavigationDestination(selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),label: "",),
          NavigationDestination(
            icon: Icon(Icons.search),label: "",),
          NavigationDestination(
            icon: Icon(Icons.shop),label: "",),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),label: "",),
        ],
      ),
    );

  }
}
