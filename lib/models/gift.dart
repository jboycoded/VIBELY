class GiftModel {
  final String name;
  final int coins;
  final String asset;
  final bool isImage;

  GiftModel({
    required this.name,
    required this.coins,
    required this.asset,
    this.isImage = false,
  });
}
