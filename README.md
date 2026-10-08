Gmail API
___

Get the code from:-
[url](https://accounts.google.com/o/oauth2/v2/auth?client_id=xyz&redirect_uri=http://localhost&response_type=code&scope=https://www.googleapis.com/auth/gmail.readonly&access_type=offline&prompt=consent)

Get access/refresh token using:-
```
curl -X POST https://oauth2.googleapis.com/token \
  -d "code=xyz" \
  -d "client_id=xyz" \
  -d "client_secret=xyz" \
  -d "redirect_uri=http://localhost" \
  -d "grant_type=authorization_code"
```


