class CountryModel {
  String? name;
  List<String>? topLevelDomain;
  String? alpha2Code;
  String? alpha3Code;
  List<String>? callingCodes;
  String? capital;
  List<String>? altSpellings;
  String? subregion;
  String? region;
  double? population;
  List<double>? latlng;
  String? demonym;
  double? area;
  List<String>? timezones;
  List<String>? borders;
  String? nativeName;
  String? numericCode;
  Flags? flags;
  List<Currencies>? currencies;
  List<Languages>? languages;
  Translations? translations;
  String? flag;
  List<RegionalBlocs>? regionalBlocs;
  String? cioc;
  bool? independent;

  CountryModel(
      {this.name,
        this.topLevelDomain,
        this.alpha2Code,
        this.alpha3Code,
        this.callingCodes,
        this.capital,
        this.altSpellings,
        this.subregion,
        this.region,
        this.population,
        this.latlng,
        this.demonym,
        this.area,
        this.timezones,
        this.borders,
        this.nativeName,
        this.numericCode,
        this.flags,
        this.currencies,
        this.languages,
        this.translations,
        this.flag,
        this.regionalBlocs,
        this.cioc,
        this.independent});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    topLevelDomain = (json['topLevelDomain'] as List?)?.cast<String>();
    alpha2Code = json['alpha2Code'];
    alpha3Code = json['alpha3Code'];
    callingCodes = (json['callingCodes'] as List?)?.cast<String>();
    capital = json['capital'];
    altSpellings = (json['altSpellings'] as List?)?.cast<String>();
    subregion = json['subregion'];
    region = json['region'];
    population = (json['population'] as num?)?.toDouble();
    latlng = (json['latlng'] as List?)?.cast<double>();
    demonym = json['demonym'];
    area = (json['area'] as num?)?.toDouble();
    timezones = (json['timezones'] as List?)?.cast<String>();
    borders = (json['borders'] as List?)?.cast<String>();
    nativeName = json['nativeName'];
    numericCode = json['numericCode'];
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currencies.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    translations = json['translations'] != null
        ? Translations.fromJson(json['translations'])
        : null;
    flag = json['flag'];
    if (json['regionalBlocs'] != null) {
      regionalBlocs = <RegionalBlocs>[];
      json['regionalBlocs'].forEach((v) {
        regionalBlocs!.add(RegionalBlocs.fromJson(v));
      });
    }
    cioc = json['cioc'];
    independent = json['independent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['topLevelDomain'] = topLevelDomain;
    data['alpha2Code'] = alpha2Code;
    data['alpha3Code'] = alpha3Code;
    data['callingCodes'] = callingCodes;
    data['capital'] = capital;
    data['altSpellings'] = altSpellings;
    data['subregion'] = subregion;
    data['region'] = region;
    data['population'] = population;
    data['latlng'] = latlng;
    data['demonym'] = demonym;
    data['area'] = area;
    data['timezones'] = timezones;
    data['borders'] = borders;
    data['nativeName'] = nativeName;
    data['numericCode'] = numericCode;
    if (flags != null) {
      data['flags'] = flags!.toJson();
    }
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data['translations'] = translations!.toJson();
    }
    data['flag'] = flag;
    if (regionalBlocs != null) {
      data['regionalBlocs'] =
          regionalBlocs!.map((v) => v.toJson()).toList();
    }
    data['cioc'] = cioc;
    data['independent'] = independent;
    return data;
  }
}

class Flags {
  String? svg;
  String? png;

  Flags({this.svg, this.png});

  Flags.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
    png = json['png'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    data['png'] = png;
    return data;
  }
}

class Currencies {
  String? code;
  String? name;
  String? symbol;

  Currencies({this.code, this.name, this.symbol});

  Currencies.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

class Languages {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Languages({this.iso6391, this.iso6392, this.name, this.nativeName});

  Languages.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso639_1'];
    iso6392 = json['iso639_2'];
    name = json['name'];
    nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso639_1'] = iso6391;
    data['iso639_2'] = iso6392;
    data['name'] = name;
    data['nativeName'] = nativeName;
    return data;
  }
}

class Translations {
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? hu;

  Translations(
      {this.br,
        this.pt,
        this.nl,
        this.hr,
        this.fa,
        this.de,
        this.es,
        this.fr,
        this.ja,
        this.it,
        this.hu});

  Translations.fromJson(Map<String, dynamic> json) {
    br = json['br'];
    pt = json['pt'];
    nl = json['nl'];
    hr = json['hr'];
    fa = json['fa'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    ja = json['ja'];
    it = json['it'];
    hu = json['hu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['br'] = br;
    data['pt'] = pt;
    data['nl'] = nl;
    data['hr'] = hr;
    data['fa'] = fa;
    data['de'] = de;
    data['es'] = es;
    data['fr'] = fr;
    data['ja'] = ja;
    data['it'] = it;
    data['hu'] = hu;
    return data;
  }
}

class RegionalBlocs {
  String? acronym;
  String? name;

  RegionalBlocs({this.acronym, this.name});

  RegionalBlocs.fromJson(Map<String, dynamic> json) {
    acronym = json['acronym'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acronym'] = acronym;
    data['name'] = name;
    return data;
  }
}
