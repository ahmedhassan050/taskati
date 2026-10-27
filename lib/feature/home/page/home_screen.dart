import 'package:flutter/material.dart';
import 'package:taskati2/core/functions/navigations.dart';
import 'package:taskati2/core/functions/extensions.dart';
import 'package:taskati2/core/styles/appcolor.dart';
import 'package:taskati2/core/widgets/my_scaffold.dart';
import 'package:taskati2/feature/create_task/page/create_task_screen.dart';
import 'package:taskati2/feature/home/widgets/task_builder.dart';

import '../widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeHeader(),
          
            TaskBuilder(),
          ],
        ),
      ),
floatingActionButton: FloatingActionButton(onPressed: (){
  pushTo(context, CreateAndEditTaskScreen());
},
shape: CircleBorder(),
backgroundColor: context.theme.primaryColor,
child: Icon(Icons.add,color: LightPalette.background,size:28,),
),
    );
  }
}

