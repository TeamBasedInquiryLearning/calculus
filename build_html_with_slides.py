import pretext
from pretext.project import Project
from pretext.utils import working_directory
from lxml import etree as ET
from pathlib import Path

# build HTML as usual
with working_directory("."):
    Project().build("html",diagrams=False)

# rig up slide stuff
XSLNS="{http://www.w3.org/1999/XSL/Transform}"

to_revealjs_path = Path(pretext.static.__file__).parent / "xsl" / "pretext-revealjs.xsl"
to_revealjs_transform_xml = ET.parse(str(to_revealjs_path))
to_revealjs_transform = ET.XSLT(to_revealjs_transform_xml)

common_path = Path(pretext.static.__file__).parent / "xsl" / "pretext-common.xsl"
to_slide_path = Path("slides") / "extract-slides.xsl"
to_slide_transform_xml = ET.parse(str(to_slide_path))
root = to_slide_transform_xml.getroot()
include = ET.Element(f"{XSLNS}include")
include.set("href",str(common_path))
root.insert(0,include)
#to_slide_transform_xml.write("slides/extract-slides-injected.xsl")
to_slide_transform = ET.XSLT(to_slide_transform_xml)

book_source = Path("source") / "main.ptx"
book_xml = ET.parse(str(book_source))
book_xml.xinclude()
slide_xml = to_slide_transform(book_xml,**{'debug.project.number': 'true'})
#slide_xml.write("slides/slides.ptx")
slide_revealjs = to_revealjs_transform(slide_xml)
slide_revealjs.write("output/html/slides.html")
