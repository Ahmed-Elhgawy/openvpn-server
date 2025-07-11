# 🚀 OpenVPN EC2 Deployment with Terraform

This project automates the provisioning of an AWS EC2 instance and installs an OpenVPN server using Terraform. It handles the following:

- Creates a secure and properly routed AWS VPC with a public subnet.
- Deploys an EC2 instance with Ubuntu 22.04.
- Installs and configures OpenVPN using a custom `openvpn-install.sh` script.
- Automatically transfers the generated `client.ovpn` file to the local user's machine for easy connection.

---

## 📁 Project Structure

```bash
.
├── images
│   ├── screen1.png
│   └── screen2.png
├── openvpn-install.sh
├── main.tf
├── outputs.tf
├── variables.tf
└── README.md
```

---

## ✅ Prerequisites

Before you begin, make sure you have:

- An [AWS account](https://aws.amazon.com/)
- [Terraform](https://developer.hashicorp.com/terraform/install) v1.3+ installed
- An SSH key pair generated locally (`~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`)
- S3 backend bucket already created for remote state (as defined in `main.tf`)

---

## 📸 Screenshots

| ✅ Successful Terraform Deployment | 🔗 OpenVPN Client Connected |
| ---------------------------------- | ---------------------------- |
| Shows the terminal output after deploying the infrastructure and installing OpenVPN. | Demonstrates a successful connection using the downloaded `client.ovpn` file. |
| ![Terraform Deployment Output](images/screen2.png) | ![OpenVPN Client Connected](images/screen1.png) |

---

## 🔧 Setup and Usage

### 1. Clone the Repository

```bash
git clone https://github.com/Ahmed-Elhgawy/openvpn-server.git
cd openvpn-server
```

### 2. Customize Variables (Optional)

Edit `variables.tf` or override values via CLI:

```bash
terraform plan \
  -var="my_public_ip=YOUR_PUBLIC_IP/32" \
```

⚠️ Default allows SSH from any IP. For security, set `my_public_ip` to your machine's IP.

###3. Initialize Terraform

```bash
terraform init
```

### 4. Apply the Terraform Configuration

```bash
terraform apply
```
This will:
- Spin up the infrastructure
- Copy `openvpn-install.sh` to the EC2 instance
- Make the script executable and run it remotely
- Download the generated `client.ovpn` config file to `~/client.ovpn`

--- 

## 🔑 Connecting to OpenVPN

Once provisioning is complete:
1. Use the downloaded `~/client.ovpn` file.
2. Import it into your VPN client (e.g., [OpenVPN Connect](https://openvpn.net/client/)).
3. Connect to your VPN.

---

## 🧹 Cleanup

To destroy all resources:

```bash
terraform destroy
```

---

## 🛠️ Customization

You can modify `openvpn-install.sh` to preconfigure users, change ports, or apply advanced OpenVPN configurations. Make sure the file is executable and located in the project root.

---

## 🔐 Security Notes

- SSH access is limited to the IP provided in `my_public_ip`.
- VPN uses default configurations from the installer script — update it to enforce stricter security policies if needed.
- The `.ovpn` file is downloaded to the home directory. Handle it securely.

---

## 📦 Outputs

After a successful deployment, Terraform will output:
- `instance_public_ip`: The public IP of the OpenVPN server.

---

## 🙋 Support

If you encounter any issues or have feature requests, feel free to open an issue or contribute to the repository.

---