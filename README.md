# CODING CHALLENGE-2 API

APIs and tables to manage tasks and their statuses with additional functionalities like assigning
tasks to users, setting due dates, and tracking progress.


## Development Runbook

#### Install Dependencies 

``` bash
bundle install
```

#### Database Configuration 
#### Used sqlite3 as it comes with Rails by default but I prefer using postgresql

1. Create database
```bash
bundle exec rake db:create
```
2. Migrate db
```bash
bundle exec rake db:migrate
```
### Start Rails server

``` bash
bundle exec rails s
```
### Testing

```bash
bundle exec rspec
```

### API Documentation

https://api.postman.com/collections/25365606-aed5f017-2cc8-4b83-95ce-a3ecf899d04e?access_key=PMAT-01HQK6H2J88BRVV4P0NHXXPKPR


Copy the above output from the link and import in postman to see the results.