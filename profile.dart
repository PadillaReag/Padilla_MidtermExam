class MyProfile {
  // --- Bio (UI/UX-focused) ---
  static const bio = """
I’m a UI/UX-focused designer who turns rough concepts into testable, delightful interfaces. 
I work with wireframes, prototypes, and design systems, validating ideas through quick usability checks. 
I collaborate closely with devs, write clear specs, and iterate using feedback and analytics.
""";

  // --- Skills ---
  static const skills = <String>[
    "UI/UX Design",
    "Wireframing & Prototyping",
    "Design Systems",
    "Usability Testing",
    "Interaction Design",
    "3D Modeling",
  ];

  // --- Game Projects (sample placeholders — replace links) ---
  static const gameProjects = <GameProject>[
    GameProject(
      title: "Neon Runner (Prototype)",
      blurb: "Endless runner with neon HUD and haptics. Unity UI Toolkit.",
      link: "https://example.com/neon-runner",
    ),
    GameProject(
      title: "Pixel Quest Menu Revamp",
      blurb: "Reworked settings & inventory for faster task completion.",
      link: "https://example.com/pixel-quest",
    ),
    GameProject(
      title: "Boss Arena HUD",
      blurb: "Accessible color palette + cooldown rings for clarity.",
      link: "https://example.com/boss-arena",
    ),
  ];

  // --- Contacts ---
  static const phone = "09496048427";

  // --- enail ---
  static const email = "rpadilla_220000001501@uic.edu.ph";
}

class GameProject {
  final String title;
  final String blurb;
  final String link;
  const GameProject({
    required this.title,
    required this.blurb,
    required this.link,
  });
}
