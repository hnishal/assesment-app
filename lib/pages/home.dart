import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:assessment_app/services/data.Dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Data> returnData;

  Widget clientList(List<Clients> clientInfo) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            itemCount: clientInfo.length,
            itemBuilder: (context, index) {
              return ClientTile(clientData: clientInfo[index]);
            },
          )
        ],
      ),
    );
  }

  void initState() {
    returnData = getInfo();
    super.initState();
  }

  Future<Data> getInfo() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/e4e8069c-1e6a-46c5-ba99-8ce20bd2690e'));
    if (response.statusCode == 200) {
      return Data.fromJson(jsonDecode(response.body));
    } else {
      print("not success");
      throw Exception("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("List", style: TextStyle(fontSize: 22)),
            Text("View",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                )),
          ],
        ),
      ),
      body: Container(
          child: FutureBuilder<Data>(
        future: returnData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return clientList(snapshot.data!.clients);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}

class ClientTile extends StatelessWidget {
  const ClientTile({Key? key, required this.clientData}) : super(key: key);

  final Clients clientData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 80,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black38.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clientData.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  clientData.company,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
