import sys, os, importlib.util

try:
    import truststore

    truststore.inject_into_ssl()
except ImportError:
    pass  # truststore not installed in this env, skip silently

_self = os.path.abspath(__file__)
for _path in sys.path:
    _candidate = os.path.join(_path, "sitecustomize.py")
    if os.path.isfile(_candidate) and os.path.abspath(_candidate) != _self:
        try:
            spec = importlib.util.spec_from_file_location(
                "_chained_sitecustomize", _candidate
            )
            mod = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(mod)
        except Exception as e:
            sys.stderr.write(f"chained sitecustomize {_candidate} failed: {e}\n")
        break  # mimics Python's "first wins" behavior; remove if you want all of them
