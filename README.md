# ShaderTube Effects

A collection of shaders that you can enjoy in the ShaderTube Chrome extension.

## Contributing

You can add your own effects by creating a pull request to this repository. The extension works from the master folder of this repository.

- Checkout a new branch with the name of your effect
- Create a folder with the name of your effect
- Copy the `index.html` from the root folder of this repository to that folder
- Create your shader as `effect.glsl`

Finally, serve the contentes of that by a static server:

```
npm install http-server -g
http-server
```

which starts a local server to avoid CORS issues:

```
Starting up http-server, serving ./
Available on:
  http://192.168.1.3:8080
  http://127.0.0.1:8080
Hit CTRL-C to stop the server
```

## Uniforms

Add the following uniforms to the header of your shader:

```
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;
uniform float u_volume;
```
