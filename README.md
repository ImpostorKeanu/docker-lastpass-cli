# docker-lastpass-cli

Quick and dirty container for the LastPass CLI.

# Notes

- Compiled fresh with each image build.
- Works only on Linux.

# Required Environment Variables

|Variable|Explanation|Default|
|---|---|---|
|`USER`|User that will be created in the container to ensure that file permissions are preserved in `LPASS_HOME`|n/a|
|`LPASS_HOME`|Host directory where your LastPass data will be stored|n/a|
|`X11_SOCKET`|Path to the X11 socket that will be passed along to the container for clipboard access|`/tmp/.X11-unix`|

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
