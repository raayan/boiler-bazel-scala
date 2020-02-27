load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library", "scala_binary", "scala_test")
scala_import(
    name = "akka_http",
    jars = [
        "//external:jar/com/typesafe/akka/akka_http_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_http_core"
    ],
    visibility = [
        "//visibility:public"
    ]
)



scala_import(
    name = "akka_http_core",
    jars = [
        "//external:jar/com/typesafe/akka/akka_http_core_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        ":akka_parsing"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



scala_import(
    name = "akka_parsing",
    jars = [
        "//external:jar/com/typesafe/akka/akka_parsing_2_12"
    ],
    runtime_deps = [
        "//3rdparty/jvm/org/scala_lang:scala_library"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


