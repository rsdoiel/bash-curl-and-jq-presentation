
# Bash, curl and jq

## Accessing the ORCID Public API

+ [R. S. Doiel](http://orcid.org/0000-0003-0900-6903)
+ 2016-06-20, Version 0.0.1, SoCal Code4Lib
+ Woodbury University, Saffel Board Room, Burbank, CA
+ [code{4}lib SoCal Summer '16 meetup](http://www.meetup.com/Code4lib-SoCal/events/231192647/)

--

# Overview

+ Caltech Library's Research Services is promoting ORCID adoption
+ Who has ORCID?
+ Who needs them?

--

## A couple user profiles

1. New graduates (easy case)
2. New researcher/faculty (easy case)
3. Established researcher/faculty with publication history

--

## Our plan for Established Faculty

Incentivising ORCID adoption by helping faculty/researchers port
their publications lists to ORCID.

--

## Prototyping and Exploration phase 

+ We're not exactly sure what we need yet but have some ideas
+ We can iterate through specific user profiles to get a better idea

--

## A simple prototyping toolkit

+ Bash (for orchestrating our interactions)
+ curl (*the* command line utility for working with web content)
+ jq (a JSON processor that can filter or pretty JSON content)

--

## A simple prototyping toolkit

+ Works on Mac OS X, Linux and soon [Windows](https://blogs.windows.com/buildingapps/2016/03/30/run-bash-on-ubuntu-on-windows/) too
+ Actually you can run Bash on Windows for some time
    + MS is officially supporting it via an SDK in Windows 10

--

# What is ORCID?

+ [ORCID](http://orcid.org) is a unique indentifier service for authors and researchers
+ It provides a simple [API](http://members.orcid.org/api/api-calls) for accessing or integrating its content
+ API supports both XML and JSON output (we'll be talking about JSON)

--

# What is JSON?

+ JSON is a simple notation describing a data structure
+ Most languages I can think of can work with JSON 
    + even Bash my using jq
+ It makes it easy to describe trees, lists or object properties
    + JSON-LD is Linked Data expressed in JSON

--

# What role does Bash play?

+ Quick prototyping
    + Interactive
    + script command to record your explorations
    + replay as script
+ Easy for simple templating output
    + embedding text variables and bash functions
+ Easy for orchestrating 
    + Once sequence it working you can automate with cron or run as needed
+ On Linux and Mac OS X there is you already have it installed

--

# Some bash tricks I used

+ Using the environment for configuration
    + A practice I picked up from [12 factor Apps](http://12factor.net/)
+ Sourcing versus running a Bash file 
    + we source configuration, we run bash scripts
+ Pipes (sending content from one program to the next)
+ Assign output to a environment variable
+ Organization repeated tasks into Bash functions

--

# Don't worry I've already written the scripts

+ [etc/setup.conf-example](./etc/setup.conf-example.txt) - configuring things
+ [scripts/api-login.sh](./scripts/api-login.sh.txt) - authenticates and lets us login
+ [scripts/api-bio.sh](./scripts/api-bio.sh.txt) - gets a ORCID Bio
+ [scripts/api-profile.sh](./scripts/api-profile.sh.txt) - gets a ORCID Profile
+ [scripts/api-works.sh](./scripts/api-works.sh.txt) - gets a ORCID works

--

# What role does curl play?

+ curl is your connection to the web
+ curl is a headless browser
+ thinking about the web interaction
    + GET, POST
+ Working special headers (e.g. Authorization Token, desired formats)

--

# What is jq?

    "jq is a lightweight and flexible command-line JSON processor"

+ jq stands for JSON Query
+ Written by [Stephen Dolan](https://stedolan.github.io)
    [stedolan.github.io/jq/](https://stedolan.github.io/jq/)
+ It is easy to install (Windows, Mac OS X and Linux)
    + See the "Downloads" link on website
+ I use *jq* to extract our auth token so we can run our other scripts

--

# Putting it all together

## ORCID APIS

+ Sandbox (for experimenting with)
+ Public (read only, everyone can access)
+ Member (allows updates, must have membership)

--

## Getting access

+ How to signup for an ORCID key
    + You need to have an ORCID account (so get your ORCID now)
    + Developer tab on your account
    + Generating your key

--

## Getting access

+ Sign up at [orcid.org/register](https://orcid.org/register)
+ Go to your ORCID profile [orcid.org/my-orcid](https://orcid.org/my-orcid) 
+ Go to developer tools [orcid.org/developer-tools](https://orcid.org/developer-tools)

--

## connecting and authentication

+ Uses OAuth2 for authentication
+ Which means we need to save the Access Token
+ We can script that with curl and export the token's value as an environment variable

--

## Setting up our environment

+ We're going to "source" the setup script

```
    . etc/setup.conf-example
```

+ Note the "dot" telling Bash we're "sourcing" as opposed to "executing" the script
+ See [etc/setup.conf-example](./etc/setup.conf-example.txt)

--

## Setting up our environment

This sets the following environment variables

1. ORCID_API_URL
2. ORCID_CLIENT_ID
3. ORCID_CLIENT_SECRET


--

## Saving your access token

+ [scripts/api-login.sh](./scripts/api-login.sh.txt)

--

## Authenticating

Example logging in


```
    ./scripts/api-login.sh 

      export ORCID_ACCESS_TOKEN="This-is-a-dmeo-token-db03d93c-f42e2a07d29a"

```

Then cut an paste the "export" link to save the auth token

--

## [Interesting end points](http://members.orcid.org/api/api-calls)

+ Bio
+ Works
+ Profile
+ Search

--

## Getting my bio

+ My ORCID is 0000-0003-0900-6903
+ We'll use [scripts/api-bio.sh](./scripts/api-bio.sh.txt)

```shell
    ./scripts/api-bio.sh "0000-0003-0900-6903" | jq .
```

[Example output](./examples/bio.json)

--

# Getting my list of works

+ My ORCID is 0000-0003-0900-6903
+ We'll use [scripts/api-works.sh](./scripts/api-works.sh.txt)

```shell
    ./scripts/api-works.sh "0000-0003-0900-6903" | jq .
```

[Example output](./examples/works.json)

--

# Getting my profile

+ My ORCID is 0000-0003-0900-6903
+ We'll use [scripts/api-profile.sh](./scripts/api-profile.sh.txt)

```shell
    ./scripts/api-profile.sh "0000-0003-0900-6903" | jq .
```

[Example output](./examples/profile.json)

--

# Finding my ORCID from my email address

+ Let's search for "rsdoiel@caltech.edu"
+ We'll use [scripts/api-search-email.sh](./scripts/api-search-email.sh.txt)

```shell
    ./scripts/api-search-email.sh "*@caltech.edu" | jq .
```

[Example output](./examples/search.json)

--

# Where to go next

+ Our prototype helps us to understand how the ORCID API works
+ I can simply the process into command line tools (e.g. ot project)
+ It can be used with other tooling (e.g. JabRef)
+ ORCID is moving from 1.2 to 2.0 APIs soon
    + this presentation use 1.2 API calls

--

# Reference links

+ [ORCID Docs](http://members.orcid.org/api/introduction-orcid-member-api)
+ [Bash for beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/)
+ [cURL](https://curl.haxx.se/) - See URL, pronounced "curl"
+ [JSON](http://json.org/)
+ [jq](https://stedolan.github.io/jq/)

--

# Credits

+ Thank you to [Caltech Library](http://library.caltech.edu)
    + Gail Clement, Laurel Narizny and Heather Wilson for encouragement
    + Stephen Davison and Betsy Coles for supporting my crazy ideas
+ R. S. Doiel, <rsdoiel@gmail.com> or <rsdoiel@caltech.edu>
    + [ORCID 0000-0003-0900-6903](http://orcid.org/0000-0003-0900-6903)
    + [github.com/rsdoiel](https://github.com/rsdoiel)
    + [github.com/caltechlibrary](https://github.com/caltechlibrary)
+ [github.com/rsdoiel/bash-curl-and-jq-presentation](https://github.com/rsdoiel/bash-curl-and-jq-presentation)


