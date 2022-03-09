
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pucon/function.dart';

import 'package:http/http.dart' as http;
import 'package:pucon/insert.dart';


Future<List<Data>> fetchData() async {
  String url='http://10.0.2.2:5000/getvenue';
  final response =
  await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    print ("Connection Successful");
    return jsonResponse.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Data {
  Data ({
    required this.venuename,
    required this.venuetype,
    required this.venueaddress,
    required this.venuecontact,
  });

  String venuename;
  String venuetype;
  String venueaddress;
  String venuecontact;
  //String venuecost;
  //String venueimage;



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    //venue_id : json["venue_id"],
    venuename : json["venuename"],
    venuetype : json["venuetype"],
    venueaddress : json["venueaddress"],
    venuecontact :json["venuecontact"],
    //venuecost: json["venuecost"],
    //venueimage :json["venueimage"],



  );

  Map<String, dynamic> toJson() => {

    //"venue_id" : venue_id,
    "venuename" : venuename,
    "venuetype" : venuetype,
    "venueaddress" : venueaddress,
    "venuecontact" : venuecontact,
    //"venuecost" : venuecost,
    //"venueimage": venueimage,



  };
}


class Venue extends StatefulWidget {
  const Venue({Key? key}) : super(key: key);

  @override
  _VenueState createState() => _VenueState();
}

class _VenueState extends State<Venue> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('venue'),leading: IconButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>InsertData()),);
        }, icon: Icon(Icons.add)),
      ),
      body: Center(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Data> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(data[index].venuename),
                      subtitle: Column(
                        children: [
                          Text(data[index].venueaddress),
                          Text(data[index].venuetype),
                        ],
                      ),
                      onTap: (){},
                    );
                  }

              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

