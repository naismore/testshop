
# Общие моменты

Имена файлов snake_case

Использовать json_serializable  https://pub.dev/packages/json_serializable

Пробежаться по линтам

## Хранение ассетов

В проекте есть файл './lib/images/placeholder.svg'. Он не используется, но в целом ассеты обычно не размещаются в lib.
Обычно они должны находится в директории ./assets, также необходимо прописать путь к ним в блоке flutter/assets в pubspec.yaml
https://docs.flutter.dev/ui/assets/assets-and-images

## Навигация

Мы обычно не ис пользуем именованные роуты в проектах.
С ними легко ошибиться в нейминге роута и при чтении агрументов, а также они ограничены в настройках переходов и кастомизации роута,
например если мы хотим использовать RawDialogRoute вместо MaterialPageRoute для того,
чтобы было удобнее можно создать в features файлы <feature_name>/<feature_name>_routes.dart c геттаерами роута,
а затем использовать
```dart
Navigator.of(context).push(
  CategoriesRoutes.goodsListRoute(categoryId),
);
```

Пример роута
```dart
abstract final class CategoriesRoutes {

  static MaterialPageRoute<void> goodsListRoute(
    final int categoryId,
  ) =>
      MaterialPageRoute(
        builder: (final context) => GoodsListScreen(
          categoryId: categoryId,
        ),
      );
}



```

Пример такой навигации показал в файле categories_routes.dart и GoodsListScreen.

## Файлы с экспортами

Сейчас в директории проекта есть файлы с экспортами по типу lib/features/categories/view.dart.
Директивы library, part/part of, export могут использоваться для изоляции логики или названий из основного пространства имен проекта.
Однако сейчас в этом нет необходимости и только затрудняет восприятие. А все необходимые классы доступны в пространстве имен всего приложения.


## Пагинация/динамическая подгрузка

На странице списка продуктов можно реализовать динамичесткую подгрузку. Количество элементов в таких списках может быть очень большим, поэтому получение и обработка всего списка из API может быть проблемой. Для получение порции продуктов в API обычно существуют поля offset и иногда limit.
Таким образом, если список проскролен почти до конца стоит начинать подгрузку следущией партии данных. Для того чтобы отследить такое поведение во Flutter есть множество возможностей, один из простых вариантов - использовать в списке ScrollController.

## Разделение страницы и ее логики

Обычно логика работы с внешними данными отделяется от страницы.

Сейчас на страницах ProductScreen, GoodsListScreen, CategoriesScreen это реализовано с помощью FutureBuilder и вызова асинхронного коллбека в didChangeDependencies. У таких подходов есть несколько минусов - FutureBuilder не очень хорошо контролируется и достаточно узок с точки зрения вариантов использования. Например если нам необходимо перезагрузить страницу и догрузить на нее какие-то данные. didChangeDependencies Может вызываться многократно в приложении тогда, когда нам это не очень необходимо , например при смене темы приложения, открытие/закрытие клавиатуры и т.д. Ключевой проблемой является путаница в логике страницы, где смешана логика представления и данных.

Для решение этих проблем можно делегировать загрузку данных и сигнал на обновление виджетов внешнему классу.
// https://pub.dev/packages/provider вынести работу с данными в модель
Простым вариантом будет использовать для этого класс, наследованный от ValueNotifier/ChangeNotifier. Этот класс будет инициализироваться в initState(который вызывается единожды для State) стейта страницы.
В нем мы можем добавить метод на загрузку данных, после которого будет вызывться notifyListeners (в случае с ChangeNotifier). Для прослушивания изменений мы можем обернуть body страницы в ValueListenableBuilder/ListenableBuilder.


## BaseApi
```dart
abstract class BaseApi {
  late final dio = Dio(
    BaseOptions(
      baseUrl: buildUri(),
    ),
  );

  Future<Uri> buildUri({
    required String relativePath,
    Map<String, dynamic>? queryParameters,
  }) async {
    queryParameters ??= {};

    final uri =  Uri.http(
      apiUrlDomain,
      relativePath,
      queryParameters,
    );
    return uri;
  }

  
  Future<BaseApiResponse> sendGetRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
  // Get запрос
  // Базовый парсинг ответа сервера в BaseApiResponse
  // логику парсинга вынести в отдельный класс ApiResponseParser
  }
}
```


Забить если bloc
```dart
class ProductListModel extends ChangeNotifier {
  bool isLoading = true;
  // NewsApi get api => appModel.newsModule.api;
  List<Product> productList = [];

  PostListModel();

  Future<void> loadNextItems() async {
    final response = await api.loadList(
      offset: productList.length,
    );
    if (newsListResponse.isError) {
      BotToast.showText(text: newsListResponse.error!);
    } else {
      productList = newsListResponse.result!;
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
```


Базовый ответ api
```dart
/// Инкапсулирует ответ серверного API.
/// Содержит информацию:
/// - о результатах ответа запроса
/// - ошибки
/// - или разобранный JSON
/// Используется сугубо в [BaseApi]
class BaseApiResponse {
  ApiResponseMeta? meta;
  String? rawData;
  String? error;
  dynamic dataJson;

  BaseApiResponse({
    this.meta,
    this.rawData,
    this.error,
    this.dataJson,
  });

  bool get isError => error?.isNotEmpty ?? false;
}
```


Правки по CategoryApi
```dart
class CategoryApi {
  Future<ApiResponse<List<Category>>> getCategoryList() async {
    final response = await sendGetRequest('common/category/list');
    
    return ApiResponseParser.parseListFromResponse(
      response,
      key: 'categories',
      fromJson: Category.fromJson,
      emptyError: 'Данные не найдены',
    );
 }
```

Добавить ApiResponse
```dart
class ApiResponse<T> extends BaseApiResponse {
  T? result;

  ApiResponse({
    required BaseApiResponse baseApiResponse,
    this.result,
  }) : super(
          meta: baseApiResponse.meta,
          rawData: baseApiResponse.rawData,
          dataJson: baseApiResponse.dataJson,
          error: baseApiResponse.error,
        );

  ApiResponse.error({
    required String error,
    required BaseApiResponse baseApiResponse,
  }) : super(
          meta: baseApiResponse.meta,
          rawData: baseApiResponse.rawData,
          error: error,
        );
}
```

Парсер
```dart
class ApiResponseParser {
  /// Парсинг списка объектов из результата выполненного запроса к API.
  static ApiResponse<List<T>> parseListFromResponse<T>(BaseApiResponse response, {
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
    String? emptyError,
  }) {
    // Весь парсинг можно обернуть в try catch
    // Если ошибка в response вернуть  ApiResponse.error(
    // Если по ключу key нет данных
    // Дальше парсинг списка
    // final list = (jsonData as List).map((e) => fromJson(e)).toList();
    // Вернуть ApiResponse result
  }

  /// Парсинг одного объекта из результата выполненного запроса к API.
  static ApiResponse<T> parseObjectFromResponse<T>(BaseApiResponse response, {
    required T Function(Map<String, dynamic>) fromJson,
    String? key,
    String? emptyError,
  }) {
    // По аналогии
    // final object = fromJson(jsonData);
  }
}
```

Для отображения ошибок bot_toast: ^4.1.3


Картинки вынести обработку, использовать extended_image: ^8.2.1