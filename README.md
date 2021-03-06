A better pre-commit hook for git.

[![Current version](https://badge.fury.io/rb/pre-commit.png)](https://rubygems.org/gems/pre-commit)
[![Code Climate](https://codeclimate.com/github/jish/pre-commit.png)](https://codeclimate.com/github/jish/pre-commit)
[![Coverage Status](https://coveralls.io/repos/jish/pre-commit/badge.png?branch=master)](https://coveralls.io/r/jish/pre-commit?branch=master)
[![Build status](https://secure.travis-ci.org/jish/pre-commit.png?branch=master)](https://travis-ci.org/jish/pre-commit)
[![Dependency Status](https://gemnasium.com/jish/pre-commit.png)](https://gemnasium.com/jish/pre-commit)
[![Documentation](http://b.repl.ca/v1/yard-docs-blue.png)](http://rubydoc.info/gems/pre-commit/frames)

## Installation

Install the gem

    $ gem install pre-commit

Use the pre-commit command to generate a stub pre-commit hook

    # In your git repo
    $ pre-commit install

This creates a .git/hooks/pre-commit script which will check your git config and run checks that are enabled.

## Configuration

These are the available checks:

* white_space
* console_log
* debugger
* pry
* tabs
* jshint
* js_lint
* closure\_syntax\_check
* php (Runs php -l on all staged files)
* rspec_focus (Will check if you are about to check in a :focus in a spec file)
* ruby_symbol_hashrockets (1.9 syntax. BAD :foo => "bar". GOOD foo: "bar")
* local (executes `config/pre-commit.rb` with list of changed files)
* merge_conflict (Will check if you are about to check in a merge conflict)
* migrations (Will make sure you check in the proper files after creating a Rails migration)
* ci (Will run the `pre_commit:ci` rake task and pass or fail accordingly)
* rubocop (Check ruby code style using the rubocop gem. Rubocop must be installed)
* before_all (Check your RSpec tests for the use of `before(:all)`)
* coffeelint (Check your coffeescript files using the [coffeelint gem.](https://github.com/clutchski/coffeelint))

To configure which checks you would like to run, simply set the `pre-commit.checks` git configuration setting.

To enable `white_space` and `tab` checks:

    # From your git repo
    $ git config "pre-commit.checks" "white_space, tabs"

To enable `white_space`, `console_log` and `debugger` checks:

    # From your git repo
    $ git config "pre-commit.checks" "white_space, console_log, debugger"

Note: If no checks are configured, a default set of checks is run:

    white_space, console_log, debugger, pry, tabs, jshint, migrations, merge_conflict, local

You may also enable checks that will produce warnings if detected but NOT stop the commit:

    # From your git repo
    $ git config "pre-commit.warnings" "jshint, ruby_symbol_hashrockets"


For the rubocop check, you can tell it what config file to use by setting a path relative to the repo:

    # From your git repo
    $ git config "pre-commit.rubocop.config" "config/rubocop.yml"
