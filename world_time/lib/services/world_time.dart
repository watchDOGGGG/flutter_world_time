import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
   String location; //location name for the UI
   String time; // time in that location
   String flag; //Url to an asset flag icon
   String url; // location for url api endpoint
   bool isDaytime; // true or false if day time or not

   WorldTime({required this.isDaytime, required this.time, required this.location, required this.flag, required this.url});

  Future<void> getTime () async{

    try{
      Response response =  await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/berlin'));
      Map data = jsonDecode(response.body);

      //get propertise from data
      String detectime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(detectime);
      now = now.add(Duration(hours: int.parse((offset))));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20? true: false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time = 'could not get time data';
    }


  }
}

