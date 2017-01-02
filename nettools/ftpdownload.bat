echo user downloader@pieterhouwen.info> ftpcmd.dat
echo Password12345>> ftpcmd.dat
echo bin>> ftpcmd.dat
echo get %1>> ftpcmd.dat
echo quit>> ftpcmd.dat
ftp -n -s:ftpcmd.dat ftp.pieterhouwen.info
del ftpcmd.dat

