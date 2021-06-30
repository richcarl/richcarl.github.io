---
title: "Richard's Cygwin Tips"
layout: page.njk
description: "Richard's Cygwin Tips"
eleventyNavigation:
  key: Cygwin
  title: Cygwin Tips
  parent: Home
---
# Richard\'s Cygwin Tips

Cygwin is a free Unix/Linux-like (POSIX) environment for Windows. It
consists of:

-   a DLL (cygwin1.dll) which acts as a Linux API emulation layer
-   a collection of programs, config files, documentation, etc.,
    providing a Linux look-and-feel

The official Cygwin home page is <http://cygwin.com/>.

## Why Cygwin

-   The MS-DOS/Windows console and command line shell is almost useless,
    there are few available console programs (with very ad hoc
    behaviour), and there is no package management.
-   The Unix world has much better consoles and shells, loads of
    standardized and very useful programs, and the Cygwin installer
    program handles downloads and updates for you.

## How does it work?

-   It is *not* an emulator or virtual machine - the programs are normal
    Win32 executables that just use the Cygwin DLL.
-   The whole point of the Cygwin DLL is that programs written for
    Unix/Linux don\'t have to be rewritten in order to run under
    Windows.
-   This means that *huge* amounts of free/open source Unix software is
    available also on Windows.
