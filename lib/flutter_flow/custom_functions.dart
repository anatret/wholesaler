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

DocumentReference getWholeUserRefCopy(DocumentReference wholeStore) {
  // returne user reference from wholestore
  return wholeStore.collection('users').doc('user_id');
}

int summFunction(
  int count,
  int price,
) {
  return count * price;
}

DocumentReference getWholeUserRef(StoresRecord wholeStore) {
  return wholeStore.user as DocumentReference;
}
