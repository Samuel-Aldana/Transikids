import 'package:flutter/material.dart';
import 'package:flutter_application_1/bases/colores/colores.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  // Quicksand
  static final TextStyle quickBold = GoogleFonts.quicksand(
    fontSize: 21.05,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle quickSemiBold = GoogleFonts.quicksand(
    fontSize: 21.05,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle quickRegular = GoogleFonts.quicksand(
    fontSize: 21.05,
    fontWeight: FontWeight.normal,
  );

  // Montserrat
  static final TextStyle montSemiBold = GoogleFonts.montserrat(
    fontSize: 21.05,
    fontWeight: FontWeight.w600,
  );

  // Texto general
  static const TextStyle cuerpo = TextStyle(
    color: AppColors.base,
    fontSize: 18,
  ); 
  static final TextStyle montSemiBolde = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle quickRegularp = GoogleFonts.quicksand(
    fontSize: 14.4,
    fontWeight: FontWeight.normal,
  );
   static final TextStyle quickRegularpe = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle quickRegularcambiante = GoogleFonts.quicksand(
    color: AppColors.botondatos,
    fontSize: 13,
    fontWeight: FontWeight.normal,
     );
  static final TextStyle montSereg = GoogleFonts.montserrat(
    fontSize: 12,
  );

}