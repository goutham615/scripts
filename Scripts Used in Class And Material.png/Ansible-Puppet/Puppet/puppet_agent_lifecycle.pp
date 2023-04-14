Communication between the nodes and the master in a Puppet environment is verified with a system of X.509 SSL certificates. The master operates as a certificate authority (CA) for the system, although you may specify another server to act as the CA. When the agent first runs on a node, there are several steps taken to set up the trust relationship between the node and the master, which are outlined as follows:
#Puppet Client Registring with Puppet Master
The agent contacts the master and downloads the CA certificate.
The agent generates a certificate for itself based on the certname configuration option, which is usually equivalent to the hostname of the node.
The agent issues a certificate signing request (CSR) to the master, asking the master to sign its certificate.
The master may choose to sign the certificate (if automatic signing is configured) or the operator of the master may sign the certificate.
The agent will check back every 2 minutes by default (configurable with the waitforcert option) to check whether its certificate has been signed.
Once it has been signed, the agent will download its signed certificate.

How Catalog is applied:
https://subscription.packtpub.com/book/networking_and_servers/9781784398651/1/ch01lvl1sec08/the-lifecycle-of-a-puppet-run


