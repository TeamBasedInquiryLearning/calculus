import pretext
from pretext.project import Project
from pretext.static import core_xsl
from pretext.utils import expand_pretext_href
from lxml import etree as ET
import os

# build HTML as usual
print("Building project to HTML")
Project().build("html",diagrams=False)

# rig up slide stuff
print("Converting project to slideshow")
to_revealjs_transform_xml = core_xsl("pretext-revealjs.xsl")
to_revealjs_transform = ET.XSLT(to_revealjs_transform_xml)

to_slide_transform_xml = ET.parse(os.path.join("slides","extract-slides.xsl"))
expand_pretext_href(to_slide_transform_xml)
to_slide_transform = ET.XSLT(to_slide_transform_xml)

book_xml = ET.parse(os.path.join("source","main.ptx"))
book_xml.xinclude()
slide_xml = to_slide_transform(book_xml,**{'debug.project.number': 'true','publisher':'publication/publication.ptx'})
#slide_xml.write("slides/slides.ptx")
slide_revealjs = to_revealjs_transform(slide_xml,**{'publisher':'publication/publication.ptx'})
slide_revealjs.write("output/html/slides.html")

print("Success! Run `pretext view` to see the result.")
