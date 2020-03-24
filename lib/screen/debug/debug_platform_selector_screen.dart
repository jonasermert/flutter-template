import 'package:flutter/material.dart';
import 'package:flutter_template/di/kiwi_container.dart';
import 'package:flutter_template/viewmodel/back_navigator.dart';
import 'package:flutter_template/viewmodel/debug/debug_platform_selector_viewmodel.dart';
import 'package:flutter_template/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_template/widget/debug/selector_item.dart';
import 'package:flutter_template/widget/general/styled/flutter_template_back_button.dart';
import 'package:flutter_template/widget/provider/provider_widget.dart';
import 'package:provider/provider.dart';

class DebugPlatformSelectorScreen extends StatefulWidget {
  static const String routeName = 'debug_platform_selector';

  @override
  _DebugPlatformSelectorScreenState createState() => _DebugPlatformSelectorScreenState();
}

class _DebugPlatformSelectorScreenState extends State<DebugPlatformSelectorScreen> with BackNavigatorMixin implements DebugPlatformSelectorNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorViewModel>(
      childBuilderWithViewModel: (context, value) => Scaffold(
        appBar: AppBar(
          leading: FlutterTemplateBackButton.light(onClick: value.onBackClicked),
          title: const Text('Select a platform'),
        ),
        body: Consumer<GlobalViewModel>(
          builder: (context, viewModel, child) => ListView(
            children: [
              SelectorItem(
                title: 'System Default',
                onClick: viewModel.setSelectedPlatformToDefault,
                selected: viewModel.targetPlatform == null,
              ),
              SelectorItem(
                title: 'Android',
                onClick: viewModel.setSelectedPlatformToAndroid,
                selected: viewModel.targetPlatform == TargetPlatform.android,
              ),
              SelectorItem(
                title: 'iOS',
                onClick: viewModel.setSelectedPlatformToIOS,
                selected: viewModel.targetPlatform == TargetPlatform.iOS,
              ),
            ],
          ),
        ),
      ),
      create: () => KiwiContainer.resolve()..init(this),
    );
  }
}
