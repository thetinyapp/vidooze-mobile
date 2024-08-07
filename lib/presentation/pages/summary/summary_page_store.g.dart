// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SummaryPageStore on _SummaryPageStore, Store {
  Computed<String>? _$pageTitleComputed;

  @override
  String get pageTitle =>
      (_$pageTitleComputed ??= Computed<String>(() => super.pageTitle,
              name: '_SummaryPageStore.pageTitle'))
          .value;

  late final _$eventAtom =
      Atom(name: '_SummaryPageStore.event', context: context);

  @override
  SummaryEvent get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(SummaryEvent value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  late final _$selectedTabAtom =
      Atom(name: '_SummaryPageStore.selectedTab', context: context);

  @override
  SummarizerTab get selectedTab {
    _$selectedTabAtom.reportRead();
    return super.selectedTab;
  }

  @override
  set selectedTab(SummarizerTab value) {
    _$selectedTabAtom.reportWrite(value, super.selectedTab, () {
      super.selectedTab = value;
    });
  }

  late final _$_SummaryPageStoreActionController =
      ActionController(name: '_SummaryPageStore', context: context);

  @override
  dynamic selectTab(SummarizerTab tab) {
    final _$actionInfo = _$_SummaryPageStoreActionController.startAction(
        name: '_SummaryPageStore.selectTab');
    try {
      return super.selectTab(tab);
    } finally {
      _$_SummaryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
event: ${event},
selectedTab: ${selectedTab},
pageTitle: ${pageTitle}
    ''';
  }
}
