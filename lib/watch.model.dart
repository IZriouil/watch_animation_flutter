class Watch {
  final String name;
  final String provider;
  final int price;
  final String assetImage;
  final String movement;
  final String casetype;

  Watch(
      {required this.name,
      required this.provider,
      required this.price,
      required this.assetImage,
      required this.movement,
      required this.casetype});
}

List<Watch> mockWatches = [
  Watch(
      name: "Mystique",
      provider: "Trilobe",
      price: 1000,
      assetImage: "assets/images/trilobe_t1.png",
      movement: "Japanese Movement Quartz",
      casetype: "40mm Polished Stainless Steel"),
  Watch(
      name: "Elegance",
      provider: "Longines",
      price: 1500,
      assetImage: "assets/images/longines_l2.png",
      movement: "Swiss Movement Mechanical",
      casetype: "38mm Rose Gold Plated"),
  Watch(
      name: "Radiance",
      provider: "Luminor",
      price: 1700,
      assetImage: "assets/images/luminor_lm1.png",
      movement: "Swiss Movement Automatic",
      casetype: "42mm Black PVD Coated"),
  Watch(
      name: "Voyager",
      provider: "Zenith",
      price: 800,
      assetImage: "assets/images/zenith_z1.png",
      movement: "Swiss Movement Battery Operated",
      casetype: "44mm Platinum"),
  Watch(
      name: "Enchantment",
      provider: "Trilobe",
      price: 1700,
      assetImage: "assets/images/trilobe_t2.png",
      movement: "Japanese Movement Quartz",
      casetype: "40mm Rose Gold Plated"),
  Watch(
      name: "Refinement",
      provider: "Longines",
      price: 1300,
      assetImage: "assets/images/longines_l2.png",
      movement: "Swiss Movement Mechanical",
      casetype: "36mm Polished Silver"),
  Watch(
      name: "Luminance",
      provider: "Luminor",
      price: 1900,
      assetImage: "assets/images/luminor_lm1.png",
      movement: "Swiss Movement Automatic",
      casetype: "45mm Black PVD Coated"),
  Watch(
      name: "Navigator",
      provider: "Zenith",
      price: 1000,
      assetImage: "assets/images/zenith_z2.png",
      movement: "Swiss Movement Battery Operated",
      casetype: "42mm Yellow Gold Plated"),
  Watch(
      name: "Illumination",
      provider: "Trilobe",
      price: 1500,
      assetImage: "assets/images/trilobe_t1.png",
      movement: "Japanese Movement Quartz",
      casetype: "40mm Polished White Gold"),
];
