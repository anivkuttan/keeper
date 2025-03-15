import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    this.phoneController,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.autofocus = false,
    this.countryButtonStyle,
    this.validator,
    this.onChanged,
    this.initialValue,
  });
  final PhoneController? phoneController;
  final String? hintText;
  final String? labelText;
  final PhoneNumber? initialValue;
  final bool autofocus;
  final CountryButtonStyle? countryButtonStyle;
  final void Function(PhoneNumber?)? onSaved;
  final void Function(PhoneNumber)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhoneFormField(
          autofocus: autofocus,
          controller: phoneController,
          onSaved: onSaved,
          // decoration: InputDecoration(
          //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          //   contentPadding: const EdgeInsets.symmetric(
          //     vertical: 12,
          //     horizontal: 10,
          //   ),
          //   label: labelText != null ? Text(labelText!) : null,
          //   hintText: hintText,
          // ),
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          // PhoneValidator.compose([
          // PhoneValidator.validMobile(context),
          // PhoneValidator.required(context),
          // ]),
          textAlignVertical: TextAlignVertical.center,
          countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
          onChanged: onChanged,
          enabled: true,
          isCountrySelectionEnabled: true,
          countryButtonStyle:
              countryButtonStyle ??
              const CountryButtonStyle(
                showDialCode: true,
                showDropdownIcon: false,
                showIsoCode: false,
                showFlag: true,
                flagSize: 16,
              ),
        ),
      ],
    );
  }
}
