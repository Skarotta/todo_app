import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/settings_provider.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});

  List<String> languageList = [
    "English",
    "عربي",
  ];

  List<String> themeList = [
    "light",
    "dark",
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var local = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            local.language,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomDropdown<String>(
            items: languageList,
            initialItem: vm.currentLanguage == "en" ? "English" : "عربى",
            decoration: CustomDropdownDecoration(
                expandedSuffixIcon: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: vm.isDark() ? Colors.blueGrey : Colors.white,
                ),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: vm.isDark() ? Colors.black : Colors.white,
                ),
                expandedFillColor:
                    vm.isDark() ? Colors.blueGrey : Colors.blueGrey,
                closedFillColor:
                    vm.isDark() ? Colors.blueGrey : Colors.blueGrey),
            onChanged: (value) {
              if (value == "English") {
                vm.changeLanguage("en");
              } else if (value == "عربى") {
                vm.changeLanguage("ar");
              }
            },
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "theme",
            // local.theme,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown<String>(
            items: themeList,
            initialItem: vm.isDark() ? "dark" : "light",
            decoration: CustomDropdownDecoration(
                expandedSuffixIcon: Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: vm.isDark() ? Colors.blueGrey : Colors.white,
                ),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: vm.isDark() ? Colors.black : Colors.white,
                ),
                expandedFillColor:
                    vm.isDark() ? Colors.blueGrey : Colors.blueGrey,
                closedFillColor:
                    vm.isDark() ? Colors.blueGrey : Colors.blueGrey),
            onChanged: (value) {
              if (value == "dark") {
                vm.changeTheme(ThemeMode.dark);
              } else if (value == "light") {
                vm.changeTheme(ThemeMode.light);
              }
            },
          ),
        ],
      ),
    );
  }
}
