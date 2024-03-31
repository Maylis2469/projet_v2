import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:projet_v2/ComicVine_response.dart';


import 'API/appel_API.dart';
import 'API/ComicVine_response.dart';


import 'PageCentral/ecran_comics.dart';
import 'PageCentral/ecran_movies.dart';
import 'PageCentral/ecran_series.dart';
import 'PageCentral/acceuil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Color/color.dart';



void main() {
  runApp(const MyApp());
}

/// Exercice : Faire en sorte d'ouvrir l'écran 2 en utilisant GoRouter
/// Cf https://pub.dev/packages/go_router
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: const AppBarTheme(
            backgroundColor: myColor.bleumarine,
            elevation: 0.0,

          )),

      home: const Screen2(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: NetworkRequest().loadCharacters(),
          builder: (BuildContext context, AsyncSnapshot<CharactersResponse> data) {
            if (data.hasError) {
              return const Text('Une erreur est survenue !');
            } else if (data.hasData) {
              // Afficher l'image récupérée depuis l'API
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'URL de l\'image :',
                      style: GoogleFonts.abrilFatface(),),
                    Text(data.data!.results[1].tome.titre,)
                    //Image.network(data.data!.results[1].apiUrl.imageUrl, width:75, height: 200, ),
                    //Image.network('https://comicvine.gamespot.com/a/uploads/scale_avatar/0/2/868526-superman.jpg', width:200),

                  ]
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

//-----------------------------------------------------ECRAN D'ACCEUIL------------------------------------------------------------------------------------------//
class Screen2 extends StatelessWidget{
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Acceuil(),
    IndexComics(),
    IndexSeries(),
    IndexMovies(),
    const Text(
      'Index 5: School',
    ),
];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColor.bleumarine,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Acceuil',
              backgroundColor: myColor.botombar,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Business',
              backgroundColor: myColor.botombar,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'School',
              backgroundColor: myColor.botombar,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_movies),
              label: 'Films',
              backgroundColor: myColor.botombar,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Recherche',
              backgroundColor: myColor.botombar,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: myColor.Textb,
          unselectedItemColor: myColor.icone,
          backgroundColor: myColor.bleumarine,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}