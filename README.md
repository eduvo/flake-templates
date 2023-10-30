# flake-templates

## Requirements

### Nix

For macOS:

``` shell
sh <(curl -L https://nixos.org/nix/install)
```

See https://nixos.org/download for other systems.

### Nix flakes

Nix flakes is a feature to be enabled to use these templates:

``` shell
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Direnv

[Install with nix profile](https://github.com/nix-community/nix-direnv#with-nix-profile) for quick start:

``` shell
nix profile install nixpkgs#nix-direnv
echo 'source $HOME/.nix-profile/share/nix-direnv/direnvrc' >> ~/.config/direnv/direnvrc
```

See https://github.com/nix-community/nix-direnv#installation for other ways.

## Usage

### Use a template

```shell
nix flake init -t github:eduvo/flake-templates#<template>
```

For example,

```shell
nix flake init -t github:eduvo/flake-templates#rails-mysql
```

By using a template, the files of the `<template>` are downloaded to current directory.

### Enable direnv

``` shell
direnv allow
```

The [packages](https://search.nixos.org/packages) and
[services](https://devenv.sh/services/#supported-services) (such as databases)
specified in the template will be installed automatically.

### Run services

Services are managed by [devenv](https://devenv.sh/), which is installed automatically.

``` shell
devenv up
```

For example,

``` shell
> devenv up
10:43:25 system            | memcached.1 started (pid=28338)
10:43:25 system            | redis.1 started (pid=28339)
10:43:25 system            | mysql-configure.1 started (pid=28340)
10:43:25 system            | mysql.1 started (pid=28341)
```

### Procfile-based applications
If you're using [foreman](https://github.com/ddollar/foreman) to manage your
application processes, add `devenv up` to `Procfile`, so you can run a single
command for development.

For example, given the `Procfile`:

```
web: rails server -p 3000
js: yarn build --watch
css: yarn build:css --watch
sidekiq: bundle exec sidekiq -C config/sidekiq.yml
ngrok: ngrok http --domain=fariapay.ngrok.dev 3000
devenv: devenv up
```

Run the `dev` command starts all processes:

``` shell
> dev
10:28:35 web.1     | started with pid 63731
10:28:35 js.1      | started with pid 63732
10:28:35 css.1     | started with pid 63733
10:28:35 sidekiq.1 | started with pid 63734
10:28:35 ngrok.1   | started with pid 63735
10:28:35 devenv.1  | started with pid 63736
```

Notice no need to add `bin` as it is already in the `PATH` magically.

## References
- [Why you should give Nix a try?](https://nixos.org/guides/nix-pills/why-you-should-give-it-a-try)
- [Nix language basics](https://nix.dev/tutorials/nix-language)
- [Nix flakes](https://nixos.wiki/wiki/Flakes)
