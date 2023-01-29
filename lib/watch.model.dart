class Watch {
  final String name;
  final String provider;
  final int price;
  final String assetImage;

  Watch({required this.name, required this.provider, required this.price, required this.assetImage});
}

List<Watch> mockWatches = [
  Watch(name: "Trilobe T1", provider: "Trilobe", price: 1000, assetImage: "assets/images/trilobe_t1.png"),
  Watch(name: "Longines L1", provider: "Longines", price: 1500, assetImage: "assets/images/longines_l1.png"),
  Watch(name: "Luminor LM1", provider: "Luminor", price: 1700, assetImage: "assets/images/luminor_lm1.png"),
  Watch(name: "Zenith Z1", provider: "Zenith", price: 800, assetImage: "assets/images/zenith_z1.png"),
  Watch(name: "Trilobe T2", provider: "Trilobe", price: 1700, assetImage: "assets/images/trilobe_t2.png"),
  Watch(name: "Longines L2", provider: "Longines", price: 1300, assetImage: "assets/images/longines_l2.png"),
  Watch(name: "Luminor LM2", provider: "Luminor", price: 1900, assetImage: "assets/images/luminor_lm2.png"),
  Watch(name: "Zenith Z2", provider: "Zenith", price: 1000, assetImage: "assets/images/zenith_z2.png"),
  Watch(name: "Trilobe T3", provider: "Trilobe", price: 1500, assetImage: "assets/images/trilobe_t3.png"),
  Watch(name: "Longines L3", provider: "Longines", price: 1700, assetImage: "assets/images/longines_l3.png"),
];
