import 'package:vity/menu/screen/dataaccess/person-dataaccess.dart';
import 'package:vity/menu/screen/model/person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PersonDataAccess pda = PersonDataAccess();
  List<Person> list = <Person>[].obs;
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  var isNew = false;
  var id = -1;

  loadData() async {
    var data = await pda.getAll();
    list.clear();
    list.addAll(data);
  }

  showBottomSheet() {
    return SingleChildScrollView(
      child: Container(
        height: 280,
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title"),
            TextField(
              controller: nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Memo"),
            TextField(
              controller: cityController,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: Size.infinite.width,
                child: ElevatedButton(
                    onPressed: () async {
                      if (isNew) {
                        await pda.insert(Person(
                            name: nameController.text,
                            city: cityController.text));
                      } else {
                        await pda.update(Person(
                            id: id,
                            name: nameController.text,
                            city: cityController.text));
                      }
                      Get.back;
                      loadData();
                    },
                    child: const Text("save")))
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    loadData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UAS",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UAS"),
        ),
        body: Obx((() => ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) async {
                  await pda.deleteById(item.id!);
                  loadData();
                  Get.dialog(SizedBox(
                    height: 130,
                    child: Column(
                      children: [
                        Text(
                          "Data has Deleted",
                          style:
                              TextStyle(fontSize: 23, color: Colors.amber[50]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ));
                },
                background: Container(
                  color: Colors.red[400],
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete),
                ),
                child: TextButton(
                  onPressed: () {
                    id = item.id!;
                    isNew = false;
                    nameController.text = item.name;
                    cityController.text = item.city;
                    Get.bottomSheet(showBottomSheet());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.only(top: 8),
                    height: 54,
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      children: [
                        const Icon(Icons.access_alarms),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index].name),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              list[index].city,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black45),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }))),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            isNew = true;
            nameController.clear();
            cityController.clear();
            Get.bottomSheet(showBottomSheet());
            FocusScope.of(context).requestFocus();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
