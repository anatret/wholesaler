import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

int summPizza(List<CartStruct> cartItem) {
  int summ = 0;
  for (final item in cartItem) {
    summ += item.price * item.count;
  }
  return summ;
}

bool encarParser(String phone) {
  return phone.length == 13;
}

bool checkCart(
  List<DocumentReference> pizzes,
  DocumentReference ref,
) {
  bool result = false;

  for (var element in pizzes) {
    if (element == ref) {
      result = true;
    }
  }
  return result;
}

int summFunction(
  int count,
  int price,
) {
  return count * price;
}

int getSizeOfCartList(List<CartStruct> cartList) {
  // верни длину cartList
  return cartList.length;
}

DateTime addMonToExpiryDate(DateTime oldExpiryDate) {
  // Добавляем 1 месяц
  int newYear = oldExpiryDate.year;
  int newMonth = oldExpiryDate.month + 1;

  // Обрабатываем переход на следующий год
  if (newMonth > 12) {
    newYear += 1;
    newMonth = 1;
  }

  // Сохраняем день
  int newDay = oldExpiryDate.day;

  // Если новый месяц не имеет нужного количества дней, корректируем
  int maxDaysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;
  if (newDay > maxDaysInNewMonth) {
    newDay = maxDaysInNewMonth;
  }

  // Новая дата с обнулением времени до 00:00
  DateTime newExpireDate = DateTime(newYear, newMonth, newDay);

  // Проверяем, нужно ли округлять в большую сторону
  if (oldExpiryDate.hour > 0 ||
      oldExpiryDate.minute > 0 ||
      oldExpiryDate.second > 0 ||
      oldExpiryDate.millisecond > 0) {
    newExpireDate = newExpireDate.add(Duration(days: 1));
  }

  return newExpireDate;
}

int checkExpiryDate(DateTime expiryDate) {
  // верни количество дней до expirydate
  DateTime now = DateTime.now();
  Duration difference = expiryDate.difference(now);
  return difference.inDays;
}

DateTime addDaysToDate(
  int addDays,
  DateTime curDate,
) {
  // Обнуляем время, добавляем дни
  DateTime newDate = DateTime(curDate.year, curDate.month, curDate.day)
      .add(Duration(days: addDays));
  return newDate;
}
