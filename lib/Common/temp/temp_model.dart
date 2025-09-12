class CategoryModel {
  String imageUrl, title;
  int? id;

  CategoryModel({required this.imageUrl, required this.title, this.id});
}

class ProductModel {
  String imageUrl, title, urlCountry;
  int nubOfDayShip;
  String? description,
      priceAmt,
      amtCode,
      highPrice,
      percentOff,
      minOrder,
      sellerCountry;
  List? imageList;

  String? about, unitSize, unitOfMeasure, numberOfUnit, pricePerUnit;

  ProductModel(
      {required this.imageUrl,
      required this.title,
      this.description,
      this.priceAmt,
      this.amtCode,
      this.highPrice,
      this.percentOff,
      this.minOrder,
      required this.urlCountry,
      this.sellerCountry,
      this.about,
      required this.nubOfDayShip,
      this.unitSize,
      this.unitOfMeasure,
      this.numberOfUnit,
      this.pricePerUnit,
      this.imageList});
}
