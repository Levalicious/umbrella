# umbrella

The Eezo workspace: [libeezo](https://github.com/Levalicious/libeezo) (runtime library),
[eezo](https://github.com/Levalicious/eezo) (evaluator), [eezoc](https://github.com/Levalicious/eezoc) (compiler),
[eezott](https://github.com/Levalicious/eezott) (typed front end) and [stdlib](https://github.com/Levalicious/stdlib)
as submodules, side by side: the layout their mkfiles and test scripts assume (`../libeezo`, `../eezo`, ...).

    git clone --recurse-submodules https://github.com/Levalicious/umbrella
    mk            # everything, dependencies first
    mk test       # every suite
    mk install    # binaries and the stdlib under $PREFIX ($HOME/.local by default)

Needs `mk` and `toposort` on the PATH and `MKROOT`, `objtype` in the environment: the
[mk](https://github.com/Levalicious/mk) and [mkroot](https://github.com/Levalicious/mkroot) repositories
(`make install` in mk; point `MKROOT` at a checkout of mkroot, or install it to `/usr/share/mk`).

The submodule commits are the integrated set. Each repository also pins its own dependencies in its `deps.lock` for
its CI: a dependant fetches the versions it pinned, nothing else. Moving the workspace forward is bumping submodules
here and pins there, ordinary commits both.
