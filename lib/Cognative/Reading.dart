import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Response {
  bool? success;
  String? message;

  Response({this.success, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    return _data;
  }
}


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _textController = TextEditingController();

  // ...previous code

  _handleSubmitted(String text) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://hackthon-x9vu.onrender.com/api/chat'));
    request.body = json.encode({"message": "$text"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Convert the response stream to a String and store it in a variable
      String responseBody = await utf8.decodeStream(response.stream);



      print(Response.fromJson(jsonDecode(responseBody)).message);
      return Response.fromJson(jsonDecode(responseBody)).message;
    } else {
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assistance')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => ListTile(title: Text(_messages[index])),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
            child: Row(
              children: [
                Spacer(),
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () {
                    _handleSubmitted(_textController.text).then((value) {
                      setState(() {
                        _messages.add(value);
                      });
                    });
                    _textController.clear();
                  },

                  child: Icon(Icons.mic),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(hintText: 'Send a message'),
                  ),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () {

                    _handleSubmitted(_textController.text).then((value) {
                      setState(() {
                        _messages.add(value);
                      });
                    });
                    _textController.clear();
    },

                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}