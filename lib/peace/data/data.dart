
import '../model/tile_model.dart';

int points = 0;
bool selcted = false;
String selectedImageAssetPath = "";
int selectedTileIndex=0;

List<TileModel> pairs = <TileModel>[];
List<TileModel> visiblePairs = <TileModel>[];

List<TileModel> getPairs(){

  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel(imageAssetPath: 'assets/images/cloud.jpg', isSelected: false);

  //1
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/cloud2.jpg', isSelected: false);

  //2
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/cloud3.jpg', isSelected: false);

  //3
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/cloud4.jpg', isSelected: false);

  //4
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/heart.jpg', isSelected: false);

  //5
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/laugh.jpg', isSelected: false);

  //6
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/moon.jpg', isSelected: false);

  //7
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/sad.jpg', isSelected: false);

  //8
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/sun.jpg', isSelected: false);

  //9
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel=TileModel(imageAssetPath: 'assets/images/thumb.jpg', isSelected: false);

  //10
  pairs.add(tileModel);
  pairs.add(tileModel);

  return pairs;
}

List<TileModel> getBlanks(){

  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = TileModel(imageAssetPath: 'assets/images/blank.jpg', isSelected: false);

  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);
  pairs.add(tileModel);

  return pairs;
}