# Blockcast Network

**Blockcast Network** is a decentralized content delivery network (CDN) built on the Solana blockchain. 
Its main goal is to address the growing demand for internet bandwidth—especially for high-quality content like 4K streaming,
software updates, and live broadcasts—by using more efficient and cost-effective distribution methods.

## Reward Details:

A 6-month Proof of Resources Epoch, rewarding nodes based on their node capacity.

- Top-performing nodes will receive special NFTs at the end of the epoch.
- Reward rate is based on:
  - Connection quality (your uplink speed)
  - Reliability (consistent uptime)
  - Hardware score (RAM, disk, CPU)
  - Location (where your IP is physically based)
  - BONUS: Multicast-enabled IPs earn extra points!
- Possible to run with a minimal hardware.


## Installation

1. Register [Blockcast Network]([https://0g.app.tradegpt.finance](https://app.blockcast.network?referral-code=zUx95T))

2. Install Tools.
   ```bash
   wget https://github.com/xxin-han/Blockcast/raw/main/Auto_Setup.sh -O setup.sh && chmod +x setup.sh && ./setup.sh
   ```
3. Clone this repository:
   ```bash
   git clone https://github.com/xxin-han/Blockcast
   ```
4. Navigate to the project directory:
   ```bash
   cd Blockcast
   ```

5. Fill proxy list on .env if you using a proxy then save it ctrl + x + y + enter
   ```bash
   nano .env

   #Change HTTP and HTTPS for your proxy/ if not using proxy you must delete "http://123.456.789.10:3128"
       HTTP_PROXY=http://123.456.789.10:3128
       HTTPS_PROXY=http://123.456.789.10:3128
       NO_PROXY=localhost,127.0.0.1
   ```
6. Run command
   ```bash
   docker compose up -d
   ```
7. Stop bot
   ```bash
   docker compose down
   ```

## Register Node

Get location:

   ```bash
   curl -s https://ipinfo.io | jq '.city, .region, .country, .loc'
   ```
if using proxy
   ```bash
   curl -s <change your proxy> https://ipinfo.io | jq '.city, .region, .country, .loc'
   ```
Generate Node Data & Register:
   ```bash
   docker compose exec blockcastd blockcastd init
   ```
- Copy and paste the ```Registration URL``` from the terminal in browser to open the Dashboard.
- With your Hardware ID and Challenge Key pre-filled, Fill-in your location from previous command.
- Register your Node.
- Wait a few minutes until your node truns Online

## Check Logs
Make screen :
   ```bash
        # make new screen
        screen -S log

        # Return screen
        screen -r log
   
        # Minimize screen
        Press: CTRL + A + D
        
        # Screens list
        screen -ls
        
        # Stop Node (when inside a screen)
        Press: Ctrl + C
        
        # Kill and Remove Node (when outside a screen)
        screen -XS log quit
   ```
 
Check Log:
   ```bash
   docker compose logs -fn 1000
   ```
