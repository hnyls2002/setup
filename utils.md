### GPU Monitoring

```sh
pip install nvitop
```

### Fix Broken Pip

```sh
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
```

### Compatible Editable Mode

```sh
pip install -e ".[all]" --config-settings editable_mode=compat
```