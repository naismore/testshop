part of '../view/categories_screen.dart';

GridView _buildGridView(CategoryLoaded state, BuildContext context) {
  //TODO: GridView.builder

  return GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: List.generate(
      state.categoriesList!.length,
      (i) => InkWell(
        onTap: () => Navigator.of(context).push(
          CategoriesRoutes.goodsListRoute(state.categoriesList![i].id),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Stack(
            children: [
              FadeInImage(
                placeholder:
                    const NetworkImage('https://via.placeholder.com/200'),
                image: NetworkImage(state.categoriesList![i].imageUrl!),
                fit: BoxFit.cover,
              ),
              Text(state.categoriesList![i].title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    ),
  );
}
