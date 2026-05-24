enum AppIcons {
  home({IconStyles.bold, IconStyles.bulk});

  final Set<IconStyles> supportedStyles;

  const AppIcons(this.supportedStyles);

  String path([IconStyles style = IconStyles.bold]) =>
      supportedStyles.contains(style)
      ? 'assets/icons/$style/$name.svg'
      : 'assets/icons/bold/$name.svg';
}

enum IconStyles { bold, bulk }
