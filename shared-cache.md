## Shared Cache Between Users

To see the basic linux groups and users operations, see [Linux Groups and Users Operations](linux-groups.md).

### Add a new group

```bash
sudo groupadd cacheshare
```

### Add users to the group

```bash
sudo usermod -aG cacheshare root
sudo usermod -aG cacheshare username
```

### Change Directory's Ownership

```bash
sudo chown -R root:cacheshare /path/to/shared/cache
```

### Change Directory's Mode

- `2` in `2775` is the setgid bit, so that the new files and directories created inside the directory will inherit the group of the parent directory.
- The newly created files and directories will inherit the `775` and `664` permissions.

```bash
sudo find /path/to/shared/cache -type d -exec chmod 2775 {} +
sudo find /path/to/shared/cache -type f -exec chmod 0664 {} +
```

### XDG Base Directory Specification

```bash
export XDG_CACHE_HOME="/path/to/shared/cache"
```