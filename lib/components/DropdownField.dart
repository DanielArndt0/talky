// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/ComponentDecoration.dart';
// import 'package:talky_chat/repository/DropdownStatusValues.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/repository/interfaces/AvailabilityStatusRepository.dart';

class DropdownField extends StatefulWidget {
  const DropdownField({
    super.key,
    this.label,
    this.onChanged,
    this.standardValue,
  });

  final void Function(AvailabilityStatus? value)? onChanged;
  final String? label;
  final AvailabilityStatus? standardValue;

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late AvailabilityStatus standardValue;
  late final AvailabilityStatusRepository availabilityStatusRepository;

  Widget icon = Row(
    children: [
      Container(
        height: 100,
        width: 1,
        color: AppColors.borderColor,
      ),
      const Icon(Icons.arrow_drop_down_rounded),
    ],
  );

  @override
  void initState() {
    availabilityStatusRepository = context.read<AvailabilityStatusRepository>();
    standardValue = widget.standardValue == null
        ? AvailabilityStatus.available
        : widget.standardValue!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: standardValue,
      items: availabilityStatusRepository.findAll(),
      icon: icon,
      decoration: ComponentDecoration.inputDecoration(label: widget.label),
      onChanged: (value) => setState(() {
        standardValue = value!;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      }),
    );
  }
}
