import "package:flutter/material.dart";
import 'package:notes/pages/edit_page.dart';
import "package:notes/pages/utils/data.dart";

Data notes = Data();

void main() => runApp(Notes());

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Map<String, String>> _notes = notes.getNotes;

  void removeNote(int id) {
    setState(() {
      notes.deleteNote(id);
    });
  }

  Future<void> refresh() async{
    print("loading");
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _notes = notes.getNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_notes);
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                  ))
            ],
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              "NotesApp",
              style: TextStyle(
                fontFamily: "Pacifico",
                color: Colors.black,
              ),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: refresh,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  children: _notes.map((Map<String, String> note) {
                    return NoteCard(
                      title: "${note["title"]}",
                      noteContent: "${note["details"]}",
                      noteId: notes.getIndexOf(note),
                      deleteFunc: removeNote,
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, "/create");
            },
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
          ),
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String? title;
  final String? noteContent;
  final int? noteId;
  final Function deleteFunc;

  NoteCard(
      {this.title, this.noteContent, this.noteId, required this.deleteFunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.5,
            color: Colors.black45,
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "$title",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Poppins",
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 0.0,
                    ),
                    child: Text(
                      "$noteContent",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditPage()));
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () => this.deleteFunc(this.noteId),
                  icon: Icon(
                    Icons.delete_outline_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
