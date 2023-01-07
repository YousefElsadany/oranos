import 'package:oranos/constance/strings_manager.dart';

class RecommendedModel {
  late dynamic id;
  late String image;
  late double rate;
  late String name;
  late bool isFav;
  RecommendedModel(
      {required this.id,
      required this.image,
      required this.rate,
      required this.name,
      required this.isFav});
}

List<RecommendedModel> recommendedList = [
  RecommendedModel(
    id: '1',
    image: ImageAssetsManager.man,
    rate: 5.0,
    name: 'Kareem Adel',
    isFav: true,
  ),
  RecommendedModel(
    id: '2',
    image: ImageAssetsManager.woman,
    rate: 4.5,
    name: 'Merna Adel',
    isFav: false,
  ),
  RecommendedModel(
    id: '3',
    image: ImageAssetsManager.man,
    rate: 4.0,
    name: 'Samy Adel',
    isFav: true,
  ),
  RecommendedModel(
    id: '4',
    image: ImageAssetsManager.woman,
    rate: 3.5,
    name: 'Esraa Adel',
    isFav: false,
  ),
];