-   However, the programs believe that they are running in a Unix
    environment!
    -   By default, they assume that newlines are LF, not CRLF, but this
        is usually not a problem (see the [Cygwin FAQ entry on the CR/LF
        issue](http://cygwin.com/faq/faq-nochunks.html#faq.api.cr-lf)
        for further info.
    -   For programs that are sensitive to newline conventions, you
        should keep DOS/Windows files separate from Cygwin/Unix files.
    -   You can use the dos2unix and unix2dos commands to convert or
        normalize newlines in files.
-   The programs see the Windows file system as if it was a Unix file
    system, with Unix user/group permissions, etc.
    -   A Unix program compiled under Cygwin does not have to understand
        MS-DOS drive letters.  Instead of \"C:\\\...\", it just sees a
        normal Unix-like path \"/cygdrive/c/\...\".
    -   You can use the cygpath command in scripts to convert between
        Unix- and Windows-style paths.

## Installing Cygwin

1.  Go to <http://cygwin.com> and download the file setup.exe
2.  Save this file somewhere for future use and make a shortcut to it.
    You will run it later every time you want to update or add
    packages.\
3.  Run the setup.exe program once, *without changing any settings*
    (except for possibly the install directory). **Keep all RECOMMENDED
    settings and don\'t add or remove packages yet**.
    -   ftp.sunet.se is a good mirror if you\'re in Sweden.
    -   Detailed setup help can be found
        [here](http://cygwin.com/cygwin-ug-net/setup-net.html)
4.  After installation, click one of the new icons to start a shell and
    check that things are working.
5.  Whenever you want to check for updates, just run the setup.exe
    program again (without changing any settings). If there are updated
    versions of packages you already have, they will be automatically
    installed.
6.  If you want to add or remove packages, do the same thing, but browse
    the package tree and select/deselect packages as you like.

## Post-install setup

When you click the icon to start a Cygwin shell, it runs
C:\\Cygwin\\cygwin.bat (if you used C:\\Cygwin as the install
directory). You should edit this file to set up some things:

1.  Set the CYGWIN environment variable to \"ntsec\" (if you have NTFS
    partitions). Look
    [here](http://cygwin.com/cygwin-ug-net/using-cygwinenv.html) for
    more details.
2.  Set the HOME environment variable to the DOS path to your home
    directory. If you used C:\\Cygwin as install directory, then HOME is
    typically C:\\Cygwin\\home\\username, but there is nothing stopping
    you from changing this to somewhere else.
3.  You might want to specialize your PATH settings for Cygwin shells.
    For example:\
     set CYGWIN=ntsec\
     set HOME=C:\\Cygwin\\home\\Dorothy\

## Caveats

-   Many \"plain Windows\" console programs don\'t work properly with
    input if they are called from a Cygwin-shell; in particular,
    programs that want to ask the user questions about password etc.
    tend to hang or not print the question until you have pressed enter.
    There is more details on this problem in the [PuttyCyg
    FAQ](http://code.google.com/p/puttycyg/wiki/FAQ).
-   Because of package dependencies, you may get Cygwin-versions of
    languages like Perl, Python, Ruby, etc., that you might already have
    native Windows versions of. It can be tricky to make sure that you
    run the right version at the right time. In general, don\'t try to
    run the Windows versions of such languages from the Cygwin shell,
    but run them from a normal Windows console instead.
-   Although you might think it would be convenient to have access to
    Cygwin utilities even when you\'re not in a Cygwin shell, by putting
    C:/cygwin/bin in your global Windows PATH, this may cause DLL
    conflicts where there are two types of DLLs with the same name
    (tcl84.dll is a common example), or just get you into trouble with
    having both a Cygwin executable and a Windows executable with the
    same name (find.exe is one example). The general advice is **do not
    put cygwin/bin in your Windows PATH!** Use
    [GnuWin32](http://gnuwin32.sourceforge.net/) to get the most common
    Unix tools as native Windows programs instead, and put those in your
    Windows path.

## A better console window

By default, Cygwin will use the standard Windows console to run the
command line interpreter in. Since this sucks in many ways, you should
use rxtv instead.

### Rxvt

1.  Run setup.exe again, and just skip to package selection. In the
    group *shells*, you should find rxvt: \"VT102 terminal emulator for
    both X and Windows\". Select this, and click Next to finish the
    installation.

2.  Edit C:\\Cygwin\\cygwin.bat again, and change the line that starts
    bash (or whatever shell you use) to the following:

        rxvt -e bash --login -i

The thing with rxvt is that it is really an X11 application, but it also
works on Windows without an X11 server running. Either way, you can
configure it in your \$HOME/.Xresources file; e.g., like this:

     rxvt.geometry: 80x32
     rxvt.boldFont: Lucida Console-12
     rxvt.font: Lucida Console-12
     rxvt.loginShell: True
     rxvt.saveLines: 5000
     rxvt.scrollBar_right: True
     rxvt.visualBell: True

## Configuring tab-completion etc.

The shell (bash) uses the GNU Readline library to read lines of input.
This is where the input history, tab-completion, etc., is handled. You
can configure it by editing your \$HOME/.inputrc file. Here is an
example:

     # These are for proper 8-bit characters (åäö, etc.)
     set meta-flag on
     set input-meta on
     set output-meta on
     set convert-meta off

     # Just flash screen, don't beep
     set bell-style visible

     # Be case-insensitive (nice on Windows machines)
     set completion-ignore-case on

     # These are also nice for tab-completion
     set completion-query-items 16
     set mark-symlinked-directories on
     set print-completions-horizontally on
     set show-all-if-unmodified on

     # Home Key
     "\e[7~":beginning-of-line

     # End Key
     "\e[8~":end-of-line

     # Ctrl-cursor right/left
     # (change to end-of-line/beginning-of-line if you prefer)
     "\eOc":forward-word
     "\eOd":backward-word

     # Alt-cursor right/left
     "\e\e[C":forward-word
     "\e\e[D":backward-word

     # Page up/down for beginning/end of history
     "\e[5~":beginning-of-history
     "\e[6~":end-of-history

Run \"man readline\" for details and more options. An easy way of
checking the control sequence generated by a keypress is to run the
command \"[od -c]{style="font-family: monospace;"}\" and type away. End
by pressing Ctrl-d twice. Where the output says \"033\", use \"\\e\" in
the file.

## Starting an X server

An X server is useful for running GUI programs on remote Unix machines,
but have the windows pop up on your local screen instead.

First, you need to run the Cygwin setup.exe program and install at least
the package xorg-x11-base (in the package group X11). See
[here](http://x.cygwin.com/docs/ug/setup-cygwin-x-installing.html) for
detailed help.

After installation, the easiest way to start the X server is probably by
creating a shortcut to the file
C:\\Cygwin\\usr\\X11R6\\bin\\startxwin.bat. You shouldn\'t need to edit
the .bat file, but you might want to take a look at it just to see what
it is doing. More details
[here](http://x.cygwin.com/docs/ug/using.html).

Note that when the server is running, you can control it through an icon
in the Windows tray.

------------------------------------------------------------------------

[Back to Richard\'s home page](index.html)
