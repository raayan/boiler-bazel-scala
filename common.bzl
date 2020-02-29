def scaffold_intellij(ctx):
    print("intellij", ctx, ctx.label, ctx.features)

    out_file = ctx.actions.declare_file("%s.size" % ctx.attr.name)

    targets = ctx.actions.run_shell(
        outputs = [out_file],
        command = "bazel query kind\(scala_library, //...\)",
    )

    return [DefaultInfo(files = depset([out_file]))]

make_intellij = rule(
    implementation = scaffold_intellij,
)
