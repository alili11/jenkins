#!/bin/bash
scp -i /secrets/kp-alison.pem helloWorld.class ec2-3-22-250-36.us-east-2.compute.amazonaws.com:/app/
ssh -i /secrets/kp-alison.pem ec2-3-22-250-36.us-east-2.compute.amazonaws.com 'cd /app && java helloWorld'
