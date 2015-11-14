# Creating a Key Pair for an AWS EC2 Instance

## Move Downloaded Key File

``` mv Downlaods/KEY-PAIR-NAME.pem .ssh/KEY-PAIR-NAME.pem

## Chmod The Private Key File

``` chmod 400 .ssh/KEY-PAIR-NAME.pem ```

## Generate Public RSA Key

``` openssl rsa -in .ssh/KEY-PAIR-NAME.pem -pubout > .ssh/KEY-PAIR-NAME.pub ```

## Connect to EC2 Instance

``` ssh -i ".ssh/KEY-PAIR-NAME.pem" ec2-user@EC2-PUBLIC-DNS ```