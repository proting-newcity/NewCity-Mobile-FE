import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget TopicChip(String label, int index, Rx<int> selectedIndex) {
  bool isSelected = selectedIndex.value == index;

  return ChoiceChip(
    label: Text(
      label,
      style: TextStyle(color: isSelected ? Colors.white : Color(0xFF588157)),
    ),
    selected: isSelected,
    onSelected: (bool selected) {
      selectedIndex.value = selected ? index : -1;
    },
    backgroundColor: isSelected ? Color(0xFF588157) : Colors.white,
    selectedColor: Color(0xFF588157),
    labelStyle: TextStyle(color: isSelected ? Colors.white : Color(0xFF588157)),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: isSelected ? Color(0xFF588157) : Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
