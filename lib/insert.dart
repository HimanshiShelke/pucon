import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*class Data {
  Data ({
    required this.venuename,
    required this.venuetype,
    required this.venueaddress,
    required this.venuecontact,
    required this.venuecost,
    required this.venueimage,
  });

  String venuename;
  String venuetype;
  String venueaddress;
  int venuecontact;
  String venuecost;
  String venueimage;



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    //venue_id : json["venue_id"],
    venuename : json["venuename"],
    venuetype : json["venuetype"],
    venueaddress : json["venueaddress"],
    venuecontact :json["venuecontact"],
    venuecost: json["venuecost"],
    venueimage :json["venueimage"],



  );

  Map<String, dynamic> toJson() => {

    //"venue_id" : venue_id,
    "venuename" : venuename,
    "venuetype" : venuetype,
    "venueaddress" : venueaddress,
    "venuecontact" : venuecontact,
    "venuecost" : venuecost,
    "venueimage": venueimage,

  };
}*/
/*Future createPost(String url, {Map }) async {
  /*return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });*/
}*/

class Post {
  final String venuename;
  final String venuetype;
  final String venueaddress;
  final String venuecontact;
  final String venuecost;
  final String venueimage;
  final String venuelimit;

  Post(
      {required this.venuename,
      required this.venuetype,
      required this.venueaddress,
      required this.venuecontact,
      required this.venuecost,
      required this.venueimage,
      required this.venuelimit});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      venuelimit: json['venuelimit'],
      venuename: json['venuename'],
      venuetype: json['venuetype'],
      venueaddress: json['venueaddress'],
      venuecontact: json['venuecontact'],
      venuecost: json['venuecost'],
      venueimage: json['venueimage'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["venuename"] = venuename;
    map["venuetype"] = venuetype;
    map["venueaddress"] = venueaddress;
    map["venuecontact"] = venuecontact;
    map["venuecost"] = venuecost;
    map["venueimage"] = venueimage;
    map["venuelimit"] = venuelimit;

    return map;
  }
}

Future createPost(String url, {required Map data}) async {
  return http.post(Uri.parse(url), body: data).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return Post.fromJson(json.decode(response.body));
  });
}

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);
  //final Future post;
  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  static final CREATE_POST_URL = 'http://10.0.2.2:5000/insertvenue';
  TextEditingController venuenameController = new TextEditingController();
  TextEditingController venuetypeController = new TextEditingController();
  TextEditingController venueaddressController = new TextEditingController();
  TextEditingController venuecontactController = new TextEditingController();
  TextEditingController venuecostController = new TextEditingController();
  TextEditingController venueimageController = new TextEditingController();
  TextEditingController venuelimitController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venuenameController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "VenueName",
                hintText: "VenueName",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venuetypeController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "VenueName",
                hintText: "VenueName",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venuelimitController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "Venuelimit",
                hintText: "Venuelimit",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venueaddressController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "VenuAddress",
                hintText: "VenueAddress",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venuecontactController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "VenueContact",
                hintText: "Contact",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venueimageController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "VenueImg",
                hintText: "Image",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: venuecostController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(1.0),
                ),
                labelText: "Venuecost",
                hintText: "Cost",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 9,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                  ),
                  //gapPadding: 9,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.pink.shade900,
                  ),
                  //gapPadding: 5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () async {
                ///int cimage = (venueimageController.text);
                // int climit = int.parse(venuelimitController.text);
                //int ccontact = int.parse(venuecontactController.text);
                //double ccost = double.parse(venuecostController.text);
                Post newPost = new Post(
                    venuename: venuenameController.text,
                    venueaddress: venueaddressController.text,
                    venuecost: venuecostController.text,
                    venuetype: venuetypeController.text,
                    venueimage: venueimageController.text,
                    venuelimit: venuelimitController.text,
                    venuecontact: venuecontactController.text);
                Post p =
                    await createPost(CREATE_POST_URL, data: newPost.toMap());
                print(p.venuename);
              },
              child: Text("Confirm"),
              color: Colors.red[900],
            )
          ],
        ),
      ),
    );
  }
}
