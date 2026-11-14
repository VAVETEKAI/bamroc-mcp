# BAMROC MCP Server by Vavetek

**Revit MEP clash detection and BAMROC Move/Bend clash resolution from your own AI app** (Claude, Cursor, VS Code /
GitHub Copilot and any app that supports the Model Context Protocol).

This repository holds the **Claude plugin** for BAMROC and the **releases** of the BAMROC MCP Server (the Claude
Desktop extension `.mcpb`, listed in the [official MCP Registry](https://registry.modelcontextprotocol.io) as
`ai.vavetek/bamroc`). The server's source code is not public.

- **Documentation and download:** https://vavetek.ai/bamroc-mcp-server-documentation/

## What it does

- Finds MEP clashes (pipes, ducts, cable trays, conduits and their fittings) in the Autodesk Revit model open on your
  PC, including clashes against linked models, and shows any clash in Revit.
- Resolves the clashes you choose with **BAMROC Move** or **Bend**, Vavetek's patent-protected AI, and applies the fix
  in one Revit transaction (one Ctrl+Z).
- Lets Claude build your own clash agents, scheduled checks and Revit buttons on BAMROC.

Nothing that sends clashes to BAMROC, changes your model or installs something happens without your approval.

## Install

1. **Install BAMROC (Windows):** run the signed
   [BAMROC AI Connector setup](https://bamroc-downloads.vavetek.workers.dev/bamroc/latest/BAMROC-AI-Connector-Setup.exe)
   (also `winget install Vavetek.BAMROCAIConnector`, or the BAMROC AI Connector app on the Autodesk App Store). It
   installs the Revit add-in and the BAMROC MCP server, and connects Claude Desktop.
2. **Optional, the Claude plugin** (adds the BAMROC skill and server to Claude Code and other plugin-enabled Claude
   apps): in Claude Code, run `/plugin marketplace add VAVETEKAI/bamroc-mcp`, then `/plugin install bamroc@vavetek`.
3. Open Revit and your model, and ask Claude: *"Check my BAMROC setup, then find the clashes in my open Revit model."*

The plugin needs step 1: it starts the BAMROC server that the setup installed.

## Requirements

- Windows 10 or 11 with Autodesk Revit 2024, 2025, 2026 or 2027
- A Vavetek account with an active BAMROC subscription, for resolving clashes (detection is free)
- An AI app that supports MCP, for example [Claude Desktop](https://claude.ai/download) or Claude Code

## What the plugin runs, sends and fetches

- **Runs** `bin/bamroc.cmd`, which starts the BAMROC MCP server installed by the setup
  (`%APPDATA%\Autodesk\ApplicationPlugins\BAMROC.bundle\Contents\server\python.exe -I -m bamroc_mcp`, or the same
  path under `%ProgramData%`). If BAMROC is not installed, it stops with a message pointing to the setup. The server
  runs locally and talks to Claude over stdin/stdout.
- **Talks to Revit** on this PC only (`localhost:5055` and `localhost:5056`-`5065`), through the BAMROC Revit add-in.
- **Sends** to the BAMROC service (`https://platform.vavetek.ai`, Vavetek, encrypted HTTPS), only when you approve a
  Move or Bend run: the clashes you chose and simplified geometry of the elements involved, with your BAMROC sign-in.
- **Signs in** at `https://platform.vavetek.ai` in your browser the first time you resolve clashes.
- **Downloads**, only when you approve installing or updating the Revit add-in from Claude, the add-in package from
  Vavetek's download site (`https://bamroc-downloads.vavetek.workers.dev`), checked against its built-in SHA-256.
- **Changes your Revit model** only when you approve applying a prediction (one Ctrl+Z undoes it).

No analytics or telemetry.

## Privacy Policy

Full policy: https://vavetek.ai/bamroc-mcp-server-documentation/#privacy

- **Data collection:** your Revit model stays on your PC. Only when you approve a BAMROC Move or Bend run, the clashes
  you chose and simplified geometry of the elements involved (bounding boxes, orientation, size, category, element
  IDs and connections) are sent to the BAMROC service at `https://platform.vavetek.ai` over an encrypted connection,
  with your BAMROC sign-in. Your .rvt file, project name, Windows user name and element parameters are never sent.
  Detecting, listing and showing clashes sends nothing.
- **Usage and storage:** the geometry is used only to compute the prediction you asked for. Your project data is
  never used to train our AI. Your sign-in is saved only in your own Windows user folder.
- **Third-party sharing:** none, except the infrastructure providers that host the service and the downloads
  (Cloudflare). Your AI app's own provider sees what you type in it, under that provider's policy.
- **Data retention:** project data is deleted automatically after processing; standard request logs are kept as
  described in the VAVETEK AI Privacy Policy (https://vavetek.ai/privacy-policy/).
- **Contact:** VAVETEK AI PRIVATE LIMITED, New Delhi, India. info@vavetek.ai

## Support

Email info@vavetek.ai with your Revit version and the AI app you use. Documentation, FAQ and troubleshooting:
https://vavetek.ai/bamroc-mcp-server-documentation/

## License

Proprietary. Copyright (c) 2026 VAVETEK AI PRIVATE LIMITED. See [LICENSE](LICENSE).
