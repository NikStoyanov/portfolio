+++
title = "Sketching for Outeach"
author = ["Nikola Stoyanov"]
date = 2018-11-01T00:00:00+00:00
tags = ["Javascript"]
categories = ["Visualisation"]
draft = true
+++

## Sketching {#sketching}

<div class="HTML">
  <div></div>

<script src="<https://rawgit.com/pshihn/rough/master/dist/rough.min.js>"></script>

</div>

Creating sketches/drawings for an outreach event targeted at
non-technical audience is time consuming and it would be best to reuse
what we already have. In my case all of my figures are generated using
PGF/TikZ and are great quality, however, I would not consider them
suitable for some audiences. In this post I am showing the use of
Rough.js to convert my figures to sketches targeted for school
outreach events.


## Rough.js sketching {#rough-dot-js-sketching}

Rough.js is a JavaScript library which allows the drawing of lines and
shapes in a sketchy style. It is hosted in GitHub and can be found
[here](https://github.com/pshihn/rough).

To demonstrate what it can do lets execute the script below. This is
one of the examples in the project [webpage](https://roughjs.com/examples/paths-svg.html).

```javascript
<svg height="300" width="400" id="svg"></svg>

<script>
    const svg = document.getElementById('svg');
    const rc = rough.svg(svg);

    svg.appendChild(rc.path('M80 80 A 45 45, 0, 0, 0, 125 125 L 125 80 Z', { fill: 'green' }));
    svg.appendChild(rc.path('M230 80 A 45 45, 0, 1, 0, 275 125 L 275 80 Z', { fill: 'purple', hachureAngle: 60, hachureGap: 5 }));
    svg.appendChild(rc.path('M80 230 A 45 45, 0, 0, 1, 125 275 L 125 230 Z', { fill: 'red' }));
    svg.appendChild(rc.path('M230 230 A 45 45, 0, 1, 1, 275 275 L 275 230 Z', { fill: 'blue' }));
</script>
```

With the rendered svg sketches below.

<div class="HTML">
  <div></div>

<svg height="300" width="400" id="svg"></svg>

<script>
  const svg = document.getElementById('svg');
  const rc = rough.svg(svg);

  svg.appendChild(rc.path('M80 80 A 45 45, 0, 0, 0, 125 125 L 125 80 Z', { fill: 'green' }));
  svg.appendChild(rc.path('M230 80 A 45 45, 0, 1, 0, 275 125 L 275 80 Z', { fill: 'purple', hachureAngle: 60, hachureGap: 5 }));
  svg.appendChild(rc.path('M80 230 A 45 45, 0, 0, 1, 125 275 L 125 230 Z', { fill: 'red' }));
  svg.appendChild(rc.path('M230 230 A 45 45, 0, 1, 1, 275 275 L 275 230 Z', { fill: 'blue' }));
</script>

</div>

Great it looks sketchy and is perfect for showing figures in a
non-serious manner. We can now easily convert existing figures since
Rough.js can take svg paths and display them. However, to avoid manual
paste of the path we need a parser from the .svg file to the
JavaScript code.


## Coarse transformation {#coarse-transformation}

Luckily, there is a library [Coarse](https://github.com/ismay/coarse) built on top of Rough.js which
allows server side execution. This is useful if more than reasonable
computational power is required to generate the figure on the client
side. We can use this for our purposes since the input to Coarse is
just the .svg file. Since I am using the command line I also needed to
install the cli interface which you can download [here](https://github.com/ismay/coarse-cli). Now having the
two libraries and the cli interface in place we can transform the
figures.


## Sketchy figures {#sketchy-figures}

The figure which I am going to convert is shown below. It describes
the crack initiation process in a body and the eventual arrest
behaviour.

{{< figure src="/img/cracked_body.svg" width="50%" height="50%" >}}

Now the majority of this figure can be omitted. The figure is meant
for a technical document and in an outreach most of it can be dropped. So
lets convert the file.

```shell
coarse cracked_body.svg sketchy_cracked_body.svg
```

{{< figure src="/img/sketchy_cracked_body.svg" width="50%" height="50%" >}}

Great! And since the algorithm works with random seeds we can
experiment a few times to get an output we are happy with. Now any
technical figure can be converted for an non-technical outreach event.