# Exchange online info

## Servers
| login | server | port | encryption
--- | --- | --- | ---
IMAP4 | outlook.office365.com | 993 | tls
SMTP | smtp.office365.com | 587 | tls

---
## Installation and import module
```powershell
Install-Module -Name ExchangeOnlineManagement
Import-Module ExchangeOnlineManagement
```


## Set Polish
```powershell
Set-MailboxRegionalConfiguration user@doma.in -Language pl-PL -DateFormat dd.MM.yyyy -TimeFormat HH:mm -TimeZone "Central Europe Standard Time" 
```

```powershell
.\OUTLOOK.exe /resetfoldernames
```



## Docs
* [installation](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps#install-and-maintain-the-exo-v2-module)

* [more info](https://docs.microsoft.com/en-us/powershell/exchange/exchange-online-powershell-v2?view=exchange-ps)