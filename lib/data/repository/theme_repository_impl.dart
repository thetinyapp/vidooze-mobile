import 'package:result_dart/src/result.dart';
import 'package:result_dart/src/unit.dart';
import 'package:vidooze_mobile/data/data_sources/firebase_app_data_source.dart';
import 'package:vidooze_mobile/data/data_sources/theme_data_source.dart';
import 'package:vidooze_mobile/data/repository/base_repository.dart';
import 'package:vidooze_mobile/domain/entity/theme_style/theme_style.dart';
import 'package:vidooze_mobile/domain/repository/app_repository.dart';
import 'package:vidooze_mobile/domain/repository/theme_repository.dart';

class ThemeRepositoryImpl extends BaseRepository implements ThemeRepository {
  final ThemeDataSource _themeDataSource;

  ThemeRepositoryImpl({
    required ThemeDataSource themeDataSource,
    required super.errorReportingDataSource,
  }) : _themeDataSource = themeDataSource;

  @override
  Future<Result<ThemeStyle, Unit>> fetchTheme() async {
    return await parseOrError(() async {
      final theme = await _themeDataSource.get();
      return switch (theme) {
        'light' => ThemeStyle.light(),
        'dark' => ThemeStyle.dark(),
        _ => ThemeStyle.system(),
      };
    });
  }

  @override
  Future<Result<Unit, Unit>> updateTheme(ThemeStyle style) async {
    return await parseOrError(() async {
      final theme = style.when(
        system: () => "system",
        light: () => "light",
        dark: () => "dark",
      );
      return await _themeDataSource.set(theme);
    });
  }
}
