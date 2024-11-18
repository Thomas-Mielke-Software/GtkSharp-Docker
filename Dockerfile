FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /mauienv

# set environment variable/path
ENV DOTNET_ROOT=/usr/share/dotnet
ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# install GtkSharp
RUN git clone https://github.com/GtkSharp/GtkSharp.git
WORKDIR /mauienv/GtkSharp
RUN sed -i 's/"8.0.100", "8.0.200"}/"8.0.100", "8.0.200", "8.0.300", "8.0.400"}/g' build.cake  # add missing version bands
RUN dotnet tool restore
COPY launch.json .vscode
  # ^ this allows debugging using the vscode devcontainer extension 
RUN dotnet cake --verbosity=diagnostic --BuildTarget=InstallWorkload 
RUN apt update
RUN apt install -y libgtk-3-dev libgtksourceview-4-0 
RUN dotnet new install GtkSharp.Template.CSharp
WORKDIR /mauienv
RUN dotnet new gtkapp -n GtkAppGeneratedFromTemplate
WORKDIR /mauienv/GtkAppGeneratedFromTemplate

