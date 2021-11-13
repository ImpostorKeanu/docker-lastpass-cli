# docker-lastpass-cli

Quick and dirty container for the LastPass CLI.

# Notes

- Compiled fresh with each image build.
- **CLIPBOARD OPERATIONS work only with Linux**
  - Obviously, this means passwords will be dumped to stdout on Windows
  - May be able to bypass this by installing an X server on Windows and
    properly configuring the X11 socket in the compose file.
  - X11 socket must be shared with the container
  - DISPLAY environment variable must be set
- **IMPORTANT**: *LPASS_HOME* variable must be set before running
  `docker-compose`. Point it to a directory where your LastPass data
  should be stored.

# Usage

## Building

```
docker-compose build
```

## Running

```
docker-compose run --entrypoint "<lpass command>" --rm lpass
```

# Convenience Scripts

The `scripts` directory contains shortcut bash scripts:

- `lpass` - Shortcut to the `docker-compose` command that runs the container.
- `lpclip` - Accepts a LastPass record and copies it to your clipboard.
  - Just run the script without arguments to see which fields can be extracted
    and copied to the clipboard at runtime.
- `lpshow` - Dumps a LastPass record to stdout.
