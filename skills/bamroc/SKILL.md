---
name: bamroc
description: Revit MEP clash detection and resolution with BAMROC (Move and Bend), and building agents, scripts, scheduled checks or Revit buttons on BAMROC. Use when the user mentions BAMROC, Revit clashes, MEP coordination, clash detection or resolution, or asks to build a tool that finds or fixes clashes.
---

# BAMROC

BAMROC finds MEP clashes in the Revit model open on this PC and resolves them with BAMROC **Move** (shift
elements) or **Bend** (re-route runs). It works through the `bamroc` MCP server of this plugin. The server's own
instructions and its `BamrocGuide` tool are the reference; this skill is the short version.

## If the BAMROC tools are missing

The `bamroc` server starts the BAMROC MCP server installed by the **BAMROC AI Connector** setup (Windows, Revit
2024-2027). If its tools are not available, BAMROC is not installed on this PC: tell the user to download and run the
setup from https://vavetek.ai/bamroc-mcp-server-documentation/, then restart Claude. Do not try to install it
yourself.

## Start every BAMROC task like this

1. Call `CheckSetup`. Fix what it reports, in plain words for the user:
   - **BAMROC connector in Revit** missing: explain it is a small invisible Revit add-in, get a yes, call
     `InstallRevitConnector`, ask the user to save and restart Revit. (Already there if the user installed the
     *BAMROC AI Connector* app from the Autodesk Marketplace.)
   - **Revit link** not running: Revit with the model must be open.
2. `ClashDetection` (20 mm unless the user says otherwise), summarise by scope, then `ListClashes` with filters.
   `ShowInRevit(clashIndex)` selects and zooms to a clash.

## Rules (never skip)

- `RunBamrocAnalysis` / `RunBamrocBending` **use the user's BAMROC subscription** and send clashes to Vavetek: say how many clashes will be
  sent and get a clear yes first. Never run them to test or preview.
- `ApplyBamrocMove` / `ApplyBamrocBend` / `MoveElement` **change the model**: show the run summary and ask first.
  Deleting or detaching elements only with explicit consent (`allowDeletingElements`).
- `InstallRevitConnector` / `UninstallRevitConnector` and editing any app's settings: ask first.
- Walls/floors/ceilings against each other (`non_mep`) are for manual review, not BAMROC.

## Building something on BAMROC

Read the guide before writing code: `BamrocGuide` with `build-an-agent` (Claude Agent SDK template),
`build-a-revit-button` (C# add-in calling `bamroc-call`, never blocking Revit's UI thread), `call-from-code`
(`python -m bamroc_mcp.cli <Tool> "<json>"`, `--yes` only after the user agreed) and `tool-results` (JSON shapes).
Test only with free tools (`CheckSetup`, `ClashDetection`, `ListClashes`, `ShowInRevit`). Do not read or
reverse-engineer the server, the connector or the user's files; ask before installing anything.
