# ShaderTube Effects

A collection of shaders that you can enjoy in the ShaderTube Chrome extension.

## Contributing

You can add your own effects by creating a pull request to this repository. The extension works from the master folder of this repository.

- Checkout a new branch with the name of your effect
- Create copy of the [sandbox folder](sandbox) with the name of your effect
- Edit your shader as `effect.glsl`

Finally, serve the contentes of that by a static server to avoid [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) issues.

```
npm install http-server -g
http-server
```

which starts a local server at the `8080` port:

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
uniform float u_volume; // not yet implemented
```

## Add credits

The Chrome extension displays the effects and the author's name in a music TV like lower third design.

Just add these comments to the top of your `effect.glsl` file:

```
// Created by: Thales
// Title: Triangles on the beach
```
