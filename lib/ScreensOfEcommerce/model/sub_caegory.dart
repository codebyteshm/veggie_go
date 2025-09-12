import 'package:get/get.dart';

class SubCategories {
  String? image;
  String name;
  RxBool isOpen ;
  String? id;


  SubCategories(this.name,this.isOpen,{this.image,this.id});
}