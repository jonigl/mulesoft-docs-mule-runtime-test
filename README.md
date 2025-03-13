# AsciiDoc Converter Tool

A simple bash script to convert AsciiDoc (.adoc) files to plaintext format, preserving directory structure.

## Prerequisites

Before using this tool, you need to install:

- **asciidoctor**: Used to convert AsciiDoc to DocBook format
- **pandoc**: Used to convert DocBook to plaintext

### Installing Prerequisites

#### On macOS:

```bash
# Using Homebrew
brew install asciidoctor pandoc
```

#### On Ubuntu/Debian:

```bash
sudo apt-get update
sudo apt-get install asciidoctor pandoc
```

#### On RHEL/CentOS/Fedora:

```bash
sudo dnf install asciidoctor pandoc
```

## Usage

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd mulesoft-docs-hosting-test
   ```

2. Run the conversion script:
   ```bash
   ./adoc-converter.sh
   ```

By default, the script will:
- Process all .adoc files in the `./mulesoft-docs-hosting-test` directory
- Skip directories specified in the `IGNORE_DIRS` array
- Output plaintext (.txt) files to the `./output_text_directory`

## Customization

You can modify the script to:
- Change input and output directories
- Add more directories to ignore
- Adjust conversion parameters

## Example

If you have the following structure:

```
mulesoft-docs-hosting-test/
├── docs/
│   ├── example.adoc
│   └── guide/
│       └── tutorial.adoc
└── drafts/
    └── draft.adoc
```

Running the script with drafts in the ignore list will convert:
- `docs/example.adoc` → `output_text_directory/docs/example.txt`
- `docs/guide/tutorial.adoc` → `output_text_directory/docs/guide/tutorial.txt`

And skip:
- `drafts/draft.adoc`
