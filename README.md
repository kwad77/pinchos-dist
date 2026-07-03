<div align="center">

# pinchOS

**The honesty layer for AI work.**

Type one idea. Watch a council convene, fill the gaps in your ask — *labeling every assumption* —
weave a verification loop sized to the job, run it on **your** models, and hand you the finished
thing with receipts. When it can't verify, it says **blocked** and shows you why.
It would rather stop than lie.

[![version](https://img.shields.io/badge/release-v0.16.0-2ea44f)](https://github.com/kwad77/pinchos-dist/releases/latest)
[![dead clicks](https://img.shields.io/badge/dead%20clicks-ZERO%20(enforced)-2ea44f)](#every-click-does-the-right-thing)
[![decision budgets](https://img.shields.io/badge/decision%20budgets-enforced-2ea44f)](#every-click-does-the-right-thing)
[![model](https://img.shields.io/badge/model-agnostic-5b8def)](#your-models-your-machine)
[![won't lie](https://img.shields.io/badge/would%20rather-block%20than%20lie-d6336c)](#proof-not-promises)

`Trust` · `Affordability` · `Transparency` · `Freedom`

<br/>

![The payoff: a real artifact arrives on the departure board with honest receipts — AVAILABLE per gate, "only real events post here"](docs/images/stage-payoff.png)

*A real session on a real local model. "ARRIVED · FISHING CONDITIONS APP" — preview only, nothing
applied, every gate's receipt posted. This screenshot is from a live run, not a mockup — that
distinction is a law in this repo (`FIXTURE` vs `LIVE` evidence labeling).*

</div>

---

## One stage. The whole session is a performance you can watch.

pinchOS v16 replaced dashboards-and-menus with **one stage**: scenes enter, do their work
palpably, and hand off — like a play, with your idea as the object that travels the whole arc.

1. **THE ASK** — an empty stage and a composer. You type one line. That's the entire onboarding.
2. **THE COUNCIL** — advisors file onto an arrivals board, each announced by name and aptitude.
   They fill your ask's gaps from the product's spines — memory, your files, your screenshots —
   and the refined brief labels **every single fill**:

   ![The labeled brief: WHAT YOU SAID · REMEMBERED (from memory) · SEEN (source) · ASSUMED, each with a basis and a CHANGE button](docs/images/stage-brief.png)

   *"What you said" verbatim · "Remembered" cited from memory · "Seen" cited from evidence ·
   "**Assumed**" — each assumption with its basis and a `CHANGE` button. Empty categories render
   nothing. An unlabeled assumption is treated as a worst-class bug here.*

3. **THE HANDOFF** — the decision is thrown to the loop, and the weave itself is a receipt:
   *"excluded Apply — a plan, not a code change."* You can always see why your loop has the
   phases it has.
4. **THE LOOP** — a gate ring runs the verification circuit. Earned phases turn green. Work in
   transit pulses. And when the session needs *you*, **the ring lights signal-red** — one
   question, one answer button, visible from across the room. Answers are **remembered forever**
   (asked once per user, never per session).
5. **THE PAYOFF** — the artifact takes the stage with a receipt on every claim. Verified changes
   offer a gated **Apply · Create PR · Reject** — and a plan that has nothing to apply *arrives
   as a plan* instead of blocking behind a repo demand.

**Explain mode** narrates all of it from the product's own event log — every beat cites the
verbatim events that drove it and the rule that decided it. *Nothing invented* is printed on
the rail itself:

![Explain mode: THE COUNCIL CONVENES — DATA: message.created · e26 — WHY: scene=council because intake events exist and no run has started](docs/images/stage-explain.png)

And because the whole session is an event log, **reloading the page replays the performance** —
your project remembers not just what happened, but how it looked happening.

## Four worlds, one truth

The stage ships in four materials — pick yours in the gear: a **Departure Board** (split-flap
verdicts, arrivals-board council), a **Blueprint Atelier** (inspection stamps, revision-table
receipts), a **Harbor Chart**, and a **Flight Instrument** panel. Same choreography, same
honesty, radically different souls. (A fifth design was retired by its own author. RIP.)

## Every click does the right thing

Five rules, all **machine-enforced in CI** — not aspirations:

1. **No dead clicks** — a click oracle walks every interactive element (143 at last census) and
   fails the build on any click that produces nothing. Current ledger: **empty**.
2. **No silent no-ops** — a click that can't act says why, right there.
3. **No lying labels** — VERIFIED derives from the gate's verdict, never from which gate ran.
   Red checks render "not landable" and offer no Apply.
4. **One right thing** — decision budgets cap visible actions at every moment (composer: one
   primary; needs-you: one). Current over-budget ledger: **empty**.
5. **Destructive is two-step** — armed, then confirmed, in-DOM. All 12 legacy native confirms
   were hunted down and replaced.

## It compounds

- **Ask-soak**: every clarification you answer becomes a remembered fact, cited when reused.
- **The barista question**: one innocuous preference question a day (skippable, deterministic,
  retires when the bank runs dry) quietly makes every future artifact more yours.
- **Semantic recall**: "I never use JavaScript" surfaces exactly when someone proposes Node —
  constraints recall by *meaning*, negation-safe.
- **Skills with provenance**: verified runs mint reusable skills that cite the run you approved;
  reuse is scored by the gate's real verdicts and degrading skills are **flagged, never silently
  kept or silently retired**. A skill needs two similar verified runs before it's even offered.
- **Phase Workshop**: loops are Lego bricks. Clone any loop, see every knob honestly (nothing
  hidden, nothing dropped), cap any phase's tokens with a number in a box, and the cap holds
  from save through runtime through lane selection.

## The gate has eyes now

When your model can see, the Verify phase runs a **visual witness** over rendered artifacts:
binary probes derived as *citations of the artifact's own source* ("Is there a section titled
Budget?"), majority-of-3 sampled. Qualification battery: **72/72 accurate, zero hallucinated
absences** — and on its first live run it caught a real defect (an empty table) while refusing
to let a perfect visual score rescue a failed non-visual check. A probe that can't decide
abstains — abstention is never a pass.

## Your models, your machine

Zero-config discovery of local backends (vLLM, Ollama; anything speaking OpenAI-compatible
`/v1`). Bind subscription CLIs (Claude, Codex) as council seats — during release dogfood, a
Harsh Skeptic and a Warm Advocate on the *same model* argued opposite verdicts with attributed
receipts, twice. Budget lanes (`Best · Cheapest · Auto`) route each phase to the model class it
deserves, savings math auditable on every receipt — **including edits**, where the money
actually goes. And a run that hits its budget **degrades honestly and tells you** instead of
stopping or lying.

## Quick start

```bash
# Download the binary for your platform:
#   https://github.com/kwad77/pinchos-dist/releases/latest
./pinchos
# → http://localhost:4147/stage     the stage (new in v16)
# → http://localhost:4147/next      the classic workroom
```

Have a local model running (Ollama, vLLM, LM Studio — anything `/v1`)? pinchOS finds it.
Don't? pinchOS will tell you honestly what it can't do yet, and exactly one step to fix it.

## Proof, not promises

Honesty is measured by instruments committed to this repo — run them yourself:

| The claim | The receipt |
|---|---|
| The paid loop works, live | Release probe: real repo, verified diff, Apply clicked on the stage, **file changed on disk, tests green** — zero mocks. |
| It refuses to fake success | A tests-red diff renders "checks red — not landable" and cannot be applied; honest refusals are recorded as `blocked`, never dressed up. |
| No dead clicks, no option walls | `zz-click-oracle` + `zz-decision-budget` run in the gate; both debt ledgers are empty and any regression fails CI. |
| The gate is real | 1,000+ Node tests, 900+ browser journey/proof tests across two engines, correctness + router harnesses against a live model, desktop sidecar smoke. |
| Screenshots don't lie | Every evidence image in this repo is labeled `FIXTURE` (design) or `LIVE` (capability). This README uses LIVE only. |
| Its limits are named | Below, as always. |

## Known limitations (named, not hidden)

- Language drift detection is script-level (a Chinese reply to an English ask gets flagged
  `unverified`); Latin-to-Latin language confusion is out of scope for now.
- Jury votes currently run on the local decision lane regardless of a seat's bound model
  (receipts say so honestly); true multi-model deliberation is v0.18 territory.
- Screenshot evidence flows into support tickets today; screenshot→brief (`seen` via PixelRAG
  at intake) is wired vocabulary, landing next.
- Agentic CLI authors (claude/codex) don't report token usage — receipts say `unreported`
  rather than guessing.
- Unproven on very large/messy repos; the worst case is an honest refusal.

## Where it's going

[`docs/V0.17-V0.18-ROADMAP.md`](docs/V0.17-V0.18-ROADMAP.md) — v0.17 **"It compounds"**
(teach-by-demonstration, full dynamic loop weaving, domain packs, portable context), v0.18
**"The partner ships"** (pinchOS bundled with its own distilled local model: a laptop plus
your context bundle is your entire assistant, offline).

---

*Built with its own loop, verified by its own gate, dogfooded by its own council —
and every claim above has a receipt in this repo's event logs.* 🦀
