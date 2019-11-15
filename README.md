# local-kakrc

## Description

When a Kakoune session begins, recursively search through the current working directory and its parent directories for a file named `.kakrc`. The first such file is sourced for additional configuration. The directory containing this file, if found, is accessible via `%opt{project_directory}`.

This plugin behaves similarly to the Vim option `exrc`.

## Usage

For security, this feature is disabled unless explicity enabled by setting `source_local_kakrc` to `true`.

With plug.kak:
```
plug "dgmulf/local-kakrc" config %{
    set-option global source_local_kakrc true
}
```
