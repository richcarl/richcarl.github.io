---
title: Richard's Home Page
layout: page.njk
description: Richard's home page
---
<style type="text/css">
.contact {
    float:left;
    text-align: center;
    padding: 0 3rem;
    max-width: fit-content;
}
</style>

::: container

::: image-tile
![Picture of Richard](images/RichardC.jpg "Richard")
:::

::: contact
# Richard Carlsson
This will be my personal home page for the foreseeable future.
### Contact Information
E-mail: carlsson.richard@gmail.com
::: sites
{% for site in my_sites -%}
[![{{ site.name }}]({{ site.logo }} "{{ site.name }}")]({{ site.url }})
{% endfor %}
:::
:::

:::

## About myself

- Once a graduate student and member of
  the [HiPE](http://www.it.uu.se/research/group/hipe/) research group at
  [Uppsala University](http://www.uu.se/). I worked a couple of years first
  at [Virtutech](http://www.virtutech.com/) and then [IAR
  Systems](http://www.iar.com). I worked as a senior developer
  at [Klarna](http://klarna.com/) for many years. Now I'm a consultant at
  [Happi Hacking](https://happihacking.com).

------------------------------------------------------------------------

I have been maintaining a list of useful [Free Software for
Windows](free_software_for_windows) for some time. Check it out. I have
also written a page on [how to get going with Cygwin](cygwin) in a few easy
steps.
