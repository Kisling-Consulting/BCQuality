---
bc-version: [all]
domain: style
keywords: [documentation, header, comment, region, endregion, feature-number, pte, appsource, tableextension, pageextension]
technologies: [al, javascript, css]
countries: [w1]
application-area: [all]
---

# Every new or changed AL object needs a KC feature header and feature regions

## Description

KC internal policy for feature traceability in every new or changed AL object
(table, page, codeunit, report, enum, extension objects, permission sets) and
associated JavaScript/CSS. Review it for any AL change, including changed
comments, `#region`/`#endregion` directives, and new procedures or fields.
This is organization policy, not a Microsoft platform requirement.
The same feature has different notation in PTE and AppSource projects.

## Best Practice

- Resolve the consuming project's profile from its local
  `.github/copilot-instructions.md` explicit project kind and/or effective AL-Go
  Settings `type`: `PTE` or `AppSource App`. Resolve applicable settings and
  overrides, not just the first settings file found. In multi-app repositories,
  resolve the profile for each app. Never infer it from object prefixes, ID
  ranges, repository/file names, or an example's notation.
- If those sources are missing, ambiguous, or contradictory, ask for clarification
  interactively; otherwise report the uncertainty/conflict and the unevaluated
  profile-dependent checks. Do not guess or silently choose one source.
- PTE feature 2 is `I002`; AppSource feature 2 is `002`. Pad to three digits
  (without truncating larger numbers). PTE example: `I755 "Enhance sales order page"`;
  AppSource example: `755 "Enhance sales order page"`.
- Use a simple `/*` block containing only one feature-number plus quoted title
  per line, closed by `*/`, near the start of the object. Placement as the first
  item inside its body is valid; a copyright/project/module frame is not required
  and must not be generated.
- Keep entries unique and strictly ascending by numeric value, including the
  feature that introduced the object. Keep an existing entry unchanged when
  its feature is already listed; add the appropriate regions for new code only.
  Do not invent a feature number or title when the request/history lacks it.
- When a header is touched, remove a legacy copyright/project/module frame,
  authors, dates, and change descriptions without losing original feature numbers
  or titles. Preserve the original feature identity while normalizing the
  profile notation if necessary. Do not rewrite an untouched legacy header.
- AL uses matching `#region I755` / `#endregion I755` in PTE and
  `#region 755` / `#endregion 755` in AppSource. Each logical addition has a
  matching pair; related additions for one feature may share a pair.
- For a newly introduced non-extension object, open its original feature region
  after the object declaration and before `{`, and close it after the final `}`.
  Later changes get inner feature regions while preserving that original outer
  region. Do not mistake a newly added member of an existing object for a new
  object.
- Extension objects, including `tableextension`, `pageextension`, `enumextension`,
  `reportextension`, and `permissionsetextension`, have no outer feature region.
  Put regions around additions/modifications inside the object. Keep structural
  clauses such as `addafter`, `addbefore`, and `modify` outside the regions.
- JavaScript uses comment directives `//#region I755` / `//#endregion I755`
  (or `755` for AppSource), with the same feature association and logical scope.
  CSS, when touched, uses valid CSS comments such as `/* #region I755 */` and
  `/* #endregion I755 */`; never insert raw AL directives or JavaScript `//`
  comments into CSS. Do not transplant AL object braces into JavaScript/CSS.
- Apply this policy to the supplied changes, not unrelated legacy code. For a
  diff, inspect unchanged surrounding source only to understand placement/history.
  A file/folder review without a baseline cannot prove a historical deletion or
  whether an object was newly introduced; report that limitation instead.
- Documentation-only objects and permission sets do not gain a special exemption:
  use the applicable object/extension shape and established project policy.
  Do not invent unrelated exceptions or demand business logic in such objects.
  For generation/editing, apply the same policy to new or touched code and then
  review it. This article does not centralize field IDs, prefixes, or general BC
  coding rules.

## Anti Pattern

Guessing the profile; mixing `Ixxx` and `xxx`; unsorted/duplicate entries; changing
an existing title; dropping the introducing feature; adding dates or framed
headers; moving a new object's opening region before its declaration or inside
its body; closing it before its final brace; wrapping an extension object or
its structural clauses; unmatched feature regions; broad cleanup of untouched
headers. Do not flag required feature metadata as a redundant explanatory comment.

## Samples

[`kc-documentation-headers-and-regions.good.al`](kc-documentation-headers-and-regions.good.al)
uses the PTE profile (`Ixxx`); AppSource uses the same shapes without `I`.
The Anti Pattern list replaces a bad sample: a paired good/bad sample would
require upstream evaluation fixtures outside `custom/`.
