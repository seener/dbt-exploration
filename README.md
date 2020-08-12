## Setup

Here is how I setup my dbt env. 

1. Install dbt: `$ pip install -U dbt`. If you are using conda environments you'll want to activate the appropriate environment prior to doing the pip install. Also I am assuming you're using `pip`.

2. Check the version: `$ dbt --verion` and you should get something like:
```
installed version: 0.17.2
   latest version: 0.17.2

Up to date!

Plugins:
  - bigquery: 0.17.2
  - snowflake: 0.17.2
  - redshift: 0.17.2
  - postgres: 0.17.2
```

3. The data that I worked with I found from [here](https://www.postgresqltutorial.com/postgresql-sample-database/)

4. I restored the above data to my local postgres server to a database called dvd_rental as well as created a `dev` schema and a dbt user with proper permissions on the dvd_rental database. 

5. I from there I used a variety of sources to help me get things going:
- https://docs.getdbt.com/tutorial/setting-up
- https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/
- https://github.com/mikekaminsky/dbt-setup-example

## Info provided as a the default from dbt
### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
