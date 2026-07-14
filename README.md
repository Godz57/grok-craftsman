# Grok Craftsman — quality enforcement lite for Grok Build

> Adaptado de [giovani-junior-dev/code-craftsman](https://github.com/giovani-junior-dev/code-craftsman) (Claude Code) para **Grok Build**.

**Always-on discipline** (quando ligado): TDD, Clean Code mensurável, flat-first, YAGNI, anti–LLM laziness, EARS, SPIKE protocol, checklist de conclusão.

Isto é a **fase lite** — manifesto + references + toggle. Não porta hooks Claude nem stack Biome/Stryker inteira. Quality gate Node fica no roadmap.

## Por que existe

LLMs sabem engenharia boa, mas tendem a **iterar** (resposta fraca → correção → tokens). Craftsman força disciplina **na primeira entrega**.

## Como se encaixa nos outros kits

| Kit | Papel |
|-----|--------|
| [grok-superpowers](https://github.com/Godz57/grok-superpowers) | Processo: design → plan → TDD → verify |
| [grok-loops](https://github.com/Godz57/grok-loops) | Autonomia: girar até check/goals |
| **grok-craftsman** | **Polícia de código:** o que é proibido / medido sempre |

## Install

```powershell
cd grok-craftsman
.\scripts\install.ps1            # global ~/.grok
.\scripts\install.ps1 -Project   # ./.grok do projeto
```

```bash
./scripts/install.sh
./scripts/install.sh project
```

## Uso

```
/craftsman-on
/craftsman-off
/craftsman-status
/craftsman-bypass <rule> <reason>
/code-craftsman          # carrega manifesto completo
```

Com craftsman **ON**, qualquer feature/código deve seguir as regras do skill (TDD, naming, flat-first, checklist).

## O que está na lite

| Incluído | Não incluso (ainda) |
|----------|---------------------|
| Skill always-on (se flag ON) | Hooks PreToolUse hard-block |
| Anti-patterns + Clean Code + arch | Biome/Stryker/Knip install automático |
| EARS + SPIKE + E2E ADR templates | Statusline Claude |
| Toggle on/off/status/bypass | Mutation coverage scripts multi-lang |
| Integração com superpowers/tdd | Ratchet baseline JSON full |

## Créditos

- Original: [code-craftsman](https://github.com/giovani-junior-dev/code-craftsman)  
- Influências: Clean Code, flat-first / YAGNI, caveman output, Superpowers TDD  
- Adaptação Grok: este repositório  

## License

MIT
