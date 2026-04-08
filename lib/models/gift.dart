class GiftModel {
  final String name;
  final int coins;
  final String asset;
  final bool isImage;
  final bool isBigGift;

  GiftModel({
    required this.name,
    required this.coins,
    required this.asset,
    this.isImage = false,
    this.isBigGift = false,
  });
}
