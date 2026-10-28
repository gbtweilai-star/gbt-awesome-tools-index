# awesome_tools_index

**One capability bit from GBT V8, packaged standalone.** No. 310 of 341,
`tools` domain (Tools).

<p>
<img alt="python" src="https://img.shields.io/badge/python-3.9%2B-blue">
<img alt="license" src="https://img.shields.io/badge/license-MIT-green">
<img alt="deps" src="https://img.shields.io/badge/runtime%20dependencies-0-brightgreen">
</p>

> Awesome Tools 蒸馏索引（只读骨架·地图）：四原语 INDEX/LOOKUP/MAP/VERIFY；三条带牙判据（**索引只读** index_not_readonly / **映射可追** map_without_source / **未核实不标绿** unverified_green）+ 五条红线（只读/映射带出处/未核实不标绿/只引用不复制/不绕官方入口）；主人明确配对的六个重点工具（CC Switch→auto_switch · MoneyPrinterTurbo/Huobao Drama/LocalMiniDrama→video_pipeline · CowAgent→im_multiplex · OpenClaw Monitor→god_view）**全部 unverified（盘上 0 命中）**；仓库内容未取证 ⇒ 索引池为空且**不编**；type=external

That description is copied verbatim from the registry. `tests/test_spec.py` pins it,
so documentation drift fails the build instead of shipping quietly.

## What this package actually is

It is the **contract** for one capability: its name, its parameters, the values it
accepts, and whether it can change state that cannot be restored. It is not the
implementation — that lives in the runtime this bit was extracted from.

So `run()` goes through a narrow `Backend` protocol, and the default backend is a
stub that **says so**:

```
status="validated"   backend="stub"   data={"executed": false}
```

Never `status="ok"`. A stub that reports success is worse than no stub, because the
caller stops looking for the real thing.

## Install

```bash
git clone https://github.com/gbtweilai-star/gbt-awesome-tools-index.git
cd gbt-awesome-tools-index
python -m pip install -e ".[dev]"
```

## Use

```bash
python -m gbt_awesome_tools_index info                  # capability card
python -m gbt_awesome_tools_index spec --json           # machine-readable contract
python -m gbt_awesome_tools_index check --payload '{}'
python -m gbt_awesome_tools_index run   --payload '{}'
```

Real `info` output from this machine:

```text
awesome_tools_index  (tools)  v1.0.0
----------------------------------------
Awesome Tools 蒸馏索引（只读骨架·地图）：四原语 INDEX/LOOKUP/MAP/VERIFY；三条带牙判据（**索引只读** index_not_readonly / **映射可追** map_without_source / **未核实不标绿** unverified_green）+ 五条红线（只读/映射带出处/未核实不标绿/只引用不复制/不绕官方入口）；主人明确配对的六个重点工具（CC Switch→auto_switch · MoneyPrinterTurbo/Huobao Drama/LocalMiniDrama→video_pipeline · CowAgent→im_multiplex · OpenClaw Monitor→god_view）**全部 unverified（盘上 0 命中）**；仓库内容未取证 ⇒ 索引池为空且**不编**；type=external

gated      : False
external   : False
multi-op   : False
params     : (none)
```

Wire a real implementation:

```python
from gbt_awesome_tools_index import run

class MyBackend:
    name = "my-backend"
    def invoke(self, cap, payload):
        return {"cap": cap, "handled": sorted(payload)}

result = run({}, backend=MyBackend())
assert result.status == "ok"
```

## Parameters

| name | required | notes |
|---|---|---|
| — | no | the registry declares no required parameters |

Registry hint (`params_hint`): (empty)

Types are deliberately absent: the registry does not declare them, and an invented
type is worse than no type, because callers believe it.

## Boundaries

- Not gated: the registry marks this bit `safe: true`.
- No external service dependency declared.
- Single-action bit.
- No implementation ships here. Bring a backend; the protocol is one method.

## What this is not

Not a wrapper around a hosted API. Not a model. Not a promise that calling it does
anything on its own. It is the typed seam plus the validation, which is the part that
stays correct even when the implementation changes.

## Tests

```bash
python -m pytest
```

```text
20 passed, 3 skipped in 0.13s
```

## Provenance

| field | value |
|---|---|
| capability | `awesome_tools_index` |
| domain | `tools` |
| handler | `awesome_tools_index` |
| safe | `True` (gated = `False`) |
| external | `False` |
| atlas page | [tools/awesome_tools_index](https://github.com/gbtweilai-star/gbt-caps/blob/main/caps/tools/awesome_tools_index.md) |
| full index | [https://github.com/gbtweilai-star/gbt-caps](https://github.com/gbtweilai-star/gbt-caps) |

The parent README says 348 capabilities; an AST pass over the registry enumerates
`341 + 0 unimplemented + 0 disabled = 341`. The extra 7 are historical duplicates.
Numbering here follows 341 and matches the `gbt-caps` index one-to-one.

## License

MIT.
