# The Eezo workspace: the runtime library (libeezo), evaluator (eezo), compiler (eezoc), typed front end (eezott) and
# standard library (stdlib) as submodules, side by side - the layout their mkfiles and test scripts assume (../libeezo, ...).
# The submodule commits are the integrated set: each repository also pins its own dependencies (deps.lock) for its CI.
#
#   git submodule update --init      after cloning
#   mk            build everything, dependencies first
#   mk test       build, then run every suite
#   mk install    install the binaries and the stdlib under $PREFIX (the proto's $HOME/.local by default)
#   mk clean

DIRS=libeezo eezo eezoc eezott stdlib

all:V:
	for d in $DIRS; do (cd $d && mk all) || exit 1; done

test:V: all
	for t in eezoc/tests/e2e.sh eezoc/tests/modes.sh eezoc/tests/gc_regress.sh eezoc/tests/io.sh eezoc/tests/xbcl.sh eezott/tests/eezott.sh; do bash $t || exit 1; done

install:V: all
	for d in $DIRS; do (cd $d && mk install) || exit 1; done

clean:V:
	for d in $DIRS; do (cd $d && mk clean) || exit 1; done
