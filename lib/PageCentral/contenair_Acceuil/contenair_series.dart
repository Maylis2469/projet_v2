import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:projet_v2/API/appel_API_series.dart';
import "package:projet_v2/API/Series_response.dart";
import 'package:projet_v2/Color/color.dart';



class ContenairSeries extends StatelessWidget {
  const ContenairSeries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SeriesResponse>(
      future: SNetworkRequest().loadSeries(),
      builder: (BuildContext context, AsyncSnapshot<SeriesResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final data = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 329,
            margin: const EdgeInsets.only(left: 10),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 329,
                  decoration: BoxDecoration(
                    color: myColor.apbleu,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(data.results.length, (index) {
                        final comic = data.results[index].titre;
                        final image = data.results[index].affiche;
                        return Container(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 10 : 0,
                            right: 10,
                            top: 68,
                          ),
                          decoration: BoxDecoration(
                            color: myColor.cartebleu,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: 180,
                          height: 242,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 180,
                                height: 177,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(image.url),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                comic,
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Text(
                    'Comics populaires',
                    style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: myColor.voirplus,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Voir plus',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(); // Cas par défaut
        }
      },
    );
  }
}