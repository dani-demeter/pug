### Elixir Installation

```bash
#! /bin/sh

usr=$USER

sudo su
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb
rm erlang-solutions_1.0_all.deb
apt update
apt install -y esl-erlang
apt install -y elixir
su $usr
```


### Dependencies

```bash
$ mix deps.get
```

### Running the Application

```bash
$ mix run --no-halt
```