# stellwerk
An application for managing food donations across facilities

 Setup

## Basic assumptions

You're running Mac OS X, and you have a C compiler and Homebrew installed.

You have Ruby installed through a system like `rvm`, `rbenv`, or `chruby`. If
you want to use system Ruby, don't come crying to us... ;-)

Linux will work fine, but you'll need to figure out which extra packages you
need by consulting the `Brewfile`.

## Basic setup

1. Ruby
  See `.ruby-version` for the current ruby version we're using. We expect you
  to have already run `gem install bundler`

2. Clone the project
  If you haven't already done so...

  ```
  $ git clone git@github.com:Tafelstellwerk/stellwerk.git
  ```

3. Databases and other third-party dependencies
  ```
  $ brew bundle
  ```

  Non-rails dependencies are listed in the Brewfile, so you can easily figure
  out what to install if you're on Linux.

  Don't forget to ensure you've got all the services started -
  `brew info {service}` normally reports the `launchctl` invocation and other
  setup steps you need.

4. Ruby dependencies
  ```
  $ bundle install
  ```

5. Javascript dependencies
  ```
  $ npm install
  ```
6. Databases
tbd

7. Make sure the test suite runs

  ```
  $ ./bin/rake
  ```
  
8. Environment vars
tbd

8. Run the rails server
  ```
  $ rails s
  ```

