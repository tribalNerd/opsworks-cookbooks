# Convert Private .pem to .pub RSA Key

----

Download the *.pem key, move to .ssh directory, open terminal

### Create Key

``` cd .ssh/ ```

``` chmod 400 KEY-NAME.pem ```

``` openssl rsa -in KEY-NAME.pem -pubout > KEY-NAME.pub ```

``` chmod 400 KEY-NAME.pub ```

### Access Amazon Instance

``` ssh -i ".ssh/KEY-NAME.pem" ec2-user@ELASTIC-IP-ADDRESS ```

``` ssh -i ".ssh/KEY-NAME.pem" ubuntu@PUBLIC-DNS-AMAZONAWS.COM ```

