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

  static List<String> languages() => ['ru', 'en', 'ko', 'zh_Hans'];

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
    String? zh_HansText = '',
  }) =>
      [ruText, enText, koText, zh_HansText][languageIndex] ?? '';

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
      'zh_Hans': '电子邮件',
    },
    '7a7uldtu': {
      'ru': 'Пароль',
      'en': 'Password',
      'ko': '비밀번호',
      'zh_Hans': '密码',
    },
    'gnvt3by0': {
      'ru': 'Логин',
      'en': 'Login',
      'ko': '로그인',
      'zh_Hans': '登录',
    },
    'xogc70w9': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'ko': '등록하다',
      'zh_Hans': '登记',
    },
    '87yyv8xt': {
      'ru': 'Забыли пароль?',
      'en': 'Forgot your password?',
      'ko': '비밀번호를 잊으셨나요?',
      'zh_Hans': '忘记密码了吗？',
    },
    'aqgkxu3e': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
    },
  },
  // HomePageOld
  {
    'bu8386f5': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    '2wqzgu9f': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'j9xftzng': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    'irpqukru': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    'g0u21uy1': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    'gkrijmgd': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    's28evzcp': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
      'zh_Hans': '酱汁',
    },
    '1bkq133i': {
      'ru': 'Консервы',
      'en': 'Canned goods',
      'ko': '통조림',
      'zh_Hans': '罐头食品',
    },
    'efe3s78c': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    '69tp1l3v': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'yser9f9u': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
      'zh_Hans': '经常订购',
    },
    'u7yhs1sf': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '찾다',
      'zh_Hans': '搜索',
    },
    'dhat81dc': {
      'ru': 'Показать удаленые',
      'en': 'Show deleted',
      'ko': '삭제된 프로그램 보기',
      'zh_Hans': '显示已删除',
    },
    'onzurzzr': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '房子',
    },
  },
  // RegPage
  {
    'tc35e1lc': {
      'ru': 'Имя',
      'en': 'Name',
      'ko': '이름',
      'zh_Hans': '姓名',
    },
    'gvixap3l': {
      'ru': 'Email',
      'en': 'Email',
      'ko': '이메일',
      'zh_Hans': '电子邮件',
    },
    'y71u2dpg': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
      'zh_Hans': '电话',
    },
    'vf2lghsw': {
      'ru': 'Пароль',
      'en': 'Password',
      'ko': '비밀번호',
      'zh_Hans': '密码',
    },
    'dtfegsp3': {
      'ru': 'Повторите пароль',
      'en': 'Repeat password',
      'ko': '비밀번호를 반복하세요',
      'zh_Hans': '重复密码',
    },
    'wh2m7n2e': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'ko': '등록하다',
      'zh_Hans': '登记',
    },
    'fbfqq7pl': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
    },
  },
  // FavoritPage
  {
    'v72404gv': {
      'ru': 'Избранное',
      'en': 'Featured',
      'ko': '즐겨찾기',
      'zh_Hans': '收藏夹',
    },
    '3j6kfelg': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'ps247s78': {
      'ru': 'Избранное',
      'en': 'Featured',
      'ko': '즐겨찾기',
      'zh_Hans': '收藏夹',
    },
  },
  // CartPage
  {
    '6pmu4v6v': {
      'ru': 'Сумма: ',
      'en': 'Sum:',
      'ko': '합집합:',
      'zh_Hans': '和：',
    },
    'l0sj2axs': {
      'ru': 'Перейти к оформлению',
      'en': 'Proceed to checkout',
      'ko': '결제로 이동',
      'zh_Hans': '前往结帐处',
    },
    'os3sweqk': {
      'ru': 'Оформить заказ',
      'en': 'Place an order',
      'ko': '주문하기',
      'zh_Hans': '下订单',
    },
    'xxfbssnu': {
      'ru': 'Корзина',
      'en': 'Cart',
      'ko': '바구니',
      'zh_Hans': '篮子',
    },
    'kgz6qjxl': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'xf38p9sp': {
      'ru': 'Корзина',
      'en': 'Cart',
      'ko': '카트',
      'zh_Hans': '大车',
    },
  },
  // OrderPage
  {
    'hbs8h33d': {
      'ru': '3',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '2nu63wtu': {
      'ru': 'Оформление заказа',
      'en': 'Placing an order',
      'ko': '주문하기',
      'zh_Hans': '下订单',
    },
    '5m3tc28p': {
      'ru': 'Адрес доставки',
      'en': 'Delivery address',
      'ko': '배송 주소',
      'zh_Hans': '送货地址',
    },
    'oumzsela': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
      'zh_Hans': '公寓',
    },
    'jwk74gzw': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
      'zh_Hans': '电话',
    },
    '2iw62u2j': {
      'ru': 'Комментарий',
      'en': 'Comment',
      'ko': '논평',
      'zh_Hans': '评论',
    },
    'iio8qo1v': {
      'ru': 'Комментарий',
      'en': 'Comment',
      'ko': '논평',
      'zh_Hans': '评论',
    },
    'qkwapva1': {
      'ru': 'Ваш магазин не зарегистрирован',
      'en': 'Your store is not registered',
      'ko': '귀하의 매장이 등록되지 않았습니다',
      'zh_Hans': '您的商店尚未注册',
    },
    'tagjt7no': {
      'ru': 'Пройдите регистрацию',
      'en': 'Please register',
      'ko': '등록해주세요',
      'zh_Hans': '请注册',
    },
    'knhrrnmi': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
    },
  },
  // UserOrderListPage
  {
    'xrzu0l4m': {
      'ru': 'Новые',
      'en': 'New',
      'ko': '새로운',
      'zh_Hans': '新的',
    },
    'eew8z2hi': {
      'ru': 'Принятые',
      'en': 'Accepted',
      'ko': '수락됨',
      'zh_Hans': '公认',
    },
    '0bsf2382': {
      'ru': 'Готовые',
      'en': 'Ready',
      'ko': '준비가 된',
      'zh_Hans': '准备好',
    },
    '68wveg3v': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'ko': '취소',
      'zh_Hans': '取消',
    },
    'pv9jebvs': {
      'ru': 'Новые',
      'en': 'New',
      'ko': '새로운',
      'zh_Hans': '新的',
    },
    'wan6pets': {
      'ru': 'Принятые',
      'en': 'Accepted',
      'ko': '수락됨',
      'zh_Hans': '公认',
    },
    '9cnk3jue': {
      'ru': 'Готовые',
      'en': 'Ready',
      'ko': '준비가 된',
      'zh_Hans': '准备好',
    },
    '72d6q67q': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'ko': '취소',
      'zh_Hans': '取消',
    },
    'wc6e7dip': {
      'ru': 'Заказы',
      'en': 'Orders',
      'ko': '명령',
      'zh_Hans': '订单',
    },
    'f1fe1a17': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'cugi6x2m': {
      'ru': 'Заказы',
      'en': 'Orders',
      'ko': '명령',
      'zh_Hans': '订单',
    },
  },
  // OneOrderUserPage
  {
    's10yrhop': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'l0mvspnw': {
      'ru': 'Заказ',
      'en': 'Order',
      'ko': '주문하다',
      'zh_Hans': '命令',
    },
    'penlq8th': {
      'ru': 'Сумма: ',
      'en': 'Sum:',
      'ko': '합집합:',
      'zh_Hans': '和：',
    },
    '5z09tsmq': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
    },
  },
  // Profile
  {
    'tfz46wt5': {
      'ru': 'Мой магазин',
      'en': 'My shop',
      'ko': '내 가게',
      'zh_Hans': '我的商店',
    },
    '0rl63l99': {
      'ru': 'Управление заказами',
      'en': 'Shipping addresses',
      'ko': '배송 주소',
      'zh_Hans': '送货地址',
    },
    '5p69vk0g': {
      'ru': 'Мои заказы',
      'en': 'My orders',
      'ko': '내 주문',
      'zh_Hans': '我的订单',
    },
    '7ln4bk0u': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
      'ko': '관리자 패널',
      'zh_Hans': '管理面板',
    },
    'oxvpk6gw': {
      'ru': 'Выйти из аккаунта',
      'en': 'Logout',
      'ko': '계정에서 로그아웃하세요',
      'zh_Hans': '退出您的帐户',
    },
    'v8839slr': {
      'ru': 'Профиль',
      'en': 'Profile',
      'ko': '윤곽',
      'zh_Hans': '轮廓',
    },
    'f34qcecm': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    '3jcn9ln5': {
      'ru': 'Профиль',
      'en': 'Profile',
      'ko': '윤곽',
      'zh_Hans': '轮廓',
    },
  },
  // RestorePage
  {
    'b62nhru7': {
      'ru': 'Email',
      'en': 'Email',
      'ko': '이메일',
      'zh_Hans': '电子邮件',
    },
    'ktnme57q': {
      'ru': 'Востановить пароль',
      'en': 'Recover password',
      'ko': '비밀번호 복구',
      'zh_Hans': '恢复密码',
    },
    '0mf8gck8': {
      'ru': 'Вернуться назад',
      'en': 'Go back',
      'ko': '돌아가기',
      'zh_Hans': '回去',
    },
    'pjel75cg': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
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
      'zh_Hans': '一封电子邮件已发送到您的电子邮箱，其中包含有关如何恢复帐户访问权限的说明。',
    },
    'rxjduhbi': {
      'ru': 'Ok',
      'en': 'Ok',
      'ko': '좋아요',
      'zh_Hans': '好的',
    },
    '76102ltn': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
    },
  },
  // Addresses
  {
    'j9eagpc8': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'n6mmdoet': {
      'ru': 'Адреса',
      'en': 'Addresses',
      'ko': '구애',
      'zh_Hans': '地址',
    },
    'uir58i35': {
      'ru': 'Добавить адрес',
      'en': 'Add address',
      'ko': '주소 추가',
      'zh_Hans': '添加地址',
    },
    'iyzaqn1o': {
      'ru': 'Delete',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'cs6y0j8b': {
      'ru': 'Title',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'tyo1oa05': {
      'ru': 'Subtitle',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '2jdecvgu': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '홈',
      'zh_Hans': '家',
    },
  },
  // AdminPanel
  {
    '09904rw0': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'gcyzj88v': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
      'ko': '관리자 패널',
      'zh_Hans': '管理面板',
    },
    'myojmyms': {
      'ru': 'Добавить новую акцию',
      'en': 'Add new promotion',
      'ko': '새 프로모션 추가',
      'zh_Hans': '添加新促销',
    },
    'qnesaa0d': {
      'ru': 'Добавить новую продукцию',
      'en': 'Add new products',
      'ko': '새 제품 추가',
      'zh_Hans': '添加新产品',
    },
    'wgylaao2': {
      'ru': 'Акции',
      'en': 'Stock',
      'ko': '재고',
      'zh_Hans': '库存',
    },
    'kx5qukfe': {
      'ru': 'Продукты',
      'en': 'Products',
      'ko': '제품',
      'zh_Hans': '产品',
    },
    'gzfkg8jt': {
      'ru': 'Новые заказы',
      'en': 'New orders',
      'ko': '신규 주문',
      'zh_Hans': '新订单',
    },
    'ceu54nx9': {
      'ru': 'История заказов',
      'en': 'Order history',
      'ko': '주문 내역',
      'zh_Hans': '订单历史',
    },
    'k7xfxx5e': {
      'ru': 'Пользователи',
      'en': 'Clients',
      'ko': '클라이언트',
      'zh_Hans': '客户',
    },
    'xltywj6b': {
      'ru': 'Заявки на проверку магазинов',
      'en': 'Applications for store inspection',
      'ko': '매장 점검 신청',
      'zh_Hans': '商店检查申请',
    },
    '09ubqdzk': {
      'ru': 'Очистить состояния приложения',
      'en': 'Clear app states',
      'ko': '앱 상태 지우기',
      'zh_Hans': '清除应用程序状态',
    },
    'x41kfgda': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // PromotionsPage
  {
    'vyix0zm1': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'vizj4y05': {
      'ru': 'Список акций',
      'en': 'List of shares',
      'ko': '주식 목록',
      'zh_Hans': '股份清单',
    },
    '28cgby1p': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // EditCopyDeletProduct
  {
    'zl8t8jdm': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    '1502kfsw': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
      'zh_Hans': '下载',
    },
    'qwcdjvlt': {
      'ru': 'фото акции',
      'en': 'stock photo',
      'ko': '액션 사진',
      'zh_Hans': '行动照片',
    },
    'k5gzkxps': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
      'zh_Hans': '格式：JPG、PNG',
    },
    'oam0jpkm': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
      'zh_Hans': '更改照片',
    },
    'ga548q79': {
      'ru': 'Цена',
      'en': 'Price',
      'ko': '가격',
      'zh_Hans': '价格',
    },
    'h0li3m5s': {
      'ru': 'Название',
      'en': 'Name',
      'ko': '이름',
      'zh_Hans': '姓名',
    },
    'hzqf8jkh': {
      'ru': 'Штрихкод',
      'en': 'Barcode',
      'ko': '바코드',
      'zh_Hans': '条码',
    },
    'ba7w7ldk': {
      'ru': 'Ссылка на Товар',
      'en': 'Link to Product',
      'ko': '제품 링크',
      'zh_Hans': '产品链接',
    },
    'rolpnxwi': {
      'ru': 'Описание',
      'en': 'Description',
      'ko': '설명',
      'zh_Hans': '描述',
    },
    '4vknz1kj': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    'iroawih2': {
      'ru': 'Соус',
      'en': 'Sauce',
      'ko': '소스',
      'zh_Hans': '酱',
    },
    'ifn90g3o': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    '9hre8s1t': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    '4hhx8yae': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    '6ggw86a7': {
      'ru': 'Консервы/Маринады',
      'en': 'Canned goods/Marinades',
      'ko': '통조림/마리네이드',
      'zh_Hans': '罐头食品/腌料',
    },
    '2ufka7yv': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    '8w88t5dz': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'bn3mnwqw': {
      'ru': 'Море продукты',
      'en': 'Seafood',
      'ko': '바다 음식',
      'zh_Hans': '海鲜',
    },
    'jwm0qlk6': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
      'zh_Hans': '肉',
    },
    'm3h62uq5': {
      'ru': 'Хоз товары',
      'en': 'Household goods',
      'ko': '가정 용품',
      'zh_Hans': '家居用品',
    },
    'c9kco6z4': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
      'zh_Hans': '冷冻',
    },
    'btd8gp33': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
      'zh_Hans': '孩子们的',
    },
    'xwfa0thu': {
      'ru': 'Десерт',
      'en': 'Dessert',
      'ko': '디저트',
      'zh_Hans': '甜点',
    },
    'pyxerq7z': {
      'ru': 'Молочка',
      'en': 'Dairy',
      'ko': '우유',
      'zh_Hans': '牛奶',
    },
    '5wbucmxe': {
      'ru': 'Прочее',
      'en': 'Other',
      'ko': '다른',
      'zh_Hans': '其他',
    },
    'ivnisruo': {
      'ru': 'В наличии',
      'en': 'In stock',
      'ko': '재고 있음',
      'zh_Hans': '有存货',
    },
    '4q33hi2b': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
      'zh_Hans': '经常订购',
    },
    '8khlxt74': {
      'ru': 'Дои',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // ProductsPage
  {
    'nedjrypz': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'iul1iz1d': {
      'ru': 'Список продуктов',
      'en': 'List of products',
      'ko': '제품 목록',
      'zh_Hans': '产品列表',
    },
    'tgicj5xh': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // ProductDeckPage
  {
    'nz8x346p': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    '4ogbz3li': {
      'ru': 'Select Size',
      'en': 'Select Size',
      'ko': '사이즈 선택',
      'zh_Hans': '选择尺码',
    },
    '09ccqk6c': {
      'ru': 'S',
      'en': 'S',
      'ko': '에스',
      'zh_Hans': 'S',
    },
    'yu9zox1h': {
      'ru': 'M',
      'en': 'M',
      'ko': '중',
      'zh_Hans': '中号',
    },
    'oma2xj2l': {
      'ru': 'L',
      'en': 'L',
      'ko': '엘',
      'zh_Hans': 'L',
    },
    'jcvzc53k': {
      'ru': 'XL',
      'en': 'XL',
      'ko': '특대',
      'zh_Hans': 'XL',
    },
    '4g67fyar': {
      'ru': 'Select Color',
      'en': 'Select Color',
      'ko': '색상 선택',
      'zh_Hans': '选择颜色',
    },
    'hswd8ivr': {
      'ru': 'Black',
      'en': 'Black',
      'ko': '검은색',
      'zh_Hans': '黑色的',
    },
    'e2g07pl7': {
      'ru': 'White',
      'en': 'White',
      'ko': '하얀색',
      'zh_Hans': '白色的',
    },
    'qpnyj3et': {
      'ru': 'Red',
      'en': 'Red',
      'ko': '빨간색',
      'zh_Hans': '红色的',
    },
    'sq8t9rb8': {
      'ru': 'Blue',
      'en': 'Blue',
      'ko': '파란색',
      'zh_Hans': '蓝色的',
    },
    'u3qxtluf': {
      'ru': 'Продукт уже есть в вашей корзине',
      'en': 'The product is already in your cart.',
      'ko': '제품이 이미 장바구니에 있습니다.',
      'zh_Hans': '该产品已在您的购物车中',
    },
  },
  // ManagerOrderListPage
  {
    '1cefj9uw': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    's8tupd5o': {
      'ru': 'Новые',
      'en': 'New',
      'ko': '새로운',
      'zh_Hans': '新的',
    },
    'n1my5uu0': {
      'ru': 'Принятые',
      'en': 'Accepted',
      'ko': '수락됨',
      'zh_Hans': '公认',
    },
    '43sje0bl': {
      'ru': 'Готовые',
      'en': 'Ready',
      'ko': '준비가 된',
      'zh_Hans': '准备好',
    },
    'i7co77ew': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'ko': '취소',
      'zh_Hans': '取消',
    },
    '06ny3hd7': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // EditStorePage
  {
    'k0zdqdbm': {
      'ru': 'Имя магазина',
      'en': 'Store name',
      'ko': '매장명',
      'zh_Hans': '店铺名称',
    },
    'e3rxd788': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
      'zh_Hans': '电话',
    },
    'yzzapdkd': {
      'ru': 'Название магазина обязательно',
      'en': 'Store name is required',
      'ko': '매장 이름이 필요합니다.',
      'zh_Hans': '店铺名称必填',
    },
    '6nccqnzr': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'wvbzqy00': {
      'ru': 'Номер телефона обязательно',
      'en': 'Phone number is required',
      'ko': '전화번호는 필수 항목입니다.',
      'zh_Hans': '电话号码为必填项',
    },
    'qdgppzyl': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '746a3s6z': {
      'ru': 'Адрес',
      'en': 'Address',
      'ko': '주소',
      'zh_Hans': '地址',
    },
    '2c3nkl8s': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
      'zh_Hans': '公寓',
    },
    'jjzngdsn': {
      'ru': 'Бизнес лицензия(사업자)',
      'en': 'Business license',
      'ko': '사업자등록증',
      'zh_Hans': '营业执照',
    },
    'yuugvyux': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
      'zh_Hans': '下载',
    },
    'k83lppxf': {
      'ru': 'фото  лицензии(사업자)',
      'en': 'photo license(사업자)',
      'ko': '사진 사옵차',
      'zh_Hans': '照片 萨布查',
    },
    'jcnrwec5': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
      'zh_Hans': '格式：JPG、PNG',
    },
    '3ln56ul1': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
      'zh_Hans': '更改照片',
    },
    'mn2d1u35': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'b5e49uua': {
      'ru': 'Дои',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // Stores
  {
    '6zdbteg8': {
      'ru': 'Мои магазины',
      'en': 'My shops',
      'ko': '내 매장',
      'zh_Hans': '我的商店',
    },
    'jpd1e78n': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'kkvfnwlt': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // OneOrderManagerPage
  {
    'h5tz6tf9': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    '1w9buw09': {
      'ru': 'Заказ',
      'en': 'Order',
      'ko': '주문하다',
      'zh_Hans': '命令',
    },
    'f3xx2rjt': {
      'ru': 'Сумма: ',
      'en': 'Sum:',
      'ko': '합집합:',
      'zh_Hans': '和：',
    },
    '6xlo3m9v': {
      'ru': 'Отмена статуса',
      'en': 'Cancel status',
      'ko': '취소 상태',
      'zh_Hans': '取消状态',
    },
    'qiboo5i9': {
      'ru': 'Удалить заказ',
      'en': 'Delete order',
      'ko': '주문 삭제',
      'zh_Hans': '删除订单',
    },
    '636924qo': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // MyClients
  {
    'ts23ei51': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'vw4cam08': {
      'ru': 'Option 1',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '0hdg7drk': {
      'ru': 'Option 2',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'rchq49ld': {
      'ru': 'Option 3',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'jqzrbeyk': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // HomePageWholeStore
  {
    'qgqv4sff': {
      'ru': 'WholeSaler',
      'en': 'WholeSaler',
      'ko': 'WholeSaler',
      'zh_Hans': 'WholeSaler',
    },
    '8knbeohg': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'k3ci3v2w': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
      'zh_Hans': '经常订购',
    },
    'rz7o2sbd': {
      'ru': 'Показать удаленые',
      'en': 'Show deleted',
      'ko': '삭제된 프로그램 보기',
      'zh_Hans': '显示已删除',
    },
    'mc3n5gye': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // WholeStorePage
  {
    'asv7rqlm': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'znrsu42u': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    'lwactj7f': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    '1p2480ae': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    'k3av8op1': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    '26gbis1n': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
      'zh_Hans': '酱汁',
    },
    '04e29wi0': {
      'ru': 'Консервы',
      'en': 'Canned',
      'ko': '통조림',
      'zh_Hans': '罐头食品',
    },
    '146l694s': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    'x7g6fhfr': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    'zc85q7sl': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    'nxs5jmbl': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    '4j2mf2ij': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    'd8icrzso': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
      'zh_Hans': '酱汁',
    },
    'sb2f9c2k': {
      'ru': 'Консервы',
      'en': 'Canned',
      'ko': '통조림',
      'zh_Hans': '罐头食品',
    },
    'g8odwtjg': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    '5d269i3h': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'wex06w3h': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
      'zh_Hans': '冷冻',
    },
    '1vo1vpft': {
      'ru': 'Море прод.',
      'en': 'Sea cont.',
      'ko': '바다 계속.',
      'zh_Hans': '海续',
    },
    'epoqnmbt': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
      'zh_Hans': '孩子们的',
    },
    '9j3bxod8': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
      'zh_Hans': '肉',
    },
    'nqi1kuay': {
      'ru': 'Молочка',
      'en': 'Dairy',
      'ko': '우유',
      'zh_Hans': '牛奶',
    },
    'stoplflp': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    '0rptgt09': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'w4rtxn3b': {
      'ru': 'Десерты',
      'en': 'Desserts',
      'ko': '디저트',
      'zh_Hans': '甜点',
    },
    '8evzfba1': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'xahqcoel': {
      'ru': 'Хоз товар',
      'en': 'Homeware',
      'ko': '가정 용품',
      'zh_Hans': '家居用品',
    },
    '6x83o58t': {
      'ru': 'Другие',
      'en': 'Other',
      'ko': '다른',
      'zh_Hans': '其他',
    },
    'lwnk6ozr': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
      'zh_Hans': '经常订购',
    },
    'wkshynz5': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '찾다',
      'zh_Hans': '搜索',
    },
    '9lccamso': {
      'ru': 'Показать удаленые',
      'en': 'Show deleted',
      'ko': '삭제된 프로그램 보기',
      'zh_Hans': '显示已删除',
    },
    'v6iiokm5': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // payment
  {
    'fohtynin': {
      'ru': 'Подписка/Оплата',
      'en': 'Subscription / Payment',
      'ko': '구독/결제',
      'zh_Hans': '订阅/支付',
    },
    'ixo7t97c': {
      'ru': 'Ваша подписка',
      'en': 'Your Subscription',
      'ko': '귀하의 구독',
      'zh_Hans': '您的订阅',
    },
    'jva11say': {
      'ru': 'Ежемесячно',
      'en': 'Monthly',
      'ko': '월간 간행물',
      'zh_Hans': '每月',
    },
    'pp0pb58t': {
      'ru': '\$15.99/м',
      'en': '\$15.99/mo',
      'ko': '\$15.99/월',
      'zh_Hans': '\$15.99/月',
    },
    '00bk6umn': {
      'ru':
          'Получите неограниченный доступ ко всему предлагаемому нами контенту!',
      'en': 'Gain unlimited access to all the content we have to offer!',
      'ko': '우리가 제공하는 모든 콘텐츠에 무제한으로 액세스하세요!',
      'zh_Hans': '无限制地访问我们提供的所有内容！',
    },
    'k5b8ia5r': {
      'ru': 'Другие предложения',
      'en': 'Other Offers',
      'ko': '기타 제안',
      'zh_Hans': '其他优惠',
    },
    'wgpuv0cv': {
      'ru': 'Ежегодно (экономьте  \$12)',
      'en': 'Annual (save \$12)',
      'ko': '연간(\$12 절약)',
      'zh_Hans': '每年（节省 12 美元）',
    },
    'm3ibs5ms': {
      'ru': '\$180/г',
      'en': '\$180/yr',
      'ko': '\$180/년',
      'zh_Hans': '\$180/年',
    },
    'xxtkmyeu': {
      'ru':
          'Получите неограниченный доступ ко всему предлагаемому нами контенту!',
      'en': 'Gain unlimited access to all the content we have to offer!',
      'ko': '우리가 제공하는 모든 콘텐츠에 무제한으로 액세스하세요!',
      'zh_Hans': '无限制地访问我们提供的所有内容！',
    },
    'm3w3vp7s': {
      'ru': 'Бесплатный ограниченный доступ',
      'en': 'Free Limited Access',
      'ko': '무료 제한 액세스',
      'zh_Hans': '免费有限访问',
    },
    'ua5dne1y': {
      'ru':
          'Продолжайте с ограниченным доступом бесплатно. Просматривайте блоги и видео, которые помогут вам в вашем путешествии!',
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'ko': '무료로 제한된 액세스를 계속하세요. 귀하의 여행에 도움이 되는 블로그와 비디오를 찾아보세요!',
      'zh_Hans': '继续免费享受有限访问。浏览旨在为您的旅程提供帮助的博客和视频！',
    },
    '3pc56npp': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // ProfileEdit
  {
    'sus98qct': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'm0fjc4jk': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '3y1r54xz': {
      'ru': 'Имя пользователя',
      'en': 'Username',
      'ko': '사용자 이름',
      'zh_Hans': '用户名',
    },
    'fnp5v0al': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'aroi4a4s': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
      'zh_Hans': '电话',
    },
    'jeh8hueh': {
      'ru': 'Сохранить',
      'en': 'Save',
      'ko': '구하다',
      'zh_Hans': '节省',
    },
    '0fi39yba': {
      'ru': 'Удалить профиль',
      'en': 'Delete profile',
      'ko': '프로필 삭제',
      'zh_Hans': '删除个人资料',
    },
    'a7t53t67': {
      'ru':
          'Внимание! Чтобы полностью удалить ваши учетные данные, отправьте запрос на указанный адрес электронной почты',
      'en':
          'Attention! To completely delete your credentials, please send a request to the specified email address',
      'ko': '주목! 자격 증명을 완전히 제거하려면 제공된 이메일 주소로 요청을 보내십시오.',
      'zh_Hans': '注意力！要完全删除您的凭据，请向提供的电子邮件地址发送请求',
    },
    '2lwlxllh': {
      'ru': 'wholekrsaler@gmail.com',
      'en': 'wholekrsaler@gmail.com',
      'ko': 'wholekrsaler@gmail.com',
      'zh_Hans': 'wholekrsaler@gmail.com',
    },
    'sjl2kzez': {
      'ru': '',
      'en': 'wholekrsaler@gmail.com',
      'ko': 'wholekrsaler@gmail.com',
      'zh_Hans': 'wholekrsaler@gmail.com',
    },
    '3lrqkd83': {
      'ru': 'wholekrsaler@gmail.com',
      'en': 'wholekrsaler@gmail.com',
      'ko': 'wholekrsaler@gmail.com',
      'zh_Hans': 'wholekrsaler@gmail.com',
    },
    'v0q4jezo': {
      'ru': 'Оплата',
      'en': 'Payment',
      'ko': '지불',
      'zh_Hans': '支付',
    },
    'kh8c8mfs': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // deleteInstructionPage
  {
    'pqg2g2xp': {
      'ru': 'Важное предупреждение',
      'en': 'Important Warning',
      'ko': '중요한 경고',
      'zh_Hans': '重要警告',
    },
    'g7b7dfni': {
      'ru':
          'Удаление аккаунта - необратимое действие. Вся информация будет утеряна без возможности восстановления.',
      'en':
          'Deleting an account is an irreversible action. All information will be lost without the possibility of recovery.',
      'ko': '계정 삭제는 되돌릴 수 없는 작업입니다. 모든 정보는 복구 가능성 없이 손실됩니다.',
      'zh_Hans': '删除帐户是不可逆转的操作。所有信息都将丢失且无法恢复。',
    },
    'yb26x489': {
      'ru': 'Перед удалением:',
      'en': 'Before deleting:',
      'ko': '삭제하기 전:',
      'zh_Hans': '删除前：',
    },
    '4n5bvm3l': {
      'ru': 'Сохраните важные данные и информацию, если они вам необходимы',
      'en': 'Save important data and information if you need it.',
      'ko': '필요할 때 중요한 데이터와 정보를 저장하세요.',
      'zh_Hans': '在需要时保存重要数据和信息',
    },
    'oui2s5jg': {
      'ru': 'Завершите все активные транзакции и процессы',
      'en': 'Terminate all active transactions and processes',
      'ko': '모든 활성 트랜잭션 및 프로세스 종료',
      'zh_Hans': '结束所有活动的事务和进程',
    },
    'tbggmd39': {
      'ru': 'Убедитесь, что вы действительно хотите удалить аккаунт',
      'en': 'Make sure you really want to delete your account.',
      'ko': '정말로 계정을 삭제하고 싶은지 확인하세요',
      'zh_Hans': '确保您确实想要删除您的帐户',
    },
    'm0tzbbqm': {
      'ru': 'Запрос на удаление:',
      'en': 'Request for deletion:',
      'ko': '제거 요청:',
      'zh_Hans': '删除请求：',
    },
    'drky2ikr': {
      'ru':
          'Отправьте запрос на удаление аккаунта на еmail: wholekrsaler@gmail.com',
      'en':
          'Send a request to delete your account to email: wholekrsaler@gmail.com',
      'ko': '이메일(wholekrsaler@gmail.com)로 계정 삭제 요청을 보내세요.',
      'zh_Hans': '通过电子邮件发送删除帐户的请求：wholekrsaler@gmail.com',
    },
    'cwhh2c7c': {
      'ru': 'Процесс удаления:',
      'en': 'Removal process:',
      'ko': '제거 프로세스:',
      'zh_Hans': '去除过程：',
    },
    '8rd8nfsg': {
      'ru': 'Перейдите в настройки профиля',
      'en': 'Go to profile settings',
      'ko': '프로필 설정으로 이동',
      'zh_Hans': '转到个人资料设置',
    },
    'a6hpw10z': {
      'ru': 'Найдите опцию \'Удалить аккаунт\'',
      'en': 'Find the \'Delete Account\' option',
      'ko': '\'계정 삭제\' 옵션 찾기',
      'zh_Hans': '找到“删除帐户”选项',
    },
    'nlor1nw4': {
      'ru': 'Подтвердите удаление',
      'en': 'Confirm deletion',
      'ko': '삭제 확인',
      'zh_Hans': '确认删除',
    },
    'hg164n15': {
      'ru': 'После удаления:',
      'en': 'After removal:',
      'ko': '제거 후:',
      'zh_Hans': '移除后：',
    },
    'xioldf7d': {
      'ru':
          '• Все ваши данные будут удалены\n• Доступ к сервисам будет прекращен\n• Восстановление аккаунта будет невозможно',
      'en':
          '• All your data will be deleted\n• Access to services will be terminated\n• Account recovery will be impossible',
      'ko': '• 모든 데이터가 삭제됩니다.\n• 서비스 이용이 종료됩니다.\n• 계정 복구는 불가능합니다.',
      'zh_Hans': '• 您的所有数据都将被删除\n• 服务访问将被终止\n• 帐户无法恢复',
    },
  },
  // SupportPage
  {
    '0k35hdbu': {
      'ru': 'Техническая поддержка',
      'en': 'Technical support',
      'ko': '기술지원',
      'zh_Hans': '技术支援',
    },
    'm5rc1rqn': {
      'ru':
          'Если у вас есть вопрос об использовании приложения, проблема, которую вы не знаете, как решить, или конкретный запрос - мы всегда рады вам помочь. Пожалуйста отправьте ваш запрос в виде электронного письма по адресу:\n\n**wholekrsaler@gmail.com**',
      'en':
          'If you have a question regarding our application, a problem which you do not know how to resolve, or concrete inquiry - we are here for you. We will answer you via email as soon as possible.\n\n**wholekrsaler@gmail.com**\n\nPlease let us know if you have any trouble using the application.\n',
      'ko':
          '신청서에 관한 질문이 있거나 해결 방법을 모르는 문제 또는 구체적인 문의사항이 있는 경우, 저희가 도와드리겠습니다. 최대한 빨리 이메일을 통해 답변해드리겠습니다.\n\n**wholekrsaler@gmail.com**\n\n응용 프로그램을 사용하는 데 문제가 있으면 알려주십시오.',
      'zh_Hans':
          '如果您对我们的申请有疑问、不知道如何解决或具体询问 - 我们随时为您服务。我们将尽快通过电子邮件回复您。\n\n**wholekrsaler@gmail.com**\n\n如果您在使用应用程序时遇到任何问题，请告诉我们。',
    },
    '9c7ntt3a': {
      'ru': 'Написать в тех поддержку',
      'en': 'Write to tech support',
      'ko': '기술 지원에 쓰기',
      'zh_Hans': '写信给技术支持',
    },
    'fbss3r6o': {
      'ru': 'Контактный номер',
      'en': 'Contact number',
      'ko': '연락처',
      'zh_Hans': '联系电话',
    },
    '9lsvb474': {
      'ru': '+821022795599',
      'en': '+821022795599',
      'ko': '+821022795599',
      'zh_Hans': '+821022795599',
    },
  },
  // PrivacyPolicy
  {
    'w3hp98gi': {
      'ru': 'Политика конфиденциальности WholeSaler',
      'en': 'WholeSaler Privacy\nPolicy',
      'ko': 'WholeSaler 개인 정보 보호\n정책',
      'zh_Hans': '批发商隐私\n政策',
    },
    'mrzmhcic': {
      'ru':
          'Настоящая политика конфиденциальности применяется к приложению WholeSaler (далее именуемому «Приложение») для мобильных устройств, которое было создано Кимом Вадимом Климовичем (далее именуемым «Поставщиком услуг») в качестве коммерческой услуги. Эта услуга предназначена для использования «КАК ЕСТЬ».\n\nСбор и использование информации\nПриложение собирает информацию, когда вы загружаете и используете ее. Эта информация может включать в себя следующую информацию:\n\nАдрес интернет-протокола вашего устройства (например, IP-адрес)\nСтраницы Приложения, которые вы посещаете, время и дата вашего посещения, время, проведенное на этих страницах\nВремя, проведенное в Приложении\nОперационная система, которую вы используете на своем мобильном устройстве\n\nПриложение не собирает точную информацию о местоположении вашего мобильного устройства.\n\nПоставщик услуг может использовать предоставленную вами информацию, чтобы время от времени связываться с вами для предоставления вам важной информации, требуемых уведомлений и маркетинговых акций.\n\nДля лучшего опыта при использовании Приложения Поставщик услуг может потребовать от вас предоставить нам определенную личную информацию. Информация, которую запросит Поставщик услуг, будет сохранена им и использована, как описано в настоящей политике конфиденциальности.\n\nДоступ третьих лиц\nТолько агрегированные, анонимные данные периодически передаются внешним службам, чтобы помочь Поставщику услуг улучшить Приложение и его обслуживание. Поставщик услуг может передавать вашу информацию третьим лицам способами, описанными в настоящем заявлении о конфиденциальности.\n\nОбратите внимание, что Приложение использует сторонние службы, которые имеют собственную Политику конфиденциальности в отношении обработки данных. Ниже приведены ссылки на Политику конфиденциальности сторонних поставщиков услуг, используемых Приложением:\n\nСервисы Google Play\nAdMob\nGoogle Analytics для Firebase\nFirebase Crashlytics\nFacebook\n\nПоставщик услуг может раскрывать предоставленную пользователем и автоматически собранную информацию:\n\nв соответствии с требованиями закона, например, для выполнения повестки в суд или аналогичного юридического процесса;\n\nкогда они добросовестно полагают, что раскрытие необходимо для защиты их прав, защиты вашей безопасности или безопасности других лиц, расследования мошенничества или ответа на запрос правительства;\nс их доверенными поставщиками услуг, которые работают от их имени, не имеют независимого использования информации, которую мы им раскрываем, и согласились придерживаться правил, изложенных в настоящем заявлении о конфиденциальности.\n\nПрава отказа\nВы можете легко прекратить сбор информации Приложением, удалив его. Вы можете использовать стандартные процессы удаления, которые могут быть доступны как часть вашего мобильного устройства или через магазин мобильных приложений или сеть.\n\nПолитика хранения данных\nПоставщик услуг будет хранить предоставленные пользователем данные до тех пор, пока вы используете Приложение, и в течение разумного времени после этого. Если вы хотите, чтобы они удалили предоставленные пользователем данные, которые вы предоставили через Приложение, свяжитесь с ними по адресу wholekrsaler@gmail.com, и они ответят в разумные сроки.\n\nДети\nПоставщик услуг не использует Приложение для сознательного сбора данных или маркетинга для детей младше 13 лет.\n\nПриложение не адресовано лицам младше 13 лет. Поставщик услуг сознательно не собирает личную идентифицируемую информацию у детей младше 13 лет. В случае, если Поставщик услуг обнаружит, что ребенок младше 13 лет предоставил личную информацию, Поставщик услуг немедленно удалит ее со своих серверов. Если вы являетесь родителем или опекуном и вам известно, что ваш ребенок предоставил нам личную информацию, свяжитесь с Поставщиком услуг (wholekrsaler@gmail.com), чтобы они могли предпринять необходимые действия.\n\nБезопасность\nПоставщик услуг заботится о защите конфиденциальности вашей информации. Поставщик услуг предоставляет физические, электронные и процессуальные меры безопасности для защиты информации, которую Поставщик услуг обрабатывает и хранит.\n\nИзменения\nНастоящая Политика конфиденциальности может время от времени обновляться по любой причине. Поставщик услуг уведомит вас о любых изменениях в Политике конфиденциальности, обновив эту страницу новой Политикой конфиденциальности. Вам рекомендуется регулярно просматривать эту Политику конфиденциальности на предмет любых изменений, поскольку дальнейшее использование считается одобрением всех изменений.\n\nДанная политика конфиденциальности вступает в силу с 16.12.2024 г.\n\nВаше согласие\nИспользуя Приложение, вы даете согласие на обработку вашей информации, как указано в данной Политике конфиденциальности и с внесенными нами изменениями.\n\nСвяжитесь с нами\nЕсли у вас возникли вопросы относительно конфиденциальности при использовании Приложения или у вас есть вопросы о применяемых методах, свяжитесь с Поставщиком услуг по электронной почте wholekrsaler@gmail.com.',
      'en':
          'This privacy policy applies to the WholeSaler app (hereby referred to as \"Application\") for mobile devices that was created by Kim Vadim Klimovich (hereby referred to as \"Service Provider\") as a Commercial service. This service is intended for use \"AS IS\".\n\n\nInformation Collection and Use\nThe Application collects information when you download and use it. This information may include information such as\n\nYour device\'s Internet Protocol address (e.g. IP address)\nThe pages of the Application that you visit, the time and date of your visit, the time spent on those pages\nThe time spent on the Application\nThe operating system you use on your mobile device\n\nThe Application does not gather precise information about the location of your mobile device.\n\n\nThe Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.\n\n\nFor a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information. The information that the Service Provider request will be retained by them and used as described in this privacy policy.\n\n\nThird Party Access\nOnly aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.\n\n\n\nPlease note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:\n\nGoogle Play Services\nAdMob\nGoogle Analytics for Firebase\nFirebase Crashlytics\nFacebook\n\nThe Service Provider may disclose User Provided and Automatically Collected Information:\n\nas required by law, such as to comply with a subpoena, or similar legal process;\nwhen they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to a government request;\nwith their trusted services providers who work on their behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement.\n\nOpt-Out Rights\nYou can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.\n\n\nData Retention Policy\nThe Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you\'d like them to delete User Provided Data that you have provided via the Application, please contact them at wholekrsaler@gmail.com and they will respond in a reasonable time.\n\n\nChildren\nThe Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.\n\n\nThe Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discovers that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (wholekrsaler@gmail.com) so that they will be able to take the necessary actions.\n\n\nSecurity\nThe Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintains.\n\n\nChanges\nThis Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.\n\n\n\nThis privacy policy is effective as of 2024-12-16\n\n\nYour Consent\nBy using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.\n\n\nContact Us\nIf you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at wholekrsaler@gmail.com.',
      'ko':
          '본 개인정보 보호정책은 Kim Vadim Klimovich(이하 \"서비스 제공자\")가 상업용 서비스로 제작한 모바일 장치용 WholeSaler 앱(이하 \"애플리케이션\")에 적용됩니다. 이 서비스는 \"있는 그대로\" 사용하기 위한 것입니다.\n\n\n정보 수집 및 사용\n애플리케이션은 귀하가 다운로드하여 사용할 때 정보를 수집합니다. 이 정보에는 다음과 같은 정보가 포함될 수 있습니다.\n\n장치의 인터넷 프로토콜 주소(예: IP 주소)\n귀하가 방문한 애플리케이션 페이지, 방문 시간 및 날짜, 해당 페이지에서 보낸 시간\n신청서 작성에 소요된 시간\n모바일 장치에서 사용하는 운영 체제\n\n애플리케이션은 귀하의 모바일 장치 위치에 대한 정확한 정보를 수집하지 않습니다.\n\n\n서비스 제공업체는 중요한 정보, 필수 공지 사항 및 마케팅 프로모션을 제공하기 위해 수시로 귀하에게 연락하기 위해 귀하가 제공한 정보를 사용할 수 있습니다.\n\n\n더 나은 경험을 위해 애플리케이션을 사용하는 동안 서비스 제공업체는 귀하에게 특정 개인 식별 정보를 제공하도록 요구할 수 있습니다. 서비스 제공자가 요청한 정보는 본 개인정보 보호정책에 설명된 대로 서비스 제공자가 보유하고 사용합니다.\n\n\n제3자 액세스\n서비스 제공업체가 애플리케이션과 해당 서비스를 개선하는 데 도움이 되도록 집계되고 익명화된 데이터만 주기적으로 외부 서비스로 전송됩니다. 서비스 제공업체는 본 개인정보 보호정책에 설명된 방식으로 귀하의 정보를 제3자와 공유할 수 있습니다.\n\n\n\n애플리케이션은 데이터 처리에 대한 자체 개인 정보 보호 정책이 있는 제3자 서비스를 활용한다는 점에 유의하십시오. 다음은 애플리케이션에서 사용하는 제3자 서비스 제공업체의 개인정보 보호정책에 대한 링크입니다.\n\n구글 플레이 서비스\nAdMob\nFirebase용 Google 애널리틱스\nFirebase Crashlytics\n페이스북\n\n서비스 제공자는 사용자가 제공하고 자동으로 수집된 정보를 공개할 수 있습니다.\n\n소환장 또는 유사한 법적 절차를 준수하기 위해 법률에서 요구하는 경우\n자신의 권리를 보호하고, 귀하 또는 타인의 안전을 보호하고, 사기를 조사하거나, 정부 요청에 응답하기 위해 공개가 필요하다고 선의로 믿는 경우\n신뢰할 수 있는 서비스 제공업체를 대신하여 당사가 공개하는 정보를 독립적으로 사용하지 않으며 본 개인정보 보호정책에 명시된 규칙을 준수하는 데 동의했습니다.\n\n옵트아웃 권리\n귀하는 애플리케이션을 제거함으로써 쉽게 애플리케이션에 의한 모든 정보 수집을 중지할 수 있습니다. 귀하는 귀하의 모바일 장치의 일부로 또는 모바일 애플리케이션 마켓플레이스나 네트워크를 통해 이용 가능한 표준 제거 프로세스를 사용할 수 있습니다.\n\n\n데이터 보존 정책\n서비스 제공업체는 귀하가 애플리케이션을 사용하는 동안과 그 이후에도 합당한 기간 동안 사용자 제공 데이터를 보관합니다. 귀하가 애플리케이션을 통해 제공한 사용자 제공 데이터를 삭제하기를 원하는 경우, Wholekrsaler@gmail.com으로 연락하시면 합당한 시간 내에 응답해 드릴 것입니다.\n\n\n어린이들\n서비스 제공업체는 13세 미만의 어린이에게 의도적으로 데이터를 요청하거나 마케팅하기 위해 애플리케이션을 사용하지 않습니다.\n\n\n본 애플리케이션은 13세 미만의 사용자에게 적용되지 않습니다. 서비스 제공업체는 13세 미만의 어린이로부터 고의로 개인 식별 정보를 수집하지 않습니다. 서비스 제공자는 만 13세 미만 아동이 개인정보를 제공한 사실을 발견한 경우, 해당 정보를 즉시 서버에서 삭제합니다. 귀하가 부모 또는 보호자이고 귀하의 자녀가 당사에 개인정보를 제공한 사실을 알고 있는 경우 서비스 제공자(wholekrsaler@gmail.com)에게 연락하여 필요한 조치를 취할 수 있도록 하십시오.\n\n\n보안\n서비스 제공업체는 귀하의 정보의 기밀성을 보호하는 데 최선을 다하고 있습니다. 서비스 제공업체는 서비스 제공업체가 처리하고 유지 관리하는 정보를 보호하기 위해 물리적, 전자적, 절차적 보호 장치를 제공합니다.\n\n\n변경 사항\n본 개인정보 보호정책은 어떤 이유로든 수시로 업데이트될 수 있습니다. 서비스 제공업체는 이 페이지를 새로운 개인정보 보호정책으로 업데이트하여 개인정보 보호정책의 변경 사항을 귀하에게 통보할 것입니다. 지속적인 사용은 모든 변경 사항에 대한 승인으로 간주되므로 변경 사항이 있는 경우 정기적으로 이 개인 정보 보호 정책을 참조하는 것이 좋습니다.\n\n\n\n본 개인정보처리방침은 2024년 12월 16일부터 적용됩니다.\n\n\n귀하의 동의\n애플리케이션을 사용함으로써 귀하는 현재 본 개인정보 보호정책에 명시되어 있고 당사가 개정한 대로 귀하의 정보를 처리하는 데 동의하는 것입니다.\n\n\n문의하기\n애플리케이션을 사용하는 동안 개인 정보 보호에 관해 질문이 있거나 관행에 대해 질문이 있는 경우 이메일(wholekrsaler@gmail.com)을 통해 서비스 제공업체에 문의하세요.',
      'zh_Hans':
          '本隐私政策适用于 Kim Vadim Klimovich（以下简称“服务提供商”）作为商业服务创建的适用于移动设备的 WholeSaler 应用程序（以下简称“应用程序”）。该服务旨在“按原样”使用。\n\n\n信息收集和使用\n该应用程序会在您下载和使用时收集信息。该信息可能包括以下信息：\n\n您设备的互联网协议地址（例如 IP 地址）\n您访问的应用程序页面、访问时间和日期、在这些页面上花费的时间\n应用程序花费的时间\n您在移动设备上使用的操作系统\n\n该应用程序不会收集有关您的移动设备位置的精确信息。\n\n\n服务提供商可能会使用您提供的信息不时与您联系，以便为您提供重要信息、所需通知和营销促销。\n\n\n为了获得更好的体验，在使用应用程序时，服务提供商可能会要求您向我们提供某些个人身份信息。服务提供商请求的信息将由他们保留并按照本隐私政策中的描述使用。\n\n\n第三方访问\n只有汇总的匿名数据才会定期传输到外部服务，以帮助服务提供商改进应用程序及其服务。服务提供商可能会按照本隐私声明中描述的方式与第三方共享您的信息。\n\n\n\n请注意，该应用程序使用第三方服务，这些服务有自己的有关处理数据的隐私政策。以下是该应用程序使用的第三方服务提供商的隐私政策的链接：\n\n谷歌播放服务\nAdMob\n适用于 Firebase 的 Google Analytics\nFirebase Crashlytics\nFacebook\n\n服务提供商可能会披露用户提供的和自动收集的信息：\n\n根据法律要求，例如遵守传票或类似的法律程序；\n当他们真诚地认为有必要进行披露以保护其权利、保护您或他人的安全、调查欺诈行为或响应政府要求时；\n与代表他们工作的值得信赖的服务提供商合作，不能独立使用我们向他们披露的信息，并同意遵守本隐私声明中规定的规则。\n\n选择退出权\n您可以通过卸载该应用程序轻松停止其所有信息收集。您可以使用作为移动设备的一部分或通过移动应用程序市场或网络提供的标准卸载流程。\n\n\n数据保留政策\n只要您使用应用程序，服务提供商就会保留用户提供的数据，并在此后的合理时间内保留。如果您希望他们删除您通过应用程序提供的用户提供的数据，请通过 Wholekrsaler@gmail.com 与他们联系，他们将在合理的时间内回复。\n\n\n孩子们\n服务提供商不会使用应用程序故意向 13 岁以下儿童索取数据或向其推销数据。\n\n\n该应用程序不针对 13 岁以下的任何人。服务提供商不会故意收集 13 岁以下儿童的个人身份信息。如果服务提供商发现 13 岁以下儿童提供了个人信息，服务提供商将立即从其服务器中删除该信息。如果您是父母或监护人，并且您知道您的孩子向我们提供了个人信息，请联系服务提供商 (wholekrsaler@gmail.com)，以便他们能够采取必要的措施。\n\n\n安全\n服务提供商关心保护您信息的机密性。服务提供商提供物理、电子和程序保障措施来保护服务提供商处理和维护的信息。\n\n\n变化\n本隐私政策可能会因任何原因不时更新。服务提供商将通过使用新的隐私政策更新此页面来通知您隐私政策的任何更改。建议您定期查阅本隐私政策以了解任何更改，因为继续使用将被视为同意所有更改。\n\n\n\n本隐私政策自2024年12月16日起生效\n\n\n您的同意\n使用该应用程序，即表示您同意按照本隐私政策中规定的以及我们修订的方式处理您的信息。\n\n\n联系我们\n如果您在使用应用程序时对隐私有任何疑问，或对实践有疑问，请通过电子邮件联系服务提供商：wholekrsaler@gmail.com。',
    },
  },
  // paywall
  {
    'sygwc5s3': {
      'ru': 'Выберите свой план',
      'en': 'Choose Your Plan',
      'ko': '계획을 선택하세요',
      'zh_Hans': '选择您的计划',
    },
    'dzmdyjyc': {
      'ru': 'Выберите идеальный для вас план',
      'en': 'Select the perfect plan for you',
      'ko': '귀하에게 딱 맞는 플랜을 선택하세요',
      'zh_Hans': '选择最适合您的计划',
    },
    'e1pq7rxq': {
      'ru': 'Базовый план',
      'en': 'Basic Plan',
      'ko': '기본 계획',
      'zh_Hans': '基本计划',
    },
    '5i668jpl': {
      'ru': 'Идеально для начала',
      'en': 'Perfect for starters',
      'ko': '초보자에게 딱 맞습니다.',
      'zh_Hans': '非常适合初学者',
    },
    'cs4iy02z': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '89yismec': {
      'ru': 'Доступ к основным функциям',
      'en': 'Access to basic features',
      'ko': '기본 기능에 대한 액세스',
      'zh_Hans': '访问基本功能',
    },
    'jki67gr1': {
      'ru': 'До 100 транзакций/месяц',
      'en': 'Up to 100 transactions/month',
      'ko': '월별 최대 100건의 거래',
      'zh_Hans': '每月最多 100 笔交易',
    },
    'ejlzbj3c': {
      'ru': 'Поддержка по электронной почте',
      'en': 'Email support',
      'ko': '이메일 지원',
      'zh_Hans': '电子邮件支持',
    },
    'fu7mxt24': {
      'ru': 'Выбрать базовый план',
      'en': 'Select Basic Plan',
      'ko': '기본 플랜 선택',
      'zh_Hans': '选择基本计划',
    },
    'kevchjw9': {
      'ru': 'Премиум план',
      'en': 'Premium Plan',
      'ko': '프리미엄 플랜',
      'zh_Hans': '高级计划',
    },
    'cp796xl7': {
      'ru': 'Для растущего бизнеса',
      'en': 'For growing businesses',
      'ko': '성장하는 기업을 위한',
      'zh_Hans': '对于成长型企业',
    },
    '76v261vp': {
      'ru': '\$24.99/м',
      'en': '\$24.99/mo',
      'ko': '\$24.99/월',
      'zh_Hans': '\$24.99/月',
    },
    'ph3vofn0': {
      'ru': 'Все основные функции',
      'en': 'All Basic Features',
      'ko': '모든 기본 기능',
      'zh_Hans': '所有基本功能',
    },
    'bsoe84qb': {
      'ru': 'Неограниченные транзакции',
      'en': 'Unlimited transactions',
      'ko': '무제한 거래',
      'zh_Hans': '无限交易',
    },
    'qei0h1qp': {
      'ru': 'Приоритетная поддержка',
      'en': 'Priority support',
      'ko': '우선 지원',
      'zh_Hans': '优先支持',
    },
    'zsqo5e9y': {
      'ru': 'Расширенная аналитика',
      'en': 'Advanced analytics',
      'ko': '고급 분석',
      'zh_Hans': '高级分析',
    },
    'poqgqn5k': {
      'ru': 'Индивидуальные интеграции',
      'en': 'Custom integrations',
      'ko': '맞춤형 통합',
      'zh_Hans': '定制集成',
    },
    'sacwyxsw': {
      'ru': 'Выбрать Премиум-план',
      'en': 'Select Premium Plan',
      'ko': '프리미엄 플랜 선택',
      'zh_Hans': '选择高级计划',
    },
    'tiay8thm': {
      'ru': 'Нужна помощь с выбором?',
      'en': 'Need help choosing?',
      'ko': '선택하는 데 도움이 필요하십니까?',
      'zh_Hans': '需要帮助选择吗？',
    },
    'im405s9f': {
      'ru':
          'Обратитесь в наш отдел продаж, чтобы получить персональные рекомендации, соответствующие вашим конкретным потребностям.',
      'en':
          'Contact our sales team for a personalized recommendation based on your specific needs.',
      'ko': '귀하의 특정 요구 사항에 따른 맞춤형 추천을 받으려면 당사 영업팀에 문의하세요.',
      'zh_Hans': '请联系我们的销售团队，根据您的具体需求获取个性化推荐。',
    },
    'o9s81i7i': {
      'ru': 'Связаться с отделом продаж',
      'en': 'Contact Sales',
      'ko': '영업팀에 문의',
      'zh_Hans': '联系销售人员',
    },
  },
  // onePortCreateCard
  {
    'z7pdqfh7': {
      'ru': '₩ 50 000 в мясяц',
      'en': '₩ 50,000 per month',
      'ko': '₩ 50,000/월',
      'zh_Hans': '每月 ₩ 50,000',
    },
    'a05hnmt8': {
      'ru': 'Номер карты',
      'en': 'Card number',
      'ko': '카드번호',
      'zh_Hans': '卡号',
    },
    'a96w4dff': {
      'ru': 'Expiry Date(YYYY-MM)',
      'en': 'Expiry Date(YYYY-MM)',
      'ko': '유통기한(YYYY-MM)',
      'zh_Hans': '到期日(YYYY-MM)',
    },
    'rh5j4eys': {
      'ru': 'CVV',
      'en': 'CVV',
      'ko': '이력서',
      'zh_Hans': 'CVV',
    },
    'ap16n660': {
      'ru': 'Пароль от карты, первые2 цифры',
      'en': 'Card password, first 2 digits',
      'ko': '카드비밀번호 앞 2자리',
      'zh_Hans': '卡密码，前2位',
    },
    'lvkq0coq': {
      'ru': '2 цифры',
      'en': '2 digits',
      'ko': '2자리',
      'zh_Hans': '2 位数字',
    },
    'nqcl5764': {
      'ru': 'Имя владельца карты',
      'en': 'Cardholder name',
      'ko': '카드 소지자 이름',
      'zh_Hans': '持卡人姓名',
    },
    'iid1ck7t': {
      'ru': 'Дата рождения (ГГММДД)',
      'en': 'Date of birth (YYMMDD)',
      'ko': '생년월일(YYMMDD)',
      'zh_Hans': '出生日期（年月日）',
    },
    '8n3itgzd': {
      'ru': 'ГГММДД',
      'en': 'YYMMDD',
      'ko': 'YYMMDD',
      'zh_Hans': '年月日',
    },
    '42nipi53': {
      'ru': 'Электронная почта',
      'en': 'E-mail',
      'ko': '이메일',
      'zh_Hans': '电子邮件',
    },
    '4gm9k1lb': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '3ai10vr4': {
      'ru': '100',
      'en': '100',
      'ko': '100',
      'zh_Hans': '100',
    },
    'cfayf97t': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'rghe9j6g': {
      'ru': 'План WholeSaler Satore на 1 месяц',
      'en': 'WholeSaler Satore plan 1 month',
      'ko': 'WholeSaler Satore 계획 1mon',
      'zh_Hans': '批发商 Satore 计划 1 个月',
    },
    'y7mb0hxy': {
      'ru': 'Сохраненные карты',
      'en': 'Saved Cards',
      'ko': '저장된 카드',
      'zh_Hans': '已保存的卡片',
    },
    'pq73eo2o': {
      'ru': '•••• •••• •••• 4567',
      'en': '•••• •••• •••• 4567',
      'ko': '•••• •••• •••• 4567',
      'zh_Hans': '•••••••••••• 4567',
    },
    '8stt67mm': {
      'ru': 'Истекает 12/24',
      'en': 'Expires 12/24',
      'ko': '12/24에 만료됨',
      'zh_Hans': '12/24 到期',
    },
    'jnf7t89t': {
      'ru': '•••• •••• •••• 8901',
      'en': '•••• •••• •••• 8901',
      'ko': '•••• •••• •••• 8901',
      'zh_Hans': '•••••••••••• 8901',
    },
    'tcshl1sy': {
      'ru': 'Истекает 25.09',
      'en': 'Expires 09/25',
      'ko': '09/25에 만료됨',
      'zh_Hans': '到期日 09/25',
    },
    'h20a58g1': {
      'ru': 'Оплатить',
      'en': 'Pay',
      'ko': '지불하다',
      'zh_Hans': '支付',
    },
    '7bwrcrwf': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
  },
  // paidPage
  {
    'buv38oj1': {
      'ru': 'Оплата прошла!',
      'en': 'Payment completed!',
      'ko': '결제가 완료되었습니다!',
      'zh_Hans': '付款已通过！',
    },
    'dw3qe12s': {
      'ru': 'Платеж успешно выполнен. Благодарим за покупку!',
      'en': 'Payment completed successfully. Thank you for your purchase!',
      'ko': '결제가 성공적으로 완료되었습니다. 구매해주셔서 감사합니다!',
      'zh_Hans': '付款已成功完成。感谢您的购买！',
    },
    '6p73f7df': {
      'ru': 'Сумма платежа',
      'en': 'Payment amount',
      'ko': '결제금액',
      'zh_Hans': '付款金额',
    },
    's73kwhw4': {
      'ru': 'ID транзакции',
      'en': 'Transaction ID',
      'ko': '거래 ID',
      'zh_Hans': '交易ID',
    },
    'xnpjcmci': {
      'ru': 'Название карты',
      'en': 'Map name',
      'ko': '카드 이름',
      'zh_Hans': '卡名',
    },
    'sqqeye5c': {
      'ru': 'Тарифный план',
      'en': 'Tariff plan',
      'ko': '관세 계획',
      'zh_Hans': '资费方案',
    },
    'p6fe8knk': {
      'ru': 'Провайдер',
      'en': 'Provider',
      'ko': '공급자',
      'zh_Hans': '提供商',
    },
    '42gcy9qs': {
      'ru': 'Номер карты',
      'en': 'Card number',
      'ko': '카드번호',
      'zh_Hans': '卡号',
    },
    'xcnx6o25': {
      'ru': 'ОК',
      'en': 'OK',
      'ko': '좋아요',
      'zh_Hans': '好的',
    },
  },
  // SandNoticePage
  {
    '18to02or': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'ji1kxumb': {
      'ru': 'Рассылка',
      'en': 'Newsletter',
      'ko': '회람 신문',
      'zh_Hans': '通讯',
    },
    '0289q13e': {
      'ru': 'Заголовок сообщения',
      'en': 'Message Title',
      'ko': '메시지 제목',
      'zh_Hans': '留言标题',
    },
    'p0k7eix3': {
      'ru': 'Текст сообщения',
      'en': 'Message text',
      'ko': '메시지 텍스트',
      'zh_Hans': '留言内容',
    },
    '4l7xph33': {
      'ru': 'Отправить',
      'en': 'Send',
      'ko': '보내다',
      'zh_Hans': '发送',
    },
  },
  // RegNewStore
  {
    '0khfppdb': {
      'ru': 'Магазин на проверке',
      'en': 'The store is under inspection',
      'ko': '점검 중인 매장',
      'zh_Hans': '店铺正在接受检查',
    },
    'rltxqab8': {
      'ru': 'Имя магазина',
      'en': 'Store name',
      'ko': '매장명',
      'zh_Hans': '店铺名称',
    },
    'ps8uu2y1': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
      'zh_Hans': '电话',
    },
    'fiz35r22': {
      'ru': 'Адрес',
      'en': 'Address',
      'ko': '주소',
      'zh_Hans': '地址',
    },
    '38a2rkie': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
      'zh_Hans': '公寓',
    },
    'ygw4ntty': {
      'ru': 'Бизнес лицензия(사옵차)',
      'en': 'Business license (사옵차)',
      'ko': '사업자등록증(사옵차)',
      'zh_Hans': '营业执照（사옵차）',
    },
    '1wsqpox5': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
      'zh_Hans': '下载',
    },
    'vnr3l8nx': {
      'ru': 'фото 사옵차',
      'en': 'photo by 사옵차',
      'ko': '사진 사 최적차',
      'zh_Hans': '照片 사옵차',
    },
    's2hyume6': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
      'zh_Hans': '格式：JPG、PNG',
    },
    '99bbn9i4': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
      'zh_Hans': '更改照片',
    },
    'djgyqsmw': {
      'ru': 'Зарегистрироваться',
      'en': 'Register',
      'ko': '등록하다',
      'zh_Hans': '登记',
    },
    '725lx7p9': {
      'ru': 'Имя магазина обязательно',
      'en': 'Store name is required',
      'ko': '매장 이름은 필수 항목입니다.',
      'zh_Hans': '店铺名称为必填项',
    },
    '0n7uysi2': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'etrgck0y': {
      'ru': 'Номер телефона обязательно',
      'en': 'Phone number is required',
      'ko': '전화번호는 필수 항목입니다.',
      'zh_Hans': '电话号码为必填项',
    },
    'zxw7jhp1': {
      'ru': 'Неправильно',
      'en': 'Incorrect',
      'ko': '잘못된',
      'zh_Hans': '错误的',
    },
    '7ei98lk3': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'wqybv1d0': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    '0uoq2qyh': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // SendEmail
  {
    'j7d5lnuy': {
      'ru': 'Тех поддержка',
      'en': 'Tech support',
      'ko': '기술 지원',
      'zh_Hans': '技术支持',
    },
    'abrlth36': {
      'ru': 'Кому',
      'en': 'To',
      'ko': '에게',
      'zh_Hans': '到',
    },
    'zxjwqukw': {
      'ru': 'wholekrsaler@gmail.com',
      'en': 'wholekrsaler@gmail.com',
      'ko': 'Wholekrsaler@gmail.com',
      'zh_Hans': 'Wholekrsaler@gmail.com',
    },
    '0ithpwxx': {
      'ru': 'Тема сообщения',
      'en': 'Message Subject',
      'ko': '메시지 제목',
      'zh_Hans': '留言主题',
    },
    'kmstbcl8': {
      'ru': 'Текст сообщения',
      'en': 'Message text',
      'ko': '메시지 텍스트',
      'zh_Hans': '留言内容',
    },
    'qhv8xr41': {
      'ru': 'Незабудьте указать контактные данные',
      'en': 'Don\'t forget to include your contact information',
      'ko': '연락처 정보를 제공하는 것을 잊지 마세요',
      'zh_Hans': '不要忘记提供您的联系信息',
    },
    '3tdcbnde': {
      'ru': 'Отправить',
      'en': 'Send',
      'ko': '보내다',
      'zh_Hans': '发送',
    },
    'v9g516kr': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
  },
  // checkStoreList
  {
    'vi9vfnh6': {
      'ru': 'Магазины на проверке',
      'en': 'Shops under inspection',
      'ko': '점검중인 매장',
      'zh_Hans': '接受检查的商店',
    },
    'h6euseda': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
  },
  // checkStorePageAdmin
  {
    'hutbvsoh': {
      'ru': 'Имя магазина',
      'en': 'Store name',
      'ko': '매장명',
      'zh_Hans': '店铺名称',
    },
    'dn0esv0v': {
      'ru': 'Телефон',
      'en': 'Telephone',
      'ko': '전화',
      'zh_Hans': '电话',
    },
    'c6er9fk6': {
      'ru': 'Адрес',
      'en': 'Address',
      'ko': '주소',
      'zh_Hans': '地址',
    },
    'fcz3w61a': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
      'zh_Hans': '公寓',
    },
    'usl8mapv': {
      'ru': 'Бизнес лицензия(사옵차)',
      'en': 'Business license (사옵차)',
      'ko': '사옵차',
      'zh_Hans': '营业执照 (사옵차）',
    },
    'ofmqxhae': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
      'zh_Hans': '下载',
    },
    '8albb0te': {
      'ru': 'фото Бизнес лицензия ',
      'en': 'photo Business license',
      'ko': '사진 사옵차',
      'zh_Hans': '营业执照照片',
    },
    'rwuehjhf': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
      'zh_Hans': '格式：JPG、PNG',
    },
    'h24s8wm3': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
      'zh_Hans': '更改照片',
    },
    '4t03kmpc': {
      'ru': 'Прошел',
      'en': 'Passed',
      'ko': '합격',
      'zh_Hans': '通过',
    },
    'cct6rnry': {
      'ru': 'Не прошел',
      'en': 'Didn\'t pass',
      'ko': '통과하지 못함',
      'zh_Hans': '没有通过',
    },
    '3gxrwx6m': {
      'ru': 'Причина отказа',
      'en': 'Reason for refusal',
      'ko': '거절 이유',
      'zh_Hans': '拒绝原因',
    },
    'i5shjzkf': {
      'ru': 'Сохранить отказ',
      'en': 'Save the disclaimer',
      'ko': '거절 저장',
      'zh_Hans': '保存拒绝',
    },
    'z3m57ebj': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'zvj1p7a8': {
      'ru': 'Home',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // RegNewStorePre
  {
    '0f51v76q': {
      'ru': 'Выберите вид деятельности',
      'en': 'Select the type of activity',
      'ko': '활동 유형 선택',
      'zh_Hans': '选择活动类型',
    },
    'a8rmt11c': {
      'ru': 'Укажите основной тип деятельности вашего магазина',
      'en': 'Please indicate the main type of activity of your store',
      'ko': '매장의 주요 활동 유형을 지정하세요.',
      'zh_Hans': '指定商店的主要活动类型',
    },
    'lz9gn1tp': {
      'ru': 'Оптовые продажи',
      'en': 'Wholesale sales',
      'ko': '도매판매',
      'zh_Hans': '批发销售',
    },
    'h7c83g5a': {
      'ru': 'Продажа товаров оптом другим компаниям',
      'en': 'Wholesale sales of goods to other companies',
      'ko': '다른 회사에 물품을 도매로 판매하는 행위',
      'zh_Hans': '向其他公司批发销售商品',
    },
    'c8wsbg41': {
      'ru': 'Закуп товаров',
      'en': 'Purchase of goods',
      'ko': '상품 구매',
      'zh_Hans': '购买商品',
    },
    'iqciio22': {
      'ru': 'Закупка товаров для вашего бизнеса',
      'en': 'Purchasing goods for your business',
      'ko': '귀하의 비즈니스를 위한 물품 구매',
      'zh_Hans': '为您的企业采购商品',
    },
  },
  // AddProduct
  {
    'd975ub3p': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    '7bhysy77': {
      'ru': 'Добавление продукта',
      'en': 'Adding a product',
      'ko': '제품 추가',
      'zh_Hans': '添加产品',
    },
    'o2zxillf': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
      'zh_Hans': '下载',
    },
    '7xeaw434': {
      'ru': 'фото акции',
      'en': 'stock photo',
      'ko': '액션 사진',
      'zh_Hans': '行动照片',
    },
    's1oq10d7': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
      'zh_Hans': '格式：JPG、PNG',
    },
    'dlqc89rv': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
      'zh_Hans': '更改照片',
    },
    'emf2w9kn': {
      'ru': 'Цена',
      'en': 'Price',
      'ko': '가격',
      'zh_Hans': '价格',
    },
    'htj8ns0a': {
      'ru': 'Название',
      'en': 'Name',
      'ko': '이름',
      'zh_Hans': '姓名',
    },
    'immojnlt': {
      'ru': 'Штрихкод',
      'en': 'Barcode',
      'ko': '바코드',
      'zh_Hans': '条码',
    },
    'fnb53ewy': {
      'ru': 'Ссылка на Товар',
      'en': 'Link to Product',
      'ko': '제품 링크',
      'zh_Hans': '产品链接',
    },
    'lkj7exld': {
      'ru': 'Описание',
      'en': 'Description',
      'ko': '설명',
      'zh_Hans': '描述',
    },
    'x86jifgh': {
      'ru': 'Прочее',
      'en': 'Other',
      'ko': '다른',
      'zh_Hans': '其他',
    },
    '91zyilxh': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    '5eq61397': {
      'ru': 'Соус',
      'en': 'Sauce',
      'ko': '소스',
      'zh_Hans': '酱',
    },
    'ijg4y718': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    'ggu3ajhk': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    'tit87awq': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    '831wm72w': {
      'ru': 'Консервы/Маринады',
      'en': 'Canned goods/Marinades',
      'ko': '통조림/마리네이드',
      'zh_Hans': '罐头食品/腌料',
    },
    'egpt8b5f': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    'rroqewyg': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'jrfrm6i0': {
      'ru': 'Море продукты',
      'en': 'Seafood',
      'ko': '바다 음식',
      'zh_Hans': '海鲜',
    },
    'vngnbz8p': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
      'zh_Hans': '肉',
    },
    'nfzn2fxv': {
      'ru': 'Хоз товары',
      'en': 'Household goods',
      'ko': '가정 용품',
      'zh_Hans': '家居用品',
    },
    'nv5ze3dz': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
      'zh_Hans': '冷冻',
    },
    '7rxtrsu6': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
      'zh_Hans': '孩子们的',
    },
    '68kq672t': {
      'ru': 'Десерт',
      'en': 'Dessert',
      'ko': '디저트',
      'zh_Hans': '甜点',
    },
    'xi3p5got': {
      'ru': 'Молочка',
      'en': 'Dairy',
      'ko': '우유',
      'zh_Hans': '牛奶',
    },
    'nodbfg50': {
      'ru': 'Прочее',
      'en': 'Other',
      'ko': '다른',
      'zh_Hans': '其他',
    },
    'xbuy82lu': {
      'ru': 'В наличии',
      'en': 'In stock',
      'ko': '재고 있음',
      'zh_Hans': '有存货',
    },
    '7241ehs7': {
      'ru': 'Часто заказывают',
      'en': 'Frequently ordered',
      'ko': '자주 주문됨',
      'zh_Hans': '经常订购',
    },
    '3fv4zfw3': {
      'ru': 'Добавить продукт',
      'en': 'Add product',
      'ko': '제품 추가',
      'zh_Hans': '添加产品',
    },
    '9uqseb6e': {
      'ru': 'Дои',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // SearchPage
  {
    'rawujk8u': {
      'ru': '1',
      'en': '1',
      'ko': '1',
      'zh_Hans': '1',
    },
    'j5izztn9': {
      'ru': 'Поиск',
      'en': 'Search',
      'ko': '찾다',
      'zh_Hans': '搜索',
    },
    'u3evau4k': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    '4rui4ylb': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    'mylzwmdy': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    'ndzikv1m': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    'aek085j7': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
      'zh_Hans': '酱汁',
    },
    'fzahbfrh': {
      'ru': 'Консервы',
      'en': 'Canned',
      'ko': '통조림',
      'zh_Hans': '罐头食品',
    },
    'akmt9sbp': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    'sgcpzlbv': {
      'ru': 'Водка',
      'en': 'Vodka',
      'ko': '보드카',
      'zh_Hans': '伏特加酒',
    },
    'wszi2z7p': {
      'ru': 'Вино',
      'en': 'Wine',
      'ko': '와인',
      'zh_Hans': '葡萄酒',
    },
    'nx7trb0h': {
      'ru': 'Коньяк',
      'en': 'Cognac',
      'ko': '코냑',
      'zh_Hans': '科涅克白兰地',
    },
    'zqjrmweh': {
      'ru': 'Напитки',
      'en': 'Drinks',
      'ko': '음료수',
      'zh_Hans': '饮料',
    },
    'c1y6bdwr': {
      'ru': 'Соусы',
      'en': 'Sauces',
      'ko': '소스',
      'zh_Hans': '酱汁',
    },
    'hvpbuxzt': {
      'ru': 'Консервы',
      'en': 'Canned',
      'ko': '통조림',
      'zh_Hans': '罐头食品',
    },
    '9d6q4mwg': {
      'ru': 'Бакалея',
      'en': 'Grocery',
      'ko': '식료품점',
      'zh_Hans': '杂货店',
    },
    't2h1jte8': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    '4b9mzebo': {
      'ru': 'Заморозка',
      'en': 'Freezing',
      'ko': '동결',
      'zh_Hans': '冷冻',
    },
    '7p0urz5s': {
      'ru': 'Море прод.',
      'en': 'Sea cont.',
      'ko': '바다 계속.',
      'zh_Hans': '海续',
    },
    'sx7x0vuo': {
      'ru': 'Детское',
      'en': 'Children\'s',
      'ko': '어린이',
      'zh_Hans': '孩子们的',
    },
    '1jfkvgly': {
      'ru': 'Мясо',
      'en': 'Meat',
      'ko': '고기',
      'zh_Hans': '肉',
    },
    'rg0dchhm': {
      'ru': 'Молочка',
      'en': 'Dairy',
      'ko': '우유',
      'zh_Hans': '牛奶',
    },
    '7q3qq8mp': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'p0ue1ehw': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'ko4xhkx3': {
      'ru': 'Десерты',
      'en': 'Desserts',
      'ko': '디저트',
      'zh_Hans': '甜点',
    },
    'ml2hq84j': {
      'ru': 'Сигареты',
      'en': 'Cigarettes',
      'ko': '담배',
      'zh_Hans': '香烟',
    },
    'ztufnmde': {
      'ru': 'Хоз товар',
      'en': 'Homeware',
      'ko': '가정 용품',
      'zh_Hans': '家居用品',
    },
    'np29h8tp': {
      'ru': 'Другие',
      'en': 'Other',
      'ko': '다른',
      'zh_Hans': '其他',
    },
    'ph17nc1c': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // News
  {
    'rsf3b9n9': {
      'ru': '3',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'd73geix4': {
      'ru': 'Новости',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'ibdyfbsg': {
      'ru': 'Новая пицца в меню!',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'idigltrj': {
      'ru': '15 июня 2023',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'runzqmy6': {
      'ru':
          'Встречайте нашу новую пиццу \'Маргарита Делюкс\' с особым соусом и свежей моцареллой. Попробуйте первыми со скидкой 20%!',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '09n4iybu': {
      'ru': 'Перейти к пицце',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '98wpar8c': {
      'ru': 'Акция: 1+1=3',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'fergxz22': {
      'ru': '10 июня 2023',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '96w9x2r5': {
      'ru':
          'При заказе двух больших пицц третья в подарок! Акция действует до конца месяца.',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'h6xdxkmu': {
      'ru': 'Подробнее об акции',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'qjotita5': {
      'ru': 'Бесплатная доставка',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'pqrg63hz': {
      'ru': '5 июня 2023',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'y4mgsryk': {
      'ru':
          'Весь июнь бесплатная доставка при заказе от 2000 рублей! Время доставки всего 60 минут или пицца бесплатно.',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    's64z69n4': {
      'ru': 'Условия акции',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
  // AdminOrderListPage
  {
    '7lkllle7': {
      'ru': '3',
      'en': '3',
      'ko': '3',
      'zh_Hans': '3',
    },
    'tb55yeod': {
      'ru': 'Новые',
      'en': 'New',
      'ko': '새로운',
      'zh_Hans': '新的',
    },
    'r4nvk3m5': {
      'ru': 'Принятые',
      'en': 'Accepted',
      'ko': '수락됨',
      'zh_Hans': '公认',
    },
    'k0nq4e6j': {
      'ru': 'Готовые',
      'en': 'Ready',
      'ko': '준비가 된',
      'zh_Hans': '准备好',
    },
    '0it2emjm': {
      'ru': 'Отмена',
      'en': 'Cancel',
      'ko': '취소',
      'zh_Hans': '取消',
    },
    '6dcm0kk9': {
      'ru': 'Дом',
      'en': 'Home',
      'ko': '집',
      'zh_Hans': '家',
    },
  },
  // testPage
  {
    'pl0dokme': {
      'ru': 'Page Title',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'f58wd4zq': {
      'ru': 'Hello World',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'td82motw': {
      'ru': 'Home',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
  // UserPageInfo
  {
    'gs0ogyho': {
      'ru': 'Личные данные',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'bas923ti': {
      'ru': 'Магазин',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    's1nez2su': {
      'ru': 'История заказов',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'a5ghhol0': {
      'ru': 'Заказ #1234',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '91hk3jtd': {
      'ru': '15 июня 2023',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    't3b5syxr': {
      'ru': '2 пиццы • 1500₽',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'llf0qo2a': {
      'ru': 'Доставлен',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'p7m70gl9': {
      'ru': 'Заказ #1233',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'qa7qmnsy': {
      'ru': '10 июня 2023',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'h5xfkzqc': {
      'ru': '1 пицца • 800₽',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '8lgjkya8': {
      'ru': 'Доставлен',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'zl64vk2y': {
      'ru': 'Магазина нет',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'd1jh0dtq': {
      'ru': 'Адреса доставки',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'phf6izih': {
      'ru': 'Дом',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'zo5upg4v': {
      'ru': 'ул. Ленина, 123, кв. 45',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'f51xx9x3': {
      'ru': 'Работа',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'jpzr9qqe': {
      'ru': 'ул. Пушкина, 10, офис 301',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
  // PizzaItem
  {
    'f8im7su4': {
      'ru': 'Будет позже',
      'en': 'Will come later',
      'ko': '나중에 올 것이다',
      'zh_Hans': '稍后会来',
    },
  },
  // deckriptionItem
  {
    'sqaxzhgu': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'ko': '편집하다',
      'zh_Hans': '编辑',
    },
    'ihxjp0q9': {
      'ru': 'Маленькая',
      'en': 'Small',
      'ko': '작은',
      'zh_Hans': '小的',
    },
    '57b66eyg': {
      'ru': 'Средняя',
      'en': 'Average',
      'ko': '평균',
      'zh_Hans': '平均的',
    },
    'pu204amo': {
      'ru': 'Большая',
      'en': 'Big',
      'ko': '큰',
      'zh_Hans': '大的',
    },
    'a7i96tsd': {
      'ru': 'Традиционнае',
      'en': 'Traditional',
      'ko': '전통적인',
      'zh_Hans': '传统的',
    },
    'rl1c267q': {
      'ru': 'Тонкае',
      'en': 'Thin',
      'ko': '희석제',
      'zh_Hans': '稀释剂',
    },
    'gnuiny1r': {
      'ru': 'Добавить ингридиенты',
      'en': 'Add ingredients',
      'ko': '재료 추가',
      'zh_Hans': '添加成分',
    },
    'dhgotvh4': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
      'zh_Hans': '火腿来自\n鸡',
    },
    '27muwlil': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
      'zh_Hans': '+ 350',
    },
    'j0wc25sy': {
      'ru': 'Моцарелла',
      'en': 'Mozzarella',
      'ko': '모짜렐라',
      'zh_Hans': '马苏里拉奶酪',
    },
    'yd8mxwbh': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
      'zh_Hans': '+ 350',
    },
    'fpqgfbc7': {
      'ru': 'Шампиньоны',
      'en': 'Champignons',
      'ko': '샴피뇽',
      'zh_Hans': '香菇',
    },
    'ld0er7cp': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
      'zh_Hans': '+ 350',
    },
    'zld1njsc': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
      'zh_Hans': '火腿来自\n鸡',
    },
    'alnhzgtw': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
      'zh_Hans': '+ 350',
    },
    'jaga849t': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
      'zh_Hans': '火腿来自\n鸡',
    },
    'tll7niam': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
      'zh_Hans': '+ 350',
    },
    'ms7asp9f': {
      'ru': 'Ветчина из\nцыпленка',
      'en': 'Chicken Ham',
      'ko': '햄\n닭',
      'zh_Hans': '火腿来自\n鸡',
    },
    '2pk53utc': {
      'ru': '+ 350',
      'en': '+ 350',
      'ko': '+ 350',
      'zh_Hans': '+ 350',
    },
    'wfdq730d': {
      'ru': 'Продукт уже есть в вашей корзине',
      'en': 'The product is already in your cart.',
      'ko': '제품이 이미 장바구니에 있습니다.',
      'zh_Hans': '该产品已在您的购物车中',
    },
  },
  // CartItem
  {
    'nh73muzj': {
      'ru': '-',
      'en': '-',
      'ko': '-',
      'zh_Hans': '-',
    },
    '8uyyjytm': {
      'ru': '+',
      'en': '+',
      'ko': '+',
      'zh_Hans': '+',
    },
  },
  // bannerItem
  {
    '12tlsc2v': {
      'ru': 'Редактировать',
      'en': 'Edit',
      'ko': '편집하다',
      'zh_Hans': '编辑',
    },
  },
  // addressItem
  {
    'uyw3cn0r': {
      'ru': 'Изменить',
      'en': 'Change',
      'ko': '변화',
      'zh_Hans': '改变',
    },
  },
  // addnewAddress
  {
    '8uheljgd': {
      'ru': 'Город',
      'en': 'City',
      'ko': '도시',
      'zh_Hans': '城市',
    },
    'g9o1x37i': {
      'ru': 'Улица',
      'en': 'Street',
      'ko': '거리',
      'zh_Hans': '街道',
    },
    '1pjur2y7': {
      'ru': 'Дом',
      'en': 'House',
      'ko': '집',
      'zh_Hans': '房子',
    },
    'dio62pps': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
      'zh_Hans': '公寓',
    },
  },
  // promotion
  {
    'ypagnwf4': {
      'ru': 'Акция',
      'en': 'Promotion',
      'ko': '홍보',
      'zh_Hans': '晋升',
    },
    '46tkglqf': {
      'ru': 'загрузите',
      'en': 'download',
      'ko': '다운로드',
      'zh_Hans': '下载',
    },
    'sf6dourv': {
      'ru': 'фото акции',
      'en': 'stock photo',
      'ko': '액션 사진',
      'zh_Hans': '行动照片',
    },
    'e16q1cnr': {
      'ru': 'Формат: JPG, PNG',
      'en': 'Format: JPG, PNG',
      'ko': '형식: JPG, PNG',
      'zh_Hans': '格式：JPG、PNG',
    },
    'dgkt7fme': {
      'ru': 'Изменить фото',
      'en': 'Edit photo',
      'ko': '사진 변경',
      'zh_Hans': '更改照片',
    },
    'dzhnwley': {
      'ru': 'Удалить акцию',
      'en': 'Remove promotion',
      'ko': '프로모션 삭제',
      'zh_Hans': '删除促销',
    },
  },
  // emptyCart
  {
    'u82bmd2l': {
      'ru': 'Перейти',
      'en': 'Go to',
      'ko': '가다',
      'zh_Hans': '去',
    },
  },
  // addnewStore
  {
    'ynhzuts8': {
      'ru': 'Город',
      'en': 'City',
      'ko': '도시',
      'zh_Hans': '城市',
    },
    'u4ekfihf': {
      'ru': 'Улица',
      'en': 'Street',
      'ko': '거리',
      'zh_Hans': '街道',
    },
    'er69ssub': {
      'ru': 'Дом',
      'en': 'House',
      'ko': '집',
      'zh_Hans': '房子',
    },
    '4v60pgzd': {
      'ru': 'Квартира',
      'en': 'Apartment',
      'ko': '아파트',
      'zh_Hans': '公寓',
    },
  },
  // storeitem
  {
    'e99y4tff': {
      'ru': 'Изменить',
      'en': 'Change',
      'ko': '변화',
      'zh_Hans': '改变',
    },
  },
  // CartItem2
  {
    'qgfd27np': {
      'ru': '-',
      'en': '-',
      'ko': '-',
      'zh_Hans': '-',
    },
    'hozg2w4j': {
      'ru': '+',
      'en': '+',
      'ko': '+',
      'zh_Hans': '+',
    },
  },
  // MyClientItem
  {
    'i4f3zs1t': {
      'ru': 'exp. date',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
  // emptyProductList
  {
    'op8hx0ue': {
      'ru': 'Ваш список товаров пуст',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '3lturs96': {
      'ru': 'Добавьте товары через админ панель в профиле приложения',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
  // prodGridCard
  {
    '61mxcz00': {
      'ru': 'Будет позже',
      'en': 'Will come later',
      'ko': '나중에 올 것이다',
      'zh_Hans': '稍后会来',
    },
  },
  // FAB
  {
    'kzxdwwjv': {
      'ru': 'Hello World',
      'en': 'Hello World',
      'ko': '안녕하세요 세계',
      'zh_Hans': '你好世界',
    },
    'dpfy09vs': {
      'ru': 'FILES',
      'en': 'FILES',
      'ko': '파일',
      'zh_Hans': '文件',
    },
    'sryoxnxh': {
      'ru': 'RECORD',
      'en': 'RECORD',
      'ko': '기록',
      'zh_Hans': '记录',
    },
    'c79hf27i': {
      'ru': 'LOCATION',
      'en': 'LOCATION',
      'ko': '위치',
      'zh_Hans': '地点',
    },
    'r7enoqmt': {
      'ru': 'Pay',
      'en': 'PAY',
      'ko': '지불하다',
      'zh_Hans': '支付',
    },
    '0uinxmo8': {
      'ru': 'Edit',
      'en': 'Edit',
      'ko': '편집하다',
      'zh_Hans': '编辑',
    },
  },
  // EmptyMyOrderList
  {
    's36b4hu6': {
      'ru': 'У вас пока нет заказов',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'a1cbpxbs': {
      'ru': 'Здесь будут отображаться ваши заказы после их оформления',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
  // SearchEmpty
  {
    'ita9oj69': {
      'ru': 'Ничего не найдено',
      'en': 'Nothing found',
      'ko': '아무것도 발견되지 않았습니다',
      'zh_Hans': '没有找到任何内容',
    },
    '68r58ats': {
      'ru': 'Попробуйте изменить запрос или проверить написание.',
      'en': 'Try changing your query or checking your spelling.',
      'ko': '검색어를 변경하거나 철자를 확인해보세요.',
      'zh_Hans': '尝试更改您的查询或检查您的拼写。',
    },
  },
  // itemOrderUser
  {
    '4fr08629': {
      'ru': 'Дата заказа',
      'en': 'Order Date',
      'ko': '주문 날짜',
      'zh_Hans': '订购日期',
    },
    'ziinv5nu': {
      'ru': 'Сумма заказа',
      'en': 'Total Amount',
      'ko': '총액',
      'zh_Hans': '总金额',
    },
  },
  // itemOrderManager
  {
    'al36b3io': {
      'ru': 'Дата заказа',
      'en': 'Order Date',
      'ko': '주문 날짜',
      'zh_Hans': '订购日期',
    },
    '228fs80k': {
      'ru': 'Сумма заказа',
      'en': 'Total Amount',
      'ko': '총액',
      'zh_Hans': '总金额',
    },
  },
  // FABProdEditForAdmin
  {
    'msofcenn': {
      'ru': 'Изменить',
      'en': 'Edit',
      'ko': '편집하다',
      'zh_Hans': '编辑',
    },
    'afz9wf8c': {
      'ru': 'Сообщение',
      'en': 'Notification',
      'ko': '공고',
      'zh_Hans': '通知',
    },
  },
  // Miscellaneous
  {
    'kggo67s0': {
      'ru':
          'Для добавления фотографий или видео товаров и бизнес-лицензий приложению требуется доступ к камере. Бизнес-лицензия необходима для проверки магазина и не будет передаваться третьим лицам. Фотографии товаров, напротив, будут доступны потенциальным покупателям для удобства выбора.',
      'en':
          'To add photos or videos of products and business licenses, the application requires access to the camera. The business license is required for store verification and will not be shared with third parties. Product photos, on the contrary, will be available to potential buyers for ease of selection.',
      'ko':
          '제품 및 사업자 등록증의 사진이나 비디오를 추가하려면 앱에서 카메라에 액세스해야 합니다. 사업자등록증은 매장 검증에 필요하며, 타인에게 양도되지 않습니다. 오히려, 잠재적인 구매자에게는 선택의 편의를 위해 제품 사진이 제공될 것입니다.',
      'zh_Hans':
          '要添加产品和营业执照的照片或视频，该应用程序需要访问相机。营业执照是店铺验证所必需的，不会转让给第三方。相反，产品照片将提供给潜在买家，以方便选择。',
    },
    'puap9trx': {
      'ru':
          'Для загрузки данных, таких как фотографии товаров и бизнес-лицензия, приложению требуется доступ к библиотеке фотографий. Бизнес-лицензия необходима для проверки магазина и не будет передаваться третьим лицам. Фотографии товаров, напротив, будут видны потенциальным покупателям, чтобы облегчить процесс выбора.',
      'en':
          'To upload data such as product photos and a business license, the app requires access to the photo library. The business license is required for store verification and will not be shared with third parties. Product photos, on the other hand, will be visible to potential buyers to facilitate the selection process.',
      'ko':
          '제품 사진, 사업자등록증 등의 데이터를 다운로드하려면 앱에서 사진 라이브러리에 대한 액세스 권한이 필요합니다. 사업자등록증은 매장 검증에 필요하며, 타인에게 양도되지 않습니다. 반면, 제품 사진은 잠재적인 구매자에게 보여져 선택 과정을 더욱 쉽게 만들어 줄 것입니다.',
      'zh_Hans':
          '要下载产品照片和营业执照等数据，该应用程序需要访问照片库。营业执照是店铺验证所必需的，不会转让给第三方。另一方面，产品照片将对潜在买家可见，从而简化选择过程。',
    },
    'nplkojh7': {
      'ru': 'Ошибка: [error]',
      'en': 'Error: [error]',
      'ko': '오류: [오류]',
      'zh_Hans': '错误：[错误]',
    },
    '6hf86e56': {
      'ru': 'Письмо для сброса пароля отправлено!',
      'en': 'Password reset email sent!',
      'ko': '비밀번호 재설정 메일이 발송되었습니다!',
      'zh_Hans': '密码重置电子邮件已发送！',
    },
    'gnzswnov': {
      'ru': 'Требуется указать адрес электронной почты!',
      'en': 'An email address is required!',
      'ko': '이메일 주소가 필요합니다!',
      'zh_Hans': '需要一个电子邮件地址！',
    },
    't2vyld2o': {
      'ru': 'Номер телефона обязателен и должен начинаться с +',
      'en': 'Phone number is required and must start with +',
      'ko': '전화번호는 필수 항목이며 +로 시작해야 합니다.',
      'zh_Hans': '电话号码为必填项，且必须以 + 开头',
    },
    'vu6l2ips': {
      'ru': 'Пароли не совпадают',
      'en': 'The passwords do not match',
      'ko': '비밀번호가 일치하지 않습니다.',
      'zh_Hans': '密码不匹配',
    },
    '1w1sxrco': {
      'ru': 'Введите код подтверждения SMS',
      'en': 'Enter SMS confirmation code',
      'ko': 'SMS 인증코드를 입력하세요',
      'zh_Hans': '输入短信验证码',
    },
    'w43e88ov': {
      'ru':
          'Слишком много времени прошло с момента последней регистрации. Войдите в систему еще раз, прежде чем удалять учетную запись.',
      'en':
          'Too much time has passed since your last registration. Please sign in again before deleting your account.',
      'ko': '마지막 등록 이후 너무 많은 시간이 지났습니다. 계정을 삭제하기 전에 다시 로그인하세요.',
      'zh_Hans': '自上次注册以来已经过去了太多时间。删除您的帐户之前请重新登录。',
    },
    'z207gbic': {
      'ru':
          'Слишком много времени прошло с момента последней регистрации. Войдите в систему еще раз, прежде чем обновлять адрес электронной почты.',
      'en':
          'Too much time has passed since your last registration. Please sign in again before updating your email address.',
      'ko': '마지막 등록 이후 너무 많은 시간이 지났습니다. 이메일 주소를 업데이트하기 전에 다시 로그인하세요.',
      'zh_Hans': '自上次注册以来已经过去了太多时间。在更新您的电子邮件地址之前重新登录。',
    },
    'mo4ran1m': {
      'ru': 'Письмо с подтверждением изменения Email адреса  отправлено!',
      'en': 'Email address change confirmation email sent!',
      'ko': '이메일 주소 변경을 확인하는 편지가 전송되었습니다!',
      'zh_Hans': '确认电子邮件地址更改的信件已发送！',
    },
    'z1zja8zd': {
      'ru': 'Адрес электронной почты уже используется другим пользователем',
      'en': 'The email address is already in use by another user.',
      'ko': '해당 이메일 주소는 이미 다른 사용자가 사용하고 있습니다.',
      'zh_Hans': '该电子邮件地址已被其他用户使用',
    },
    'loxivoqm': {
      'ru': 'Указанные данные для входа неверны.',
      'en': 'The login details you provided are incorrect.',
      'ko': '제공된 로그인 정보가 올바르지 않습니다.',
      'zh_Hans': '提供的登录信息不正确。',
    },
    'g9442q5r': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'av6yiu8l': {
      'ru': 'Загрузка файла...',
      'en': 'Loading file...',
      'ko': '파일 로드 중...',
      'zh_Hans': '正在加载文件...',
    },
    'ivcbu61y': {
      'ru': 'Готово!',
      'en': 'Success',
      'ko': '준비가 된!',
      'zh_Hans': '准备好！',
    },
    '64sgmfr4': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'xqq99fdb': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'b9jeci1i': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'b7v5qv22': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'xsaqnxxp': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '1y2fapq7': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'ja2beswk': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '7fp9qhq3': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'b8grdz77': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    '4piikevj': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
    'j6mdm3j3': {
      'ru': '',
      'en': '',
      'ko': '',
      'zh_Hans': '',
    },
  },
].reduce((a, b) => a..addAll(b));
