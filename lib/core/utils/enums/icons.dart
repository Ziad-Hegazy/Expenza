enum AppIcons {
  home({IconStyles.bold, IconStyles.bulk}),
  show({IconStyles.bulk}),
  hide({IconStyles.bulk}),
  google_logo({IconStyles.bold});
  final Set<IconStyles> supportedStyles;

  const AppIcons(this.supportedStyles);

  String path([IconStyles style = IconStyles.bulk]) =>
      supportedStyles.contains(style)
      ? 'assets/icons/${style.name}/$name.svg'
      : 'assets/icons/${supportedStyles.first.name}/$name.svg';
}

enum IconStyles { bold, bulk }
