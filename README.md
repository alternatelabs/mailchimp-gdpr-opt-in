# GDPR consent for Mailchimp

A microservice to help with Mailchimp and GDPR reconsent campaigns. Mailchimps GDPR fields are pretty hefty and currently not supported unless you use their hosted signup forms, this invents a new approach creating your own WEB_GDPR merge field to track consent of your existing list and new subscribers.

### Deploy to heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Create a new merge tag to store consent

In your list go to Settings -> `List fields and *|MERGE|* tags`

Create a Date merge tag called `Website GDPR consent` and update the merge tag name to `WEB_GDPR`.

### Create your mailchimp campaign

Create a new campaign to send out to existing subscribers and insert a button linking to the following URL (replacing `my-gdpr-consent-app` with the actual name of your heroku app).

```
https://my-gdpr-consent-app.herokuapp.com/consent?email=*|EMAIL|*
```

### Send your campaign

Send your campaign and hopefully lots of customers opt-in again 😰

### Sending future campaigns

You now have a field you can use to manage consent, you want to segment your list using `Website GDPR consent` `is not blank`.

### Update your website newsletter form

Make sure you update your website form to be GDPR compliant and pass along a prefilled `WEB_GDPR` value set to todays date.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
