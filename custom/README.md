# Custom layer

This folder is the template for partner- and customer-specific overrides. Use it to add knowledge and skills that apply to your organization but are not appropriate for the shared Microsoft or Community layers.

## Structure

```
custom/
├── knowledge/    # Your organization's knowledge files (same format as /microsoft/knowledge/)
└── skills/       # Your organization's action skills
```

## How to use

Use a fork or organization-controlled copy of BCQuality, not the upstream
repository or your AL app's source folder. Confirm `git remote get-url origin`
points at your repository before adding custom content. Upstream does not
accept custom rules.

Follow [Customizing BCQuality](../docs/customizing-bcquality.md) for a worked
rule, plugin configuration, installing your fork, and keeping it up to date.
Adding a rule here does not update an existing upstream plugin installation;
your host must consume your copy.

Knowledge files follow [READ](../skills/read.md) and action skills follow
[DO](../skills/do.md). With the Custom layer enabled, applicable custom
knowledge overrides contradictory Community or Microsoft guidance. The report
records the displaced article; non-conflicting guidance remains additive.

## KC internal documentation

This organization-controlled copy ships one canonical policy:
[`knowledge/style/kc-documentation-headers-and-regions.md`](knowledge/style/kc-documentation-headers-and-regions.md).
It covers PTE/AppSource feature headers and regions, not field numbering,
prefixes, or general BC conventions. Consuming project instructions declare
the project kind; they should link here rather than maintain another rule copy.

Only this `custom/` folder is KC-owned. Everything outside it is synchronized
from upstream BCQuality and must not be changed in this fork; upstream syncs
would overwrite such edits.

The shared `al-style-review` consumes every `style` article of all enabled
layers, so AL-Go reviews with `enabledLayers` containing `custom` evaluate this
article without a custom skill. No same-ID skill override is shipped, because
upstream contract tests assume `custom/skills` holds no `al-style-review`.

Focused documentation authoring/review and project-profile routing live in the
KC agent harness (`kc-documentation` skill in
[KCAgentHarness](https://github.com/Kisling-Consulting/KCAgentHarness)), which
reads this article as its only policy source.

AL-Go's `BCQuality.version` selects a released tag. Publish a new tag of this
fork after changing custom content, then raise the consumer pin.
