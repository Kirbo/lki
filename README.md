Here are the scripts on my Macbook Pro I use every day at work.

All of these are located in `~/Documents/Scripts`, some of the scripts (eg. `Logout.app` heavily rely on this location.

I have set `login_scripts` to be executed at login, in Apple menu -> System preferences -> Users & groups -> my work user (lki) -> Login items.
When I end my day, I execute the `Logout.app` application which is a shortcut in my Dock (it has a confirm in it, so if I accidentally click on it, it wont do a thing).

`login_scripts` and `logout_scripts` are a wrappers which executes a bunch of other scripts, such as:

`login_scripts`
- Set my Skype status to "Online"
- Check if I have already worked today
 - If not, create a new row to database
 - If yes, asks is this one a flexitime or billable work and then creates a new database row
- Opens all predefined SSH tunnels

`logout_scripts`
- Closes all predefined SSH tunnels
- Set my Skype status to "Away"
- Update database that I've stopped working

A lot of spaghetti, but since they all do their job and no one will ever pay for these scripts I've done for myself, I hadn't had any motivation to make these scripts more robust.
