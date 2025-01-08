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

  static List<String> languages() => ['ru', 'en', 'ko'];

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
    String? enText = '',
    String? koText = '',
  }) =>
      [ruText, enText, koText][languageIndex] ?? '';

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
      'en': 'Email',
      'ko': '이메일',
    },
    '7a7uldtu': {
      'ru': 'Пароль',
      'en': 'Password',
      'ko': '비밀번호',
    },
    'gnvt3by0': {
      'ru': 'Логин',
      'en': 'Login',
      'ko': '로그인',
    },
    'xogc70w9': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'ko': '등록하다',
    },
    '87yyv8xt': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
      'ko': '비밀번호를 잊으셨나요?',
    },
    'aqgkxu3e': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // HomePageOld
  {
    'bu8386f5': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    '2wqzgu9f': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'j9xftzng': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
    },
    'irpqukru': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
    },
    'g0u21uy1': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
    },
    'gkrijmgd': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
    },
    's28evzcp': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
    },
    '1bkq133i': {
      'ru': 'Консервы',
      'en': 'Canned goods',
      'ko': '통조림',
    },
    'efe3s78c': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
    },
    '69tp1l3v': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'yser9f9u': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
    },
    'u7yhs1sf': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '찾다',
    },
    'dhat81dc': {
      'ru': 'Показать удаленые',
      'en': 'Show deleted',
      'ko': '삭제된 프로그램 보기',
    },
    'onzurzzr': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // RegPage
  {
    'tc35e1lc': {
      'ru': 'Имя',
      'en': 'Name',
      'ko': '이름',
    },
    'gvixap3l': {
      'ru': 'Email',
      'en': 'Email',
      'ko': '이메일',
    },
    'y71u2dpg': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
    },
    'vf2lghsw': {
      'ru': 'Пароль',
      'en': 'Password',
      'ko': '비밀번호',
    },
    'dtfegsp3': {
      'ru': 'Повторите пароль',
      'en': 'Repeat password',
      'ko': '비밀번호를 반복하세요',
    },
    'wh2m7n2e': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'ko': '등록하다',
    },
    'fbfqq7pl': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // FavoritPage
  {
    '2vnjcnbg': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'jodiglg3': {
      'ru': 'Избранное',
      'en': 'Featured',
      'ko': '즐겨찾기',
    },
    'ps247s78': {
      'ru': 'Избранное',
      'en': 'Favorite',
      'ko': '가장 좋아하는',
    },
  },
  // CartPage
  {
    'v13zoxhq': {
      'ru': 'Корзина',
      'en': 'Basket',
      'ko': '바구니',
    },
    '6pmu4v6v': {
      'ru': 'Сумма: ',
      'en': 'Sum:',
      'ko': '합집합:',
    },
    'l0sj2axs': {
      'ru': 'Перейти к оформлению',
      'en': 'Proceed to checkout',
      'ko': '결제로 이동',
    },
    '2o8xil44': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    'xf38p9sp': {
      'ru': 'Корзина',
      'en': 'Cart',
      'ko': '카트',
    },
  },
  // OrderPage
  {
    'hbs8h33d': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    '2nu63wtu': {
      'ru': 'Оформление заказа',
      'en': 'Placing an order',
      'ko': '주문하기',
    },
    '5m3tc28p': {
      'ru': 'Адрес доставки',
      'en': 'Delivery address',
      'ko': '배송 주소',
    },
    'oumzsela': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
    },
    'jwk74gzw': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
    },
    '2iw62u2j': {
      'ru': 'Комментарий',
      'en': 'Comment',
      'ko': '논평',
    },
    'iio8qo1v': {
      'ru': 'Комментарий',
      'en': 'Comment',
      'ko': '논평',
    },
    'qkwapva1': {
      'ru': 'Ваш магазин не зарегистрирован',
      'en': 'Your store is not registered',
      'ko': '귀하의 매장이 등록되지 않았습니다',
    },
    'tagjt7no': {
      'ru': 'Пройдите регистрацию',
      'en': 'Please register',
      'ko': '등록해주세요',
    },
    'knhrrnmi': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // UserOrderListPage
  {
    '7hec0wfl': {
      'ru': 'Мои заказы',
      'en': 'My orders',
      'ko': '내 주문',
    },
    'cugi6x2m': {
      'ru': 'Заказы',
      'en': 'Orders',
      'ko': '명령',
    },
  },
  // OneOrderPage
  {
    's10yrhop': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'l0mvspnw': {
      'ru': 'Заказ',
      'en': 'Order',
      'ko': '주문하다',
    },
    'penlq8th': {
      'ru': 'Сумма: ',
      'en': 'Sum:',
      'ko': '합집합:',
    },
    '5z09tsmq': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Profile
  {
    '0jhrezqb': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'aba41ubx': {
      'ru': 'Профиль',
      'en': 'Profile',
      'ko': '윤곽',
    },
    'tfz46wt5': {
      'ru': 'Мой магазин',
      'en': 'My shop',
      'ko': '내 가게',
    },
    '0rl63l99': {
      'ru': 'Адреса доставки',
      'en': 'Shipping addresses',
      'ko': '배송 주소',
    },
    '5p69vk0g': {
      'ru': 'Мои заказы',
      'en': 'My orders',
      'ko': '내 주문',
    },
    '7ln4bk0u': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
      'ko': '관리자 패널',
    },
    'oxvpk6gw': {
      'ru': 'Выйти из аккаунта',
      'en': 'Logout',
      'ko': '계정에서 로그아웃하세요',
    },
    '3jcn9ln5': {
      'ru': 'Профиль',
      'en': 'Profile',
      'ko': '윤곽',
    },
  },
  // RestorePage
  {
    'b62nhru7': {
      'ru': 'Email',
      'en': 'Email',
      'ko': '이메일',
    },
    'ktnme57q': {
      'ru': 'Востановить пароль',
      'en': 'Recover password',
      'ko': '비밀번호 복구',
    },
    '0mf8gck8': {
      'ru': 'Вернуться назад',
      'en': 'Go back',
      'ko': '돌아가기',
    },
    'pjel75cg': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // RestoreInfoPage
  {
    'l6hf6k8e': {
      'ru':
          'На вашу почту было отправлено письмо с инструкциями по восстановлению доступа к акканту',
      'en':
          'An email with instructions on how to restore access to your account has been sent to your email.',
      'ko': '귀하의 계정에 대한 액세스를 복원하는 방법에 대한 지침이 포함된 이메일이 귀하의 이메일로 전송되었습니다.',
    },
    'rxjduhbi': {
      'ru': 'Ok',
      'en': 'Ok',
      'ko': 'Ok',
    },
    '76102ltn': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Addresses
  {
    'j9eagpc8': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'n6mmdoet': {
      'ru': 'Адреса',
      'en': 'Addresses',
      'ko': '구애',
    },
    'uir58i35': {
      'ru': 'Добавить адрес',
      'en': 'Add address',
      'ko': '주소 추가',
    },
    '2jdecvgu': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // AdminPanel
  {
    '09904rw0': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'gcyzj88v': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
      'ko': '관리자 패널',
    },
    'myojmyms': {
      'ru': 'Добавить новую акцию',
      'en': 'Add new promotion',
      'ko': '새 프로모션 추가',
    },
    'qnesaa0d': {
      'ru': 'Добавить новую продукцию',
      'en': 'Add new products',
      'ko': '새 제품 추가',
    },
    'wgylaao2': {
      'ru': 'Акции',
      'en': 'Stock',
      'ko': '재고',
    },
    'kx5qukfe': {
      'ru': 'Продукты',
      'en': 'Products',
      'ko': '제품',
    },
    'gzfkg8jt': {
      'ru': 'Новые заказы',
      'en': 'New orders',
      'ko': '신규 주문',
    },
    'ceu54nx9': {
      'ru': 'История заказов',
      'en': 'Order history',
      'ko': '주문 내역',
    },
    'k7xfxx5e': {
      'ru': 'Клиенты',
      'en': 'Clients',
      'ko': '클라이언트',
    },
    '09ubqdzk': {
      'ru': 'Clear app states',
      'en': 'Clear app states',
      'ko': '앱 상태 지우기',
    },
    'ksr0gpws': {
      'ru': 'Супер Админ',
      'en': '',
      'ko': '',
    },
    'xltywj6b': {
      'ru': 'Заявки на проверку магазинов',
      'en': 'Clients',
      'ko': '클라이언트',
    },
    'x41kfgda': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // PromotionsPage
  {
    'vyix0zm1': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'vizj4y05': {
      'ru': 'Список акций',
      'en': 'List of shares',
      'ko': '주식 목록',
    },
    '28cgby1p': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // AddProduct
  {
    'zl8t8jdm': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'cd3uafk4': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
    },
    'qosnuzvf': {
      'ru': 'фото акции',
      'en': 'stock photo',
      'ko': '액션 사진',
    },
    'q3femplf': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
    },
    'xwp045eu': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
    },
    'shs6uih9': {
      'ru': 'Цена',
      'en': 'Price',
      'ko': '가격',
    },
    'wu6v0723': {
      'ru': 'Название',
      'en': 'Name',
      'ko': '이름',
    },
    '1fs8jxc1': {
      'ru': 'Штрихкод',
      'en': 'Barcode',
      'ko': '바코드',
    },
    'cn811g7x': {
      'ru': 'Ссылка на Товар',
      'en': 'Link to Product',
      'ko': '제품 링크',
    },
    '4t9c3hi7': {
      'ru': 'Описание',
      'en': 'Description',
      'ko': '설명',
    },
    'fzn7691g': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
    },
    'p95kv2ce': {
      'ru': 'Соус',
      'en': 'Sauce',
      'ko': '소스',
    },
    '6srt5tiy': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
    },
    '0rnfx85c': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
    },
    'dssbguf5': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
    },
    'hb0h7u0r': {
      'ru': 'Консервы/Маринады',
      'en': 'Canned goods/Marinades',
      'ko': '통조림/마리네이드',
    },
    'pue1d4l0': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
    },
    'j6gmjn44': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    '2negydpa': {
      'ru': 'Море продукты',
      'en': 'Seafood',
      'ko': '바다 음식',
    },
    'hykr21gm': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
    },
    'u1hzkkx9': {
      'ru': 'Хоз товары',
      'en': 'Household goods',
      'ko': '가정 용품',
    },
    'bbp0gps2': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
    },
    '70xejb1x': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
    },
    'xencupqz': {
      'ru': 'Десерт',
      'en': 'Dessert',
      'ko': '디저트',
    },
    'b2itwya3': {
      'ru': 'Прочее',
      'en': 'Other',
      'ko': '다른',
    },
    '3gpgpbpt': {
      'ru': 'В наличии',
      'en': 'In stock',
      'ko': '재고 있음',
    },
    'fmihrsfq': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
    },
    '8khlxt74': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // ProductsPage
  {
    'nedjrypz': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'iul1iz1d': {
      'ru': 'Список продуктов',
      'en': 'List of products',
      'ko': '제품 목록',
    },
    'tgicj5xh': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // ProductDeckPage
  {
    '8cyixmf0': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'byfvioes': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'ko': '편집하다',
    },
    'sk7jpox0': {
      'ru': 'Рассылка',
      'en': 'Newsletter',
      'ko': '회람 신문',
    },
    '4ogbz3li': {
      'ru': 'Select Size',
      'en': 'Select Size',
      'ko': '사이즈 선택',
    },
    '09ccqk6c': {
      'ru': 'S',
      'en': 'S',
      'ko': '에스',
    },
    'yu9zox1h': {
      'ru': 'M',
      'en': 'M',
      'ko': '중',
    },
    'oma2xj2l': {
      'ru': 'L',
      'en': 'L',
      'ko': '엘',
    },
    'jcvzc53k': {
      'ru': 'XL',
      'en': 'XL',
      'ko': '특대',
    },
    '4g67fyar': {
      'ru': 'Select Color',
      'en': 'Select Color',
      'ko': '색상 선택',
    },
    'hswd8ivr': {
      'ru': 'Black',
      'en': 'Black',
      'ko': '검은색',
    },
    'e2g07pl7': {
      'ru': 'White',
      'en': 'White',
      'ko': '하얀색',
    },
    'qpnyj3et': {
      'ru': 'Red',
      'en': 'Red',
      'ko': '빨간색',
    },
    'sq8t9rb8': {
      'ru': 'Blue',
      'en': 'Blue',
      'ko': '파란색',
    },
    'u3qxtluf': {
      'ru': 'Продукт уже есть в вашей корзине',
      'en': 'The product is already in your cart.',
      'ko': '제품이 이미 장바구니에 있습니다.',
    },
  },
  // ManagerOrderListPage
  {
    '1cefj9uw': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    's8tupd5o': {
      'ru': 'Новые',
      'en': 'New',
      'ko': '새로운',
    },
    'n1my5uu0': {
      'ru': 'Принятые',
      'en': 'Accepted',
      'ko': '수락됨',
    },
    '43sje0bl': {
      'ru': 'Готовые',
      'en': 'Ready',
      'ko': '준비가 된',
    },
    'i7co77ew': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'ko': '취소',
    },
    '06ny3hd7': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // EditStorePage
  {
    'k0zdqdbm': {
      'ru': 'Имя магазина',
      'en': 'Store name',
      'ko': '매장명',
    },
    'e3rxd788': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
    },
    '746a3s6z': {
      'ru': 'Адрес',
      'en': 'Address',
      'ko': '주소',
    },
    '2c3nkl8s': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
    },
    'jjzngdsn': {
      'ru': 'САОБЧА',
      'en': 'SAOBCHA',
      'ko': '사오차',
    },
    'yuugvyux': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
    },
    'k83lppxf': {
      'ru': 'фото саобча',
      'en': 'photo saobcha',
      'ko': '사진 사옵차',
    },
    'jcnrwec5': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
    },
    '3ln56ul1': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
    },
    'mn2d1u35': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    'b5e49uua': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // Stores
  {
    '6zdbteg8': {
      'ru': 'Мои магазины',
      'en': 'My shops',
      'ko': '내 매장',
    },
    'jpd1e78n': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'kkvfnwlt': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // OneOrderPage2
  {
    'h5tz6tf9': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    '1w9buw09': {
      'ru': 'Заказ',
      'en': 'Order',
      'ko': '주문하다',
    },
    'f3xx2rjt': {
      'ru': 'Сумма: ',
      'en': 'Sum:',
      'ko': '합집합:',
    },
    '6xlo3m9v': {
      'ru': 'Отмена статуса',
      'en': 'Cancel status',
      'ko': '취소 상태',
    },
    'qiboo5i9': {
      'ru': 'Удалить заказ',
      'en': 'Delete order',
      'ko': '주문 삭제',
    },
    '636924qo': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // MyClients
  {
    'ts23ei51': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'r5s71a2f': {
      'ru': 'Мои клиенты',
      'en': 'My clients',
      'ko': '내 고객',
    },
    'wv90639o': {
      'ru': 'All',
      'en': 'All',
      'ko': '모두',
    },
    'jjdjqh5a': {
      'ru': 'Pending',
      'en': 'Pending',
      'ko': '보류 중',
    },
    'njym9dxi': {
      'ru': 'In Progress',
      'en': 'In Progress',
      'ko': '진행 중',
    },
    '2mk6oxj1': {
      'ru': 'Completed',
      'en': 'Completed',
      'ko': '완전한',
    },
    'g2pslkwq': {
      'ru': 'All',
      'en': 'All',
      'ko': '모두',
    },
    'buvxsjw7': {
      'ru': 'All',
      'en': 'All',
      'ko': '모두',
    },
    'qr3mzzd4': {
      'ru': 'Имя',
      'en': 'Name',
      'ko': '이름',
    },
    '1whnsafy': {
      'ru': 'Статус',
      'en': 'Status',
      'ko': '상태',
    },
    'jqzrbeyk': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // HomePageWholeStore
  {
    '8knbeohg': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    '0wqmy3zq': {
      'ru': '3',
      'en': '3',
      'ko': '3',
    },
    'z06xs94n': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '찾다',
    },
    'nx3saamf': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
    },
    'nn9hfurq': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
    },
    '0l79ocsg': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
    },
    'eyyw2qrj': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
    },
    '18bnz4uh': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
    },
    'tolgmnro': {
      'ru': 'Консервы',
      'en': 'Canned goods',
      'ko': '통조림',
    },
    '1t2kahon': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
    },
    'o29hdbj7': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
    },
    'z1qjthac': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
    },
    '3iag5d4w': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
    },
    'br7nycn5': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
    },
    '36y7wgin': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
    },
    'kfiwv1du': {
      'ru': 'Консервы',
      'en': 'Canned goods',
      'ko': '통조림',
    },
    'xe0chby9': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
    },
    'jza90tpc': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'isyt7u1t': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
    },
    'zo6zbasr': {
      'ru': 'Море прод.',
      'en': 'Sea cont.',
      'ko': '바다 계속.',
    },
    'ejp7vqnv': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
    },
    'kxvtrlza': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
    },
    '9lvogyn9': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'kfbkf7wk': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'dgqe4x78': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'el9st8aq': {
      'ru': 'Десерты',
      'en': 'Desserts',
      'ko': '디저트',
    },
    'ozgbshbq': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    '4vq24xc5': {
      'ru': 'Хоз товар',
      'en': 'Household goods',
      'ko': '가정 용품',
    },
    'xpe3exwp': {
      'ru': 'Другие',
      'en': 'Other',
      'ko': '다른',
    },
    'k3ci3v2w': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
    },
    'rz7o2sbd': {
      'ru': 'Показать удаленые',
      'en': 'Show deleted',
      'ko': '삭제된 프로그램 보기',
    },
    'mc3n5gye': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // WholeStorePage
  {
    'asv7rqlm': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    'znrsu42u': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
    },
    'lwactj7f': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
    },
    '1p2480ae': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
    },
    'k3av8op1': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
    },
    '26gbis1n': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
    },
    '04e29wi0': {
      'ru': 'Консервы',
      'en': 'Canned goods',
      'ko': '통조림',
    },
    '146l694s': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
    },
    'x7g6fhfr': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
    },
    'zc85q7sl': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
    },
    'nxs5jmbl': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
    },
    '4j2mf2ij': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
    },
    'd8icrzso': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
    },
    'sb2f9c2k': {
      'ru': 'Консервы',
      'en': 'Canned goods',
      'ko': '통조림',
    },
    'g8odwtjg': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
    },
    '5d269i3h': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'wex06w3h': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
    },
    '1vo1vpft': {
      'ru': 'Море прод.',
      'en': 'Sea cont.',
      'ko': '바다 계속.',
    },
    'epoqnmbt': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
    },
    '9j3bxod8': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
    },
    'nqi1kuay': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'stoplflp': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    '0rptgt09': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'w4rtxn3b': {
      'ru': 'Десерты',
      'en': 'Desserts',
      'ko': '디저트',
    },
    '8evzfba1': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
    },
    'xahqcoel': {
      'ru': 'Хоз товар',
      'en': 'Household goods',
      'ko': '가정 용품',
    },
    '6x83o58t': {
      'ru': 'Другие',
      'en': 'Other',
      'ko': '다른',
    },
    'lwnk6ozr': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
    },
    'wkshynz5': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '찾다',
    },
    '9lccamso': {
      'ru': 'Показать удаленые',
      'en': 'Show deleted',
      'ko': '삭제된 프로그램 보기',
    },
    '64vwyl00': {
      'ru': 'В корзине',
      'en': 'In the basket',
      'ko': '장바구니에',
    },
    'v6iiokm5': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // payment
  {
    'fohtynin': {
      'ru': 'Subscription / Payment',
      'en': 'Subscription / Payment',
      'ko': '구독/결제',
    },
    'ixo7t97c': {
      'ru': 'Your Subscription',
      'en': 'Your Subscription',
      'ko': '귀하의 구독',
    },
    'jva11say': {
      'ru': 'Monthly',
      'en': 'Monthly',
      'ko': '월간 간행물',
    },
    'pp0pb58t': {
      'ru': '\$15.99/mo',
      'en': '\$15.99/mo',
      'ko': '\$15.99/월',
    },
    '00bk6umn': {
      'ru': 'Gain unlimited access to all the content we have to offer! ',
      'en': 'Gain unlimited access to all the content we have to offer!',
      'ko': '우리가 제공하는 모든 콘텐츠에 무제한으로 액세스하세요!',
    },
    'k5b8ia5r': {
      'ru': 'Other Offers',
      'en': 'Other Offers',
      'ko': '기타 제안',
    },
    'wgpuv0cv': {
      'ru': 'Annual (save \$12)',
      'en': 'Annual (save \$12)',
      'ko': '연간(\$12 절약)',
    },
    'm3ibs5ms': {
      'ru': '\$180/yr',
      'en': '\$180/yr',
      'ko': '\$180/년',
    },
    'xxtkmyeu': {
      'ru': 'Gain unlimited access to all the content we have to offer! ',
      'en': 'Gain unlimited access to all the content we have to offer!',
      'ko': '우리가 제공하는 모든 콘텐츠에 무제한으로 액세스하세요!',
    },
    'm3w3vp7s': {
      'ru': 'Free Limited Access',
      'en': 'Free Limited Access',
      'ko': '무료 제한 액세스',
    },
    'ua5dne1y': {
      'ru':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'ko': '무료로 제한된 액세스를 계속하세요. 귀하의 여행에 도움이 되는 블로그와 비디오를 찾아보세요!',
    },
    '3pc56npp': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // ProfileEdit
  {
    'm0fjc4jk': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '3y1r54xz': {
      'ru': 'Имя пользователя',
      'en': 'Username',
      'ko': '사용자 이름',
    },
    'fnp5v0al': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'aroi4a4s': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
    },
    'jeh8hueh': {
      'ru': 'Сохранить',
      'en': 'Register',
      'ko': '등록하다',
    },
    '0fi39yba': {
      'ru': 'Удалить профиль',
      'en': 'Delete profile',
      'ko': '프로필 삭제',
    },
    'v0q4jezo': {
      'ru': 'оплата',
      'en': 'payment',
      'ko': '지불',
    },
    'sus98qct': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    'kh8c8mfs': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // deleteInstructionPage
  {
    'pqg2g2xp': {
      'ru': 'Важное предупреждение',
      'en': 'Important Warning',
      'ko': '중요한 경고',
    },
    'g7b7dfni': {
      'ru':
          'Удаление аккаунта - необратимое действие. Вся информация будет утеряна без возможности восстановления.',
      'en':
          'Deleting an account is an irreversible action. All information will be lost without the possibility of recovery.',
      'ko': '계정 삭제는 되돌릴 수 없는 작업입니다. 모든 정보는 복구 가능성 없이 손실됩니다.',
    },
    'yb26x489': {
      'ru': 'Перед удалением:',
      'en': 'Before deleting:',
      'ko': '삭제하기 전:',
    },
    '4n5bvm3l': {
      'ru': 'Сохраните важные данные и информацию, если они вам необходимы',
      'en': 'Save important data and information if you need it.',
      'ko': '필요할 때 중요한 데이터와 정보를 저장하세요.',
    },
    'oui2s5jg': {
      'ru': 'Завершите все активные транзакции и процессы',
      'en': 'Terminate all active transactions and processes',
      'ko': '모든 활성 트랜잭션 및 프로세스 종료',
    },
    'tbggmd39': {
      'ru': 'Убедитесь, что вы действительно хотите удалить аккаунт',
      'en': 'Make sure you really want to delete your account.',
      'ko': '정말로 계정을 삭제하고 싶은지 확인하세요',
    },
    'm0tzbbqm': {
      'ru': 'Запрос на удаление:',
      'en': 'Request for deletion:',
      'ko': '제거 요청:',
    },
    'drky2ikr': {
      'ru':
          'Отправьте запрос на удаление аккаунта на еmail: wholekrsaler@gmail.com',
      'en':
          'Send a request to delete your account to email: wholekrsaler@gmail.com',
      'ko': '이메일(wholekrsaler@gmail.com)로 계정 삭제 요청을 보내세요.',
    },
    'cwhh2c7c': {
      'ru': 'Процесс удаления:',
      'en': 'Removal process:',
      'ko': '제거 프로세스:',
    },
    '8rd8nfsg': {
      'ru': 'Перейдите в настройки профиля',
      'en': 'Go to profile settings',
      'ko': '프로필 설정으로 이동',
    },
    'a6hpw10z': {
      'ru': 'Найдите опцию \'Удалить аккаунт\'',
      'en': 'Find the \'Delete Account\' option',
      'ko': '\'계정 삭제\' 옵션 찾기',
    },
    'nlor1nw4': {
      'ru': 'Подтвердите удаление',
      'en': 'Confirm deletion',
      'ko': '삭제 확인',
    },
    'hg164n15': {
      'ru': 'После удаления:',
      'en': 'After removal:',
      'ko': '제거 후:',
    },
    'xioldf7d': {
      'ru':
          '• Все ваши данные будут удалены\n• Доступ к сервисам будет прекращен\n• Восстановление аккаунта будет невозможно',
      'en':
          '• All your data will be deleted\n• Access to services will be terminated\n• Account recovery will be impossible',
      'ko': '• 모든 데이터가 삭제됩니다.\n• 서비스 이용이 종료됩니다.\n• 계정 복구는 불가능합니다.',
    },
  },
  // SupportPage
  {
    '0k35hdbu': {
      'ru': 'Техническая поддержка',
      'en': 'Technical support',
      'ko': '기술지원',
    },
    'm5rc1rqn': {
      'ru':
          'If you have a question regarding our application, a problem which you do not know how to resolve, or concrete inquiry - we are here for you. We will answer you via email as soon as possible.\n\n**wholekrsaler@gmail.com**\n\nPlease let us know if you have any trouble using application.\n\n\n\nЕсли у вас есть вопрос об использовании приложения, проблема, которую вы не знаете, как решить, или конкретный запрос - мы всегда рады вам помочь. Пожалуйста отправьте ваш запрос в виде электронного письма по адресу:\n\n**wholekrsaler@gmail.com**',
      'en':
          'If you have a question regarding our application, a problem which you do not know how to resolve, or concrete inquiry - we are here for you. We will answer you via email as soon as possible.\n\n**wholekrsaler@gmail.com**\n\nPlease let us know if you have any trouble using the application.\n\nIf you have a question regarding the use of the application, a problem which you do not know how to resolve, or a specific request - we are always happy to help you. Please send your request as an email to:\n\n**wholekrsaler@gmail.com**',
      'ko':
          '신청서에 관한 질문이 있거나 해결 방법을 모르는 문제 또는 구체적인 문의사항이 있는 경우, 저희가 도와드리겠습니다. 최대한 빨리 이메일을 통해 답변해드리겠습니다.\n\n**wholekrsaler@gmail.com**\n\n응용 프로그램을 사용하는 데 문제가 있으면 알려주십시오.\n\n\n\n애플리케이션 사용에 대한 질문이 있거나 해결 방법을 모르는 문제 또는 특정 요청이 있는 경우 언제든지 기꺼이 도와드리겠습니다. 다음 주소로 이메일을 보내 요청을 보내주세요.\n\n**wholekrsaler@gmail.com**',
    },
    '9c7ntt3a': {
      'ru': 'Написать в тех поддержку',
      'en': 'Write to tech support',
      'ko': '기술 지원에 쓰기',
    },
    'fbss3r6o': {
      'ru': 'Контактный номер',
      'en': 'Contact number',
      'ko': '연락번호',
    },
    '9lsvb474': {
      'ru': '+821022795599',
      'en': '+821022795599',
      'ko': '+821022795599',
    },
  },
  // PrivacyPolicy
  {
    'w3hp98gi': {
      'ru': 'WholeSaler Privacy\nPolicy\n',
      'en': 'WholeSaler Privacy\nPolicy',
      'ko': 'WholeSaler 개인 정보 보호\n정책',
    },
    'mrzmhcic': {
      'ru':
          'This privacy policy applies to the WholeSaler app (hereby referred to as \"Application\") for mobile devices that was created by Kim Vadim Klimovich (hereby referred to as \"Service Provider\") as a Commercial service. This service is intended for use \"AS IS\".\n\n\nInformation Collection and Use\nThe Application collects information when you download and use it. This information may include information such as\n\nYour device\'s Internet Protocol address (e.g. IP address)\nThe pages of the Application that you visit, the time and date of your visit, the time spent on those pages\nThe time spent on the Application\nThe operating system you use on your mobile device\n\nThe Application does not gather precise information about the location of your mobile device.\n\n\nThe Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.\n\n\nFor a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information. The information that the Service Provider request will be retained by them and used as described in this privacy policy.\n\n\nThird Party Access\nOnly aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.\n\n\n\nPlease note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:\n\nGoogle Play Services\nAdMob\nGoogle Analytics for Firebase\nFirebase Crashlytics\nFacebook\n\nThe Service Provider may disclose User Provided and Automatically Collected Information:\n\nas required by law, such as to comply with a subpoena, or similar legal process;\nwhen they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to a government request;\nwith their trusted services providers who work on their behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement.\n\nOpt-Out Rights\nYou can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.\n\n\nData Retention Policy\nThe Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you\'d like them to delete User Provided Data that you have provided via the Application, please contact them at wholekrsaler@gmail.com and they will respond in a reasonable time.\n\n\nChildren\nThe Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.\n\n\nThe Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (wholekrsaler@gmail.com) so that they will be able to take the necessary actions.\n\n\nSecurity\nThe Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.\n\n\nChanges\nThis Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.\n\n\n\nThis privacy policy is effective as of 2024-12-16\n\n\nYour Consent\nBy using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.\n\n\nContact Us\nIf you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at wholekrsaler@gmail.com.',
      'en':
          'This privacy policy applies to the WholeSaler app (hereby referred to as \"Application\") for mobile devices that was created by Kim Vadim Klimovich (hereby referred to as \"Service Provider\") as a Commercial service. This service is intended for use \"AS IS\".\n\n\nInformation Collection and Use\nThe Application collects information when you download and use it. This information may include information such as\n\nYour device\'s Internet Protocol address (e.g. IP address)\nThe pages of the Application that you visit, the time and date of your visit, the time spent on those pages\nThe time spent on the Application\nThe operating system you use on your mobile device\n\nThe Application does not gather precise information about the location of your mobile device.\n\n\nThe Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.\n\n\nFor a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information. The information that the Service Provider request will be retained by them and used as described in this privacy policy.\n\n\nThird Party Access\nOnly aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.\n\n\n\nPlease note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:\n\nGoogle Play Services\nAdMob\nGoogle Analytics for Firebase\nFirebase Crashlytics\nFacebook\n\nThe Service Provider may disclose User Provided and Automatically Collected Information:\n\nas required by law, such as to comply with a subpoena, or similar legal process;\nwhen they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to a government request;\nwith their trusted services providers who work on their behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement.\n\nOpt-Out Rights\nYou can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.\n\n\nData Retention Policy\nThe Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you\'d like them to delete User Provided Data that you have provided via the Application, please contact them at wholekrsaler@gmail.com and they will respond in a reasonable time.\n\n\nChildren\nThe Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.\n\n\nThe Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discovers that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (wholekrsaler@gmail.com) so that they will be able to take the necessary actions.\n\n\nSecurity\nThe Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.\n\n\nChanges\nThis Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.\n\n\n\nThis privacy policy is effective as of 2024-12-16\n\n\nYour Consent\nBy using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.\n\n\nContact Us\nIf you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at wholekrsaler@gmail.com.',
      'ko':
          '본 개인정보 보호정책은 Kim Vadim Klimovich(이하 \"서비스 제공자\")가 상업용 서비스로 제작한 모바일 장치용 WholeSaler 앱(이하 \"애플리케이션\")에 적용됩니다. 이 서비스는 \"있는 그대로\" 사용하기 위한 것입니다.\n\n\n정보 수집 및 사용\n애플리케이션은 귀하가 다운로드하여 사용할 때 정보를 수집합니다. 이 정보에는 다음과 같은 정보가 포함될 수 있습니다.\n\n장치의 인터넷 프로토콜 주소(예: IP 주소)\n귀하가 방문한 애플리케이션 페이지, 방문 시간 및 날짜, 해당 페이지에서 보낸 시간\n신청서 작성에 소요된 시간\n모바일 장치에서 사용하는 운영 체제\n\n애플리케이션은 귀하의 모바일 장치 위치에 대한 정확한 정보를 수집하지 않습니다.\n\n\n서비스 제공업체는 중요한 정보, 필수 공지 사항 및 마케팅 프로모션을 제공하기 위해 수시로 귀하에게 연락하기 위해 귀하가 제공한 정보를 사용할 수 있습니다.\n\n\n더 나은 경험을 위해 애플리케이션을 사용하는 동안 서비스 제공업체는 귀하에게 특정 개인 식별 정보를 제공하도록 요구할 수 있습니다. 서비스 제공자가 요청한 정보는 본 개인정보 보호정책에 설명된 대로 서비스 제공자가 보유하고 사용합니다.\n\n\n제3자 액세스\n서비스 제공업체가 애플리케이션과 해당 서비스를 개선하는 데 도움이 되도록 집계되고 익명화된 데이터만 주기적으로 외부 서비스로 전송됩니다. 서비스 제공업체는 본 개인정보 보호정책에 설명된 방식으로 귀하의 정보를 제3자와 공유할 수 있습니다.\n\n\n\n애플리케이션은 데이터 처리에 대한 자체 개인 정보 보호 정책이 있는 제3자 서비스를 활용한다는 점에 유의하십시오. 다음은 애플리케이션에서 사용하는 제3자 서비스 제공업체의 개인정보 보호정책에 대한 링크입니다.\n\n구글 플레이 서비스\nAdMob\nFirebase용 Google 애널리틱스\nFirebase Crashlytics\n페이스북\n\n서비스 제공자는 사용자가 제공하고 자동으로 수집된 정보를 공개할 수 있습니다.\n\n소환장 또는 유사한 법적 절차를 준수하기 위해 법률에서 요구하는 경우\n자신의 권리를 보호하고, 귀하 또는 타인의 안전을 보호하고, 사기를 조사하거나, 정부 요청에 응답하기 위해 공개가 필요하다고 선의로 믿는 경우\n신뢰할 수 있는 서비스 제공업체를 대신하여 당사가 공개하는 정보를 독립적으로 사용하지 않으며 본 개인정보 보호정책에 명시된 규칙을 준수하는 데 동의했습니다.\n\n옵트아웃 권리\n귀하는 애플리케이션을 제거함으로써 쉽게 애플리케이션에 의한 모든 정보 수집을 중지할 수 있습니다. 귀하는 귀하의 모바일 장치의 일부로 또는 모바일 애플리케이션 마켓플레이스나 네트워크를 통해 이용 가능한 표준 제거 프로세스를 사용할 수 있습니다.\n\n\n데이터 보존 정책\n서비스 제공업체는 귀하가 애플리케이션을 사용하는 동안과 그 이후에도 합당한 기간 동안 사용자 제공 데이터를 보관합니다. 귀하가 애플리케이션을 통해 제공한 사용자 제공 데이터를 삭제하기를 원하는 경우, Wholekrsaler@gmail.com으로 연락하시면 합당한 시간 내에 응답해 드리겠습니다.\n\n\n어린이들\n서비스 제공업체는 13세 미만의 어린이에게 고의로 데이터를 요청하거나 마케팅하기 위해 애플리케이션을 사용하지 않습니다.\n\n\n본 애플리케이션은 13세 미만의 사용자에게 적용되지 않습니다. 서비스 제공업체는 13세 미만의 어린이로부터 고의로 개인 식별 정보를 수집하지 않습니다. 서비스 제공자는 만 13세 미만 아동이 개인정보를 제공한 사실을 발견한 경우, 해당 정보를 즉시 서버에서 삭제합니다. 귀하가 부모 또는 보호자이고 귀하의 자녀가 당사에 개인정보를 제공한 사실을 알고 있는 경우 서비스 제공자(wholekrsaler@gmail.com)에게 연락하여 필요한 조치를 취할 수 있도록 하십시오.\n\n\n보안\n서비스 제공업체는 귀하의 정보의 기밀성을 보호하는 데 최선을 다하고 있습니다. 서비스 제공업체는 서비스 제공업체가 처리하고 유지 관리하는 정보를 보호하기 위해 물리적, 전자적, 절차적 보호 장치를 제공합니다.\n\n\n변경 사항\n본 개인정보 보호정책은 어떤 이유로든 수시로 업데이트될 수 있습니다. 서비스 제공업체는 이 페이지를 새로운 개인정보 보호정책으로 업데이트하여 개인정보 보호정책의 변경 사항을 귀하에게 통보할 것입니다. 지속적인 사용은 모든 변경 사항에 대한 승인으로 간주되므로 변경 사항이 있는 경우 정기적으로 이 개인 정보 보호 정책을 참조하는 것이 좋습니다.\n\n\n\n본 개인정보처리방침은 2024년 12월 16일부터 적용됩니다.\n\n\n귀하의 동의\n애플리케이션을 사용함으로써 귀하는 현재 본 개인정보 보호정책에 명시되어 있고 당사가 개정한 대로 귀하의 정보를 처리하는 데 동의하는 것입니다.\n\n\n문의하기\n애플리케이션을 사용하는 동안 개인 정보 보호에 관해 질문이 있거나 관행에 대해 질문이 있는 경우 이메일 Wholekrsaler@gmail.com을 통해 서비스 제공업체에 문의하세요.',
    },
  },
  // paywall
  {
    'sygwc5s3': {
      'ru': 'Choose Your Plan',
      'en': 'Choose Your Plan',
      'ko': '계획을 선택하세요',
    },
    'dzmdyjyc': {
      'ru': 'Select the perfect plan for you',
      'en': 'Select the perfect plan for you',
      'ko': '귀하에게 딱 맞는 플랜을 선택하세요',
    },
    'e1pq7rxq': {
      'ru': 'Basic Plan',
      'en': 'Basic Plan',
      'ko': '기본 계획',
    },
    '5i668jpl': {
      'ru': 'Perfect for starters',
      'en': 'Perfect for starters',
      'ko': '초보자에게 딱 맞습니다.',
    },
    'cs4iy02z': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '89yismec': {
      'ru': 'Access to basic features',
      'en': 'Access to basic features',
      'ko': '기본 기능에 대한 액세스',
    },
    'jki67gr1': {
      'ru': 'Up to 100 transactions/month',
      'en': 'Up to 100 transactions/month',
      'ko': '월별 최대 100건의 거래',
    },
    'ejlzbj3c': {
      'ru': 'Email support',
      'en': 'Email support',
      'ko': '이메일 지원',
    },
    'fu7mxt24': {
      'ru': 'Select Basic Plan',
      'en': 'Select Basic Plan',
      'ko': '기본 플랜 선택',
    },
    'kevchjw9': {
      'ru': 'Premium Plan',
      'en': 'Premium Plan',
      'ko': '프리미엄 플랜',
    },
    'cp796xl7': {
      'ru': 'For growing businesses',
      'en': 'For growing businesses',
      'ko': '성장하는 기업을 위한',
    },
    '76v261vp': {
      'ru': '\$24.99/mo',
      'en': '\$24.99/mo',
      'ko': '\$24.99/월',
    },
    'ph3vofn0': {
      'ru': 'All Basic features',
      'en': 'All Basic Features',
      'ko': '모든 기본 기능',
    },
    'bsoe84qb': {
      'ru': 'Unlimited transactions',
      'en': 'Unlimited transactions',
      'ko': '무제한 거래',
    },
    'qei0h1qp': {
      'ru': 'Priority support',
      'en': 'Priority support',
      'ko': '우선 지원',
    },
    'zsqo5e9y': {
      'ru': 'Advanced analytics',
      'en': 'Advanced analytics',
      'ko': '고급 분석',
    },
    'poqgqn5k': {
      'ru': 'Custom integrations',
      'en': 'Custom integrations',
      'ko': '맞춤형 통합',
    },
    'sacwyxsw': {
      'ru': 'Select Premium Plan',
      'en': 'Select Premium Plan',
      'ko': '프리미엄 플랜 선택',
    },
    'tiay8thm': {
      'ru': 'Need help choosing?',
      'en': 'Need help choosing?',
      'ko': '선택하는 데 도움이 필요하십니까?',
    },
    'im405s9f': {
      'ru':
          'Contact our sales team for a personalized recommendation based on your specific needs.',
      'en':
          'Contact our sales team for a personalized recommendation based on your specific needs.',
      'ko': '특정 요구 사항에 따른 맞춤형 추천을 받으려면 당사 영업팀에 문의하세요.',
    },
    'o9s81i7i': {
      'ru': 'Contact Sales',
      'en': 'Contact Sales',
      'ko': '영업팀에 문의',
    },
  },
  // onePortCreateCard
  {
    'z7pdqfh7': {
      'ru': '₩ 50 000 в мясяц',
      'en': '₩ 50,000 per month',
      'ko': '₩ 50,000/월',
    },
    'a05hnmt8': {
      'ru': 'Номер карты',
      'en': 'Card number',
      'ko': '카드번호',
    },
    'a96w4dff': {
      'ru': 'Expiry Date(YYYY-MM)',
      'en': 'Expiry Date(YYYY-MM)',
      'ko': '유통기한(YYYY-MM)',
    },
    'rh5j4eys': {
      'ru': 'CVV',
      'en': 'CVV',
      'ko': '이력서',
    },
    'ap16n660': {
      'ru': 'Пароль от карты, первые2 цифры',
      'en': 'Card password, first 2 digits',
      'ko': '카드비밀번호 앞 2자리',
    },
    'lvkq0coq': {
      'ru': '2 цифры',
      'en': '2 digits',
      'ko': '2자리',
    },
    'nqcl5764': {
      'ru': 'Имя владельца карты',
      'en': 'Cardholder name',
      'ko': '카드 소지자 이름',
    },
    'iid1ck7t': {
      'ru': 'Дата рождения (ГГММДД)',
      'en': 'Date of birth (YYMMDD)',
      'ko': '생년월일(YYMMDD)',
    },
    '8n3itgzd': {
      'ru': 'ГГММДД',
      'en': 'YYMMDD',
      'ko': 'YYMMDD',
    },
    '42nipi53': {
      'ru': 'Электронная почта',
      'en': 'E-mail',
      'ko': '이메일',
    },
    '4gm9k1lb': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '3ai10vr4': {
      'ru': '100',
      'en': '100',
      'ko': '100',
    },
    'cfayf97t': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'rghe9j6g': {
      'ru': 'WholeSaler Satore plan 1mon',
      'en': 'WholeSaler Satore plan 1 month',
      'ko': 'WholeSaler Satore 계획 1mon',
    },
    'y7mb0hxy': {
      'ru': 'Saved Cards',
      'en': 'Saved Cards',
      'ko': '저장된 카드',
    },
    'pq73eo2o': {
      'ru': '•••• •••• •••• 4567',
      'en': '•••• •••• •••• 4567',
      'ko': '•••• •••• •••• 4567',
    },
    '8stt67mm': {
      'ru': 'Expires 12/24',
      'en': 'Expires 12/24',
      'ko': '12/24에 만료됨',
    },
    'jnf7t89t': {
      'ru': '•••• •••• •••• 8901',
      'en': '•••• •••• •••• 8901',
      'ko': '•••• •••• •••• 8901',
    },
    'tcshl1sy': {
      'ru': 'Expires 09/25',
      'en': 'Expires 09/25',
      'ko': '09/25에 만료됨',
    },
    'h20a58g1': {
      'ru': 'Оплатить',
      'en': 'Pay',
      'ko': '지불하다',
    },
    '7bwrcrwf': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
  },
  // paidPage
  {
    'buv38oj1': {
      'ru': 'Оплата прошла!',
      'en': 'Payment completed!',
      'ko': '결제가 완료되었습니다!',
    },
    'dw3qe12s': {
      'ru': 'Платеж успешно выполнен. Благодарим за покупку!',
      'en': 'Payment completed successfully. Thank you for your purchase!',
      'ko': '결제가 성공적으로 완료되었습니다. 구매해주셔서 감사합니다!',
    },
    '6p73f7df': {
      'ru': 'Сумма платежа',
      'en': 'Payment amount',
      'ko': '결제금액',
    },
    's73kwhw4': {
      'ru': 'ID транзакции',
      'en': 'Transaction ID',
      'ko': '거래 ID',
    },
    'xnpjcmci': {
      'ru': 'Название карты',
      'en': 'Map name',
      'ko': '카드 이름',
    },
    'sqqeye5c': {
      'ru': 'Тарифный план',
      'en': 'Tariff plan',
      'ko': '관세 계획',
    },
    'p6fe8knk': {
      'ru': 'Провайдер',
      'en': 'Provider',
      'ko': '공급자',
    },
    '42gcy9qs': {
      'ru': 'Номер карты',
      'en': 'Card number',
      'ko': '카드번호',
    },
    'xcnx6o25': {
      'ru': 'ОК',
      'en': 'OK',
      'ko': '좋아요',
    },
  },
  // SandNoticePage
  {
    '18to02or': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    'ji1kxumb': {
      'ru': 'Рассылка',
      'en': 'Newsletter',
      'ko': '회람 신문',
    },
    '0289q13e': {
      'ru': 'Заголовок сообщения',
      'en': 'Message Title',
      'ko': '메시지 제목',
    },
    'p0k7eix3': {
      'ru': 'Текст сообщение',
      'en': 'Text message',
      'ko': '문자 메시지',
    },
    '4l7xph33': {
      'ru': 'Отправить',
      'en': 'Send',
      'ko': '보내다',
    },
  },
  // RegNewStore
  {
    '0khfppdb': {
      'ru': 'Магазин на проверке',
      'en': 'The store is under inspection',
      'ko': '점검 중인 매장',
    },
    'rltxqab8': {
      'ru': 'Имя магазина',
      'en': 'Store name',
      'ko': '매장명',
    },
    'ps8uu2y1': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
    },
    'fiz35r22': {
      'ru': 'Адрес',
      'en': 'Address',
      'ko': '주소',
    },
    '38a2rkie': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
    },
    'ygw4ntty': {
      'ru': 'Бизнес лицензия(саобча)',
      'en': 'Business license (saobcha)',
      'ko': '사업자등록증(사옵차)',
    },
    '1wsqpox5': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
    },
    'vnr3l8nx': {
      'ru': 'фото саобча',
      'en': 'photo saobcha',
      'ko': '사진 사옵차',
    },
    's2hyume6': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
    },
    '99bbn9i4': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
    },
    'djgyqsmw': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'ko': '등록하다',
    },
    'wqybv1d0': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    '0uoq2qyh': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // SendEmail
  {
    'j7d5lnuy': {
      'ru': 'Тех поддержка',
      'en': 'Tech support',
      'ko': '기술 지원',
    },
    'abrlth36': {
      'ru': 'To',
      'en': 'To',
      'ko': '에게',
    },
    'zxjwqukw': {
      'ru': 'wholekrsaler@gmail.com',
      'en': 'wholekrsaler@gmail.com',
      'ko': 'Wholekrsaler@gmail.com',
    },
    '0ithpwxx': {
      'ru': 'Тема сообщения',
      'en': 'Message Subject',
      'ko': '메시지 제목',
    },
    'kmstbcl8': {
      'ru': 'Текст сообщения',
      'en': 'Message text',
      'ko': '메시지 텍스트',
    },
    'qhv8xr41': {
      'ru': 'Незабудьте указать контактные данные',
      'en': 'Don\'t forget to include your contact information',
      'ko': '연락처 정보를 제공하는 것을 잊지 마세요',
    },
    '3tdcbnde': {
      'ru': 'Send',
      'en': 'Send',
      'ko': '보내다',
    },
    'v9g516kr': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
  },
  // checkStoreList
  {
    'vi9vfnh6': {
      'ru': 'Магазины на проверке',
      'en': '',
      'ko': '',
    },
    'h6euseda': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
  },
  // checkStorePageAdmin
  {
    'hutbvsoh': {
      'ru': 'Имя магазина',
      'en': 'Store name',
      'ko': '매장명',
    },
    'dn0esv0v': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
    },
    'c6er9fk6': {
      'ru': 'Адрес',
      'en': 'Address',
      'ko': '주소',
    },
    'fcz3w61a': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
    },
    'usl8mapv': {
      'ru': 'САОБЧА',
      'en': 'SAOBCHA',
      'ko': '사오차',
    },
    'ofmqxhae': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
    },
    '8albb0te': {
      'ru': 'фото саобча',
      'en': 'photo saobcha',
      'ko': '사진 사옵차',
    },
    'rwuehjhf': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
    },
    'h24s8wm3': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
    },
    '4t03kmpc': {
      'ru': 'Прошел',
      'en': '',
      'ko': '',
    },
    'cct6rnry': {
      'ru': 'Не прошел',
      'en': '',
      'ko': '',
    },
    '3gxrwx6m': {
      'ru': 'Причина отказа',
      'en': '',
      'ko': '',
    },
    'i5shjzkf': {
      'ru': 'Сохранить отказ',
      'en': '',
      'ko': '',
    },
    'z3m57ebj': {
      'ru': '1',
      'en': '1',
      'ko': '1',
    },
    'zvj1p7a8': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
    },
  },
  // PizzaItem
  {
    'f8im7su4': {
      'ru': 'Будет позже',
      'en': 'Will come later',
      'ko': '나중에 올 것이다',
    },
  },
  // deckriptionItem
  {
    'sqaxzhgu': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'ko': '편집하다',
    },
    'ihxjp0q9': {
      'ru': 'Маленькая',
      'en': 'Small',
      'ko': '작은',
    },
    '57b66eyg': {
      'ru': 'Средняя',
      'en': 'Average',
      'ko': '평균',
    },
    'pu204amo': {
      'ru': 'Большая',
      'en': 'Big',
      'ko': '큰',
    },
    'a7i96tsd': {
      'ru': 'Традиционнае',
      'en': 'Traditional',
      'ko': '전통적인',
    },
    'rl1c267q': {
      'ru': 'Тонкае',
      'en': 'Thin',
      'ko': '희석제',
    },
    'gnuiny1r': {
      'ru': 'Добавить ингридиенты',
      'en': 'Add ingredients',
      'ko': '재료 추가',
    },
    'dhgotvh4': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
    },
    '27muwlil': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
    },
    'j0wc25sy': {
      'ru': 'Моцарелла',
      'en': 'Mozzarella',
      'ko': '모짜렐라',
    },
    'yd8mxwbh': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
    },
    'fpqgfbc7': {
      'ru': 'Шампиньоны',
      'en': 'Champignons',
      'ko': '샴피뇽',
    },
    'ld0er7cp': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
    },
    'zld1njsc': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
    },
    'alnhzgtw': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
    },
    'jaga849t': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
    },
    'tll7niam': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
    },
    'ms7asp9f': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
    },
    '2pk53utc': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
    },
    'wfdq730d': {
      'ru': 'Продукт уже есть в вашей корзине',
      'en': 'The product is already in your cart.',
      'ko': '제품이 이미 장바구니에 있습니다.',
    },
  },
  // CartItem
  {
    'nh73muzj': {
      'ru': '-',
      'en': '-',
      'ko': '-',
    },
    '8uyyjytm': {
      'ru': '+',
      'en': '+',
      'ko': '+',
    },
  },
  // bannerItem
  {
    '12tlsc2v': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'ko': '편집하다',
    },
  },
  // addressItem
  {
    'uyw3cn0r': {
      'ru': 'Изменить',
      'en': 'Change',
      'ko': '변화',
    },
  },
  // addnewAddress
  {
    '8uheljgd': {
      'ru': 'Город',
      'en': 'City',
      'ko': '도시',
    },
    'g9o1x37i': {
      'ru': 'Улица',
      'en': 'Street',
      'ko': '거리',
    },
    '1pjur2y7': {
      'ru': 'Дом',
      'en': 'House',
      'ko': '집',
    },
    'dio62pps': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
    },
  },
  // promotion
  {
    'ypagnwf4': {
      'ru': 'Акция',
      'en': 'Promotion',
      'ko': '홍보',
    },
    '46tkglqf': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
    },
    'sf6dourv': {
      'ru': 'фото акции',
      'en': 'stock photo',
      'ko': '액션 사진',
    },
    'e16q1cnr': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
    },
    'dgkt7fme': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
    },
    'dzhnwley': {
      'ru': 'Удалить акцию',
      'en': 'Remove promotion',
      'ko': '프로모션 삭제',
    },
  },
  // emptyCart
  {
    'u82bmd2l': {
      'ru': 'Перейти',
      'en': 'Go to',
      'ko': '가다',
    },
  },
  // addnewStore
  {
    'ynhzuts8': {
      'ru': 'Город',
      'en': 'City',
      'ko': '도시',
    },
    'u4ekfihf': {
      'ru': 'Улица',
      'en': 'Street',
      'ko': '거리',
    },
    'er69ssub': {
      'ru': 'Дом',
      'en': 'House',
      'ko': '집',
    },
    '4v60pgzd': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
    },
  },
  // storeitem
  {
    'e99y4tff': {
      'ru': 'Изменить',
      'en': 'Change',
      'ko': '변화',
    },
  },
  // CartItem2
  {
    'qgfd27np': {
      'ru': '-',
      'en': '-',
      'ko': '-',
    },
    'hozg2w4j': {
      'ru': '+',
      'en': '+',
      'ko': '+',
    },
  },
  // allCategories
  {
    'q3dzypk9': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    'kdkopmvz': {
      'ru': 'Beverages',
      'en': 'Beverages',
      'ko': '음료수',
    },
    '3u2j3goa': {
      'ru': 'Groceries',
      'en': 'Grocery stores',
      'ko': '식료 잡화류',
    },
    'lukelg45': {
      'ru': 'Household',
      'en': 'Household',
      'ko': '가정',
    },
    'm2r3i84g': {
      'ru': 'Pet Supplies',
      'en': 'Pet Supplies',
      'ko': '애완동물 용품',
    },
    'xc37s1xf': {
      'ru': 'Health',
      'en': 'Health',
      'ko': '건강',
    },
    'cs7phpro': {
      'ru': 'Beauty',
      'en': 'Beauty',
      'ko': '아름다움',
    },
    'wglw301a': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    '6xu8kl9z': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    '69elaxup': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    'wgim9bi1': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    'j1kynct5': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    'rtwt3vxc': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    'k48bxpdr': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
    'utpby49i': {
      'ru': 'Food',
      'en': 'Food',
      'ko': '음식',
    },
  },
  // Miscellaneous
  {
    'kggo67s0': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'puap9trx': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'nplkojh7': {
      'ru': '',
      'en': 'Error: [error]',
      'ko': '',
    },
    '6hf86e56': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'gnzswnov': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    't2vyld2o': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'vu6l2ips': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '1w1sxrco': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'w43e88ov': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'z207gbic': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'mo4ran1m': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'z1zja8zd': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'loxivoqm': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'g9442q5r': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'av6yiu8l': {
      'ru': '',
      'en': 'Uploading file...',
      'ko': '',
    },
    'ivcbu61y': {
      'ru': '',
      'en': 'Success!',
      'ko': '',
    },
    '64sgmfr4': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'xqq99fdb': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'b9jeci1i': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'b7v5qv22': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'xsaqnxxp': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '1y2fapq7': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'ja2beswk': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '7fp9qhq3': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'b8grdz77': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    '4piikevj': {
      'ru': '',
      'en': '',
      'ko': '',
    },
    'j6mdm3j3': {
      'ru': '',
      'en': '',
      'ko': '',
    },
  },
].reduce((a, b) => a..addAll(b));
