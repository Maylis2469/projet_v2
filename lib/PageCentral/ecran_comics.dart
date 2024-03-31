import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_v2/API/appel_API.dart';
import "package:projet_v2/API/ComicVine_response.dart";

import 'package:projet_v2/Color/color.dart';



// Créez une nouvelle classe pour le contenu que vous souhaitez afficher dans l'index 5
class IndexComics extends StatelessWidget {
  const IndexComics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Comics les plus populaires',
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 196,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: myColor.apbleu,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 128.86,
                            height: 163,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://m.media-amazon.com/images/I/71XlZvKMwoL._AC_UF1000,1000_QL80_.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder(
                                  future: NetworkRequest().loadCharacters(),
                                  builder: (BuildContext context, AsyncSnapshot<CharactersResponse> data) {
                                    if (data.hasError) {
                                      return const Text(' ...');
                                    } else if (data.hasData) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: '${data.data!.results[index].tome.titre}\n\n\n',
                                                  style: GoogleFonts.nunito(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                    child: Icon(Icons.my_library_books, color: Colors.grey),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'N°${data.data!.results[index].numtome}\n',
                                                  style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,fontSize: 17, ),),
                                                ),
                                                WidgetSpan(
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                    child: Icon(Icons.calendar_today_outlined, color: Colors.grey),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '${data.data!.results[index].publication}',
                                                  style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,fontSize: 17, ),),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  },
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        width: 59.36,
                        height: 40,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '#${index + 1}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}