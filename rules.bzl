def _rule10_impl(ctx):
    default_output_file = ctx.actions.declare_file("rule10_default_output_file") 
    ctx.actions.write(output = default_output_file, content = 'dummy content')
    output_file_1 = ctx.actions.declare_file("rule10_output_file_1") 
    ctx.actions.write(output = output_file_1, content = 'dummy content')
    output_file_2 = ctx.actions.declare_file("rule10_output_file_2") 
    ctx.actions.write(output = output_file_2, content = 'dummy content')

    return [
        DefaultInfo(files = depset([default_output_file])),
        OutputGroupInfo(
            group1 = depset([output_file_1]),
            group2 = depset([output_file_2]),
        )
    ]
 
rule10 = rule(
    implementation = _rule10_impl,
)

def _rule11_impl(ctx):
    default_output_file = ctx.actions.declare_file("rule11_default_output_file") 
    ctx.actions.write(output = default_output_file, content = 'dummy content')
    output_file_1 = ctx.actions.declare_file("rule11_output_file_1") 
    ctx.actions.write(output = output_file_1, content = 'dummy content')
    output_file_2 = ctx.actions.declare_file("rule11_output_file_2") 
    ctx.actions.write(output = output_file_2, content = 'dummy content')

    return [
        DefaultInfo(files = depset([default_output_file])),
        OutputGroupInfo(
            group1 = depset([output_file_1]),
            group2 = depset([output_file_2]),
        )
    ]
 
rule11 = rule(
    implementation = _rule11_impl,
)

def _rule20_impl(ctx):
    files = []
    g1_files = []
    for target in ctx.attr.srcs:
        files.extend(target.files.to_list())
        g1_files.extend(target[OutputGroupInfo].group1.to_list())

    return [
        DefaultInfo(files = depset(files)),
        OutputGroupInfo(
            g1 = depset(g1_files),
        )
    ]

rule20 = rule(
    implementation = _rule20_impl,
    attrs = {
        "srcs": attr.label_list(mandatory = True),
    },
)