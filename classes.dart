import 'dart:io';
class Trip {
  List added_trips = [20, 1230, "Dahab", 55, 650,
    15, 1231, "cairo", 40, 350,
    12, 1232, "Sharm", 50, 12000];
  Map names = {};

//adding trip
  add_trip() {
    print("enter Date");
    this.added_trips.add(stdin.readLineSync());
    print("enter ID");
    this.added_trips.add(stdin.readLineSync());
    print("enter location");
    this.added_trips.add(stdin.readLineSync());
    print("enter passenger limit");
    this.added_trips.add(stdin.readLineSync());
    print("enter price");
    this.added_trips.add(int.parse(stdin.readLineSync()));
    print("trip added successfully ...");
  }

  //edit trip
  edit_trip() {
    trips();  //view List of available trips

    print("enter trip ID");

    int trip_ID = int.parse(stdin.readLineSync());
    for (int y = 1; y < this.added_trips.length; y += 5) {
      if (trip_ID == added_trips[y]  ) {
        /* as arranged in list
            * added_trips[y] >> trip ID
            * added_trips[y-1] >> trip date
            * added_trips[y+1] >> trip location
            * added_trips[y+1] >> trip passenger limit
            * added_trips[y+2] >> trip price */
        print("enter new date");
        this.added_trips[y - 1 ] = stdin.readLineSync();
        print("enter new ID");
        this.added_trips[y] = stdin.readLineSync();
        print("enter new location");
        this.added_trips[y + 1] = stdin.readLineSync();
        print("enter new passenger limit");
        this.added_trips[y + 2] = stdin.readLineSync();
        print("enter new price");
        this.added_trips[y + 3] = int.parse(stdin.readLineSync());
        print("trip edited successfully..");
      }
    }
  }

  delete_trip() {
    trips() /* view trips available*/;
    print("enter trip ID");
    int trip_ID = int.parse(stdin.readLineSync());
    for (int x = 1; x < this.added_trips.length; x += 5) {
      if (trip_ID == this.added_trips[x]) {
        this.added_trips.removeRange(x, x + 4);
        print("trip deleted successfully");
      }
    }
  }


  view_trips() {
    List dates = []; //list of all available trips dates
    for (int i = 0; i < this.added_trips.length; i += 5) {
      dates.add(this.added_trips[i]);
    }
    dates.sort(); // sort dates list
    print("Date      ID       location     passenger limit         price");
    for (int m = 0; m < dates.length; m++)/* get the first date of sorted list*/ {
      for (int j = 0; j < this.added_trips.length; j += 5) /* get the equivalent date from the main lis*/{
        if (dates[m] == this.added_trips[j])/* print trip of the date sorted*/ {
          print(" " + this.added_trips[j].toString() + "      "
              + this.added_trips[j + 1].toString() + "       "
              + this.added_trips[j + 2] + "             "
              + this.added_trips[j + 3].toString() + "                "
              + this.added_trips[j + 4].toString());
        }
      }
    }
  }

  Search_trip() {
    print("enter price");
    var price = int.parse(stdin.readLineSync());
    for (int v = 4; v < this.added_trips.length; v += 5) {
      if (price == this.added_trips[v] /* trip price*/) {
        print(
            "Date      ID        location     passenger limit      price");
        print(" " + this.added_trips[v - 4].toString() + "      "
            + this.added_trips[v - 3].toString() + "       "
            + this.added_trips[v - 2] + "             "
            + this.added_trips[v - 1].toString() + "                "
            + this.added_trips[v].toString());
      }
    }
  }

  rserve_trip() {
    trips();
    var ticket_sold = 0;
    print("enter trip ID");
    var trip_id = int.parse(stdin.readLineSync());
    for (int s = 1; s < this.added_trips.length; s += 5) {
      if (trip_id == this.added_trips[s]) {
        if (ticket_sold < this.added_trips[s + 3] /*passenger limit*/) {
          print("enter your name");
          String name = stdin.readLineSync();
          names[added_trips[s]] = name /* add trip ID as key and name as value in names map*/;
          print("your trip reserved");
          if(this.added_trips[s+3] > 10000) discount(s+3) /* if price over 10000 offers discount*/;
          ticket_sold ++;
        }
        else {
          print("sorry, completed");
        }
      }
    }
  }

  discount([int w]) {

    var trip_price = added_trips[w] - (added_trips[w] * 20 / 100);
    print(
        " we offer discount for 20% discount, so your trip price will be $trip_price ");
  }

  latest_trips() {
    print("Date      ID        location     passenger limit      price");
    for (int z = 0; z < this.added_trips.length; z += 5) {
      print(" " + this.added_trips[z].toString() + "      "
          + this.added_trips[z + 1].toString() + "       "
          + this.added_trips[z + 2] + "             "
          + this.added_trips[z + 3].toString() + "                "
          + this.added_trips[z + 4].toString());
      if(this.added_trips.length == 50) break /* 50 is number of index of 10 trips as every trip have 5 indexes*/;
    }
  }

  view_passengers() {
    print("all passengers : ");
    names.forEach((K, V) => print(V)); /*print all values of names map "all passengers reservede"*/
    print("enter trip ID");
    var trip_Id = int.parse(stdin.readLineSync());
    names.containsKey(trip_Id) ? print(names[trip_Id]) : print(
        "no passengers founded");
  }


//print main menu
  welcome_func(){
    print("                  ******            "
        "\nWelcome! please choose how can i help you \n"
        "___________________________________________");
    print("1: Add trip        |       6: Reserve trip \n"
        "2: Edit trip       |       7: Discount \n"
        "3: Delete trip     |       8: Latest trips \n"
        "4: View trips      |       9: View passengers \n"
        "5: Search trip     |       10: Exit");
  }

  //view trips available
  trips(){
    print("Date      ID       location     passenger limit         price");
    for(int b=0; b < this.added_trips.length ; b+=5){
      print(" "+ this.added_trips[b].toString()  +"      "
          + this.added_trips[b+1].toString() +"       "
          + this.added_trips[b+2] +"             "
          + this.added_trips[b+3].toString() +"                "
          + this.added_trips[b+4].toString() );
    }
  }
}
