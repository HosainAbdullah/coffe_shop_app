import 'package:coffe_shop_app/constants/path_const/assets_list.dart';
import 'package:coffe_shop_app/constants/path_const/local_path.dart';
import 'package:coffe_shop_app/features/start/data/datasources/onboarding_model.dart';

final List<OnboardingModel> onboarding = [
  OnboardingModel(
    title: 'onboardingTitleOne',
    subtitle: "onboardingSubTitleOne",
    imageAsset: AssetsPath.assetsImages + AssetsListName.onboardingImage[0],
  ),
  OnboardingModel(
    title: 'onboardingTitleTwo',
    subtitle: 'onboardingSubTitleTwo',
    imageAsset: AssetsPath.assetsImages + AssetsListName.onboardingImage[1],
  ),
  OnboardingModel(
    title: 'onboardingTitleThree',
    subtitle: 'onboardingSubTitleThree',
    imageAsset: AssetsPath.assetsImages + AssetsListName.onboardingImage[2],
  ),
];
