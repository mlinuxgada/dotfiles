This guide isn't about how to back up your personal files!

What if you'd get a new machine and wanted to make it run Manjaro too?
Without having to install all the programs you added so it would really suit you - which usually means installing them one by one by using the package manager of your choice?

This is just one possible scenario, another would be that you want to have a backup up and running fairly quickly.

You could follow this guide and just back up your personal files
- along with two others, which will contain the information to turn a standard Manjaro installation into the one that you had before.
With just two commands on the old machine - and another two on the new one
you'll have all the things you had before.

Here is how to do it.

On your old machine, do:

Backup - repository
back up the list of currently installed packages from the standard repositories:
Code: [Select]
pacman -Qqen > pkglist-repo.txt

Backup foreign packages - AUR
back up the list of currently installed packages from the AUR:
Code: [Select]
pacman -Qqem > pkglist-aur.txt



On the other/new machine:
just do a quick standard installation of Manjaro from a recent ISO on the other machine and then use these two files to have pacman do the work for you.


Do pending updates first in the new installation!
Then restore using the following two commands.

Reinstall from list - repository:
have pacman reinstall all those packages you had installed on the other machine:
Code: [Select]
sudo su
then run:
Code: [Select]
for x in $(cat pkglist-repo.txt); do pacman -S --needed $x; done

This here was the original command given, but it did not work. Still don't know why.
sudo pacman -S --needed $(< pkglist-repo.txt)

Reinstall from list - AUR:
have yaourt reinstall all those extra packages you had:
Code: [Select]
yaourt -S --needed --noconfirm $(< pkglist-aur.txt)

If there are many packages to build, you'll have to re-suppy your password again because sudo will time out. The process will just stall, but not stop.
However, this part may indeed fail to build some packages if the available versions are for some reason out of date.
Also, it will fail right at the start if some packages you had installed are no longer available!
This happened to me for two packages.
Solution: remove those from the list by editing it.
If one package fails to build, the whole process will end and you'll need to restart the process by runing that same command again (possibly after removing the broken package from the list).

Now you only need to take care of backing up your personal files and move them to the other machine after a standard installation.

I hope this is useful.

The information was gathered up from here:
https://wiki.archlinux.org/index.php/Pacman_tips#Backing_up_and_retrieving_a_list_of_installed_packages
and from here:
https://wiki.archlinux.org/index.php/pacman#How_do_I_reinstall_all_packages.2C_retaining_information_on_whether_something_was_explicitly_installed_or_as_a_dependency.3F
and condensed into this guide.

FadeMind kindly helped in creating and correcting it. Thanks again!


This guide was adapted after reports of it not working as described.
Please see this post further down the thread:
https://forum.manjaro.org/index.php?topic=16484.msg155177#msg155177
