# GDPR consent for mailchimp

Marks users as having consented to email marketing using a WEB_GDPR merge datetime field.

### Deploy to heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Create a new merge tag to store consent

Create a datetime merge tag called `WEB_GDPR`

### Create your mailchimp campaign

Create a new campaign to send out to existing subscribers and insert a button linking to the following URL (replacing `my-gdpr-consent-app` with the actual name of your heroku app).

```
https://my-gdpr-consent-app.herokuapp.com/consent?email=*|EMAIL|*
```

### Done.

Send your campaign and hopefully lots of customers opt-in again 😰
