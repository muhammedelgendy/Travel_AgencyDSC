import 'package:Travel_Agency/classes.dart';
import 'dart:io';
main() {
  Trip a = new Trip();
  a.welcome_func();
  loop1: for (int i = 0; i < 1; i--) {

    for(int f = 0 ; f < 1 ; f--){
      try{var user_input = int.parse(stdin.readLineSync());
      switch (user_input) {
        case 1 :
          {a.add_trip();} break;
        case 2 :
          {a.edit_trip();}break;
        case 3 :
          {a.delete_trip();}break;
        case 4:
          {a.view_trips();}break;
        case 5:
          {a.Search_trip();}break;
        case 6 :
          {a.rserve_trip();}break;
        case 7 :
          {a.discount();}break;
        case 8 :
          {a.latest_trips();}break;
        case 9:
          {a.view_passengers();} break;
        case 10 :
          {print("Thankyou!");} break;
        default : {print("invalid Choice!, please enter from 1 to 10");} break;
      }
      if(user_input ==10)break;
      break;
      throw Exception;}
      catch(e){print("invalid Choice!");}
    }
  }
}