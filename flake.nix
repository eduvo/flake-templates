{
  description = "Nix flake templates";

  outputs = { self }: {
    templates = {
      rails-mysql = {
        path = ./rails-mysql;
        description = "Rails development environment with MySQL";
      };
    };
  };
}
