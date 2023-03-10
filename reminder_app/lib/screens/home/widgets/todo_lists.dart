import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/models/todo_list/todo_list_collection.dart';

import '../../../common/widgets/category_icon.dart';
import '../../../models/common/custom_color_collection.dart';
import '../../../models/common/custom_icon_collection.dart';

class TodoLists extends StatelessWidget {
  const TodoLists({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final todoLists = Provider.of<TodoListCollection>(context).todoList;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Lists',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) {
                    Provider.of<TodoListCollection>(context, listen: false)
                        .removeTodoList(todoLists[index]);
                  },
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  background: Container(
                    alignment: AlignmentDirectional.centerEnd,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      leading: CategoryIcon(
                          backgroundColor: CustomColorCollection()
                              .findColorById(todoLists[index].icon['color'])
                              .color,
                          iconData: CustomIconCollection()
                              .findIconById(todoLists[index].icon['id'])
                              .icon),
                      title: Text(todoLists[index].title),
                      trailing: Text('0',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
