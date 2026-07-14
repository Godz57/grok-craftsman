# Architecture rules — flat-first

## Order of preference

### 1. Modular monolith
- Folders by **domain**: `billing/`, `orders/`, `identity/`
- Each module owns its model
- No direct imports of another module’s internals (use explicit API/facade if needed)

### 2. Flat design inside a module
Typical small surface:
- input (HTTP/CLI/queue adapter)
- logic (pure-ish domain/application)
- persistence (db)

No ceremony: no UseCase/Port/Adapter/Mapper until pain is real.

### 3. Abstract only by pain
- Swapped this dependency in last 2 years? No → don’t abstract
- Second real implementation? Yes → extract interface
- External bad contract? → Anti-Corruption Layer

## Boundaries
- Prefer dependency direction: outer → inner, never domain → framework guts without need
- Shared kernel only for truly shared primitives (ids, money) — not dump folder

## When Clean Architecture *is* OK
- Multiple adapters already exist or are scheduled
- Team/platform mandates clear ports for a **stable** core
- Not for first CRUD of a greenfield todo app
