# BAMROC skill for Claude, by Vavetek

**Revit MEP clash detection and BAMROC Move/Bend clash resolution in Claude.** This plugin adds the BAMROC skill: it
teaches Claude the safe BAMROC workflow (check the setup, detect and list clashes, show them in Revit, resolve chosen
clashes with BAMROC Move or Bend only after your approval) and how to build your own BAMROC agents, scripts and Revit
buttons.

- **Documentation and download:** https://vavetek.ai/bamroc-mcp-server-documentation/

## What you need

The BAMROC tools come from the BAMROC MCP server, which this plugin does not include. Install it first:

1. **Install BAMROC (Windows):** run the signed
   [BAMROC AI Connector setup](https://bamroc-downloads.vavetek.workers.dev/bamroc/latest/BAMROC-AI-Connector-Setup.exe)
   (the BAMROC AI Connector app is also coming to the Autodesk App Store). It
   installs the Revit add-in and the BAMROC MCP server, and connects Claude Desktop. For Claude Code: Start menu >
   BAMROC AI Connector > Connect Claude Code, then restart Claude Code.
2. Add this plugin, open Revit and your model, and ask Claude: *"Check my BAMROC setup, then find the clashes in my
   open Revit model."*

Requirements: Windows 10 or 11 with Autodesk Revit 2024, 2025, 2026 or 2027; a Vavetek account with an active BAMROC
subscription for resolving clashes (detection is free).

## What this plugin runs, sends and fetches

This plugin contains only a skill (instructions for Claude). It runs no commands, starts no server, and sends or
fetches nothing by itself. The BAMROC MCP server installed by the setup does the work, under your approval:

- **Talks to Revit** on this PC only, through the BAMROC Revit add-in.
- **Sends** to the BAMROC service (`https://platform.vavetek.ai`, Vavetek, encrypted HTTPS), only when you approve a
  Move or Bend run: the clashes you chose and simplified geometry of the elements involved, with your BAMROC sign-in.
- **Changes your Revit model** only when you approve applying a prediction (one Ctrl+Z undoes it).

No analytics or telemetry.

## Privacy Policy

Full policy: https://vavetek.ai/bamroc-mcp-server-documentation/#privacy

- **Data collection:** your Revit model stays on your PC. Only when you approve a BAMROC Move or Bend run, the clashes
  you chose and simplified geometry of the elements involved (bounding boxes, orientation, size, category, element
  IDs and connections) are sent to the BAMROC service over an encrypted connection. Your .rvt file, project name,
  Windows user name and element parameters are never sent.
- **Usage and storage:** the geometry is used only to compute the prediction you asked for. Your project data is
  never used to train our AI.
- **Third-party sharing:** none, except the infrastructure providers that host the service and the downloads
  (Cloudflare).
- **Data retention:** project data is deleted automatically after processing.
- **Contact:** VAVETEK AI PRIVATE LIMITED, New Delhi, India. info@vavetek.ai

## Support

Email info@vavetek.ai with your Revit version and the AI app you use.

## License

Proprietary. Copyright (c) 2026 VAVETEK AI PRIVATE LIMITED. See [LICENSE](LICENSE).
