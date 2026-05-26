# My LazyVim Config

A personal LazyVim configuration focused on modern fullstack development with TypeScript, Python, and web technologies.

This setup is built on top of [LazyVim](https://www.lazyvim.org/) and includes useful tools for LSP, formatting, linting, debugging, and productivity.

## Suitable For

This configuration is suitable for development with:

### Languages

- TypeScript
- JavaScript
- Python
- JSON
- YAML
- TOML
- Markdown

### Frameworks & Tools

- React
- Next.js
- NestJS
- Node.js
- Tailwind CSS
- Python projects
- Fullstack web development

## Included Features

### TypeScript / JavaScript

- `vtsls` for TypeScript LSP
- `eslint-lsp` for linting
- `prettier` for formatting
- Tailwind CSS language support
- JSON language support

### Python

- `pyright` for Python LSP and type checking
- `ruff` for linting and formatting
- Python virtual environment support
- Python debugging support with `debugpy`

### Debugging

- DAP support
- JavaScript / TypeScript debugging with `js-debug-adapter`
- Python debugging with `debugpy`

## Installation

### 1. Backup existing Neovim config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone this config

```bash
git clone https://github.com/Lam-Hung-ai/my-lazyvim-config.git ~/.config/nvim
```

### 3. Start Neovim

```bash
nvim
```

LazyVim will automatically install the required plugins.

### 4. Install Mason tools

Open Neovim and run:

```vim
:MasonInstall vtsls eslint-lsp prettier tailwindcss-language-server json-lsp pyright ruff debugpy js-debug-adapter
```

### 5. Sync plugins

```vim
:Lazy sync
```

### 6. Check health

```vim
:checkhealth
:LazyHealth
:LspInfo
```

## Recommended Requirements

Make sure these tools are installed on your system:

```bash
git
node
npm
python3
pip
ripgrep
fd
```

Optional but recommended:

```bash
pnpm
lazygit
```

## Notes

This configuration is designed for my personal workflow, but it can be used as a starting point for anyone who wants a ready-to-use LazyVim setup for TypeScript, Next.js, NestJS, Tailwind CSS, and Python development.
