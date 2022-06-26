import 'package:easy_localization/easy_localization.dart';

class Countries {
  late List<Country> countriesData = [];

  Countries() {
    final Country romania = Country(
      id: 1,
      countryName: "Romania".tr(),
      flagImagePath: "assets/images/icons/romania.svg",
    );

    final Country bulgaria = Country(
      id: 2,
      countryName: "Bulgaria".tr(),
      flagImagePath: 'assets/images/icons/bulgaria.svg',
    );

    countriesData.addAll([romania, bulgaria]);
  }
}

class Country {
  final int id;
  final String flagImagePath;
  final String countryName;
  bool? isSelected = false;

  Country({
    required this.id,
    required this.countryName,
    required this.flagImagePath,
    this.isSelected,
  });
}
