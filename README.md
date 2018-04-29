### About
Erlang is COP(concurrency object-oriented programming).

This is a startkit based on Erlang and cowboy framework.

###  Features
- Erlang and cowboy framework(integrate other frameworks like ChicagoBoss as you like)
- Rebar3 built
- Support multiple apps(diferrent hosts and paths)
- [x] database(MySQL, Redis, MongoDB) support
- [x] Middlewares and logging
- [x] Microservices related
- [x] deploy and monitoring


### Build
`prerequisite`: `Rebar3`
```
brew install rebar3  % follow offical instruction on other platform
```

```
rebar3 new release cowboy_startkit
cd apps
mv cowboy_startkit cowboy_demo
rebar3 new app hello
vim xxx/src/xxx.app.src  % add dependencies to src file applications
% add some logics
cd ..
% add deps: cowboy, etc.
% add apps to relx and modify release package name in relx configuration
rebar3 compile
rebar3 release
% rebar3_run plugin compile error on macOS, so use next method to run
_build/default/rel/<release-package>/bin/<release-package> console
```
