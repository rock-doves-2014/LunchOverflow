# Review

## App Startup

Yay! Migrates cleanly

##  Assets

* Correct use of `/vendor`

## Tests

* Seems like some are just stubbed out....a few....more than a few.  I'd like
  to see more actually working
* Some places exist where a factory might help

Overall, great coverage.

## General

* Watch for trailing whitespace

## Migrations

There's a lot of complexity coming from Taggable.  Otherwise, good constraining
of the DB.

## Routes

It seems pretty reasonable, especially for the amount of complexity and
sophisitcation you're offering in the application.  The question i have is if
there is a way to simplify some of these routes.  It feels like Rails should
have better ways of doing some of these...but it's very nice.  I'm digging for
a comment to have here.

## You should never commit your log/ directory or its contents
