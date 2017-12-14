heroku pg:backups:capture -rproduction
heroku pg:backups:download -rproduction
pg_restore latest.dump -d worth-chicago_co_development
pg_restore --verbose --clean --no-acl --no-owner -h localhost -d worth-chicago_co_development latest.dump
rm latest.dump
