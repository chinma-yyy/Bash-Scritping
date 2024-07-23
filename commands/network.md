#### `ifconfig`
Network interface configuration and tuning utility.

#### `host`
Searches for information about an Internet host by name or IP address, using DNS.

#### `ipcalc`
Displays IP information for a host. With the `-h` option, `ipcalc` does a reverse DNS lookup, finding the name of the host (server) from the IP address.

#### `nslookup`
Performs an Internet "name server lookup" on a host by IP address. This is essentially equivalent to `ipcalc -h` or `dig -x`. The command may be run either interactively or non-interactively, i.e., from within a script.

#### `dig`
Domain Information Groper. Similar to `nslookup`, `dig` does an Internet name server lookup on a host. It may be run from the command-line or from within a script.

#### `traceroute`
Traces the route taken by packets sent to a remote host. This command works within a LAN, WAN, or over the Internet. The remote host may be specified by an IP address. The output of this command may be filtered by `grep` or `sed` in a pipe.

#### `ping`
Broadcasts an ICMP ECHO_REQUEST packet to another machine, either on a local or remote network. This is a diagnostic tool for testing network connections and should be used with caution.

#### `whois`
Performs a DNS (Domain Name System) lookup. The `-h` option permits specifying which particular `whois` server to query.

#### `finger`
Retrieves information about users on a network. Optionally, this command can display a user's `~/.plan`, `~/.project`, and `~/.forward` files, if present.

#### `vrfy`
Verifies an Internet e-mail address. This command seems to be missing from newer Linux distros.

#### `wget`
The `wget` utility non-interactively retrieves or downloads files from a Web or FTP site. It works well in a script.

#### `lynx`
The `lynx` Web and file browser can be used inside a script (with the `-dump` option) to retrieve a file from a Web or FTP site non-interactively.

```bash
# Retrieve a file from a web page.
lynx -dump http://www.xyz23.com/file01.html >$SAVEFILE
```

With the `-traversal` option, `lynx` starts at the HTTP URL specified as an argument, then "crawls" through all links located on that particular server. Used together with the `-crawl` option, it outputs page text to a log file.

#### `ssh`
Secure shell, logs onto a remote host and executes commands there. This secure replacement for `telnet`, `rlogin`, `rcp`, and `rsh` uses identity authentication and encryption.

#### `scp`
Secure copy, similar in function to `rcp`, copies files between two different networked machines but does so using authentication and with a security level similar to `ssh`.

#### `write`
This utility allows terminal-to-terminal communication. It sends lines from your terminal (console or xterm) to that of another user. The `mesg` command may be used to disable write access to a terminal.

#### `netconfig`
A command-line utility for configuring a network adapter (using DHCP). This command is native to Red Hat-centric Linux distros.

#### `mail`
Send or read e-mail messages. This stripped-down command-line mail client works fine as a command embedded in a script.

#### `mailto`
Similar to the `mail` command, `mailto` sends e-mail messages from the command-line or in a script. However, `mailto` also permits sending MIME (multimedia) messages.

#### `mailstats`
Shows mail statistics. This command may be invoked only by root.

#### `nmap`
Network mapper and port scanner. This command scans a server to locate open ports and the services associated with those ports. It can also report information about packet filters and firewalls. This is an important security tool for locking down a network against hacking attempts.

#### `netstat`
Shows current network statistics and information, such as routing tables and active connections. This utility accesses information in `/proc/net`.

#### `iptables`
The `iptables` command set is a packet filtering tool used mainly for such security purposes as setting up network firewalls.

#### `tcpdump`
Network packet "sniffer." This is a tool for analyzing and troubleshooting traffic on a network by dumping packet headers that match specified criteria.