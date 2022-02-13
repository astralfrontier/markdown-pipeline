# markdown-pipeline
A Docker image for converting Markdown documents to HTML, PDF, EPUB, and other formats

## Usage
The following software gets installed into `/to`:

* Pandoc (version 2.17.1.1)
* ConTeXt (latest version at build time)

Both tools are on the path in `bash`, `sh`, `tcsh`, and `zsh`.

## Development
The `./build.sh` script will build the Docker image
