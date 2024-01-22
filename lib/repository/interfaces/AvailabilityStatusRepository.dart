import 'package:flutter/material.dart';

import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/repository/interfaces/Repository.dart';

abstract class AvailabilityStatusRepository
    extends Repository<DropdownMenuItem<AvailabilityStatus>> {
  late final List<DropdownMenuItem<AvailabilityStatus>> _itens = [
    DropdownMenuItem(
      value: AvailabilityStatus.available,
      child: style(AvailabilityStatus.available),
    ),
    DropdownMenuItem(
      value: AvailabilityStatus.away,
      child: style(AvailabilityStatus.away),
    ),
    DropdownMenuItem(
      value: AvailabilityStatus.busy,
      child: style(AvailabilityStatus.busy),
    ),
    DropdownMenuItem(
      value: AvailabilityStatus.inCall,
      child: style(AvailabilityStatus.inCall),
    ),
  ];

  @override
  List<DropdownMenuItem<AvailabilityStatus>> findAll() => _itens;

  @override
  void insert(DropdownMenuItem<AvailabilityStatus> element) {}

  @override
  void remove(DropdownMenuItem<AvailabilityStatus> element) =>
      _itens.remove(element);

  @override
  void removeWhere(
          bool Function(DropdownMenuItem<AvailabilityStatus> element)
              condition) =>
      _itens.removeWhere(condition);

  @override
  List<DropdownMenuItem<AvailabilityStatus>> where(
          bool Function(DropdownMenuItem<AvailabilityStatus> element)
              condition) =>
      _itens.where(condition).toList();

  Widget style(AvailabilityStatus status);
}
