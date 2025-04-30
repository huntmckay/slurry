# Workstation and Access Guide
This guide is not for the faint of heart, its for those who are not scared to swim in mud.

## HOST 1 – Physical Workstation

- **Authentication Method:** Username/Password
- **Environment:** Ubuntu 20.04
- **Purpose:** Init CVTE range Access

### What can I do here?
- You can pass butter (Clipboard contents can be pasted into CVTE)

### Login
- **Username:** `hunter.s.mckay94`
- **Password:** *your personal password*

### Notes
- Internet access is allowed.
- **No `sudo` or root access** for personal configuration.
- Keep a personal AWS EC2 instance (e.g., `t2.medium`) for notes and tools (see attached guide).
- This could be your personal device from a hotel/home since VTA is being phased out.

### After Action Review (AAR)
- Internet access allowed, but no `sudo` or root privileges for customization.
- Successfully connected to AWS EC2 instance for personal workstation needs and preservation of notes.
- VTA defunded, likely replaced with restricted NIPR Windows without licensing for components 2 & 3.

---

## HOST 2 – VMware Horizon Virtual Desktop

- **Authentication Method:** CAC Authentication
- **Purpose:** NIPR protected virtual classroom
- **Environment:** Windows 11

### What can I do here?
- ssh directly into the range with ssh ProxyJump [Host 4+]
- rdp directly to CCTC range via ssh port forwarding [Host 4+]
- ssh to CVTE range Ubuntu or Windows [Host 3]
- rdp to CVTE range Ubuntu or Windows [Host 3]
- use neovim, and push down into the range for text editor on windows
- use git to pull personal configs from your own git
- paste from Host 1 clipboard

### Login
- **CAC CARD ONLY**

### Instructions (the school house indended way)
1. Launch VMware Horizon from Host 1.
2. Authenticate with CAC.
3. Open Chrome, navigate to [CVTE Portal](https://home.ccoecaas.net).
4. Access Aria Automation (CSTN).
5. Connect via `ucfgllcpcl090.ccoecaas.net → Service Broker → Virtual Instances → ⋮ → Connect`.

### Notes
- Copy from Outside, Paste inside; not bi-directectional.
- Internet access allowed.
- No admin privileges for personal configuration.
- Data wiped daily; use roaming profile for persistence.

### AAR
- Similar to AVD, no admin access.
- Windows Terminal available, lacks PowerShell 7+.
- Noted confusion between "GAIN, EXPLOIT, ATTACK, DEFEND"—should be replaced with "RDP, SSH, RDP, RDP."

#### PowerShell Profile and Tools Setup
See provided PowerShell script for detailed setup:
- Link roaming profiles (PowerShell, SSH configs)
- Temporary policy bypass
- Custom aliases and functions

#### SSH Configuration
- Set up SSH config with a roaming profile (see provided SSH config).
- Use RDP locally (`localhost:48484`) as long as the connection is active.
- lets us use in range GUI's over ssh port forwarding.

---

## HOST 3 – CVTE Virtual Desktop
- **Purpose:** CCTC Challenge Server Access
- **Environment:** Ubuntu 20.04 (or windows, I didnt use it, no ssh)

### What can I do here?
- Only host you can read / submit CCTC challenge questions on
- ssh to all of range with some nice short hand config

### Login
- **Username:** `cvte`
- **Password:** `cvte`

### CCTC Challenge Server Instructions
1. Go to `http://10.50.147.59:8000/`
2. **Login Credentials:**
   - **Username Format:** First 2 letters of first name + Last 2 letters of last name + class number + cohort
     - Example: Hunter McKay, Class 25-001 → `HUMC-001-W`
   - **Password:** `password123`

### SSH Configuration
Example configuration provided for access to various hosts via SSH.

---

## HOST 4 – CCTC Range Admin

- **Purpose:** CCTC Range Access
- **Environment:** Windows 10

### What can I do here?
- This is the official range access admin host
- find flags

### Login
- **Username:** `andy.dwyer`
- **Password:** `BurtMacklinFBI`

### Instructions
1. Open RDP client.
2. Connect to: `10.10.XXX.XXX`

### Notes
- No internet access.
- Admin permissions

---
# Contributors
- Hunter McKay
- Spencer Rak
