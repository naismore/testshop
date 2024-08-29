import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product/product.dart';
import 'package:flutter_app/repo/product/view/widgets/failure_loading_image_container.dart';

Widget productImageBuilder(BuildContext context, Product product) {
  return ExtendedImage(
    image: product.imageUrl != null
        ? ExtendedNetworkImageProvider(product.imageUrl!)
        : const NetworkImage('https://via.placeholder.com/200'),
    height: 200,
    width: 200,
    borderRadius: BorderRadius.circular(10),
    loadStateChanged: (ExtendedImageState state) {
      if (state.extendedImageLoadState == LoadState.failed) {
        return failureLoadingImageContainerBuilder(context);
      }
      return null;
    },
  );
}
