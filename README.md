# flake-templates

## Requirements
- Nix: https://nixos.org/download
- Direnv: https://github.com/nix-community/nix-direnv#installation

## Usage

### Use a template

```shell
nix flake init -t github:eduvo/flake-templates#<template>
```

For example,

```shell
nix flake init -t github:eduvo/flake-templates#rails-mysql
```

### Enable direnv

``` shell
direnv allow
```

The dependencies and services (such as databases) specified in the template will be installed automatically.

### Run services

``` shell
devenv up
```

For example, running =devenvup= in OpenApply:

``` shell
❱ devenv up
10:27:21 system            | mysql.1 started (pid=26508)
10:27:21 system            | redis.1 started (pid=26509)
```
