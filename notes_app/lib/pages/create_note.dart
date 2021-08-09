import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:notes/pages/utils/data.dart";

Data notes = Data();

void main() => runApp(CreatePage());

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {

  String _title = "";
  String _details = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            "NotesApp",
            style: TextStyle(
              fontFamily: "Pacifico",
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 30.0,
          ),
          child: Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Note Title",
                    ),
                    initialValue: "$_title",
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (text) => {
                      setState(() => {
                        _title = text
                      }),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 0,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Note Details",
                    ),
                    initialValue: "$_details",
                    onChanged: (text) => {
                      setState(() => {
                        _details = text
                      }),
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 0,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () {
                        if (_title != "" && _details != "") {
                          notes.addNote(_title, _details);
                          print(notes.getNotes);
                          return Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Add Note",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
