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

The [packages](https://search.nixos.org/packages) and
[services](https://devenv.sh/services/#supported-services) (such as databases)
specified in the template will be installed automatically.

### Run services

Services are supported by `devenv`, which is installed automatically through template.

``` shell
devenv up
```

For example, run in OpenApply

``` shell
❱ devenv up
10:43:25 system            | memcached.1 started (pid=28338)
10:43:25 system            | redis.1 started (pid=28339)
10:43:25 system            | mysql-configure.1 started (pid=28340)
10:43:25 system            | mysql.1 started (pid=28341)
10:43:25 redis.1           | 28339:C 27 Oct 2023 10:43:25.811 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
10:43:25 redis.1           | 28339:C 27 Oct 2023 10:43:25.811 # Redis version=7.0.13, bits=64, commit=00000000, modified=0, pid=28339, just started
10:43:25 redis.1           | 28339:C 27 Oct 2023 10:43:25.812 # Configuration loaded
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.812 * Increased maximum number of open files to 10032 (it was originally set to 256).
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.812 * monotonic clock: POSIX clock_gettime
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.813 * Running mode=standalone, port=6379.
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.813 # WARNING: The TCP backlog setting of 511 cannot be enforced because kern.ipc.somaxconn is set to the lower value of 128.
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.813 # Server initialized
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.814 * Loading RDB produced by version 7.0.13
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.814 * RDB age 155768 seconds
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.814 * RDB memory usage when created 1.46 Mb
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.814 * Done loading RDB, keys loaded: 18, keys expired: 1.
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.814 * DB loaded from disk: 0.001 seconds
10:43:25 redis.1           | 28339:M 27 Oct 2023 10:43:25.814 * Ready to accept connections
10:43:26 mysql.1           | 2023-10-27T02:43:26.060051Z 0 [System] [MY-010116] [Server] /nix/store/mlx2mkbjh243gvhpfprr75sp2v85g3sf-mysql-8.0.34/bin/mysqld (mysqld 8.0.34) starting as process 28341
10:43:26 mysql.1           | 2023-10-27T02:43:26.065926Z 0 [Warning] [MY-010159] [Server] Setting lower_case_table_names=2 because file system for /Users/james/src/openapply/.devenv/state/mysql/ is case insensitive
10:43:26 mysql.1           | 2023-10-27T02:43:26.083760Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
10:43:26 mysql.1           | 2023-10-27T02:43:26.263768Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
10:43:26 mysql.1           | 2023-10-27T02:43:26.390593Z 0 [ERROR] [MY-011300] [Server] Plugin mysqlx reported: 'Setup of socket: '/run/mysqld/mysqlx.sock' failed, can't create lock file /run/mysqld/mysqlx.sock.lock'
10:43:26 mysql.1           | 2023-10-27T02:43:26.412229Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
10:43:26 mysql.1           | 2023-10-27T02:43:26.412245Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
10:43:26 mysql.1           | 2023-10-27T02:43:26.545882Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060
10:43:26 mysql.1           | 2023-10-27T02:43:26.545911Z 0 [System] [MY-010931] [Server] /nix/store/mlx2mkbjh243gvhpfprr75sp2v85g3sf-mysql-8.0.34/bin/mysqld: ready for connections. Version: '8.0.34'  socket: '/Users/james/src/openapply/.devenv/state/mysql.sock'  port: 3306  Source distribution.
```

## References
- [Why you should give Nix a try?](https://nixos.org/guides/nix-pills/why-you-should-give-it-a-try)
- [Nix language basics](https://nix.dev/tutorials/nix-language)
- [Nix flakes](https://nixos.wiki/wiki/Flakes)
