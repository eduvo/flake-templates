{
  description = "Nix flake templates";

  outputs = { self }: {
    templates = {
      rails-postgres = {
        path = ./rails-postgres;
        description = "Rails development environment with PostgreSQL";
      };
      rails-mysql = {
        path = ./rails-mysql;
        description = "Rails development environment with MySQL";
      };
      azure-openai-playground = {
        path = ./azure-openai-playground;
        description = "Azure OpenAI playground using Jupyter Notebook";
      };
    };
  };
}
