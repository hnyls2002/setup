## Linux Groups and Users Operations

### Show user's groups

```bash
groups
groups $(whoami)
```

### Show group's users

```bash
getent group groupname
```

OR

```bash
sudo apt install members
members groupname
```
