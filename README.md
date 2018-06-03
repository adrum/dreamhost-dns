# Dreamhost DNS

This script helps you update a DNS entry if your machine is accessible behind a dynamic IP.

## Example

```
dh_domain=example.com dh_api_key=MYAPIKEY ./dreamhost.bash
```


## Cron entry

```
0 1,13 * * * dh_domain=example.com dh_api_key=MYAPIKEY ./dreamhost.bash > /dev/null
```
