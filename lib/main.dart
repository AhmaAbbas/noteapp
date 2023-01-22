import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/cubit/addnotecubit/addnote_cubit.dart';
import 'package:noteapp/views/Home.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'Widgets/consts.dart';
import 'cubit/addnotecubit/simple_blocobserver.dart';
import 'cubit/notes/notes_cubit.dart';
import 'note_model/note_model.dart';


Future<void> main() async{
  Bloc.observer=Bloc_observe();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<Note_Model>(knotesbox);

  // await SentryFlutter.init(
  //       (options) => options.dsn = 'https://<key>@sentry.io/<project>',
  //   appRunner: () => runApp(Notes_APP()),
  // );

  runApp(Notes_APP());
}

class Notes_APP extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>Notes_Cubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          brightness: Brightness.dark
        ),
        home:Home_Page() ,
      ),
    );
  }
}


