# SSH KEY FOR K8S-CLUSTER
### Important: Make sure that, you have to generate the keys in `ssh_key` directory.
### Step 1: Change the directory.

```
cd ssh_key
```

### Step 2: Create private and public key by using ssh-keygen.
#### Note: The name of the file should be `k8s`

```
ssh-keygen -f k8s
```

### Step 3: Change the access permission for `k8s` private key.

```
sudo chmod 400 k8s
```

