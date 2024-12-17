import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'ko'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? koText = '',
  }) =>
      [ruText, koText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // AuthPage
  {
    'cqrdl5at': {
      'ru': 'Email',
      'ko': '',
    },
    '7a7uldtu': {
      'ru': 'Пароль',
      'ko': '',
    },
    'gnvt3by0': {
      'ru': 'Войти',
      'ko': '',
    },
    'xogc70w9': {
      'ru': 'Зарегистрироваться',
      'ko': '',
    },
    '87yyv8xt': {
      'ru': 'Забыли пароль?',
      'ko': '',
    },
    'aqgkxu3e': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // HomePage
  {
    'bu8386f5': {
      'ru': '1',
      'ko': '',
    },
    '2wqzgu9f': {
      'ru': '3',
      'ko': '',
    },
    'j9xftzng': {
      'ru': 'Водка',
      'ko': '',
    },
    'irpqukru': {
      'ru': 'Вино',
      'ko': '',
    },
    'g0u21uy1': {
      'ru': 'Коньяк',
      'ko': '',
    },
    'gkrijmgd': {
      'ru': 'Напитки',
      'ko': '',
    },
    's28evzcp': {
      'ru': 'Соусы',
      'ko': '',
    },
    '1bkq133i': {
      'ru': 'Консервы',
      'ko': '',
    },
    'efe3s78c': {
      'ru': 'Бакалея',
      'ko': '',
    },
    '69tp1l3v': {
      'ru': 'Сигареты',
      'ko': '',
    },
    'yser9f9u': {
      'ru': 'Часто заказывают',
      'ko': '',
    },
    'u7yhs1sf': {
      'ru': 'Поиск',
      'ko': '',
    },
    'dhat81dc': {
      'ru': 'Показать удаленые',
      'ko': '',
    },
    'onzurzzr': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // RegPage
  {
    'tc35e1lc': {
      'ru': 'Имя',
      'ko': '',
    },
    'gvixap3l': {
      'ru': 'Email',
      'ko': '',
    },
    'y71u2dpg': {
      'ru': 'Телефон',
      'ko': '',
    },
    'vf2lghsw': {
      'ru': 'Пароль',
      'ko': '',
    },
    'dtfegsp3': {
      'ru': 'Повторите пароль',
      'ko': '',
    },
    'wh2m7n2e': {
      'ru': 'Зарегистрироваться',
      'ko': '',
    },
    'fbfqq7pl': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // FavoritPage
  {
    '2vnjcnbg': {
      'ru': '3',
      'ko': '',
    },
    'jodiglg3': {
      'ru': 'Избранное',
      'ko': '',
    },
    'ps247s78': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // CartPage
  {
    '05da8w7x': {
      'ru': '3',
      'ko': '',
    },
    'v13zoxhq': {
      'ru': 'Корзина',
      'ko': '',
    },
    '6pmu4v6v': {
      'ru': 'Сумма: ',
      'ko': '',
    },
    'l0sj2axs': {
      'ru': 'Перейти к оформлению',
      'ko': '',
    },
    'xf38p9sp': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // OrderPage
  {
    'hbs8h33d': {
      'ru': '3',
      'ko': '',
    },
    '2nu63wtu': {
      'ru': 'Оформление заказа',
      'ko': '',
    },
    '5m3tc28p': {
      'ru': 'Адрес доставки',
      'ko': '',
    },
    'gdm7bdtg': {
      'ru': 'Дом',
      'ko': '',
    },
    'oumzsela': {
      'ru': 'Квартира',
      'ko': '',
    },
    'jwk74gzw': {
      'ru': 'Телефон',
      'ko': '',
    },
    '2iw62u2j': {
      'ru': 'Комментарий',
      'ko': '',
    },
    'iio8qo1v': {
      'ru': 'Комментарий',
      'ko': '',
    },
    'j1xsq23e': {
      'ru': 'Оплатить курьеру наличными',
      'ko': '',
    },
    'sbz01rip': {
      'ru': 'Оплатить курьеру картой',
      'ko': '',
    },
    'qkwapva1': {
      'ru': 'Ваш магазин не зарегистрирован',
      'ko': '',
    },
    'tagjt7no': {
      'ru': 'Пройдите регистрацию',
      'ko': '',
    },
    'wso622qm': {
      'ru': 'Регистрация магазина',
      'ko': '',
    },
    'knhrrnmi': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // UserOrderListPage
  {
    '7hec0wfl': {
      'ru': 'Мои заказы',
      'ko': '',
    },
    'cugi6x2m': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // OneOrderPage
  {
    's10yrhop': {
      'ru': '3',
      'ko': '',
    },
    'l0mvspnw': {
      'ru': 'Заказ',
      'ko': '',
    },
    'penlq8th': {
      'ru': 'Сумма: ',
      'ko': '',
    },
    '5z09tsmq': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // Profile
  {
    '0jhrezqb': {
      'ru': '3',
      'ko': '',
    },
    'aba41ubx': {
      'ru': 'Профиль',
      'ko': '',
    },
    'tfz46wt5': {
      'ru': 'Мой магазин',
      'ko': '',
    },
    '0rl63l99': {
      'ru': 'Адреса доставки',
      'ko': '',
    },
    '5p69vk0g': {
      'ru': 'Мои заказы',
      'ko': '',
    },
    '7ln4bk0u': {
      'ru': 'Админ панель',
      'ko': '',
    },
    'oxvpk6gw': {
      'ru': 'Выйти из аккаунта',
      'ko': '',
    },
    '3jcn9ln5': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // RestorePage
  {
    'b62nhru7': {
      'ru': 'Email',
      'ko': '',
    },
    'ktnme57q': {
      'ru': 'Востановить пароль',
      'ko': '',
    },
    '0mf8gck8': {
      'ru': 'Вернуться назад',
      'ko': '',
    },
    'pjel75cg': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // RestoreInfoPage
  {
    'l6hf6k8e': {
      'ru':
          'На вашу почту было отправлено письмо с инструкциями по восстановлению доступа к акканту',
      'ko': '',
    },
    'rxjduhbi': {
      'ru': 'Ok',
      'ko': '',
    },
    '76102ltn': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // Addresses
  {
    'j9eagpc8': {
      'ru': '3',
      'ko': '',
    },
    'n6mmdoet': {
      'ru': 'Адреса',
      'ko': '',
    },
    'uir58i35': {
      'ru': 'Добавить адрес',
      'ko': '',
    },
    '2jdecvgu': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // AdminPanel
  {
    '09904rw0': {
      'ru': '3',
      'ko': '',
    },
    'gcyzj88v': {
      'ru': 'Админ панель',
      'ko': '',
    },
    'myojmyms': {
      'ru': 'Добавить новую акцию',
      'ko': '',
    },
    'qnesaa0d': {
      'ru': 'Добавить новую продукцию',
      'ko': '',
    },
    'wgylaao2': {
      'ru': 'Акции',
      'ko': '',
    },
    'kx5qukfe': {
      'ru': 'Продукты',
      'ko': '',
    },
    'gzfkg8jt': {
      'ru': 'Новые заказы',
      'ko': '',
    },
    'ceu54nx9': {
      'ru': 'История заказов',
      'ko': '',
    },
    'k7xfxx5e': {
      'ru': 'Клиенты',
      'ko': '',
    },
    '09ubqdzk': {
      'ru': 'Clear app states',
      'ko': '',
    },
    'x41kfgda': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // PromotionsPage
  {
    'vyix0zm1': {
      'ru': '3',
      'ko': '',
    },
    'vizj4y05': {
      'ru': 'Список акций',
      'ko': '',
    },
    '28cgby1p': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // AddProduct
  {
    'zl8t8jdm': {
      'ru': '3',
      'ko': '',
    },
    'cd3uafk4': {
      'ru': 'загрузите',
      'ko': '',
    },
    'qosnuzvf': {
      'ru': 'фото акции',
      'ko': '',
    },
    'q3femplf': {
      'ru': 'Формат: JPG, PNG',
      'ko': '',
    },
    'xwp045eu': {
      'ru': 'Изменить фото',
      'ko': '',
    },
    'shs6uih9': {
      'ru': 'Цена',
      'ko': '',
    },
    'wu6v0723': {
      'ru': 'Название',
      'ko': '',
    },
    '1fs8jxc1': {
      'ru': 'Штрихкод',
      'ko': '',
    },
    'cn811g7x': {
      'ru': 'Ссылка на Товар',
      'ko': '',
    },
    '4t9c3hi7': {
      'ru': 'Описание',
      'ko': '',
    },
    'fzn7691g': {
      'ru': 'Напитки',
      'ko': '',
    },
    'p95kv2ce': {
      'ru': 'Соус',
      'ko': '',
    },
    '6srt5tiy': {
      'ru': 'Водка',
      'ko': '',
    },
    '0rnfx85c': {
      'ru': 'Вино',
      'ko': '',
    },
    'dssbguf5': {
      'ru': 'Коньяк',
      'ko': '',
    },
    'hb0h7u0r': {
      'ru': 'Консервы/Маринады',
      'ko': '',
    },
    'pue1d4l0': {
      'ru': 'Бакалея',
      'ko': '',
    },
    'j6gmjn44': {
      'ru': 'Сигареты',
      'ko': '',
    },
    '3gpgpbpt': {
      'ru': 'В наличии',
      'ko': '',
    },
    'fmihrsfq': {
      'ru': 'Часто заказывают',
      'ko': '',
    },
    '8khlxt74': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // ProductsPage
  {
    'nedjrypz': {
      'ru': '3',
      'ko': '',
    },
    'iul1iz1d': {
      'ru': 'Список продуктов',
      'ko': '',
    },
    'tgicj5xh': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // ProductDeckPage
  {
    '8cyixmf0': {
      'ru': '3',
      'ko': '',
    },
    'tkskr7e3': {
      'ru': 'Редактировать',
      'ko': '',
    },
    '4ogbz3li': {
      'ru': 'Select Size',
      'ko': '',
    },
    '09ccqk6c': {
      'ru': 'S',
      'ko': '',
    },
    'yu9zox1h': {
      'ru': 'M',
      'ko': '',
    },
    'oma2xj2l': {
      'ru': 'L',
      'ko': '',
    },
    'jcvzc53k': {
      'ru': 'XL',
      'ko': '',
    },
    '4g67fyar': {
      'ru': 'Select Color',
      'ko': '',
    },
    'hswd8ivr': {
      'ru': 'Black',
      'ko': '',
    },
    'e2g07pl7': {
      'ru': 'White',
      'ko': '',
    },
    'qpnyj3et': {
      'ru': 'Red',
      'ko': '',
    },
    'sq8t9rb8': {
      'ru': 'Blue',
      'ko': '',
    },
    'u3qxtluf': {
      'ru': 'Продукт уже есть в вашей корзине',
      'ko': '',
    },
  },
  // ManagerOrderListPage
  {
    '1cefj9uw': {
      'ru': '3',
      'ko': '',
    },
    's8tupd5o': {
      'ru': 'Новые',
      'ko': '',
    },
    'n1my5uu0': {
      'ru': 'Принятые',
      'ko': '',
    },
    '43sje0bl': {
      'ru': 'Готовые',
      'ko': '',
    },
    'i7co77ew': {
      'ru': 'Отмена',
      'ko': '',
    },
    '06ny3hd7': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // RegStorePage
  {
    'h20ucvrm': {
      'ru': '3',
      'ko': '',
    },
    'veu8tt7w': {
      'ru': 'Мой магазин',
      'ko': '',
    },
    'k0zdqdbm': {
      'ru': 'Имя магазина',
      'ko': '',
    },
    'e3rxd788': {
      'ru': 'Телефон',
      'ko': '',
    },
    '746a3s6z': {
      'ru': 'Адрес',
      'ko': '',
    },
    '2c3nkl8s': {
      'ru': 'Квартира',
      'ko': '',
    },
    'b5e49uua': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // Stores
  {
    '6zdbteg8': {
      'ru': 'Мои магазины',
      'ko': '',
    },
    '57vi1d4p': {
      'ru': 'Добавить адрес',
      'ko': '',
    },
    'jpd1e78n': {
      'ru': '3',
      'ko': '',
    },
    'kkvfnwlt': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // OneOrderPage2
  {
    'h5tz6tf9': {
      'ru': '3',
      'ko': '',
    },
    '1w9buw09': {
      'ru': 'Заказ',
      'ko': '',
    },
    'f3xx2rjt': {
      'ru': 'Сумма: ',
      'ko': '',
    },
    '6xlo3m9v': {
      'ru': 'Отмена статуса',
      'ko': '',
    },
    'qiboo5i9': {
      'ru': 'Удалить заказ',
      'ko': '',
    },
    '636924qo': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // MyClients
  {
    'ts23ei51': {
      'ru': '3',
      'ko': '',
    },
    'r5s71a2f': {
      'ru': 'Мои клиенты',
      'ko': '',
    },
    'wv90639o': {
      'ru': 'All',
      'ko': '',
    },
    'jjdjqh5a': {
      'ru': 'Pending',
      'ko': '',
    },
    'njym9dxi': {
      'ru': 'In Progress',
      'ko': '',
    },
    '2mk6oxj1': {
      'ru': 'Completed',
      'ko': '',
    },
    'g2pslkwq': {
      'ru': 'All',
      'ko': '',
    },
    'buvxsjw7': {
      'ru': 'All',
      'ko': '',
    },
    'qr3mzzd4': {
      'ru': 'Имя',
      'ko': '',
    },
    '1whnsafy': {
      'ru': 'Статус',
      'ko': '',
    },
    'jqzrbeyk': {
      'ru': 'Home',
      'ko': '',
    },
  },
  // PizzaItem
  {
    'f8im7su4': {
      'ru': 'Будет позже',
      'ko': '',
    },
  },
  // deckriptionItem
  {
    'sqaxzhgu': {
      'ru': 'Редактировать',
      'ko': '',
    },
    'ihxjp0q9': {
      'ru': 'Маленькая',
      'ko': '',
    },
    '57b66eyg': {
      'ru': 'Средняя',
      'ko': '',
    },
    'pu204amo': {
      'ru': 'Большая',
      'ko': '',
    },
    'a7i96tsd': {
      'ru': 'Традиционнае',
      'ko': '',
    },
    'rl1c267q': {
      'ru': 'Тонкае',
      'ko': '',
    },
    'gnuiny1r': {
      'ru': 'Добавить ингридиенты',
      'ko': '',
    },
    'dhgotvh4': {
      'ru': 'Ветчина из\nцыпленка',
      'ko': '',
    },
    '27muwlil': {
      'ru': '+ 350',
      'ko': '',
    },
    'j0wc25sy': {
      'ru': 'Моцарелла',
      'ko': '',
    },
    'yd8mxwbh': {
      'ru': '+ 350',
      'ko': '',
    },
    'fpqgfbc7': {
      'ru': 'Шампиньоны',
      'ko': '',
    },
    'ld0er7cp': {
      'ru': '+ 350',
      'ko': '',
    },
    'zld1njsc': {
      'ru': 'Ветчина из\nцыпленка',
      'ko': '',
    },
    'alnhzgtw': {
      'ru': '+ 350',
      'ko': '',
    },
    'jaga849t': {
      'ru': 'Ветчина из\nцыпленка',
      'ko': '',
    },
    'tll7niam': {
      'ru': '+ 350',
      'ko': '',
    },
    'ms7asp9f': {
      'ru': 'Ветчина из\nцыпленка',
      'ko': '',
    },
    '2pk53utc': {
      'ru': '+ 350',
      'ko': '',
    },
    'wfdq730d': {
      'ru': 'Продукт уже есть в вашей корзине',
      'ko': '',
    },
  },
  // CartItem
  {
    'nh73muzj': {
      'ru': '-',
      'ko': '',
    },
    '8uyyjytm': {
      'ru': '+',
      'ko': '',
    },
  },
  // bannerItem
  {
    '12tlsc2v': {
      'ru': 'Редактировать',
      'ko': '',
    },
  },
  // addressItem
  {
    'uyw3cn0r': {
      'ru': 'Изменить',
      'ko': '',
    },
  },
  // addnewAddress
  {
    '8uheljgd': {
      'ru': 'Город',
      'ko': '',
    },
    'g9o1x37i': {
      'ru': 'Улица',
      'ko': '',
    },
    '1pjur2y7': {
      'ru': 'Дом',
      'ko': '',
    },
    'dio62pps': {
      'ru': 'Квартира',
      'ko': '',
    },
  },
  // promotion
  {
    'ypagnwf4': {
      'ru': 'Акция',
      'ko': '',
    },
    '46tkglqf': {
      'ru': 'загрузите',
      'ko': '',
    },
    'sf6dourv': {
      'ru': 'фото акции',
      'ko': '',
    },
    'e16q1cnr': {
      'ru': 'Формат: JPG, PNG',
      'ko': '',
    },
    'dgkt7fme': {
      'ru': 'Изменить фото',
      'ko': '',
    },
    'dzhnwley': {
      'ru': 'Удалить акцию',
      'ko': '',
    },
  },
  // emptyCart
  {
    'u82bmd2l': {
      'ru': 'Перейти',
      'ko': '',
    },
  },
  // addnewStore
  {
    'ynhzuts8': {
      'ru': 'Город',
      'ko': '',
    },
    'u4ekfihf': {
      'ru': 'Улица',
      'ko': '',
    },
    'er69ssub': {
      'ru': 'Дом',
      'ko': '',
    },
    '4v60pgzd': {
      'ru': 'Квартира',
      'ko': '',
    },
  },
  // storeitem
  {
    'e99y4tff': {
      'ru': 'Изменить',
      'ko': '',
    },
  },
  // CartItem2
  {
    'qgfd27np': {
      'ru': '-',
      'ko': '',
    },
    'hozg2w4j': {
      'ru': '+',
      'ko': '',
    },
  },
  // Miscellaneous
  {
    'kggo67s0': {
      'ru': '',
      'ko': '',
    },
    'puap9trx': {
      'ru': '',
      'ko': '',
    },
    'nplkojh7': {
      'ru': '',
      'ko': '',
    },
    '6hf86e56': {
      'ru': '',
      'ko': '',
    },
    'gnzswnov': {
      'ru': '',
      'ko': '',
    },
    't2vyld2o': {
      'ru': '',
      'ko': '',
    },
    'vu6l2ips': {
      'ru': '',
      'ko': '',
    },
    '1w1sxrco': {
      'ru': '',
      'ko': '',
    },
    'w43e88ov': {
      'ru': '',
      'ko': '',
    },
    'z207gbic': {
      'ru': '',
      'ko': '',
    },
    'mo4ran1m': {
      'ru': '',
      'ko': '',
    },
    'z1zja8zd': {
      'ru': '',
      'ko': '',
    },
    'loxivoqm': {
      'ru': '',
      'ko': '',
    },
    'g9442q5r': {
      'ru': '',
      'ko': '',
    },
    'av6yiu8l': {
      'ru': '',
      'ko': '',
    },
    'ivcbu61y': {
      'ru': '',
      'ko': '',
    },
    '64sgmfr4': {
      'ru': '',
      'ko': '',
    },
    'xqq99fdb': {
      'ru': '',
      'ko': '',
    },
    'b9jeci1i': {
      'ru': '',
      'ko': '',
    },
    'b7v5qv22': {
      'ru': '',
      'ko': '',
    },
    'xsaqnxxp': {
      'ru': '',
      'ko': '',
    },
    '1y2fapq7': {
      'ru': '',
      'ko': '',
    },
    'ja2beswk': {
      'ru': '',
      'ko': '',
    },
    '7fp9qhq3': {
      'ru': '',
      'ko': '',
    },
    'b8grdz77': {
      'ru': '',
      'ko': '',
    },
    '4piikevj': {
      'ru': '',
      'ko': '',
    },
    'j6mdm3j3': {
      'ru': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
