# AppUp

> The command that can save you typing 15 characters or more, each time!

[![Build Status](https://travis-ci.org/Cloudstek/zsh-plugin-appup.svg?branch=master)](https://travis-ci.org/Cloudstek/zsh-plugin-appup)

This plugins adds `start`, `restart`, `stop`, `up` and `down` commands when it detects a docker-compose or Vagrant file in the current directory (e.g. your application). Just run `up` and get coding!

### Docker

Aside from simply running `up`, you can also extend your configuration by running `up <name>`, which will run `docker-compose` with both `docker-compose.yml` and extend it with `docker-compose.<name>.yml`. For more on extending please see the [official docker documentation](https://docs.docker.com/compose/extends). Additional arguments will be directly supplied to the docker-compose.

### Vagrant

Vagrant doesn't have a `down`, `restart`, `start` or `stop` commands natively but don't worry, that's been taken care of and running those commands will actually run vagrant's equivalent commands. Additional arguments will be directly supplied to vagrant.

## Command mapping

| Command | Vagrant command                                            | Docker command                                               |
| ------- | ---------------------------------------------------------- | ------------------------------------------------------------ |
| up      | [up](https://www.vagrantup.com/docs/cli/up.html)           | [up](https://docs.docker.com/compose/reference/up/)          |
| down    | [destroy](https://www.vagrantup.com/docs/cli/destroy.html) | [down](https://docs.docker.com/compose/reference/down/)      |
| start   | [up](https://www.vagrantup.com/docs/cli/up.html)           | [start](https://docs.docker.com/compose/reference/start/)    |
| restart | [reload](https://www.vagrantup.com/docs/cli/reload.html)   | [restart](https://docs.docker.com/compose/reference/restart/) |
| stop    | [halt](https://www.vagrantup.com/docs/cli/halt.html)       | [stop](https://docs.docker.com/compose/reference/stop/)      |

