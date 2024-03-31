import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_v2/API/appel_API_movies.dart';
import "package:projet_v2/API/Movies_response.dart";

import 'package:projet_v2/Color/color.dart';



// Créez une nouvelle classe pour le contenu que vous souhaitez afficher dans l'index 5
class IndexMovies extends StatelessWidget {
  const IndexMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Films les plus populaires',
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
          FutureBuilder(
            future: MNetworkRequest().loadMovies(),
            builder: (BuildContext context, AsyncSnapshot<MoviesResponse> data) {
              if (data.hasError) {
                return const Text(' ...');
              } else if (data.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    String date = data.data!.results[index].date;
                    String datefinal = date.split('-')[0];
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
                                        data.data!.results[index].affiche.url,
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
                                      Text.rich(
                                        TextSpan(
                                          children: <InlineSpan>[
                                            TextSpan(
                                              text: '${data.data!.results[index].titre}\n\n\n',
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
                                                child: Icon(Icons.local_movies_sharp, color: Colors.grey),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${data.data!.results[index].temps} minutes\n',
                                              style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,fontSize: 17, ),),
                                            ),
                                            WidgetSpan(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                                child: Icon(Icons.calendar_today_outlined, color: Colors.grey),
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${datefinal}',
                                              style: GoogleFonts.nunito(textStyle: TextStyle(color: Colors.white,fontSize: 17, ),),
                                            ),

                                          ],
                                        ),
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
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}