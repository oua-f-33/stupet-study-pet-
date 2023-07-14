import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model_todo.dart';

class todo extends StatefulWidget {
  todo({Key? key}) : super(key: key);

  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _toDoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey ,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                  'assets/logo.png',
                ),
                )
              ],
            ),
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      searchBox(),
                      Expanded(
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50, bottom: 20),
                              child: Text(
                                "To Do",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            for( ToDo todoo in _foundToDo.reversed)
                              to_do_items(
                                toDo: todoo,
                                onToDoChange: _handleToDoChange,
                                onDeleteItem: _deleteToDoItem,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 20,
                              right: 20,
                              left: 20),
                          padding: EdgeInsets.symmetric(horizontal:  20, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller:  _toDoController,
                            decoration: InputDecoration(
                              hintText: 'Yeni bir TO-DO ekle',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        margin: EdgeInsets.only(bottom: 20, right: 20),
                        child: ElevatedButton(
                          child: Text('+', style: TextStyle(fontSize: 40,),),
                          onPressed: () {
                            _addToDoItem(_toDoController.text);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,

                            elevation: 10,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.45),
                        BlendMode.dstOut)
                )
            ),
          )
      ),
    );
  }

  void _handleToDoChange(ToDo toDo){
    setState(() {
      toDo.isDone = !toDo.isDone;
    });

  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _toDoController.clear();
  }

  void _runFilter(String enteredKeyWord){
    List<ToDo> result = [];
    if(enteredKeyWord.isEmpty){
      result = todosList;
    }else{
      result = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });

  }

  Widget searchBox() {
    return Container(padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Ara',
        ),
      ),
    );
  }
}

class to_do_items extends StatelessWidget {

  final ToDo toDo;
  final onToDoChange;
  final onDeleteItem;

  const to_do_items({Key? key,
    required this.toDo,
    required this.onToDoChange,
    required this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChange(toDo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
            toDo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue),
        title: Text(
          toDo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: toDo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(toDo.id);
            },
          ),
        ),
      ),
    );
  }
}