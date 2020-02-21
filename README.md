Docker Mailbox Sync
===================

A Docker container which runs the [`mbsync`][1] tool automatically to synchronize your email.

 [1]: http://isync.sourceforge.net/mbsync.html

[![Docker Pulls](https://img.shields.io/docker/pulls/jakewharton/mbsync.svg)](https://hub.docker.com/r/jakewharton/mbsync/) [![](https://images.microbadger.com/badges/image/jakewharton/mbsync.svg)](https://microbadger.com/images/jakewharton/mbsync)


Setup
-----

Select and create two directories:

 * The "mail" directory where email will be stored. (From now on referred to as `/path/to/mail`)
 * The "config" directory where your configuration file will be stored. (From now on referred to as `/path/to/config`)


### Config

TODO


### Initial Sync

The first time this container runs, it will download all of your historical emails.

It is not required, but if you'd like to run this sync manually you can choose to do so.
This allows you to temporarily interrupt it at any point and also restart if it gets stuck.

```bash
$ docker run -it --rm
    -v /path/to/config:/config \
    -v /path/do/mail:/mail \
    jakewharton/mbsync
```

This will run until all emails have been downloaded. At this point, you should set it up to run automatically on a schedule.


### Running Automatically

To run the sync automatically on a schedule, pass a valid cron specifier as the `CRON` environment variable.

```bash
$ docker run -it --rm
    -v /path/to/config:/config \
    -v /path/do/mail:/mail \
    -e "CRON=0 * * * *" \
    jakewharton/mbsync
```

The above version will run every hour and download any new emails. For help creating a valid cron specifier, visit [cron.help][2].

 [2]: https://cron.help/#0_*_*_*_*


### Monitoring

To be notified when sync is failing visit https://healthchecks.io, create a check, and specify the URL to the container using the `CHECK_URL` environment variable.

Because the sync can occasionally fail, it's best to set a grace period on the check which is a multiple of your cron period. For example, if you run sync hourly give a grace period of two hours.


### Docker Compose

```yaml
version: '2'
services:
  mbsync:
    image: jakewharton/mbsync:latest
    restart: unless-stopped
    volumes:
      - /path/to/mail:/mail
      - /path/to/download:/download
    environment:
      - "CRON=0 * * * *"
      - "CHECK_URL=..." #Optional!
```



LICENSE
======

MIT. See `LICENSE.txt`.

    Copyright 2020 Jake Wharton

Much of the container scripts were derived from [bcardiff/docker-rclone][3].

 [3]: https://github.com/bcardiff/docker-rclone
