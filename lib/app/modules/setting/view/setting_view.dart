import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_wallet_bottom_sheet.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Setting Wallet'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  _modalBottomSheetMenu(context);
                },
                icon: const Icon(Icons.add, size: 30))
          ]),
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text('VCB'),
              Text('ACB'),
              Text('VCB'),
              Text('VCB'),
              Text('VCB'),
              Text('VCB'),
            ],
          ),
        ),
      ),
    );
  }
}

void _modalBottomSheetMenu(context) {
  WidgetsBinding.instance?.addPostFrameCallback((_) async {
    await showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        builder: (builder) {
          return ItemWalletBottomSheetStart();
        });
  });
}
