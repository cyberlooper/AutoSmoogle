# AutoSmoogle
Powershell-based configuration generator for Translational circuits within a Discord Server. By use of Autoall and Link commands unique to Smoogle Translate bot.

# Disclaimer
This solution is made for users of Smoogle Translate, however, it is a personal project that is not officially supported by the Smoogle Support or Development teams.

Any issues, bugs or other operationally released problems can and MUST me sumbmitted though this repo's Issue tab.

## Usage
Currently only supporting Windows.

CAVEAT: Can only be used in IDE environments such as Powershell ISE or Visual Sudio Code.

### Download

1. The git way.

    `git clone https://github.com/cyberlooper/AutoSmoogle`
    - Navigate to the folder AutoSmoogle was cloned to.
    - Right-Click **main-windows.ps1**
    - Select **Edit**
    - Press **F5** to run the script

2. Manual
   - **Download** the latest release from Releases.
   - **Unpack** to a folder of your choice
   - Navigate to the folder you unpacked to
   - Right-click **main-windows.ps1**
   - Select **Edit**
   - Press **F5** to run

### Using the software

- AutoSmoogle will walk you through how to format the Discord Channels to the naming convention that works for the script.
- You can provide a CSV in the following form:
    ```csv
    channel,lang
    chat-en,en
    chat-de,de
    ```
- If you dont have a CSV to provide, the script will help generate one for you.
- Once complete, it provides a txt file with each individual command that you will need to copy and paste into your server to setup the circuit.
`AUTOSMOOGLE cannot do this for you`

### Support

AutoSmoogle is provided by **OlympiTech**
https://discord.gg/7hwNHFPJCc

However, if there is an issue with the script, please open issue using the Issue tab on this Repo. OlympiTech will point you to this also.