


```{=html}
<style>
details > *:not(summary){
  margin-left: 10em;
}
</style>
```

# What are R and R-Studio? {#WhatIsR .unnumbered}

<br>

## 1. What is R? {#WhatisRitself .unnumbered}

#### **R IS A LANGUAGE SPOKEN BY YOUR COMPUTER** {.unnumbered}

**R** is a free, open source statistical programming language. It contains millions of words/commands that are useful for dataset cleaning, analysis, and visualization.

By a "programming language", I mean it is a collection of commands that you can type into the computer in order to analyse and visualize data. The easiest way I find to think about R is that it is literally a language, like Spanish, English or Hindi. Or like a set of magic commands in a fantasy novel.

Learning R means learning vocabulary and grammar in order to communicate. It also means it gets easier with experience and practice..


If you open "R" on your computer (DON'T DO THIS), you will see a simple window with a cursor ready to hear commands. There is no help or support. This is how I learned to programme in R and I don't recommend it!

<div class="figure" style="text-align: center">
<img src="./index_images/im_02Setup_1RConsole.png" alt="*Basic R*" width="841" />
<p class="caption">(\#fig:Tut_Fig1)*Basic R*</p>
</div>

<br>

## 2. What is R-Studio/POSIT? {#WhatisRstudio .unnumbered}

#### **R-STUDIO/POSIT is a Software Application like Word, Chrome or Spotify** {.unnumbered}

**R-studio** is a *software program/app*, like Microsoft Word, or the Chrome Web-browser. It's has recently been re-branded to Posit because it can also now "speak" other computer languages. For GIS folks, it's a competitor to Google Collab.

It's a program that's designed to make it easy to write R-commands. RStudio has many useful features. For example, you can easily see help files, run code, see your results and create professional graphics. R-Studio also allows us to make interactive documents called R-Markdown files.

There is a version you can download onto your own computer called R-Studio/Posit Desktop, and a version that runs on a website called 'R-Studio Cloud'.

<div class="figure" style="text-align: center">
<img src="./index_images/im_02Setup_2RStudioIntro.png" alt="*R-studio is much more sophisticated*" width="766" />
<p class="caption">(\#fig:Tut_Fig2)*R-studio is much more sophisticated*</p>
</div>

<br>

Watch this 5 min video on the newest version of R studio. More here: <https://posit.co/blog/announcing-rstudio-1-4/>


```{=html}
<div class="vembedr">
<div>
<iframe src="https://www.youtube.com/embed/SdMPh5uphO0" width="533" height="300" frameborder="0" allowfullscreen="" data-external="1"></iframe>
</div>
</div>
```

<br>

## 3. What is R-Markdown? {#WhatisMarkdown .unnumbered}


#### Markdown is a way of writing documents with computer code embedded into them. {.unnumbered}

#### R-Markdown is a markdown file that uses R code {.unnumbered}


<img src="./index_images/im_02Setup_3AboutMarkdown.png" width="1424" style="display: block; margin: auto;" />

<br>

R Markdown is a document format that blends the capabilities of R (a programming language primarily used for statistical computing and data analysis) with the formatting and layout capabilities of Markdown (a lightweight markup language). It allows you to create dynamic documents that combine narrative text, code, and the output of that code (such as tables, plots, and figures) in a single document. <br>

Read more here: <https://rmarkdown.rstudio.com> or watch this short video


```{=html}
<div class="vembedr">
<div>
<iframe class="vimeo-embed" src="https://player.vimeo.com/video/178485416" width="533" height="300" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen="" data-external="1"></iframe>
</div>
</div>
```


Here's how R Markdown works:

1.  **Narrative Text**: You can write your document using plain text, using Markdown syntax to format your text, add headings, lists, links, and more.

2.  **Code Chunks**: You can embed R code chunks within your Markdown document. These chunks are demarcated by triple backticks or by the "\`\`\`{r}" syntax, and they allow you to execute R code directly within your document.

3.  **Output Display**: When you knit (compile) the R Markdown document, the R code within the code chunks is executed, and the output is dynamically displayed in the final document. This output can include tables, plots, statistical summaries, and more.

4.  **Knitting**: The process of converting an R Markdown document into a final, formatted document is called "knitting." When you knit an R Markdown document, R code is executed, the output is generated, and the Markdown text and the output are combined into a single document.

5.  **Flexibility**: R Markdown supports various output formats, including HTML, PDF, Word, presentations, and more. This means you can easily create different types of documents from the same source.<br><br>

R Markdown is widely used for creating reports, documents, tutorials, and presentations that involve data analysis and visualization. It is a powerful tool for reproducible research because it allows you to document your analysis process, code, and results in a single document. Changes to the code or data can be easily updated and reflected in the final document without manually reformatting everything.

To use R Markdown, you typically need to have R and a few additional packages installed. You write your document in a plain text file with the **`.Rmd`** extension, and then use an R Markdown "knitting" process to generate the final document in your desired format. We will cover this in the next tutorial.

<br>

### Some examples? {.unnumbered}

1.  **R Markdown Gallery**: The official R Markdown Gallery showcases a variety of R Markdown examples, including interactive visualizations, reports, presentations, and more. You can find this gallery on the R Markdown website.

    Website: [**R Markdown Gallery**](https://rmarkdown.rstudio.com/gallery.html)

2.  **R Bloggers**: R Bloggers is a community-driven site that aggregates blog posts related to R programming. Many R bloggers share their R Markdown examples, tutorials, and creative outputs on this platform.

    Website: [**R Bloggers**](https://www.r-bloggers.com/)
