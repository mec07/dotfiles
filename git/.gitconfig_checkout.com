[user]
name = Marc Coury
email = marc.coury@checkout.com
signingkey = B0B75975BEC5D16D
[core]
sshCommand = ssh -i ~/.ssh/id_ecdsa
[commit]
gpgsign = true
[gpg]
program = gpg
