import 'package:flutter/widgets.dart';

import '../../data/json_account_strategy.dart';
import '../../model/account_manager.dart';

class CharacterLoader extends WidgetsBindingObserver {
  final AccountManager accountManager;
  final JsonAccountStrategy accountStrategy;

  CharacterLoader(this.accountManager, this.accountStrategy);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      accountManager.characters = await accountStrategy.loadCharacters();
    }
  }
}
