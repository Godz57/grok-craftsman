# LLM laziness guard

Models often:

1. Ship a **minimal weak** first answer  
2. Wait for corrections  
3. Iterate (more tokens)

Craftsman forces **best known craft up front**.

## Self-questions before proposing code

| Question | If no |
|----------|--------|
| Is there a failing test first? | Write RED test |
| Is this the simplest design that works? | Delete speculative layers |
| Would a junior maintain this file size? | Split / flatten |
| Am I naming by role (`Manager`) or domain? | Rename to domain |
| Is this interface earning a second impl? | Delete interface |
| Did I run project checks and echo output? | Run them |

## Red flags mid-session

- “Quick hack then clean later”  
- “Tests after it works”  
- “Just a Manager for now”  
- “Clean Arch so it’s enterprise-ready” without adapters  
- Plan with 0 EARS and 0 test matrix  

## Response when user pushes bad pattern

Push back once with a concrete alternative (flat module + TDD). If user overrides → `/craftsman-bypass` or document ADR; do not silent-violate.
