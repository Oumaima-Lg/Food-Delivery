import 'package:ff/model/Chinese_model.dart';

List<ChineseModel> getChinese() {
  List<ChineseModel> chinese = [];

  ChineseModel chineseModel = ChineseModel();
  chineseModel.name = "Chinese";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "150";
  chinese.add(chineseModel);

  chineseModel = ChineseModel();
  chineseModel.name = "Chinese";
  chineseModel.image = "images/chinese.png";
  chineseModel.price = "150";
  chinese.add(chineseModel);

  return chinese;
}
