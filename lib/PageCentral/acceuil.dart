import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:projet_v2/PageCentral/contenair_Acceuil/contenair_series.dart';
import 'package:projet_v2/PageCentral/contenair_Acceuil/contenair_film.dart';
import 'package:projet_v2/PageCentral/contenair_Acceuil/container_comics.dart';



//import 'package:projet_v2/Color/color.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenue !',
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Premier conteneur bleu avec les conteneurs orange
          ContenairSeries(),
          SizedBox(height: 20),
          // Premier conteneur bleu avec les conteneurs orange
          ContenairComics(),
          SizedBox(height: 20),
          // Premier conteneur bleu avec les conteneurs orange
          ContenairFilms(),
        ],
      ),
    );
  }
}