from django import template

register = template.Library()


@register.inclusion_tag('maploom/_maploom_map.html', takes_context=True)
def maploom_html(context):
    """
    Maploom html template tag.
    """
    return context


@register.inclusion_tag('maploom/_maploom_js.html')
def maploom_js(options=None):
    """
    Maploom js template tag.
    """
    return dict()
