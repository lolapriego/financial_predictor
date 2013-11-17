#  Upload the s3 folder to my bucket at S3

export AWS_ACCESS_KEY_ID=AKIAITOWCCIPV6ONJ*****
export AWS_SECRET_ACCESS_KEY=****************
export SSL_CERT_DIR=./certs
export AWS_CALLING_FORMAT=SUBDOMAIN

ruby  ./s3sync/s3sync.rb -r --progress ./s3 tweetcollector:data

rm -f ./s3/*