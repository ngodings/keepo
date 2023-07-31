class TopMatch {
  TopMatch({
    this.jobs,
    this.top,
  });

  final String? jobs;
  final String? top;

  factory TopMatch.fromJson(Map<String, dynamic> json) => TopMatch(
        jobs: json["jobs"],
        top: json["top"],
      );

  Map<String, dynamic> toJson() => {
        "jobs": jobs,
        "top": top,
      };
}
