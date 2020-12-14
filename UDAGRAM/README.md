# UdaGram Project- Pritika Garg Arora

Project will deploy the web application using Cloud Formation , where ask is to write the code that creates and deploys the infrastructure as a Code and application for an Instagram-like app (UDAGRAM) from the ground up.

## Problem Details:
Your company is creating an Instagram clone called Udagram. Developers pushed the latest version of their code in a zip file located in a public S3 Bucket.
You have been tasked with deploying the application, along with the necessary supporting software into its matching infrastructure.
This needs to be done in an automated fashion so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.

## Resolution:
There will be two parts to this project:

1. A diagram to understand the CloudFormation script.



2. CloudFormation script for Infrastructure as a Code:

**Download the code from GITHUB repository**: (https://github.com/PritikaGargArora/PritikaGargArora_learning)

I have divided CloudFormation script into multiple parts:

a.  utils folder   :  Bash scripts to create / destroy public and private keys. Along with that, for creating, updating and deleting cloudformation stacks.

b.  iam folder     :  To deploy a stack with iam roles and policies for accessing the public S3 bucket.

c.  network folder :  To deploy the vpc, subnets and other network components used in this project.

d.  bastionhost folder :  To deploy the bastion host on the public subnets using elastic ip address.

e.  server foler   :  To deploy a stack with all 4 private servers, Load balancers, Autoscaling and Cloud watch alarms.

## Deployment Steps:
- Execute the below to create public and private keys and upload to AWS.
 ./utils/create-secure-key.sh
 
- Execute the below to create iam stack with all the relevant roles and policies for accessing the public S3 bucket provided by Udacity.
 ./utils/create-stack.sh iam-stack iam/iam-stack-template.yml iam/iam-parameters.json
 
- Execute the below to create network stack with all network components.
 ./utils/create-stack.sh network-stack network/network-stack-template.yml network/network-parameters.json
 
- Execute the below to create bastion host stack, to be deployed on the public subnets.
 ./utils/create-stack.sh bastionhost-stack bastionhost/bastionhost-stack-template.yml bastionhost/bastionhost-parameters.json
 
- Execute the below to create server stack, to be deployed on private subnets.
 ./utils/create-stack.sh server-stack server/server-stack-template.yml server/server-parameters.json
 
***Website link (output from the Load Balancer)*** -

## Rollback -
Scripts to rollback the cloud formation stacks:

 - ./utils/delete-stack.sh server-stack

 - ./utils/delete-stack.sh bastionhost-stack

 - ./utils/delete-stack.sh network-stack
 
 - ./utils/delete-stack.sh iam-stack
 
 - ./utils/delete-secure-key.sh

