
import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class Note_Model extends HiveObject{
 @HiveField(0)
  String title;
 @HiveField(1)
  String subtitle;
 @HiveField(2)
 final String date;
 @HiveField(3)
  int color;
 Note_Model(this.title, this.subtitle, this.date, this.color);


}
//flutter packages pub run build_runner build   => terminal to cereat file generator