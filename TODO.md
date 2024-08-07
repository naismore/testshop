Пробежаться по линтам

## Пагинация/динамическая подгрузка

На странице списка продуктов можно реализовать динамичесткую подгрузку. Количество элементов в таких списках может быть очень большим, поэтому получение и обработка всего списка из API может быть проблемой. Для получение порции продуктов в API обычно существуют поля offset и иногда limit.
Таким образом, если список проскролен почти до конца стоит начинать подгрузку следущией партии данных. Для того чтобы отследить такое поведение во Flutter есть множество возможностей, один из простых вариантов - использовать в списке ScrollController.

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

BasePageState вынести appbar, lead, action, scaffold

Для блоков базовый блок для списка, для 1 объекта, вынести обработку данных

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


Пример BaseListViewPageState
```dart
import 'package:flutter/material.dart';
import 'package:wts_test/abstract/base_page.dart';
import 'package:wts_test/abstract/bloc/base_bloc.dart';

abstract class BaseListviewPage extends BasePage {
  const BaseListviewPage({
    super.key,
    super.title,
  });
}

abstract class BaseListviewPageState<T extends BaseListviewPage,
    B extends BaseBloc> extends BasePageState<T> {
  final bool shouldBeRefreshable = false;
  final bool shouldBeSeparated = false;
  final ScrollController scrollController = ScrollController();

  late final B listModel = createModel();

  /// Переопределить для создания модели
  B createModel();

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    // TODO: Базовый event на загрузку данных блока
    // listModel.add(LoadProductList());
    super.initState();
  }

  void _onScroll() {
    if (!mounted) return;
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    }
  }

  void loadMore();

  @override
  Widget buildBody(BuildContext context) {
    final listViewBody = buildListViewBody(context);
    if (shouldBeRefreshable) {
      return RefreshIndicator(
        child: listViewBody,
        onRefresh: handleRefresh,
      );
    }
    return listViewBody;
  }

  @protected
  Widget buildListViewBody(BuildContext context) {
    if (shouldBeSeparated) {
      return ListView.separated(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        separatorBuilder: buildSeparator,
        itemCount: itemCount + 1,
        itemBuilder: (context, index) {
          if (index >= itemCount) {
            return const Center(child: CircularProgressIndicator());
          }
          return buildListItem(context, index);
        },
      );
    }
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index >= itemCount) {
          return const Center(child: CircularProgressIndicator());
        }
        return buildListItem(context, index);
      },
    );
  }

  @protected
  Widget buildListItem(BuildContext context, int index);

  @protected
  Future<void> handleRefresh();

  @protected
  Widget buildSeparator(BuildContext context, int index) {
    return const SizedBox(height: 16);
  }

  @protected
  int get itemCount;

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    listModel.close();
    super.dispose();
  }
}

```
