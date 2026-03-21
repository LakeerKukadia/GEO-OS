# GEO-OS

> Open-source GEO audit and solutions pipeline for agencies. Automatically audits any website for AI search visibility and generates client-ready deliverables — powered by Claude Code and Paperclip.

![License: MIT](https://img.shields.io/badge/license-MIT-blue)
![Built with Claude](https://img.shields.io/badge/built%20with-Claude%20Code-purple)
![Powered by Paperclip](https://img.shields.io/badge/orchestrated%20by-Paperclip-orange)

---

## What is GEO-OS?

GEO (Generative Engine Optimisation) is the emerging discipline of optimising websites for AI-powered search engines — ChatGPT, Perplexity, Claude, Gemini, and Google AI Overviews.

GEO-OS is a two-agent pipeline that:
1. **Audits** any website for AI search visibility in ~10 minutes
2. **Generates** client-ready implementation files based on audit findings

Built on top of the [geo-seo-claude](https://github.com/zubair-trabzada/geo-seo-claude) skill library by [@ZubairTrabzada](https://github.com/zubair-trabzada), with a Paperclip orchestration layer that automates the full audit-to-deliverables pipeline.

---

## Why GEO Matters (2026)

| Metric | Value |
|---|---|
| AI-referred traffic growth | +527% year-over-year |
| AI traffic converts vs organic | 4.4x higher |
| Gartner: search traffic drop by 2028 | -50% |
| Brand mentions vs backlinks for AI | 3x stronger correlation |
| Marketers investing in GEO | Only 23% |

---

## The Pipeline
```
New client URL
      ↓
GEO SEO Analyst runs full audit (~10 min)
      ↓
Saves GEO-AUDIT-REPORT.md
      ↓
Creates "READY FOR SOLUTIONS" handoff issue
      ↓
You review audit & approve (human in loop)
      ↓
GEO Solutions Agent generates deliverables
      ↓
Client-ready files in /solutions/ folder
```

---

## What Gets Generated

### Audit Report
- Overall GEO Score (0-100)
- AI Citability Score
- Brand Authority Score
- Technical GEO Score
- Schema & Structured Data Score
- Platform Optimisation Score (ChatGPT, Perplexity, Google AIO)
- Prioritised action plan

### Solution Files
| File | What it is |
|---|---|
| `schema.json` | Ready-to-implement JSON-LD structured data |
| `llms.txt` | Spec-compliant AI navigation file for domain root |
| `robots_updates.txt` | Exact lines to add/remove from robots.txt |
| `citations.md` | Wikipedia-style entity descriptions for AI citation |
| `ai_crawlers_report.txt` | Prioritised crawler access analysis |
| `IMPLEMENTATION_SUMMARY.md` | 30-day implementation roadmap |

---

## Requirements

- macOS or Linux
- Python 3.8+
- Claude Code CLI (authenticated with Claude Pro or Max)
- Git
- [Paperclip](https://paperclip.ing) (open-source AI orchestration)
- Node.js 20+

---

## Installation
```bash
curl -fsSL https://raw.githubusercontent.com/LakeerKukadia/GEO-OS/main/install.sh | bash
```

This will:
1. Install the geo-seo-claude skill library (via Zubair's repo)
2. Install Python dependencies
3. Install the GEO SEO Analyst and GEO Solutions Agent definitions
4. Configure all paths for your machine automatically

---

## Setup in Paperclip

### 1. Install and start Paperclip
```bash
npx paperclipai onboard --yes
```

### 2. Create a company
- Open `http://localhost:3100`
- Create a new company for your client
- Set the project workspace `cwd` to your desired output folder

### 3. Hire the GEO SEO Analyst
| Setting | Value |
|---|---|
| Name | GEO SEO Analyst |
| Adapter | Claude (local) |
| Working directory | `~/.claude/agents/geo-seo-analyst` |
| Agent instructions file | `~/.claude/agents/geo-seo-analyst/AGENTS.md` |
| Skip permissions | ON |
| Max turns | 40 |
| Heartbeat | On assignment only |

### 4. Hire the GEO Solutions Agent
| Setting | Value |
|---|---|
| Name | GEO Solutions Agent |
|  Adapter | Claude (local) |
| Working directory | `~/.claude/agents/geo-solutions-agent` |
| Agent instructions file | `~/.claude/agents/geo-solutions-agent/AGENTS.md` |
| Skip permissions | ON |
| Max turns | 40 |
| Heartbeat | OFF |

---

## Usage

### Run an audit
1. Create a new issue in Paperclip
2. Set the title to the URL: `https://yourclient.com`
3. Assign to **GEO SEO Analyst**
4. Agent runs audit and creates "READY FOR SOLUTIONS" handoff issue automatically

### Generate solutions
1. Review the audit report
2. If you want solutions, assign the handoff issue to **GEO Solutions Agent**
3. Agent generates all deliverables in `/solutions/` folder

---

## Architecture
```
GEO-OS/
├── agents/
│   ├── geo-seo-analyst/
│   │   └── AGENTS.md          ← Audit agent brain
│   └── geo-solutions-agent/
│       └── AGENTS.md          ← Solutions agent brain
└── install.sh                 ← One-command installer

# Installed via install.sh from geo-seo-claude:
~/.claude/skills/
├── geo/                       ← Main skill orchestrator
├── geo-audit/                 ← Full audit orchestration
├── geo-citability/            ← AI citation scoring
├── geo-crawlers/              ← AI crawler analysis
├── geo-llmstxt/               ← llms.txt analysis
├── geo-brand-mentions/        ← Brand presence scanning
├── geo-platform-optimizer/    ← Platform-specific optimisation
├── geo-schema/                ← Structured data analysis
├── geo-technical/             ← Technical SEO
├── geo-content/               ← Content quality & E-E-A-T
├── geo-report/                ← Report generation
└── geo-report-pdf/            ← PDF report generation
```

---

## Human in the Loop

GEO-OS is designed with intentional human oversight:

- ✅ Audit always runs automatically
- ✅ Handoff issue created automatically
- ⏸️ **You review** the audit report
- ✅ Solutions only run when **you manually assign** the handoff issue
- ✅ Full audit trail in Paperclip for every run

---

## Credits

GEO-OS is built on top of the **geo-seo-claude** skill library created by [Zubair Trabzada](https://github.com/zubair-trabzada/geo-seo-claude). The GEO audit skills, scoring methodology, and sub-skill architecture are his work.

The Paperclip orchestration layer, two-agent pipeline, human-in-the-loop handoff system, and solutions generator are original contributions of this project.

---

## Contributing

Contributions welcome! Open an issue or submit a PR.

---

## License

MIT © 2026 Lakeer Kukadia

Built for the AI search era.
