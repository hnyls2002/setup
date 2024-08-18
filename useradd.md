## Add a New User

### Prepare the Disk

```bash
lsblk # Find available disk
sudo mkfs.ext4 /dev/xxx # Format the disk
```

### Create and Mount the Home Directory

```bash
sudo mkdir /home/username
sudo mount /dev/xxx /home/username
```

### Ensure Persistence on Boot

```bash
echo "/dev/xxx /home/username ext4 defaults 0 2" | sudo tee -a /etc/fstab
```

### Add the User

```bash
sudo useradd -d /home/username -s /bin/bash username
sudo cp -a /etc/skel/. /home/username # Copy the default files
```

### Set Permissions and Ownership

```bash
sudo chown -R username:username /home/username
sudo chmod -R 755 /home/username
```

### Set User Password and Grant Sudo Privileges


```bash
sudo passwd username
sudo usermod -aG sudo username
```