load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_import(
    name = "scala_logging",
    jars = [
        "//external:jar/com/typesafe/scala_logging/scala_logging_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/scala_lang:scala_reflect",
        "//3rdparty/jvm/org/slf4j:slf4j_api"
    ],
    visibility = [
        "//visibility:public"
    ]
)


