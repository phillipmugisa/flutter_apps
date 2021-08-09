class Data {

  List<Map<String, String>> _notes = [
    {
      "title": "This is the first note",
      "details": "This are details of the first note"
    },
    {
      "title": "This is the second note",
      "details": "This are details of the second note"
    },
    {
      "title": "This is the third note",
      "details": "This are details of the third note "
    },
    {
      "title": "This is the third note",
      "details": "This are details of the third note This are details of the third note This are details of the third note This are details of the third note "
    },
    {
      "title": "This is the third note",
      "details": "This are details of the third note "
    },
    {
      "title": "This is the third note",
      "details": "This are details of the third note "
    },
    {
      "title": "This is the third note",
      "details": "This are details of the third note "
    },
  ];

  List<Map<String, String>> get getNotes {
    return _notes;
  }

  Map getNote(int id) {
    return _notes[id];
  }

  void addNote(String noteTitle, String noteContent) {
    Map<String, String> _newNote = {
      "title": noteTitle,
      "details": noteContent
    };
    _notes.add(_newNote);
  }

  void deleteNote(int id) {
    _notes.removeAt(id);
  }

  int getIndexOf(note) {
    return _notes.indexOf(note);
  }

}