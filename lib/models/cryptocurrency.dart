class Cryptocurrency {
  String id;
  String symbol;
  String name;
  String nameId;
  int rank;
  String priceUSD;
  String percentChange24h;
  String percentChange1h;
  String percentChange7d;
  String priceBTC;
  String marketCapUSD;
  double volume24;
  double volume24a;
  String currentSupply;
  String totalSupply;
  String maxSupply;

  Cryptocurrency(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.nameId,
      required this.rank,
      required this.priceUSD,
      required this.percentChange24h,
      required this.percentChange1h,
      required this.percentChange7d,
      required this.priceBTC,
      required this.marketCapUSD,
      required this.volume24,
      required this.volume24a,
      required this.currentSupply,
      required this.totalSupply,
      required this.maxSupply});

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) {
    return Cryptocurrency(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        nameId: json["nameid"],
        rank: json["rank"],
        priceUSD: json["price_usd"],
        percentChange24h: json["percent_change_24h"],
        percentChange1h: json["percent_change_1h"],
        percentChange7d: json["percent_change_7d"],
        priceBTC: json["price_btc"],
        marketCapUSD: json["market_cap_usd"],
        volume24: json["volume24"],
        volume24a: json["volume24a"],
        currentSupply: json["csupply"],
        totalSupply: json["tsupply"],
        maxSupply: json["msupply"]);
  }
}
