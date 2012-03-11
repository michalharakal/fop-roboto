Roboto fonts with fop
================================
The aim of this small project is to help to use of roboto fonts in documents rendered by FOP.
It consists from:
  * roboto ttf included
  * created metrics files for TTF
  * configuration file for using embeded fonts

What is roboto
-------------------------
Roboto is a typeface introduced with Android 4.0 Ice Cream Sandwich [see article on wikipedia](http://en.wikipedia.org/wiki/Roboto).

What is FOP
-------------------------
FOP (Formatting Objects Processor) is a in java written print formatter driven by XSL formatting objects (XSL-FO) 
and an output independent formatter. It reads a formatting object (FO) tree and renders the resulting pages to 
a specified output.

I'm using it for renedring of PDF documents from various sources (DocBook and custom).

Motivation using roboto fonts in PDFs
-------------------------
Roboto is typeface optimized to look great on devices with high dencities but on paper it looks also great.
And for me as an Android developer a natural selection for custom fonts ;-)


Implementation details
-------------------------
It is no rocket science to use embeded fonts with FOP. Its [well documented](http://xmlgraphics.apache.org/fop/trunk/fonts.html#embedding)
and actually consins from two steps:

 * create metrics files for True Type Fonts
 * provide and configure fonts for use with FOP
  
Use
-------------------------

  fop/fop -c fop/conf/fop.xconf simple.fo simple.pdf



