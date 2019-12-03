# Vebugger vs Vdebug
- In most case, Vdebug should be easier to use. It would be prefer for script languages like: ruby, php, nodejs, ...
- However, thing is different on compiled languages like: java, kotlin, C, C++, ... So we need another one on vim - Vebugger
- Usage of Vebugger is quite opposite with Vdebugger:
1. Run server/test with --debug option first
2. Debugged server/test wait on a specific port
3. Vebugger try to attach to that port later on
