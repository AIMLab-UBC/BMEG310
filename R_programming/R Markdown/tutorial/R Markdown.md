# **Getting started with R Markdown**



R Markdown allows us to integrate coding and word processing to create documents such as project assignments, readme pages in Github, supplementary sections for a research paper, or analysis records in electronic notebooks. Basically, R Markdown is a very simple ‘markup’ language which uses [Markdown syntax](https://daringfireball.net/projects/markdown/) to embed R code into a document and conventionally present its output (equations, images, graphs, tables, etc.) without the cumbersome copying, pasting,and resizing routines required by a word processors like MS Word. The suffix for these Markdown documents is ".Rmd" which may be converted to .html, .md, .doc or .pdf file formats for convenience, making R Markdown an incredibly powerful tool for practicing reproducible science.



In this tutorial, we will understand how to create and render a dynamic R Markdown file. We will also learn how to use R Markdown to present and share analyses on GitHub.



#### **Download R Markdown:**

R Markdown can be acquired from CRAN with the following commands:

​	`install.packages("rmarkdown")`

​	`library(rmarkdown)`



#### **Create an R Markdown file:**

1. Open RStudio
2. To create an R Markdown report, do *File > New File > R Markdown* and save it with the extension “.Rmd” (excluding quotes).

![img](https://lh4.googleusercontent.com/y5_JALxFth0AoufA6vRd4qExdk2FOlcUnwiJZEDzuL6C7_w4wTSTcSTNLGg7dpjjRMBd3bgzy40uvHQl3h9Ha4LzQNzKL_YVrrLUt0ahbTG8B93lfEbgth4UQgKb_vCstukZrcYf)



When prompted to install dependencies, agree and continue (click on ‘Yes’).



![img](https://lh4.googleusercontent.com/wK2MvtONRr2vQPNsKtIQYZpQZ0yTiS9RX_6cIwU_gpc3OHR6K9GFNk_QJ4TkD19XlH_xeVq8AvX455oMN0RbdtPqKa1pmG5kmUShu9U0O_DlopZWeinwUPL75Ymk4BfQtjlqhFLu)



Give it a title and author name and accept the default output format of HTML. Then, click OK.



![img](https://lh4.googleusercontent.com/E5_JF93qXsQx660W-Rll4ctylZtXi_uLMlbe_r7u9hnnRfIPrdhe3Ca0G9BIUx-OisjkYImFHCe0ofTSNPtKsdWIXYb05Ge-islqGNhKwTZ6OguLEFopayAbk3q-gv2K0jb1xc5i)



This .Rmd file contains the text and code for a data table and a scatter plot. The demo will appear when we render an html, pdf, word, md, etc. files from this .Rmd file.



![img](https://lh6.googleusercontent.com/WwWocX2y0J3qpAb7E_zUEM1NZLkf4iv6PoayLeXOZ9WBddnKUOteW6JDzZy-oruMBJPrRF1DynwmRuzcKA5uZwRL_GqJiNvky5uphwxl4-_qwG9S-fRn0P5sRKwYC-Jt7Ev0vlrl)



Save the file with a specific filename and the extension “.Rmd”.



![img](https://lh4.googleusercontent.com/JcFzMDTsigvmgQjj4_zy21WQ4IRyUVGlir0ghppnvgpJiDbJQJ3DjRBTc0NhlPYecIZgDxIzkFgfl8gOrDYK-dOLb7LXzkY0xo5Zdl6L797oTN2WJHUqPWIoL3S-50flDCAeuITG)





<u>**Content of an .Rmd file:**</u>

This auto-generated *.Rmd* file has three "types" of text:

1. YAML:

   The YAML section contains configurations for the file is the first section.

   

   ![img](https://lh3.googleusercontent.com/0EiU98IrgqKges1k3lgn-ExkqBaB3mEEHsJE7u9e_R5BSYNiVD5JKuOPLiQ-fbLZPCHO2nkQx1Kry3Mtt6ubbPyirj01mgANVu_jtWYcca2gm7a2VDQEaAZi7F0FBA5hM7cEFDBQ)

   

The *output:* value determines what type of file to render into:

- *html_document*, which will create HTML output (default)
- *pdf_document*, which will create PDF output
- *word_document*, which will create Word output
- *ioslides_presentation*, which will create an ioslides (HTML5) slideshow
- *beamer_presentation*, which will create a beamer (PDF) slideshow



2. R Code:

   The second section contains embedded R Code which is executed during rendering.

   

   ![img](https://lh4.googleusercontent.com/br--eIooO3stBAxLjHfjq3fbRQ7rfDRv8X-li0NKcin4QJH6NwHTIy9osU80j2evba9-Sdmvv3NFeLEZ8P1m-QvO9KsjEiMrQ44EvdcXpyo7aYODuD_eMS14lZK4HCFgZKLw6OrR)

   

   The knitr package extends syntax to include chunks of executable R code and render their results to output file:

   ![img](https://lh5.googleusercontent.com/UwqR7mw59tVrGVKQtT0T7df-EE-nFlar4CS70ddK78HqeDufJ29EiTocgRhwzgAjk5HRn8JQ9fhlxmuyMTQp0nY6JulrL2M98nQGTVhWVmbQNv5ZHCKYzYiL7kTa1y2fc3zR0sMi)![img](https://lh4.googleusercontent.com/5evYVW67ap4NFylY__L5PrFYcXibn5rkk6pOPwYCcMcEWdaGXdQovJPRHUhkvKlxFhaLug3b6PrsqjgObC65EZXXPDTohoSPo8uEJqyWVljR29Z3HlOrnD9govrx4zE3-s3xha7b)![img](https://lh3.googleusercontent.com/MXgpM2B7HLyj6cCfqnY7m4ywm-wAhU4vozSABmT3CTKwgWq6Unmz1pzTYTf-11DzMdtxR9ooZJFu_-m54KOALNStYdo6dHCcJtBom4LF21q1jnQ0HVi783-dVPqbdWw1OfYowfDx)![img](https://lh4.googleusercontent.com/MGxsu04nR_5NejM9_-5hX8NbgVPTjPGWxO-6nZTx2d-jAljEbCMt7dAYG80gwCP5lS6ew8yj_0YxkZhEfpmjYOMlzkhngyxuGDEkHKt8Sm1_q8aaG5X7J-z6bcN81F543sYmYvGi)

   

3. Text:

   Any text outside of YAML or the R code sections is markdown and is rendered as such. 

   

   ![img](https://lh6.googleusercontent.com/WIXvWSdg-cH5qCuzzy2X3M5URMpj6sx9xjaFkjJ8AfRys4H2WNJZ6Mf9Hws0rn6y8CgKfbURKnlOH_B8M2RbeDKu4a6zXvIa1W8j2x4qrfTsN4Jr5RrYUOMnDk43D0rTSiQmc7gg)

   

   You can use markdown to indicate:

   - *Bold text*: text surrounded with two asterisks.
   - *Italic text*: text surrounded with asterisks. 
   - *Lists*: group lines into bullet points beginning with asterisks. Leave a blank line before the first bullet.
   - *Headers*: One hashtag at the start of a line. Two hashtags, ##, creates a second level header, and so on.
   - *Hyperlinks*: Surround links with brackets, and then provide the link target in parentheses, like this [Github](www.github.com).

   

   

   **Additional tasks:**

   

   1. Give these markdown conventions a try in a plain text file. Make sure you put in lists, headers, hyperlinks, bold and Italic text in there. Save the text file with an *.Rmd* suffix and then, render it as an HTML file. You can give it whatever title you wish. Submit the *Rmd* and *html* documents.

   2. Open a new R Markdown document and give it a title of your choice. In this document, add an r-code to read the ‘SalesJan2009.csv’ dataset in a variable called 'metadata' and plot a graph using *plot(metadata)*. The plot will display the relationship between the variables in the dataset. Render the output as an HTML document. Submit the *Rmd* and *html* documents.

      

      


#### **Render a .Rmd file to an HTML document:**



Now, to render the file, click on “Knit HTML” or do File > Knit Document.



![img](https://lh6.googleusercontent.com/-JJ5eJtX4jtL6jfXB5o5G1tl9XrljfbKlNYuWnx2UeNcEZCSVFRiCAMI1zP2BYI9Qhiz694kVoCEw4oFrHz4K8KuKAWfW6hV7D1sVtjKmCPEwylHhR4b0WRrdugUdFAvdKcOo_xp)



A preview of the resulting HTML will appear in a separate window.



![img](https://lh6.googleusercontent.com/PajyOXQzxZ_lBqVlZ1HWtJ2K9qtV9lPBDVfAmG7-N63caZF3gJ6r5XBeHYPfFb3hwaBKTIne6xDp7Bqi4KC8SnnLzh_4O9SmOCLxBkDA4m0VgS0k0YfiuH7sFNErTFkUNUAQmzPP)



Look at your file browser where the NewDoc.Rmd file was saved, a NewDoc.html file will appear too. This will open on any internet browser and voila! Your first reproducible report with R Markdown is ready.





**Note**:

You have been provided R Markdown reference guides and cheatsheets for your help. Take a look! It’s also available through:



![img](https://lh4.googleusercontent.com/V5NOYuVn_36eH7bBE6PySRTZxoyvzMChzJE8be1yRtefRhGvzpnX5D3M_H1AE_UgV_bXHwdVkwWHob3ZioPC6rdmrzryjVJQCM8Jv1yz4AXpScjwneXW4-nP7S2DfUiEv0GQ5kiS)