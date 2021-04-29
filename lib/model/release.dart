class Release {
  final String id;
  final String name;
  final String creator;
  final String version;
  final String builddate;
  final String description;
  final String url;
  final String image;
  final String picture;

  const Release(
      {this.id,
      this.name,
      this.creator,
      this.version,
      this.builddate,
      this.description,
      this.url,
      this.image,
      this.picture});
}

List<Release> releases = [
  const Release(
      id: "1",
      name: "Pojav Launcher (Full)",
      creator: "PojavLauncherTeam",
      version: "v3.3.1.1",
      builddate: "2021-01-26",
      description:
          "A Minecraft: Java Edition Launcher for Android based on Boardwalk. Note that v2 will not able to run Minecraft 1.12+.",
      url:
          "https://github.com/PojavLauncherTeam/PojavLauncher/releases/download/v3.3.1.1/app-debug.apk",
      image: "Assets/Images/icon_launcher.png",
      picture: "https://i.imgur.com/cJEu2yG.png"),
  const Release(
      id: "2",
      name: "Pojav Launcher (No-Runtime)",
      creator: "PojavLauncherTeam",
      version: "v3.3.1.1",
      builddate: "2021-01-26",
      description:
          "A Minecraft: Java Edition Launcher for Android based on Boardwalk. Note that v2 will not able to run Minecraft 1.12+.",
      url:
          "https://github.com/PojavLauncherTeam/PojavLauncher/releases/download/v3.3.1.1/app-debug-noruntime.apk",
      image: "Assets/Images/icon_launcher2.png",
      picture: "https://i.imgur.com/cJEu2yG.png"),
];
