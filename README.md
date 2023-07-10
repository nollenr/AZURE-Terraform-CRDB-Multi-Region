# Azure Multi-Region Cockroach Cluster

# TLDR;
Start by creating an SSH Key in Azure (region does not matter).  You'll supply the name of the key as a variable to the HCL (Hashicorp Configuration Language).   This key will allow you to log in to all the compute instances created by this script.

Export the following in the session where you will run the HCL.  An Enterprise license is required to run the CRDB Cluster in a multi-region configuration.
```
export TF_VAR_cluster_organization={CLUSTER ORG}
export TF_VAR_enterprise_license={LICENSE}
```



## Making Sense of the TLS Certs Used in This HCL
| Variable | CRDB  Name| TLS | TLS Name | Note |
| ------   | ----      | --- | -------- | ---- |
| tls_private_key | ca.key | tls_private_key.crdb_ca_keys.private_key_pem | TLS Private Key PEM| |
|tls_public_key|ca.pub|tls_private_key.crdb_ca_keys.public_key_pem|TLS Public Key PEM| |
|tls_cert|ca.crt|tls_self_signed_cert.crdb_ca_cert.cert_pem|TLS Cert PEM| |
|tls_self_signed_cert|ca.crt|tls_self_signed_cert.crdb_ca_cert.cert_pem|TLS Cert PEM|Duplicate of tls_cert for better naming
|tls_user_cert|client.name.crt|tls_locally_signed_cert.user_cert.cert_pem| | | 
|tls_locally_signed_cert |client.name.crt |tls_locally_signed_cert.user_cert.cert_pem | | Duplicate of tls_user_cert for better naming
|tls_user_key|client.name.key|tls_private_key.client_keys.private_key_pem| | |


