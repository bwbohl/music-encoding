# AGENTS.md

## Environment Setup

### Native
- Make sure Java 8 or above is available
- Make sure Apache Ant is available
- additional for Guidelines HTML
  - Make sure Verovio is available
- additional for Guidelines HTML
  - Make sure Prince XML is available

### Docker
- Make sure Docker is available

## Commands

Full build: `ant`
Build single RNG schema: `ant build-rng -Dcustomization.path=[PATH-TO-CUSTOMIZATION]
Build all RNG schemata: `ant build customizations`

## Code Style
- none at the moment, try to stick with coding conventions of each file

## Testing
- none at the moment

## Project Structure

## Permissions

### Allowed without prompting
- Read any source file in this repository

### Require approval first
- Read files outside this repository
- Package installation
- Git operations (`git push`, `git commit`)
- Deleting files or directories
- Running full build or test suites

## PR Requirements

## Behaviour
- Create plans as markdown files before implementing
- Only implement if asked to do so
- If you’re unsure about something don’t assume or infer but ask
- Keep to the currently edited file if not asked to do otherwise
- If you’re asked to commit your changes always add a note at the end of the commit message following the model:
```

Changes prepared with assistance from: [MODEL-NAME] [MODEL-VERSION]
```
and remind your operator to review the changes before pushing or issuing a pull request
- If asked to create a commit message, always add a note at the end of the commit message following the model:
```

Commit message created with assistance from: [MODEL-NAME] [MODEL-VERSION]
```
- Always escape strings using `@` to avoid them being rendered as links to e.g. GitHub users
