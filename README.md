Reaxt Phoenix Example
=========================
This an example of how to get [Phoenix](http://www.phoenixframework.org/) and [Reaxt](https://github.com/awetzel/reaxt) to work together. Is based on the original [reaxt-example](https://github.com/awetzel/reaxt-example)

Test it now (need npm and elixir):

```elixir
git clone https://github.com/ingerslevio/reaxt-phoenix-example.git
cd reaxt-example
mix deps.get
mix phoenix.server
```

Then:  
- go to http://localhost:4000 to see an example application,
- you can test hot loading by changing a react template in `web/components/xx`,
  or the css in `web/css/index.css`.
- you can see the webpack UI in http://localhost:4000/webpack
- you can test the javascript exception converted into elixir in http://localhost:4000/with_stacktrace
- then just analyse and understand the `reaxt` usage


## Todo ##
- [ ] Use `Plug.Static` and `WebPack.Plug.Static` instead of the temporary created `WebpackController`.
