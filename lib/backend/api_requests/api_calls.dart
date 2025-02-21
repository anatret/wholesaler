import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start ImpPgPayments Group Code

class ImpPgPaymentsGroup {
  static String getBaseUrl({
    String? impSecret =
        'dIr4s0s6MOdEdQXIHirPjsHCdYQXTjMJFVQZCTcifnlueiap5MFZplDrW8h6NoO8vaBhrimUkeMa6YOz',
    String? impKey = '7010027643620543',
  }) =>
      'https://api.iamport.kr';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetAccessTokenCall getAccessTokenCall = GetAccessTokenCall();
  static OnetimePaymentCall onetimePaymentCall = OnetimePaymentCall();
}

class GetAccessTokenCall {
  Future<ApiCallResponse> call({
    String? impSecret =
        'dIr4s0s6MOdEdQXIHirPjsHCdYQXTjMJFVQZCTcifnlueiap5MFZplDrW8h6NoO8vaBhrimUkeMa6YOz',
    String? impKey = '7010027643620543',
  }) async {
    final baseUrl = ImpPgPaymentsGroup.getBaseUrl(
      impSecret: impSecret,
      impKey: impKey,
    );

    final ffApiRequestBody = '''
{
  "imp_key": "${escapeStringForJson(impKey)}",
  "imp_secret": "${escapeStringForJson(impSecret)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAccessToken',
      apiUrl: '${baseUrl}/users/getToken',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.access_token''',
      ));
  int? code(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class OnetimePaymentCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
    String? merchantUid = '',
    int? amount,
    String? cardNumber = '',
    String? expiry = '',
    String? birth = '',
    String? pwd2digit = '',
    String? cvc = '',
    String? customerUid = '',
    String? name = '',
    String? buyerName = '',
    String? buyerEmail = '',
    String? impSecret =
        'dIr4s0s6MOdEdQXIHirPjsHCdYQXTjMJFVQZCTcifnlueiap5MFZplDrW8h6NoO8vaBhrimUkeMa6YOz',
    String? impKey = '7010027643620543',
  }) async {
    final baseUrl = ImpPgPaymentsGroup.getBaseUrl(
      impSecret: impSecret,
      impKey: impKey,
    );

    final ffApiRequestBody = '''
{
  "merchant_uid": "${escapeStringForJson(merchantUid)}",
  "amount": ${amount},
  "card_number": "${escapeStringForJson(cardNumber)}",
  "expiry": "${escapeStringForJson(expiry)}",
  "birth": "${escapeStringForJson(birth)}",
  "pwd_2digit": "${escapeStringForJson(pwd2digit)}",
  "cvc": "${escapeStringForJson(cvc)}",
  "customer_uid": "${escapeStringForJson(customerUid)}",
  "pg": "nice_v2",
  "name": "${escapeStringForJson(name)}",
  "buyer_name": "${escapeStringForJson(buyerName)}",
  "buyer_email": "${escapeStringForJson(buyerEmail)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'onetimePayment',
      apiUrl: '${baseUrl}/subscribe/payments/onetime',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? respPaytCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.code''',
      ));
  int? respPaytAmount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.response.amount''',
      ));
  String? respPaytapplynum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.apply_num''',
      ));
  String? respPaytBuyerEmail(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.buyer_email''',
      ));
  String? respPaytCardCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.card_code''',
      ));
  String? respPaytCardNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.card_number''',
      ));
  String? respPaytName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.name''',
      ));
  String? respPaytPgProvider(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.pg_provider''',
      ));
  String? respPaytPgTid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.pg_tid''',
      ));
  String? respPaytReceiptUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.receipt_url''',
      ));
  String? respPaytCardName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.card_name''',
      ));
  String? respPaytMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? respPayCardIssuerCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.card_issuer_code''',
      ));
  String? respPayCardIssuerName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.card_issuer_name''',
      ));
  String? respPayCardPublisherCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.card_publisher_code''',
      ));
  String? respPayCardPublisherName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.card_publisher_name''',
      ));
  String? respPayImpUID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.imp_uid''',
      ));
  String? respPaypgid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.response.pg_id''',
      ));
  List? respPayCancelReceiptUrls(dynamic response) => getJsonField(
        response,
        r'''$.response.cancel_receipt_urls''',
        true,
      ) as List?;
}

/// End ImpPgPayments Group Code

class SendTelegramButtonCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "chat_id": "-1002492519419",
  "text": "Нажмите кнопку, чтобы открыть приложение:",
  "reply_markup": {
    "inline_keyboard": [
      [
        {
          "text": "Открыть WholeSaler",
          "web_app": {
            "url": "https://wholekrsaler.flutterflow.app/"
          }
        }
      ]
    ]
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Telegram Button',
      apiUrl:
          'https://api.telegram.org/bot8159674607:AAGDEEpZg_4jA9GdjjTydCnYN0euzlfFMSE/sendMessage',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
