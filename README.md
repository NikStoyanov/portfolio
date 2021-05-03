# Portfolio

[![Netlify Status](https://api.netlify.com/api/v1/badges/1483d258-f50f-4b99-bbff-fd1cf5b27a98/deploy-status)](https://app.netlify.com/sites/nikstoyanov/deploys)

The repository holds the content of my personal website [nikstoyanov.me](https://nikstoyanov.me).

## Blog posts
Are done typically using Python or Julia in a Jupyter notebook which can be found in the posts directory.

To build:
- This used to be Hugo, but after they dropped mmark support I have switched to raw html and decided that static website generators are not for me.
- Export the jupyter notebook to html

```bash
read -p "Folder path: " npath
read -p "Notebook name: " notebook
jupyter nbconvert $npath/$notebook.ipynb --execute --allow-errors --output-dir $npath --to html --template temp.tpl --ExecutePreprocessor.timeout=500 --NbConvertApp.output_files_dir=.
```

Which you can run from the main directory with:

```
./export.sh
```

To deploy:
- I host the website on [netlify](https://www.netlify.com/) for the continuous integration which builds the website on every push to this repository.

Jupyter formatting:
- By default the execution history does not get exported to html. To get the In[]/Out[] history of the cells like in Jupyter I had to modify the export template. The idea is to wrap the exported cells in a custom `<div>` which I can then style using custom CSS and pass as an argument to my build file.

The template can be found in the file *temp.tpl* and below:

```html
{% block in_prompt %}
<div class="prompt input_prompt">
    {%- if cell.execution_count is defined -%}
        In&nbsp;[{{ cell.execution_count|replace(None, "&nbsp;") }}]:
    {%- else -%}
        In&nbsp;[&nbsp;]:
    {%- endif -%}
</div>
{% endblock in_prompt %}
```

Which makes is looks like:

![Jupyter history export](img/img1.png)

## Rant
<rant>
Backward compatibility is important to me. This blog used to be built with Hugo because I believed it will be honored. After dropping [mmark](https://github.com/gohugoio/hugo/issues/7022) support I have adopted HTML because it is timeless with the only moving part being pandoc. If pandoc breaks backward compatibility I will switch to writing the `<p>...</p>` myself.
</rant>

## Theme
I use the [contrast-hugo](https://themes.gohugo.io/contrast-hugo/) theme because it is simple.
