# Anti-patterns — BLOCK

## Naming
- Generic: `Manager`, `Processor`, `Handler`, `Util`, `Helper`, domain-less `Service`
- Prefixes: `IRepository`, `m_var`, Hungarian
- Redundant suffixes: `NameString`, `UserData`, `OrderInfo`
- Lone letters outside short loops: `d`, `tmp`, `obj`

## Functions
- Boolean flag parameter → split into two functions
- Output args (mutate input) → return new value
- 3+ parameters without object
- Function >20 lines; indent >2 levels

## Architecture
- Interface without 2nd real implementation
- UseCase for simple CRUD
- Multi-layer DTO/Mapper without pain
- Preventive dependency inversion
- Cross-domain imports
- Ritual Clean Architecture / CQRS/Event Sourcing for simple CRUD

## Tests
- Production code without prior test (non-SPIKE)
- Multiple unrelated asserts; `if`/`switch` in test
- `.only` / `.skip` in commit
- Excessive mocking (>3); snapshot >50 lines without need
- Tests after code (timely violation); over-mock implementation coupling

## Comments
- Commented-out code; redundant WHAT comments; git history as comments
- Comments without WHY; false/outdated comments

## General
- Magic numbers; large switch without polymorphism
- Law of Demeter `a.b().c().d()`; duplication
- Empty catch; Promise without await without reason
- `console.log` in production; TODO without issue

## LLM-specific
- Made-up names; over-complex patterns for simple systems
- Multiple half-solutions instead of one
- Pseudocode when real code fits
- “// add error handling” stubs; try/catch that only rethrows
