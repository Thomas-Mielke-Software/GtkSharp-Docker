# GtkSharp-Docker -- a Docker container for reproducably setting up a GtkSharp development environment

This is intended to demonstrate issues with [GtkSharp](https://github.com/GtkSharp/GtkSharp) and not 
for active development as changes in the container would get lost on a `docker build`.

Note: You need to have [Docker](https://docs.docker.com/engine/install/ubuntu/) installed and set up 
on your system to use this.

After git-cloning and cd into the repo, build the image:

    docker build -t gtksharp-env .

This will build GtkSharp already and install the workload. It will also install the C# template and
create a sample app `GtkAppGeneratedFromTemplate`.

Then visit the container using:

    docker run -i --rm -t gtksharp-env bash

Visual Studio Code is supported: Install VS Codes 'Dev Containers' extension, then right click the 
gtksharp-env container and attach it to VS Code. Wait a few seconds until VS Code is setup in the
container, then go to the Run & Debug tab and choose a launch option.
