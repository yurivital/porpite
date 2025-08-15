FROM mcr.microsoft.com/devcontainers/base:noble

RUN curl -fsSO https://elixir-lang.org/install.sh
USER vscode
RUN sh install.sh elixir@1.18.4 otp@27.3.4
ENV installs_dir="/home/vscode/.elixir-install/installs"
ENV PATH="$installs_dir/elixir/1.18.4-otp-27/bin:$installs_dir/otp/27.3.4/bin:$PATH"
