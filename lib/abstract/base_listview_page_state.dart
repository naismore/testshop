import 'package:flutter/material.dart';
import 'package:flutter_1/abstract/base_page.dart';
import 'package:flutter_1/abstract/bloc/base_bloc.dart';

abstract class BaseListviewPage extends BasePage {
  const BaseListviewPage({
    super.key,
    super.title,
  });
}

abstract class BaseListviewPageState<T extends BaseListviewPage, B extends BaseBloc> extends BasePageState<T> {
  
}