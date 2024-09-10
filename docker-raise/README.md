# Formal Aspects of Software Engineering (02264) - docker guide

The docker container is mounted onto the folder in which `docker-compose` lies, making it easy to save you lectures in this folder and not worry about losing your files in the container.

## Getting started

1. Build and start container with `docker-compose up -d`
2. Attach to the container with `docker-compose exec rsl bash`
3. You can use `rsltc` and `sml` commands
4. When you're done, exit and stop container with `docker-compose down`

### Verify

1. `docker-compose exec rsl bash`
2. `pushd exmaples`
3. `rsltc -m SYSTEM_OF_COORDINATES.rsl`
4. `sml <SYSTEM_OF_COORDINATES.sml`

## Syntax highlighting and formatting
### Emacs

See LEARN.


### Visual Studio code

Install [RAISE](https://marketplace.visualstudio.com/items?itemName=janaszkiewicz-dtu.raise) to enable syntax highlighting and formatting:

`Ctrl + P`:
```
ext install janaszkiewicz-dtu.raise
``` 





