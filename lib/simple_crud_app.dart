import 'package:d_info/d_info.dart';
import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/simple_crud_controller.dart';
import 'package:get/get.dart';

class SimpleCrudApp extends StatefulWidget {
  const SimpleCrudApp({super.key});

  @override
  State<SimpleCrudApp> createState() => _SimpleCrudAppState();
}

class _SimpleCrudAppState extends State<SimpleCrudApp> {
  final simpleCRUDController = Get.put(SimpleCRUDController());

  addView() {
    final editInput = TextEditingController();
    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(controller: editInput),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpleCRUDController.add(editInput.text);
                Navigator.pop(context);
                DInfo.toastSuccess('Data was successfully added');
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }

  updateView(String oldData, int index) {
    final editInput = TextEditingController();
    editInput.text = oldData;
    DInfo.customDialog(
      context: context,
      content: Column(
        children: [
          DInput(controller: editInput),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                simpleCRUDController.updateItem(
                  index,
                  editInput.text,
                );
                Navigator.pop(context);
                DInfo.toastSuccess('Data was successfully updated');
              },
              child: const Text("Update"),
            ),
          )
        ],
      ),
    );
  }

  deleteView(String oldData, int index) {
    DInfo.dialogConfirmation(
      context,
      'Delete',
      'Are you sure you want to delete $oldData',
    ).then((yes) {
      if (yes ?? false) {
        simpleCRUDController.delete(index);
      }
    });
  }

  @override
  void dispose() {
    simpleCRUDController.clearState();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Crdud'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              addView();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GetX(
        init: SimpleCRUDController(),
        builder: (controller) {
          List<String> list = controller.list;
          if (list.isEmpty) {
            return const Center(
              child: Text('No data'),
            );
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              String item = list[index];

              return ListTile(
                leading: IconButton.filled(
                  onPressed: () {
                    updateView(item, index);
                  },
                  icon: const Icon(Icons.edit),
                  color: Colors.white,
                ),
                title: Text(item),
                trailing: IconButton.filled(
                  onPressed: () {
                    deleteView(item, index);
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.white,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
