This documentation is generated using the amazing [Slate](https://github.com/lord/slate) framework.

Getting Started
----------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 1.9.3 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on Github.
2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/slate.git`
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up

# OR run this to run with cap
cap production deploy
```

You can now see the docs at http://localhost:4567 or http://52.209.73.13. Whoa! That was fast!


Contributors
--------------------

The main contributor to this fork is [Roberto Marco](https://github.com/robmarco) and [Josué de León](https://github.com/kohrong).
Slate Framework was built by [Robert Lord](https://lord.io) while at [TripIt](https://www.tripit.com/).
