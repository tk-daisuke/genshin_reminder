import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/item/character/characters_list.dart';
import 'package:genshin_reminder/item/weapon/weapon_list.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/view/setting_view/settting_view_model.dart';
import 'package:genshin_reminder/view/widget/character/character_avater.dart';
import 'package:genshin_reminder/view/widget/weapons/weapon_avater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingViewScreen extends ConsumerWidget {
  const SettingViewScreen({Key? key}) : super(key: key);
  static const String id = 'setting_view_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSetting = ref.watch(userSettingProvider.notifier);
    final serverSetting = ref.watch(userSettingServersProvider.notifier);
    // final model = useProvider(settingNotificationProvider);
    final _l10n = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        // print(userSetting.state);
        userSetting.state = serverSetting.state;
        // print(userSetting.state);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _l10n?.view_setting ?? 'view setting',
            textScaleFactor: 1,
            style: const TextStyle(color: Colors.white),
          ),
          // leading: Consumer(builder: (context, ref, _) {
          //   final userSetting = ref.watch(userSettingProvider.notifier);
          //   final serverSetting =
          //       ref.watch(userSettingServersProvider.notifier);
          //   return IconButton(
          //     icon: const Icon(
          //       Icons.arrow_back,
          //     ),
          //     onPressed: () {
          //       userSetting.state = serverSetting.state;
          //       Navigator.of(context).pop();
          //     },
          //   );
          // }),
          actions: [
            _SaveButton(l10n: _l10n),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(),
                _Title(title: _l10n?.main_character ?? 'Traveler'),
                _SubTitle(title: _l10n?.hotaru_sora ?? ''),
                const _HotaruSoraToggle(),
                const Divider(),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    children: [
                      _Title(
                        title: _l10n?.image ?? 'images',
                      ),
                      _SubTitle(
                        title: _l10n?.images_size_change ?? 'resize',
                      ),
                      const _ImagesSample(),
                      // const Divider(),
                      const _ImagesSlider(),
                    ],
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    children: [
                      const Divider(),
                      _Title(
                        title: _l10n?.material_screen ?? 'material screen',
                      ),
                      _SubTitle(
                        title: _l10n?.all_tab ?? 'all tab',
                      ),
                      HookConsumer(builder: (context, ref, child) {
                        final sundaySettings =
                            ref.watch(userSettingProvider.state);
                        // print(sundaySettings.sate);
                        return SwitchListTile(
                          activeColor: Colors.lightBlue,
                          title: Text(
                            _l10n?.sunday_material_all_view_setting ??
                                'Display Sunday material',
                            textScaleFactor: 1,
                          ),
                          value: sundaySettings.state.sundayActive,
                          onChanged: (toggle) {
                            sundaySettings.state = sundaySettings.state
                                .copyWith(sundayActive: toggle);
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HotaruSoraToggle extends StatelessWidget {
  const _HotaruSoraToggle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final userSetting = ref.watch(userSettingProvider.state);
      final soraSetting = userSetting.state.travellerSora;
      const activeColor = Colors.lightBlue;
      const deactiveColor = Colors.grey;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TravellerSelectAvatar(
            isSelect: !soraSetting,
            activeColor: activeColor,
            deactiveColor: deactiveColor,
            path: 'assets/images/characters/traveler/icon.png',
            onPress: () {
              userSetting.state =
                  userSetting.state.copyWith(travellerSora: false);
            },
          ),
          _TravellerSelectAvatar(
            isSelect: soraSetting,
            activeColor: activeColor,
            deactiveColor: deactiveColor,
            path: 'assets/images/characters/traveler/icon2.png',
            onPress: () {
              userSetting.state =
                  userSetting.state.copyWith(travellerSora: true);
            },
          ),
        ],
      );
    });
  }
}

class _TravellerSelectAvatar extends StatelessWidget {
  const _TravellerSelectAvatar({
    Key? key,
    required this.path,
    required this.onPress,
    required this.isSelect,
    required this.activeColor,
    required this.deactiveColor,
  }) : super(key: key);

  final MaterialColor activeColor;

  final MaterialColor deactiveColor;
  final String path;
  final VoidCallback onPress;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              color: isSelect ? activeColor : deactiveColor,
              image: DecorationImage(
                image: AssetImage(path),
                // fit: BoxFit.cover,
              ),
              border: Border.all(
                color: isSelect ? activeColor : deactiveColor,
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
            ),
          ),
          if (isSelect)
            Container(
              width: 75,
              height: 15,
              color: Colors.white,
              child: const Icon(
                Icons.done,
                color: Colors.amber,
                size: 15,
              ),
            )
          else
            const SizedBox(
              width: 75,
              height: 15,
            )
        ],
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
    required AppLocalizations? l10n,
  })  : _l10n = l10n,
        super(key: key);

  final AppLocalizations? _l10n;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final userSetting = ref.watch(userSettingProvider.notifier);
      final serverSetting = ref.watch(userSettingServersProvider.notifier);
      final model = ref.watch(settingViewProvider);

      return ElevatedButton.icon(
        onPressed: () async {
          if (userSetting.state != serverSetting.state) {
            await model.updateSetting(
                userSetting: userSetting,
                serverSetting: serverSetting,
                context: context);
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_l10n?.saveving ?? ''),
            ),
          );
        },
        icon: const Icon(
          Icons.save,
        ),
        label: Text(
          _l10n?.save ?? '',
          textScaleFactor: 1,
        ),
      );
    });
  }
}

class _ImagesSlider extends StatelessWidget {
  const _ImagesSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final imagesSetting = ref.watch(userSettingProvider.state);

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.zoom_out),
            Expanded(
              child: Slider(
                value: imagesSetting.state.imagesSize,
                // divisions: 5,
                min: kImagesMinWidth,
                max: kImagesMaxWidth,
                onChanged: (value) {
                  final fixValue = double.parse(value.toStringAsFixed(4));
                  // print(fixValue);
                  if (imagesSetting.state.imagesSize != 45.1) {
                    imagesSetting.state =
                        imagesSetting.state.copyWith(imagesSize: fixValue);
                  }
                },
              ),
            ),
            const Icon(Icons.zoom_in),
          ],
        ),
      );
    });
  }
}

class _ImagesSample extends StatelessWidget {
  const _ImagesSample({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      ref.watch(userSettingProvider.state);

      return Container(
        constraints: const BoxConstraints(minHeight: 100, maxHeight: 500),
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CharacterAvatar(characters: [characters[26]]),
            WeaponAvatar(weapons: [weapons[0]]),
          ],
        ),
      );
    });
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1,
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textScaleFactor: 1,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
