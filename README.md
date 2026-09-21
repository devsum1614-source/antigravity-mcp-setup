# Antigravity GitHub MCP Integration

This repository contains the setup, configuration, and automation scripts used to connect GitHub with Google Antigravity CLI (`agy`) and Antigravity IDE using the **Model Context Protocol (MCP)**.

## Architecture

```
+--------------------------+       JSON-RPC (stdio)       +-------------------------------+       HTTPS       +-------------------+
|  Google Antigravity      | <--------------------------> |  GitHub MCP Server            | <---------------> |  GitHub REST &    |
|  (CLI / 2.0 IDE)         |                              |  (@modelcontextprotocol/...)  |                   |  GraphQL APIs     |
+--------------------------+                              +-------------------------------+                   +-------------------+
```

## Features Enabled

With GitHub MCP integrated, the Antigravity agent can autonomously:
- Search repositories, branches, and commits
- Create and update issues
- Inspect and review pull requests
- Stream file contents and perform code searches directly through natural language

## Installation & Setup

### 1. Prerequisites
- **Node.js (v20+ LTS)**: Installed via winget (`winget install OpenJS.NodeJS.LTS`).
- **GitHub MCP Server Package**:
  ```powershell
  npm install -g @modelcontextprotocol/server-github
  ```

### 2. Configuration (`mcp_config.json`)
Placed at `~/.gemini/config/mcp_config.json`:
```json
{
  "mcpServers": {
    "github": {
      "command": "mcp-server-github.cmd",
      "args": [],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_PERSONAL_ACCESS_TOKEN"
      }
    }
  }
}
```

### 3. Automated Token Setup
Run the included PowerShell script to securely configure your GitHub PAT without exposing it:
```powershell
powershell -ExecutionPolicy Bypass -File setup-github-mcp.ps1
```

## Verification

In Antigravity CLI or IDE:
- `/mcp`: List loaded servers and discovered tools.
- Try asking: *"List my repositories on GitHub"* or *"Check recent issues in my repo"*.