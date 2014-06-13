# jekyll-indexer

A simple index generator meant to be used with [Jekyll](http://jekyllrb.com/).
It takes all the headers with id and creates a nested list with links.


## What

`jekyll-indexer` adds two filters:

*   indexer: Returns the index based on the content.
*   indexer_anchor: Returns the content, with an anchor before every header
    with id, and removing the id from the headers.


## Example

`{{ content }}`

```
<h1 id='veryimportantstuff'>Very important stuff</h1>
    Once upon a time, stuff.

    <h2 id='howwasthestuff'>How was the stuff</h2>
        Very important.

    <h2 id='howwasthestuffdefined'>How was the stuff defined</h2>
        In several ways:

        <h3 id='color'>Color</h3>
            Usual stuff color.
        <h3 id='size'>Size</h3>
            Not too big, not too small.

<h1 id='notveryimportantstuff'>Not very important stuff</h1>
    Once upon a time, moar stuff.

    <h2 id='aboutthatstuff'>About that stuff</h2>
        It was less important than the previous one.

    <h2 id='componentsofthestuff'>Components of the stuff</h2>
        It had some parts:

        <h3 id='vhs'>VHS</h3>
            Not very important anymore.
        <h3 id='abrokentomato'>A broken tomato</h3>
            It was broken.
        <h3 id='dust'>Dust</h3>
            Dusty dust.

    <h2 id='somewordsaboutthestuff'>Some words about the stuff</h2>
        Unconscious. Tissue. Envelope. Fan. Meat.

<h1 id='finalwords'>Final words</h1>
    Sometimes, stuff.

```


`{{ content | indexer }}`

```
<ul>
<li><a href='#veryimportantstuff'>Very important stuff</a></li>
<ul>
<li><a href='#howwasthestuff'>How was the stuff</a></li>
<li><a href='#howwasthestuffdefined'>How was the stuff defined</a></li>
<ul>
<li><a href='#color'>Color</a></li>
<li><a href='#size'>Size</a></li>
</ul>
<li><a href='#notveryimportantstuff'>Not very important stuff</a></li>
<li><a href='#aboutthatstuff'>About that stuff</a></li>
<li><a href='#componentsofthestuff'>Components of the stuff</a></li>
<ul>
<li><a href='#vhs'>VHS</a></li>
<li><a href='#abrokentomato'>A broken tomato</a></li>
<li><a href='#dust'>Dust</a></li>
</ul>
<li><a href='#somewordsaboutthestuff'>Some words about the stuff</a></li>
</ul>
<li><a href='#finalwords'>Final words</a></li>
</ul>
```


`{{content | indexer_anchor }}`

```
<a id='veryimportantstuff' class='anchor'></a>
<h1>Very important stuff</h1>
    Once upon a time, stuff.

<a id='howwasthestuff' class='anchor'></a>
    <h2>How was the stuff</h2>
        Very important.

<a id='howwasthestuffdefined' class='anchor'></a>
    <h2>How was the stuff defined</h2>
        In several ways:

<a id='color' class='anchor'></a>
        <h3>Color</h3>
            Usual stuff color.
<a id='size' class='anchor'></a>
        <h3>Size</h3>
            Not too big, not too small.

<a id='notveryimportantstuff' class='anchor'></a>
<h1>Not very important stuff</h1>
    Once upon a time, moar stuff.

<a id='aboutthatstuff' class='anchor'></a>
    <h2>About that stuff</h2>
        It was less important than the previous one.

<a id='componentsofthestuff' class='anchor'></a>
    <h2>Components of the stuff</h2>
        It had some parts:

<a id='vhs' class='anchor'></a>
        <h3>VHS</h3>
            Not very important anymore.
<a id='abrokentomato' class='anchor'></a>
        <h3>A broken tomato</h3>
            It was broken.
<a id='dust' class='anchor'></a>
        <h3>Dust</h3>
            Dusty dust.

<a id='somewordsaboutthestuff' class='anchor'></a>
    <h2>Some words about the stuff</h2>
        Unconscious. Tissue. Envelope. Fan. Meat.

<a id='finalwords' class='anchor'></a>
<h1>Final words</h1>
    Sometimes, stuff.

```


## License

Copyright (c) 2014 Pablo Caro. All Rights Reserved.

Pablo Caro <<me@pcaro.es>> - <https://pcaro.es/>

See LICENSE file.
