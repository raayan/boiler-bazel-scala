# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.typesafe.akka:akka-http-core_2.12:10.1.7", "lang": "scala", "sha1": "f6d11d6c6789e764826dad8bfd630dc11682cf96", "sha256": "fbf129714858d186c5ef03d62776d9a778efc5ebd00ebc041074873e83c846e6", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/akka/akka-http-core_2.12/10.1.7/akka-http-core_2.12-10.1.7.jar", "source": {"sha1": "861179936cf0e53e4ef2f3533f1b8f5b900847d9", "sha256": "39221bfa69c52acbd2208b66195ba7bbbf96018c4b45e0e6d7796af20fb98252", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/akka/akka-http-core_2.12/10.1.7/akka-http-core_2.12-10.1.7-sources.jar"} , "name": "com_typesafe_akka_akka_http_core_2_12", "actual": "@com_typesafe_akka_akka_http_core_2_12//jar:file", "bind": "jar/com/typesafe/akka/akka_http_core_2_12"},
    {"artifact": "com.typesafe.akka:akka-http_2.12:10.1.7", "lang": "scala", "sha1": "1e1da334190f30dc151d4ff6b8600704debca75d", "sha256": "a48bc25e3fdf3ccbc3230bf32fc9f825825fd9d15410ab0742f5469638d6c370", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/akka/akka-http_2.12/10.1.7/akka-http_2.12-10.1.7.jar", "source": {"sha1": "66ff5734e2d803d7c5a006c4d93cb260650ec770", "sha256": "9a1828e37b089a3b4c5e84a9bfa73bd27f586ec17b16d1455f6c3124328bc9e7", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/akka/akka-http_2.12/10.1.7/akka-http_2.12-10.1.7-sources.jar"} , "name": "com_typesafe_akka_akka_http_2_12", "actual": "@com_typesafe_akka_akka_http_2_12//jar:file", "bind": "jar/com/typesafe/akka/akka_http_2_12"},
    {"artifact": "com.typesafe.akka:akka-parsing_2.12:10.1.7", "lang": "scala", "sha1": "513c0f1772213e3e8ed4f18d35a4843398e961c7", "sha256": "215f0152f61231bbff8d4a236d79ded7caab6b70521116c50505b63c69a273cd", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/akka/akka-parsing_2.12/10.1.7/akka-parsing_2.12-10.1.7.jar", "source": {"sha1": "d374e9287d53c4037a92e64b8ab65af2da367d98", "sha256": "795a810325487d2efdc459e6ec7ee2e4d270819fe577b2f714e51e85bd58c73d", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/akka/akka-parsing_2.12/10.1.7/akka-parsing_2.12-10.1.7-sources.jar"} , "name": "com_typesafe_akka_akka_parsing_2_12", "actual": "@com_typesafe_akka_akka_parsing_2_12//jar:file", "bind": "jar/com/typesafe/akka/akka_parsing_2_12"},
    {"artifact": "com.typesafe.scala-logging:scala-logging_2.12:3.9.0", "lang": "scala", "sha1": "b6c6bb584f3e5c2d3f20aa7c8ff3e6959870b13c", "sha256": "58073c9891e26b99a12c1b501754d8447897913e023fdd37765b58e6377408bc", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/scala-logging/scala-logging_2.12/3.9.0/scala-logging_2.12-3.9.0.jar", "source": {"sha1": "91387647fa19f1db2adf8c3aee8a3c0dee5d7aa7", "sha256": "91dfdbe8217415b22fdca6df172fd00ade87768061b4115cf97719316ebb3720", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/typesafe/scala-logging/scala-logging_2.12/3.9.0/scala-logging_2.12-3.9.0-sources.jar"} , "name": "com_typesafe_scala_logging_scala_logging_2_12", "actual": "@com_typesafe_scala_logging_scala_logging_2_12//jar:file", "bind": "jar/com/typesafe/scala_logging/scala_logging_2_12"},
    {"artifact": "joda-time:joda-time:2.10.4", "lang": "java", "sha1": "8c10bb8815109067ce3c91a8e547b5a52e8a1c1a", "sha256": "ac6fda8989775776f428df8b5a4517cdb06d923465abf9bda0746ec07dfcc657", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/joda-time/joda-time/2.10.4/joda-time-2.10.4.jar", "source": {"sha1": "4001d385e8be893bc4b82cd0091f79a9ac5976dc", "sha256": "3710abce08f9192e603c277faa4120ea13af8a890a46640ccbd3ae76ff16d6ff", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/joda-time/joda-time/2.10.4/joda-time-2.10.4-sources.jar"} , "name": "joda_time_joda_time", "actual": "@joda_time_joda_time//jar", "bind": "jar/joda_time/joda_time"},
    {"artifact": "org.scalactic:scalactic_2.12:3.0.8", "lang": "scala", "sha1": "b50559dfc4a691c1089f9c8812e1d6fd17f80277", "sha256": "5f9ad122f54e9a0112ff4fcaadfb2802d8796f5dde021caa4c831067fca68469", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.12/3.0.8/scalactic_2.12-3.0.8.jar", "source": {"sha1": "a3b6cb34439f6b0ddbecb83a22eb5add030a1fdb", "sha256": "b591d7eea2955ef9b78fe60e7ebd109aa239ae67103396a9449dfb549daba74a", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.12/3.0.8/scalactic_2.12-3.0.8-sources.jar"} , "name": "org_scalactic_scalactic_2_12", "actual": "@org_scalactic_scalactic_2_12//jar:file", "bind": "jar/org/scalactic/scalactic_2_12"},
    {"artifact": "org.scalatest:scalatest_2.12:3.0.8", "lang": "scala", "sha1": "8493ffa579676977b810a7a9fdc23af9d3c8af7f", "sha256": "a4045cea66f3eaab525696f3000d7d610593778bd070e98349a7066f872844cd", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.12/3.0.8/scalatest_2.12-3.0.8.jar", "source": {"sha1": "974583d0b274d44fa2f4c619b4a2c0d3c6fadad9", "sha256": "f23da5f345251f6b8bee14a458ecbd92f04d7aa034da2909c3b1e8edde70d7bf", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.12/3.0.8/scalatest_2.12-3.0.8-sources.jar"} , "name": "org_scalatest_scalatest_2_12", "actual": "@org_scalatest_scalatest_2_12//jar:file", "bind": "jar/org/scalatest/scalatest_2_12"},
    {"artifact": "org.slf4j:slf4j-api:1.7.25", "lang": "java", "sha1": "da76ca59f6a57ee3102f8f9bd9cee742973efa8a", "sha256": "18c4a0095d5c1da6b817592e767bb23d29dd2f560ad74df75ff3961dbde25b79", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar", "source": {"sha1": "962153db4a9ea71b79d047dfd1b2a0d80d8f4739", "sha256": "c4bc93180a4f0aceec3b057a2514abe04a79f06c174bbed910a2afb227b79366", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25-sources.jar"} , "name": "org_slf4j_slf4j_api", "actual": "@org_slf4j_slf4j_api//jar", "bind": "jar/org/slf4j/slf4j_api"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
