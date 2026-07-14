# Clean Code — measurable subset

## Names
- Reveal intent; pronounceable; no encoding types in names
- Domain language over technical noise

## Functions
- Do one thing; ≤20 lines; ≤2 indent levels
- ≤2 parameters (else options object)
- No flag arguments
- Prefer early return over deep nesting

## Comments
- Prefer clear code
- Comment **why**, invariants, workarounds, ADR links
- Never leave commented-out code

## Objects / modules
- SRP: one reason to change
- Small public surface
- Avoid god files (>500 lines)

## Errors
- Fail fast; no empty catch
- Meaningful errors at boundaries

## Tests
- F.I.R.S.T: Fast, Independent, Repeatable, Self-validating, Timely
- One behavior per test name
- Test behavior, not private implementation

Source spirit: Clean Code (Martin), applied as **limits** not taste debates.
