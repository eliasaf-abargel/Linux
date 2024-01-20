# NetApp FS drive configured with CIFS  Liunx

**Check for Updates**

```bash
sudo dnf check-update
```

**Apply Updates**

```bash
sudo dnf update
```

**Install Required Packages**

```bash
sudo dnf install cifs-utils
```

**Create a Mount Point**

```bash
sudo mkdir /mnt/netapp
```

**Obtain Credentials**

Create a credentials file

```bash
sudo nano /etc/cifs-credentials
```

Add the following content (replace with your actual username and password)

```bash
username=myusername
password=mypassword
```

Secure the credentials file

```bash
sudo chmod 600 /etc/cifs-credentials
```

**Mount the NetApp Drive Temporarily**

```bash
sudo mount -t cifs //NetApp_IP/ShareName /mnt/netapp -o credentials=/etc/cifs-credentials
```

**Test the Mount**

```bash
ls /mnt/netapp
```

**Automate the Mount at Boot - Open the fstab file**

```bash
sudo nano /etc/fstab
```

Add the following line (adjust paths and names to match your setup):

```bash
//NetApp_IP/ShareName /mnt/netapp cifs credentials=/etc/cifs-credentials 0 0
```

**Test the fstab Entry**

```bash
sudo mount -a
```

After reboot server and test netapp
