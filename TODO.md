Пробежаться по линтам

## Пагинация/динамическая подгрузка

На странице списка продуктов можно реализовать динамичесткую подгрузку. Количество элементов в таких списках может быть очень большим, поэтому получение и обработка всего списка из API может быть проблемой. Для получение порции продуктов в API обычно существуют поля offset и иногда limit.
Таким образом, если список проскролен почти до конца стоит начинать подгрузку следущией партии данных. Для того чтобы отследить такое поведение во Flutter есть множество возможностей, один из простых вариантов - использовать в списке ScrollController.

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

Дропнуть стейты продукты категории тд. Сделать базовые да generic`ах

BasePageState вынести appbar, lead, action, scaffold

Для блоков базоый блок для списка, для 1 объекта, вынести обработку данных

Форматирование

Для списков вынести в базовый дублирование 
```dart
       ListView.separated(
            itemCount: state.productsList!.length,
            separatorBuilder: (final context, final index) => const Divider(),
            itemBuilder: buildListItem(context, index)
        );
```

На экране оставить ProductTile(product: product);

```dart
  @override
  Widget buildListItemImpl(BuildContext context, int index) {
    return ProductTile(product: product);
  }
  ```

