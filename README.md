# wiki-davit-in

## Description

To set up a Hugo-based wiki-like documentation site for your DAVIt organisation (davit.in), this is a step-by-step guide.

This will create a static site with a clean, navigable documentation style, using the DAVIT Base theme.

## Installation

This theme is well-suited for wiki/documentation replicas as it features a sidebar navigation menu for hierarchical sections, search functionality, dark/light mode toggling, and a simple layout similar to the most wiki (header with title/mode toggle, sidebar for navigation, main content area, and minimal footer).

The wiki's structure (pieced together from page analysis) includes top-level sections like;

- Introduction,
- Installation/Getting Started,
- Contributing,
- Applications/Tools,
- Components/Configuration,
- Developers Corner/Roadmap, and
- language variants (e.g., English as primary).

We'll replicate this hierarchy with DAVIt-specific adaptations, focusing on your Linux based OS, DAVIT Package integration, user on boarding for IT novices in our remote teams, and plans for an Learning management systems (LMS) framework. Content will be in UK English, with placeholder Markdown files containing common/editable examples tailored to DAVIt (e.g., basics for new users, trainers in Ghana).

### Requirements

Assumptions and guidelines:

- You have Hugo installed (extended version recommended for themes with Sass; download from https://gohugo.io/installation/ if not). Minimum version: 0.121.0.
- You have Git for versioning.
- You're using VS Code Insiders (vscode-insiders command).
- pnpm is considered for any Node-based assets (e.g., if you add custom JS/CSS later), but the base setup doesn't require it as Hugo Book is pure Hugo/Go.
- Indentation: 2 spaces in configs/code.
- Quoting: Double quotes in configs.
- No actionable details on disallowed activities; this is purely for educational/documentation setup.
- The site will be versioned with Git from the start.
- After setup, you can build/edit content, then deploy to davit.ie (e.g., via Netlify, GitHub Pages, or your server).

## Directory Tree

```bash
.
├── archetypes
│   └── default.md
├── assets
├── CHANGELOG.md
├── content
├── data
├── docs
├── .env
├── .gitignore
├── hugo.yaml
├── i18n
├── layouts
├── LICENSE
├── README.md
├── requirements.yaml
├── static
├── tests
├── themes
├── .vscode
└── vscode.sh
```

### Step 1: Create and Initialise the Project

Open a terminal and run these commands to create the Hugo site and set up versioning:

text

```
mkdir davit-wiki
cd davit-wiki
git clone https://github.com/DavitTec/wiki-davit-in.git .
# Creates the site structure in the current directory
```

This initialises a Git repository and a basic Hugo site with folders like content/, layouts/, static/, etc.

### Step 2: Add the Davit-docs Theme

The Book theme provides a wiki-like layout with collapsible sidebar navigation, which mirrors the MATE wiki's hierarchical menu (e.g., Introduction > Installation).

text

```
git submodule add https://github.com/DavitTec/hugo-davit-docs.git themes/hugo-davit-docs


echo "theme: hugo-davit-docs" >> hugo.yaml
```

###

## Version

0.0.1
