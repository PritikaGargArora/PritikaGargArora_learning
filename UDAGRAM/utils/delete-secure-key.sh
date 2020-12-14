aws ec2 delete-key-pair --key-name "udagrambastionhostkey"
aws ssm delete-parameter --name 'udagrambastionhostkey'
aws ssm delete-parameter --name 'udagrambastionhostkeyprivate'
rm ~/.ssh/udagrambastionhostkey*