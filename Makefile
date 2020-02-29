.PHONY: bloop-test
bloop-test:
	bazel run //:bloop
	bloop run alpha_alpha
