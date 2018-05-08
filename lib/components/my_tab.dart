import 'package:flutter/material.dart';
import "../algo_struc/priority_queue.dart";


class MyTab extends StatefulWidget {

  @override
  _MyTab createState() => new _MyTab();

}


class _MyTab extends State<MyTab> {

  /// Набираемый текст заметки
  String _todoText = "";
  /// Очередь для хранения заметок
  PriorityQueue<String> _queue = new PriorityQueue<String>();
  /// Иконка приоритета заметки
  Icon _todoPriority;
  /// Текст самой важной заметки
  String _topTodoText = "";
  /// Текст самой важной заметки
  Icon _topTodoPriority = new Icon(null);
  /// Список заметок
  List<ListTile> _listView = <ListTile>[];

  /// Определине приоритета по иконке
  int _getPriorityByIcon(Icon icon) {
    if (icon.icon == Icons.sentiment_very_dissatisfied) {
      return 5;
    } else if (icon.icon == Icons.sentiment_dissatisfied) {
      return 4;
    } else if (icon.icon == Icons.sentiment_neutral) {
      return 3;
    } else if (icon.icon == Icons.sentiment_satisfied) {
      return 2;
    }
    return 1;
  }

  /// Установить иконку приоритета по численному значению
  Icon _getPriorityByInt(int priority) {
    if (priority == 5) {
      return new Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red[400],
      );
    } else if (priority == 4) {
      return new Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.purple[400],
      );
    } else if (priority == 3) {
      return new Icon(
        Icons.sentiment_neutral,
        color: Colors.yellow[600],
      );
    } else if (priority == 2) {
      return new Icon(
        Icons.sentiment_satisfied,
        color: Colors.blue[600],
      );
    }
    return new Icon(
      Icons.sentiment_very_satisfied,
      color: Colors.greenAccent[400],
    );
  }

  /// Добавить новую заметку в очередь
  void _addTodo() {
    if (this._todoPriority == null) return;
    int priority = this._getPriorityByIcon(this._todoPriority);
    if (this._todoText.isNotEmpty) {
      print("Insert(${priority}, '${this._todoText}')");
      setState(() {
        this._queue.insert(priority, this._todoText);
        this._setTopTodo();
        this._listView.add(new ListTile(
          trailing: new Icon(
            this._todoPriority.icon,
            color: this._todoPriority.color,
          ),
          title: new Text(this._todoText),
        ));
        this._todoPriority = null;
      });
    }
  }

  /// Удаление заметки
  void _deleteTodo() {
    setState(() {
      var max = this._queue.popMax();
      this._setTopTodo();
      if (this._listView.isNotEmpty) {
        var k = 0;
        this._listView.removeWhere((ListTile w) {
          var value = (w.title as Text).data;
          var priority = this._getPriorityByIcon(w.trailing as Icon);
          var b = (value == max.value) && (priority == max.priority);
          return b && (k++ == 0);
        });
      }
    });
  }

  /// Определить самую важную заметку
  void _setTopTodo() {
    setState(() {
      var max = this._queue.max;
      if (max == null) {
        this._topTodoText = "";
        this._topTodoPriority = null;
      } else {
        print("max: ${max.priority},${max.value}");
        this._topTodoText = max.value;
        this._topTodoPriority = this._getPriorityByInt(max.priority);
      }
    });
  }

  /// Изменить текст набираемой заметки на новый [text]
  void _changeTodoText(String text) {
    setState(() {
      this._todoText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Center(
            child: new Text(
              "Todo",
              textAlign: TextAlign.center,
            ),
          ),
          bottom: new TabBar(
            tabs: [
              new Tab(icon: new Icon(Icons.add)),
              new Tab(icon: new Icon(Icons.list)),
              new Tab(icon: new Icon(Icons.star)),
            ],
          ),
        ),
        body: new TabBarView(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red[400],
                        ),
                        onPressed: () {
                          setState(() {
                            this._todoPriority = new Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red[400],
                            );
                          });
                        },
                      ),
                      new IconButton(
                        icon: new Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.purple[400],
                        ),
                        onPressed: () {
                          setState(() {
                            this._todoPriority = new Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.purple[400],
                            );
                          });
                        },
                      ),
                      new IconButton(
                        icon: new Icon(
                          Icons.sentiment_neutral,
                          color: Colors.yellow[600],
                        ),
                        onPressed: () {
                          setState(() {
                            this._todoPriority = new Icon(
                              Icons.sentiment_neutral,
                              color: Colors.yellow[600],
                            );
                          });
                        },
                      ),
                      new IconButton(
                        icon: new Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.blue[600],
                        ),
                        onPressed: () {
                          setState(() {
                            this._todoPriority = new Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.blue[600],
                            );
                          });
                        },
                      ),
                      new IconButton(
                        icon: new Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.greenAccent[400],
                        ),
                        onPressed: () {
                          setState(() {
                            this._todoPriority = new Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.greenAccent[400],
                            );
                          });
                        },
                      ),
                    ],
                  ),
                  new Container(
                    padding: new EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: new TextField(
                      onChanged: this._changeTodoText,
                      decoration: new InputDecoration(
                        suffixIcon: this._todoPriority,
                        border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                            width: 1.0,
                          ),
                        ),
                        labelText: "Название задачи",
                      ),
                    ),
                  ),
                  new RaisedButton(
                    child: new Text("Добавить"),
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    onPressed: this._addTodo,
                  ),
                ],
              ),
              new ListView(
                children: this._listView,
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: new EdgeInsets.only(right: 10.0),
                        child: Text(this._topTodoText),
                      ),
                      new Container(
                        child: this._topTodoPriority,
                      ),
                    ],
                  ),
                  new Container(
                    padding: new EdgeInsets.only(top: 10.0),
                    child: new RaisedButton(
                      child: new Text("Выполнено"),
                      color: Colors.lightBlue,
                      textColor: Colors.white,
                      onPressed: this._deleteTodo,
                    )
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }

}
