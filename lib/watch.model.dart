class Watch {
  final String name;
  final String provider;
  final int price;
  final String assetImage;
  final String movement;
  final String casetype;

  Watch({required this.name, required this.provider, required this.price, required this.assetImage, required this.movement, required this.casetype});
}

List<Watch> mockWatches = [
  Watch(
    name: "Mystique",
    provider: "Trilobe",
    price: 1000,
    assetImage: "assets/images/trilobe_mystique.png",
    movement: "Japanese Movement Quartz",
    case: "40mm Polished Stainless Steel"
  ),
  Watch(
    name: "Elegance",
    provider: "Longines",
    price: 1500,
    assetImage: "assets/images/longines_elegance.png",
    movement: "Swiss Movement Mechanical",
    case: "38mm Rose Gold Plated"
  ),
  Watch(
    name: "Radiance",
    provider: "Luminor",
    price: 1700,
    assetImage: "assets/images/luminor_radiance.png",
    movement: "Swiss Movement Automatic",
    case: "42mm Black PVD Coated"
  ),
  Watch(
    name: "Voyager",
    provider: "Zenith",
    price: 800,
    assetImage: "assets/images/zenith_voyager.png",
    movement: "Swiss Movement Battery Operated",
    case: "44mm Platinum"
  ),
  Watch(
    name: "Enchantment",
    provider: "Trilobe",
    price: 1700,
    assetImage: "assets/images/trilobe_enchantment.png",
    movement: "Japanese Movement Quartz",
    case: "40mm Rose Gold Plated"
  ),
  Watch(
    name: "Refinement",
    provider: "Longines",
    price: 1300,
    assetImage: "assets/images/longines_refinement.png",
    movement: "Swiss Movement Mechanical",
    case: "36mm Polished Silver"
  ),
  Watch(
    name: "Luminance",
    provider: "Luminor",
    price: 1900,
    assetImage: "assets/images/luminor_luminance.png",
    movement: "Swiss Movement Automatic",
    case: "45mm Black PVD Coated"
  ),
  Watch(
    name: "Navigator",
    provider: "Zenith",
    price: 1000,
    assetImage: "assets/images/zenith_navigator.png",
    movement: "Swiss Movement Battery Operated",
    case: "42mm Yellow Gold Plated"
  ),
  Watch(
    name: "Illumination",
    provider: "Trilobe",
    price: 1500,
    assetImage: "assets/images/trilobe_illumination.png",
    movement: "Japanese Movement Quartz",
    case: "40mm Polished White Gold"
  ),
];