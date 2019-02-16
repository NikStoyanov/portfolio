{% extends 'display_priority.tpl' %}


{% block in_prompt %}
<div class="prompt input_prompt">
    {%- if cell.execution_count is defined -%}
        In&nbsp;[{{ cell.execution_count|replace(None, "&nbsp;") }}]:
    {%- else -%}
        In&nbsp;[&nbsp;]:
    {%- endif -%}
</div>
{% endblock in_prompt %}

{% block output_area_prompt %}
{%- if output.output_type == 'execute_result' -%}
    <div class="prompt output_prompt">
    {%- if cell.execution_count is defined -%}
        Out[{{ cell.execution_count|replace(None, "&nbsp;") }}]:
    {%- else -%}
        Out[&nbsp;]:
    {%- endif -%}
{%- else -%}
    <div class="prompt">
{%- endif -%}
    </div>
{% endblock output_area_prompt %}

{% block input %}
```
{%- if 'magics_language' in cell.metadata  -%}
    {{ cell.metadata.magics_language}}
{%- elif 'name' in nb.metadata.get('language_info', {}) -%}
    {{ nb.metadata.language_info.name }}
{%- endif %}
{{ cell.source}}
```
{% endblock input %}

{% block error %}
{{ super() }}
{% endblock error %}

{% block traceback_line %}
{{ line | indent | strip_ansi }}
{% endblock traceback_line %}

{% block execute_result %}

{% block data_priority scoped %}
{{ super() }}
{% endblock %}
{% endblock execute_result %}

{% block stream %}
{{ output.text | indent }}
{% endblock stream %}

{% block data_svg %}
![svg]({{ output.metadata.filenames['image/svg+xml'] | path2url }})
{% endblock data_svg %}

{% block data_png %}
![png]({{ output.metadata.filenames['image/png'] | path2url }})
{% endblock data_png %}

{% block data_jpg %}
![jpeg]({{ output.metadata.filenames['image/jpeg'] | path2url }})
{% endblock data_jpg %}

{% block data_latex %}
{{ output.data['text/latex'] }}
{% endblock data_latex %}

{% block data_html scoped %}
{{ output.data['text/html'] }}
{% endblock data_html %}

{% block data_markdown scoped %}
{{ output.data['text/markdown'] }}
{% endblock data_markdown %}

{% block data_text scoped %}
{{ output.data['text/plain'] | indent }}
{% endblock data_text %}

{% block markdowncell scoped %}
{{ cell.source }}
{% endblock markdowncell %}

{% block unknowncell scoped %}
unknown type  {{ cell.type }}
{% endblock unknowncell %}
