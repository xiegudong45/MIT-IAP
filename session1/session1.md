# ZKP for 3-coloring Demo
## Exercise 1
Q: Currently, you can only select adjacent pairs of nodes to check. Would the proof still be zero knowledge if you could pick arbitrary pairs of nodes to check?

> Yes. Because whether the pair of nodes is adjacent or not is just a piece of information, it cannot help verifier to calculate the whole graph.

## Exercise 2 ZKP for DLOG
> code: zkp_dlog.py

## Exercise 3 zkmessage.xyz
1. Explain why you need to generate and save a “secret” value.

> The "secret" that I generated is used to claim a public key and generate a group signature.

2. Write out a plain-English explanation of what statement is being proven in ZK.
> Users first claim a ZKMessage public key by Tweeting an attestation to a freshly-generated keypair. When a user wishes to submit a post, they select up to 39 other users to form a group, generate a group signature ZK proof for their message client-side, and then send the message and signature to our server, which stores signed posts in a Postgres database. The webserver then serves these signed posts to users who wish to view the message board; users can verify signatures client-side, though they won’t be able to narrow down the original poster beyond the poster’s specified group.

3. Log into the same zkmessage account, from a different browser or computer. Explain why zkmessage can’t just use a simple “username/password” system like most social apps.
> If we simply use “username/password”, a hacker may steal the username & password and make some fake posts. However, if we add public & private key, ther server can verify the credibility of statements that are not attached to known or trusted identities.