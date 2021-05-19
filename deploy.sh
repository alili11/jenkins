#!/bin/bash
ssh -o StrictHostKeyChecking=no -i /secrets/kp-alison.pem ec2-3-22-250-36.us-east-2.compute.amazonaws.com 'sudo mkdir /app'
scp StrictHostKeyChecking=no -i /secrets/kp-alison.pem helloWorld.class ec2-3-22-250-36.us-east-2.compute.amazonaws.com:/app/
ssh StrictHostKeyChecking=no -i /secrets/kp-alison.pem ec2-3-22-250-36.us-east-2.compute.amazonaws.com 'cd /app && java helloWorld'
