import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  // Khởi tạo biến state cho toàn bộ list ghi chú
  List todoItems = [];

  // Khởi tạo biến state cho phần tử hiện đang được chọn để chỉnh sửa
  String itemBeingEdited = '';

  void addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => todoItems.add({'task': task, 'completed': false}));
    }
  }

  void removeTodoItem(int index) {
    setState(() => todoItems.removeAt(index));
  }

  void promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Xoá "${todoItems[index]['task']}" ?'),
            actions: [
              ElevatedButton(
                  child: const Text('CANCEL'),
                  onPressed: () => Navigator.of(context).pop()),
              ElevatedButton(
                child: const Text('DELETE'),
                onPressed: () {
                  removeTodoItem(index);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // tạo hàm check thời gian
  void checkTime() {
    DateTime now = DateTime.now();
    String formattedDate = now.toString();
    print(formattedDate);
  }

  void updateTodoItem(String newTask) {
    setState(() {
      // Tìm phần tử cần sửa và cập nhật task
      todoItems[todoItems.indexWhere(
          (element) => element['task'] == itemBeingEdited)]['task'] = newTask;

      // Đánh dấu item hiện đang được chỉnh sửa là rỗng để đóng form chỉnh sửa
      itemBeingEdited = '';
    });
  }

  void toggleTodoItem(int index) {
    setState(() {
      // Đánh dấu phần tử là hoàn thành hoặc chưa hoàn thành
      todoItems[index]['completed'] = !todoItems[index]['completed'];
    });
  }

  Widget buildTodoList() {
    return ListView.builder(
      itemCount: todoItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Column(
              children: [
                Row(children: [
                  // Text hiển thị công việc
                  Expanded(
                    child: Text(
                      todoItems[index]['task'],
                      style: TextStyle(
                          decoration: todoItems[index]['completed']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ),

                  // Nút Xóa
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => promptRemoveTodoItem(index),
                  ),

                  // Nút hoàn thành / Chưa hoàn thành
                  Checkbox(
                    value: todoItems[index]['completed'],
                    onChanged: (value) => toggleTodoItem(index),
                  ),
                ]),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: LinearProgressIndicator(
                        value: 0.1,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation(Colors.blue),
                      ),
                    ),
                  ],
                ),
                // Tạo nút check thời gian
                ElevatedButton(
                  child: const Text('Check Time'),
                  onPressed: () {
                    checkTime();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _addTodoItemDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTask = '';
          return AlertDialog(
            title: Text('Nhập vào công việc của bạn'),
            content: TextFormField(
                autofocus: true,
                onChanged: (value) {
                  newTask = value;
                }),
            actions: [
              ElevatedButton(
                child: const Text('CANCEL'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ElevatedButton(
                child: const Text('ADD'),
                onPressed: () {
                  addTodoItem(newTask);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Quản Lý Công việc'),
        ),
        body: Column(
          children: [
// Form thêm nhiệm vụ mới
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: () {
                      _addTodoItemDialog();
                    },
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            Expanded(
              child: buildTodoList(),
            )
          ],
        ));
  }
}
