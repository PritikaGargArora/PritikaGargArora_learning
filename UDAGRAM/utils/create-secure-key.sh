ssh-keygen -t rsa -b 4096 -f ~/.ssh/udagrambastionhostkey -C "Udagram Bastion Host key" -N '' -q

aws ec2 import-key-pair --key-name "udagrambastionhostkey" --public-key-material fileb://~/.ssh/udagrambastionhostkey.pub
aws ssm put-parameter --name 'udagrambastionhostkeyprivate' --value "$(cat ~/.ssh/udagrambastionhostkey)" --type SecureString --overwrite
aws ssm put-parameter --name 'udagrambastionhostkey' --value "$(cat ~/.ssh/udagrambastionhostkey.pub)" --type SecureString --overwrite