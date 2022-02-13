# markdown-pipeline
A Docker image for converting Markdown documents to HTML, PDF, EPUB, and other formats

## Usage
The following software gets installed into `/to`:

* Pandoc (version 2.17.1.1)
* ConTeXt (latest version at build time)

Both tools are on the path in `bash`, `sh`, `tcsh`, and `zsh`.

## Development
The `./build.sh` script will build the Docker image

### ICC Color Profiles

To generate PDF/A files, you will need additional color profiles, as described here: https://wiki.contextgarden.net/PDF/A

These files are included in this repository and automatically added to the Docker image.

ICC Profiles can be downloaded here: http://www.eci.org/en/downloads

Specifically, file `eci_offset_2009.zip`
