# How to config & use xdebug
```
$ pecl install xdebug
$ cp xdebug.ini ?/etc/php/x.x/conf.d/xdebug.ini
```
### Step:
1. Go to vim, type F5 to start Vdebug, wait on port 9001
2. Run phpunit with xdebug, connect to 9001

### Troubleshoot:
- If anything goes wrong, we can go to xdebug.ini, uncomment xdebug.remote_log to view what's going on
- Debug port may conflict, try another port like: 9002, 9003, 9004, ...
- Last but not least, view debug log on Vdebug with commands:
```
:VdebugOpt debug_file ~/vdebug.log
:VdebugOpt debug_file_level 2
```
