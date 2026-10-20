  
# Disclaimer

This customization is based on the [TEI 4.9.0 release of the tei_odds.odd customization](https://www.tei-c.org/Vault/P5/4.9.0/xml/tei/custom/odd/tei_odds.odd) for authoring TEI ODDs and is being modified to accomodate the authoring of MEI ODD files.

Aside from the overdue modernization of the MEI ODDs Schema, a major reason for updating to tei:4.9.0 was the introduction of [<constraintDecl>](#TEI.constraintDecl) which allows Schematron query language binding and schematron namespace declarations.

# Introduction

The definitions of both the Music Encoding Initiative (MEI) Guidelines and the Schemata are facilitated in so called One-Document-Does-it-all (ODD) syntax as defined by the Text Encoding Initiative (TEI) XML dialect. Because the specifications of the TEI dialect emcompass a vast amount of elements and attributes for various kinds of text markup, creating a subset for the purposes of the MEI definitions is strongly adviseable. This customization is defined in the backmatter of this document. Moreover this document summarizes a set of editorial conventions for encoding the MEI Guidelines according th this schema.

The editorial conventions aim to produce markup that is parsimonious, semantic rather than presentational, and aligned with concrete downstream behaviors (rendering, glossary generation, indexing, cross-referencing, validation).

The guiding principle throughout: markup should earn its presence by enabling a behavior or capturing a distinction that matters. Tagging that does not achieve an effect is a cost without a benefit.

# Encoding Levels and Rollout Plan

The encoding conventions are organized in five cumulative encoding levels. Each level is a enrichment of the previous one and augments the encoding to facilitate specific output intentions.

1. Level 1 — Consistent baseline encoding. Apply the mei_odds schema to ensure a consistent structural encoding of the MEI specifications (aka source and guidelines).

1. Level 2 — Bibliography. Introduce bibl and related elements; build a coherent bibliography that examples and prose can reference.

1. Level 3 — Musical works and their authors. Tag musical works mentioned or used as examples ([<title>](#TEI.title), persName, with appropriatexml:lang), supporting indexing.

1. Level 4 – Semantic sugar. Introduce and settle core distinctions of: [<abbr>](#TEI.abbr) vs. [<term>](#TEI.term) vs. mentioned vs. [<name>](#TEI.name)/orgName/persName vs. [<title>](#TEI.title)) and apply them consistently. Decide explicitly what is not tagged.

1. Level 5 — Cross-referencing apparatus. Introduce [<gloss>](#TEI.gloss) and expan with target/ref attributes for index generation, mouseover behaviors, and a unified glossary.

Encoding Level 1 should be achieved for MEI 6.0, all other levels are to be applied later and preferably step-by-step and consistently accross all MEI source files (docs nad modules) in the above order. The below encoding guidelines will illustrate the markup for Encoding Level 1, guidelines for the higher levels will be added when applicable.

# Encoding Level 1

The main goal of Encoding Level 1 is consistency, including:
* File preamble

* Schema associations

* Metadata in the headers

* Markup of textstructures, e.g., [<div>](#TEI.div) with [<head>](#TEI.head) and [<p>](#TEI.p)

* Deprecation rend in favour of rendition or the TEI processing model

* Deprecation of [<abbr>](#TEI.abbr) for lexicalized Latin discourse markers such as “e.g.” and “i.e.”

* pureODD-markup of specifications, e.g., [<elementSpec>](#TEI.elementSpec)


## Encoding Guidelines Chapters

Each chapter of the guidelines is represented by one TEI document with [<TEI>](#TEI.TEI) as root element. Consequently the file will contain [<teiHeader>](#TEI.teiHeader) and [<text>](#TEI.text) elements. While the header will be mostly identical in all chapters some metadata will be specific to the chapters:
Analytic title
* 
Encoded in /TEI/fileDesc/titleStmt/title[level="a"]

Chapter editor
* 
Encoded in /TEI/fileDesc/titleStmt/respStmt, e.g.: 
  Edited by
  Benjamin W. Bohl
  
\[The editors listed here are responsible for the contents of this very chapter of the MEI Guidelines.\]


 
The text of the chapter is to be encoded in [<body>](#TEI.body) (/TEI/text/body). Although [<front>](#TEI.front), and [<back>](#TEI.back) are also available in [<text>](#TEI.text), their use is discouraged in chapters.
 
The contents of the body have to start with a [<div>](#TEI.div) holding a xml:id and a [<head>](#TEI.head), both of which hold the chapters heading. This should also be true for any subdivision of the chapter.


### Creating Element or Attribute Overview-Lists

The MEI Guidelines contain overview lists of elements or attributes discussed or relevant in the respective section. These are encoded using the [<specList>](#TEI.specList) element with a child [<specDesc>](#TEI.specDesc) for each referenced element or attribute class. Attributes on the [<specDesc>](#TEI.specDesc) control, what to include, depending on the target type:element
* add the value of the element’s ident into key
attribute(s)
* add the attribute classe’s ident into key and the ident values of all attributes from that class that you want to be listed as space-separated list into atts.


### Encoding Code or Code References in the Textflow

Every mention of any elements, attributes, models, or datatypes from the MEI specifications in the MEI Guidelines should be tagged following the below scheme, to facilitate automatic linking between the Guidelines and the Specifications.:Mentioning element names
* note
Mentioning attribute names
* pname
Giving examples for attribute values
* 
Isolated attribute values in the text have to be marked using the [<val>](#TEI.val) element: c
 
For encoding an element with potential attributes definitions use [<tag>](#TEI.tag): note dur="4" oct="4" pname="c"<note dur="4" oct="4" pname="c">



### Linking to other sections of the guidelines

Two elements should serve this prupose: 


* [ptr](#TEI.ptr) (pointer) defines a pointer to another location.

* [ref](#TEI.ref) (reference) defines a reference to another location, possibly modified by additional text or comment.


## Encoding Figures – Notation Examples and Codeblocks

The Guidelines contain figures, such as notation examples from graphics files available in the repository, or generated on-build from MEI encodings with Verovio. Moreover, the code exmples can be rendered as codeblocks. Whichever you want to achieve, it must always be wrapped in a [<figure>](#TEI.figure) with a [<head>](#TEI.head) encoding the figure caption ( without any prefix or numbering; theses will be generated automatically).

### Embedding a Graphics File

To embed a graphics file use a [<graphic>](#TEI.graphic) with url.
![graphic](../images/modules/usersymbols/triangle.png "graphic")
### Rendering Codeblocks

Codeblocks can be encoded using the eg:egXML element.
<?xml-model href="https://music-encoding.org/schema/dev/mei-all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="https://music-encoding.org/schema/dev/mei-all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<mei xmlns="http://www.music-encoding.org/ns/mei" meiversion="6.0-dev">
  <meiHead>
    <fileDesc>
      <titleStmt>
        <title>Alignment of editorial accidentals</title>
      </titleStmt>
      <pubStmt>
        <date isodate="2023">2023</date>
        <respStmt>
          <corpName>Music Encoding Initiative (MEI) Board</corpName>
        </respStmt>
        <availability>
          <useRestrict label="license" auth="https://spdx.org/licenses/" codedval="ECL-2.0">
            <p>Educational Community License v2.0</p>
          </useRestrict>
        </availability>
      </pubStmt>
      <seriesStmt>
        <title>MEI guidelines examples</title>
      </seriesStmt>
      <notesStmt>
        <annot>Editorial accidentals are aligned on the centre of the notehead.</annot>
      </notesStmt>
    </fileDesc>
    <encodingDesc />
  </meiHead>
  <music>
    <body>
      <mdiv>
        <score>
          <scoreDef n="1">
            <staffGrp>
              <staffDef n="1" lines="5" clef.shape="G" clef.line="2" />
            </staffGrp>
          </scoreDef>
          <section>
            <measure right="end" n="1">
              <staff n="1">
                <?edit-start?>
                <layer n="1">
                  <note dur="1" oct="5" pname="f">
                    <accid accid="s" func="edit" />
                  </note>
                  <note dur="1" oct="5" pname="f">
                    <accid accid="f" func="edit" />
                  </note>
                  <note dur="1" oct="5" pname="f">
                    <accid accid="n" func="edit" />
                  </note>
                  <note dur="1" oct="5" pname="f">
                    <accid accid="x" func="edit" />
                  </note>
                  <note dur="1" oct="5" pname="f">
                    <accid accid="ff" func="edit" />
                  </note>
                </layer>
                <?edit-end?>
              </staff>
            </measure>
          </section>
        </score>
      </mdiv>
    </body>
  </music>
</mei>

### Encoding Lists

For encoding lists please refer to the TEI Guidelines .

### Encoding Tables

For encoding tables please refer to the TEI Guidelines .

# Structural modifications

A major structural modification to the definition of this customization is moving the [<schemaSpec>](#TEI.schemaSpec) to the [<back>](#TEI.back) to free the [<body>](#TEI.body) and make space for a documentation of this ODD. Although not required by TEI it, makes for a clearer separation of the two.

Moreover, all the [<moduleRef>](#TEI.moduleRef) elements have been moved into [<specGrp>](#TEI.specGrp) elements inside the respective sections in this documentation. This was done to facilitate accompanying the modification with some easier to read documentaiton and explanations. Theses definition now are included via [<specGrpRef>](#TEI.specGrpRef) elements into the [<schemaSpec>](#TEI.schemaSpec).

# Modifications to the schemaSpec
Element [<schemaSpec>](#TEI.schemaSpec)change
* source has been set to tei:4.9.0.

* The available start elements have been reduced to those used in the current MEI ODD files, i.e., [<TEI>](#TEI.TEI) and [<specGrp>](#TEI.specGrp).

* The gaiji module has been excluded (for now).

* The dictionaries module has been excluded.

# Modification to the moduleRef elements

As already describe in  The [<moduleRef>](#TEI.moduleRef) elements were moved due to major structural changes to the customization file.

One of the most prominent changes to previous version of the MEI ODD schema is the drilled down inclusion of TEI modules and their respective elements. While there is a more detailed description of each module’s modifications below, there are some general principles that were applied: 
* Only include elements currently used in MEI module definitions and guidelines

* Only include modules required due to elements, attribute classes or module classes they define


Please be aware that the following does not list all modules defined by the TEI all ODD but just those, that are still included in the MEI ODD schema or had been included in the preceeding version.

## Modifications to the TEI header module

The set of available elements has been reduced to: 
* [<availability>](#TEI.availability)

* [<change>](#TEI.change)

* [<distributor>](#TEI.distributor)

* [<edition>](#TEI.edition)

* [<editionStmt>](#TEI.editionStmt)

* [<fileDesc>](#TEI.fileDesc)

* license

* [<publicationStmt>](#TEI.publicationStmt)

* [<sourceDesc>](#TEI.sourceDesc)

* [<tagsDecl>](#TEI.tagsDecl)

* [<teiHeader>](#TEI.teiHeader)

* [<titleStmt>](#TEI.titleStmt)


This reduces the allowed set of elements to those currently used in the headers of the source and guidelines files.
Module headerClass att.citeStructurePartdeleteClass att.patternReplacementdelete
## Modifications to the TEI core module
Module coreClass att.milestoneUnitdelete
## Modifications to the TEI tei module
Module teiClass att.anchoringdeleteClass att.breakingdeleteClass att.cReferencingdeleteClass att.citingdeleteClass att.cmcdeleteClass att.datablechangeClass att.datcatdeleteClass att.declarabledeleteClass att.declaringdeleteClass att.docStatusdeleteClass att.duration.w3cdeleteClass att.editLikedeleteClass att.editiondeleteClass att.fragmentabledeleteClass att.global.responsibilitydeleteClass att.indentationdeleteClass att.internetMediadeleteClass att.interpLikedeleteClass att.measurementdeleteClass att.namingchangeClass att.notateddeleteClass att.placementdeleteClass att.rangingdeleteClass att.scopedeleteClass att.scopingdeleteClass att.sortabledeleteClass att.spanningdeleteClass att.styleDefdeleteClass att.typedchangeClass att.writtendeleteClass att.ascribed.directeddeleteClass att.dimensionsdeleteClass att.divLikedeleteClass att.globalchangeClass att.handFeaturesdeleteClass att.mediadeleteClass att.pointing.groupdeleteClass att.segLikedeleteClass att.transcriptionaldeleteClass att.damageddeleteClass att.timeddeleteClass att.formuladeleteClass att.locatabledeleteClass att.partialsdeleteClass att.personalchangeClass att.calendarSystemdeleteClass att.duration.isodelete
## Modifications to the TEI gaiji module

The module has been removed from the customization (for now).

## Modifications to the TEI textstructure module
Module textstructure
## Modifications to the TEI tagdocs module

As the members of this module are crucial for writing TEI ODD, it is the only module included without restrictions.
Module tagdocsElement [<attDef>](#TEI.attDef)change[reference #mod_element_schemaSpec](##mod_element_schemaSpec)
## Modifications to the TEI dictionaries module

The module has been removed from the customization.

## Modifications to the TEI linking module

No elements from this module are included, the sole resason for the module inclusion is its definition of att.global.linking.
Module linking
## Modifications to the TEI figures module

The elements allowed from this modules are [<cell>](#TEI.cell), [<figDesc>](#TEI.figDesc), [<figure>](#TEI.figure), [<formula>](#TEI.formula), [<row>](#TEI.row), and [<table>](#TEI.table). The only attribute class defined in this module (att.tableDecoration has been removed for now, because so far, it is not being used in the MEI ODD files.
Module figuresClass att.tableDecorationdelete
# A new module: xinclude

The mei-source.xml file relies on XInclude to reference the individual ODD files of the MEI Guidelines chapters and module definitions. To facilitate the validation of mei-source.xml even without active resolution of XInclude statements, the definition of the include element was borrowed from the [TEI XInclude customization](https://www.tei-c.org/Vault/P5/4.9.0/xml/tei/Exemplars/tei_xinclude.odd) by the means of ODD chaining.

Because a stray element without module assignment did not seem adequate a corresponding xinclude module was added.
[reference #add_element_xi-include](##add_element_xi-include)[reference #mod_element_xi-include](##mod_element_xi-include)
The include element then was modified (and this is where the actual ODD chaining happens), to be member of the xinclude module. Moreover the definition of the include element was drilled down to what is actually in use in the MEI ODD files: 
* available on the div-level, i.e., member of the model.divLike to allow inclusion of the guidelines chapters

* available on the div-level, i.e., member of the model.oddRef to allow inclusion of the module definitions

* no content, because MEI ODD files do not encode, e.g., a fallback

* require the presence of a href

Element [<include>](#TEI.xi_include)change
# Future Considerations

The work on the MEI ODDs surfaced some ideas and future needs: 
* Improve bibliographic references and citation by allowingbibl, cit from the core module

* Improve index generation by allowing [<divGen>](#TEI.divGen) and adding some custom types to the XSLTs responsible for generating the guidelines

* Improve encoding of terms by allowing [<gloss>](#TEI.gloss)

* Improve referencing values from code examples by allowing mentioned

* Improve citeability by adding and implementing citeStructure

* Improve encoding of tables by adding att.tableDecoration from the gaiji module


# Elements

## <TEI>
<TEI>@version<TEI> (TEI document) contains a single TEI-conformant document, combining a single TEI header with one or more members of the model.resource class. Multiple [<TEI>](#TEI.TEI) elements may be combined within a [<TEI>](#TEI.TEI) (or teiCorpus) element. [[4. Default Text Structure](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DS) [16.1. Varieties of Composite Text](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CC.html#CCDEF)]ModuletextstructureAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

versionspecifies the version number of the TEI Guidelines against which this document is valid.StatusOptionalDatatype[teidata.version](#TEI.teidata.version)Note
Major editions of the Guidelines have long been informally referred to by a name made up of the letter P (for Proposal) followed by a digit. The current release is one of the many releases of the fifth major edition of the Guidelines, known as P5. This attribute may be used to associate a TEI document with a specific release of the P5 Guidelines, in the absence of a more precise association provided by the source attribute on the associated [<schemaSpec>](#TEI.schemaSpec).
Contained bytextstructure: [TEI](#TEI.TEI)May containheader: [teiHeader](#TEI.teiHeader)textstructure: [TEI](#TEI.TEI) [text](#TEI.text)Note
As with all elements in the TEI scheme (except [<egXML>](#TEI.teix_egXML)) this element is in the TEI namespace (see [5.7.2. Namespaces](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SG.html#SGname)). Thus, when it is used as the outermost element of a TEI document, it is necessary to specify the TEI namespace on it. This is customarily achieved by including http://www.tei-c.org/ns/1.0 as the value of the XML namespace declaration (xmlns), without indicating a prefix, and then not using a prefix on TEI elements in the rest of the document. For example: <TEI version="4.8.1" xml:lang="it" xmlns="http://www.tei-c.org/ns/1.0">.
ExampleThe shortest TEI Document ImaginableFirst published as part of TEI P2, this is the P5 version using a namespace.No source: this is an original work.This is about the shortest TEI document imaginable.ExampleA TEI Document containing four page images Unpublished demonstration file.No source: this is an original work.Content model
<content>
 <sequence>
  <elementRef key="teiHeader"/>
  <alternate>
   <sequence>
    <classRef key="model.resource"
     minOccurs="1" maxOccurs="unbounded"/>
    <elementRef key="TEI" minOccurs="0"
     maxOccurs="unbounded"/>
   </sequence>
   <elementRef key="TEI" minOccurs="1"
    maxOccurs="unbounded"/>
  </alternate>
 </sequence>
</content>
    Schema Declaration
element TEI
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   attribute version { text }?,
   ( [teiHeader](#TEI.teiHeader), ( ( [model.resource](#TEI.model.resource)+, [TEI](#TEI.TEI)* ) | [TEI](#TEI.TEI)+ ) )
}
## <abbr>
<abbr>@type<abbr> (abbreviation) contains an abbreviation of any sort. [[3.6.5. Abbreviations and Their Expansions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONAAB)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


type(type) allows the encoder to classify the abbreviation according to some convenient typology.Derived from[att.typed](#TEI.att.typed)StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Sample values include:suspension
* (suspension) the abbreviation provides the first letter(s) of the word or phrase, omitting the remainder.
contraction
* (contraction) the abbreviation omits some letter(s) in the middle.
brevigraph
* the abbreviation comprises a special symbol or mark.
superscription
* (superscription) the abbreviation includes writing above the line.
acronym
* (acronym) the abbreviation comprises the initial letters of the words of a phrase.
title
* (title) the abbreviation is for a title of address (Dr, Ms, Mr, …)
organization
* (organization) the abbreviation is for the name of an organization.
geographic
* (geographic) the abbreviation is for a geographic name.
Note
The type attribute is provided for the sake of those who wish to classify abbreviations at their point of occurrence; this may be useful in some circumstances, though usually the same abbreviation will have the same type in all occurrences. As the sample values make clear, abbreviations may be classified by the method used to construct them, the method of writing them, or the referent of the term abbreviated; the typology used is up to the encoder and should be carefully planned to meet the needs of the expected use. For a typology of Middle English abbreviations, see [6.2.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/BIB.html#PETTY)
Member of[model.pPart.editorial](#TEI.model.pPart.editorial)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
If abbreviations are expanded silently, this practice should be documented in the editorialDecl, either with a normalization element or a [<p>](#TEI.p).
ExampleNorth Atlantic Treaty OrganizationNorATONATOOTANExampleSPQRsenatus populusque romanorumContent model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element abbr
{
   [att.global.attributes](#TEI.att.global),
   attribute type { text }?,
   [macro.phraseSeq](#TEI.macro.phraseSeq)
}
## <abstract>
<abstract><abstract> contains a summary or formal abstract prefixed to an existing source document by the encoder. [[2.4.4. Abstracts](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD4ABS)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.profileDescPart](#TEI.model.profileDescPart)Contained byheader: [profileDesc](#TEI.profileDesc)May containcore: [list](#TEI.list) [p](#TEI.p)figures: [table](#TEI.table)Note
This element is intended only for cases where no abstract is available in the original source. Any abstract already present in the source document should be encoded as a [<div>](#TEI.div) within the [<front>](#TEI.front), as it should for a born-digital document.
ExampleGood database design involves the acquisition and deployment of skills which have a wider relevance to the educational process. From a set of more or less instinctive rules of thumb a formal discipline or "methodology" of database design has evolved. Applying that methodology can be of great benefit to a very wide range of academic subjects: it requires fundamental skills of abstraction and generalisation and it provides a simple mechanism whereby complex ideas and information structures can be represented and manipulated, even without the use of a computer. Content model
<content>
 <alternate minOccurs="1"
  maxOccurs="unbounded">
  <classRef key="model.pLike"/>
  <classRef key="model.listLike"/>
  <elementRef key="listBibl"/>
 </alternate>
</content>
    Schema Declaration
element abstract
{
   [att.global.attributes](#TEI.att.global),
   ( [model.pLike](#TEI.model.pLike) | [model.listLike](#TEI.model.listLike) | [listBibl](#TEI.listBibl) )+
}
## <alternate>
<alternate><alternate> indicates that the constructs referenced by its children form an alternation. [[23.5.1. Defining Content Models](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#DEFCON)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.repeatable](#TEI.att.repeatable)
* @minOccurs

* @maxOccurs

Member of[model.contentPart](#TEI.model.contentPart)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [sequence](#TEI.sequence)May containtagdocs: [alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [classRef](#TEI.classRef) [dataRef](#TEI.dataRef) [elementRef](#TEI.elementRef) [empty](#TEI.empty) [macroRef](#TEI.macroRef) [sequence](#TEI.sequence) [textNode](#TEI.textNode) [valList](#TEI.valList)ExampleThis example content model permits either a [<name>](#TEI.name) or a persName.Schematron
<sch:rule context="tei:alternate">
<sch:assert test="count(*) gt 1">The alternate element must have at least two child elements</sch:assert>
</sch:rule>Content model
<content>
 <alternate minOccurs="1"
  maxOccurs="unbounded">
  <elementRef key="valList"/>
  <classRef key="model.contentPart"/>
 </alternate>
</content>
    Schema Declaration
element alternate
{
   [att.global.attributes](#TEI.att.global),
   [att.repeatable.attributes](#TEI.att.repeatable),
   ( [valList](#TEI.valList) | model.contentPart )+
}
## <anyElement>
<anyElement>@require@except<anyElement> indicates the presence of any elements in a content model. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.repeatable](#TEI.att.repeatable)
* @minOccurs

* @maxOccurs

requiresupplies a list of namespaces to one of which the permitted elements must belong.StatusOptionalDatatype1–∞ occurrences of [teidata.namespace](#TEI.teidata.namespace) separated by whitespaceexceptsupplies a list of namespaces or prefixed element names which are not permitted.StatusOptionalDatatype1–∞ occurrences of [teidata.namespaceOrName](#TEI.teidata.namespaceOrName) separated by whitespaceNote
When RELAX NG DTD Compatibility Mode is turned on, validation requires that any elements which may take an xml:id be excluded from the content of anyName name classes. For normal TEI purposes, this includes anything in the TEI namespace and the [<egXML>](#TEI.teix_egXML) element. Default elements and namespaces to be excluded are set on the defaultExceptions attribute of the [<schemaSpec>](#TEI.schemaSpec). except may be used when the exceptions need to be locally specified. Element prefixes must be declared using a namespace declaration on the parent or an ancestor element.
Member of[model.contentPart](#TEI.model.contentPart)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [sequence](#TEI.sequence)May containEmpty elementExampleThis [<content>](#TEI.content) element permits one occurrence of any element which does not belong to the TEI namespace.ExampleThis [<content>](#TEI.content) element permits one or more elements which belong either to the MathML namespace or to the TEI examples namespace.ExampleThis [<content>](#TEI.content) element permits one or more children which are either text nodes or elements from the TEI examples namespace. It is the equivalent of the content model ANY in an XML DTD using the TEI All schema.Content model
<content>
 <empty/>
</content>
    Schema Declaration
element anyElement
{
   [att.global.attributes](#TEI.att.global),
   [att.repeatable.attributes](#TEI.att.repeatable),
   attribute require { list { + } }?,
   attribute except { list { + } }?,
   empty
}
## <att>
<att>@scheme<att> (attribute) contains the name of an attribute appearing within running text. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


scheme(scheme) supplies an identifier for the scheme in which this name is defined.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Sample values include:TEI
* (Text Encoding Initiative) this attribute is part of the TEI scheme.[Default] 
DBK
* (Docbook) this attribute is part of the Docbook scheme.
XX
* (unknown) this attribute is part of an unknown scheme.
imaginary
* (imaginary) the attribute is from a non-existent scheme, for illustrative purposes only
XHTML
* (XHTML) the attribute is part of the XHTML language
XML
* (XML) the attribute is part of the XML language
XI
* (XI) the attribute is defined in the xInclude schema
Member of[model.phrase.xml](#TEI.model.phrase.xml)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containXSD NameNote
As an alternative to using the scheme attribute a namespace prefix may be used. Where both scheme and a prefix are used, the prefix takes precedence.
ExampleThe TEI defines several global attributes; their names include xml:id, rend, xml:lang, n, xml:space, and xml:base; type is not amongst them.Content model
<content>
 <dataRef key="teidata.name"/>
</content>
    Schema Declaration
element att { [att.global.attributes](#TEI.att.global), attribute scheme { text }?, [teidata.name](#TEI.teidata.name) }
## <attDef>
<attDef>@usage<attDef> (attribute definition) contains the definition of a single attribute. [[23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil




* [att.namespaceable](#TEI.att.namespaceable)
* @ns

usagespecifies the optionality of the attribute.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:req
* (required)
rec
* (recommended)
opt
* (optional) [Default] 
Contained bytagdocs: [attList](#TEI.attList)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [constraintSpec](#TEI.constraintSpec) [datatype](#TEI.datatype) [defaultVal](#TEI.defaultVal) [exemplum](#TEI.exemplum) [remarks](#TEI.remarks) [valDesc](#TEI.valDesc) [valList](#TEI.valList)Examplespecifies a name conventionally used for this level of subdivision, e.g. act, volume, book, section, canto, etc.Schematron
<sch:rule context="tei:attDef[@usage eq 'req']">
<sch:report test="tei:defaultVal">Since the @<sch:value-of select="@ident"/> attribute is required, it will always be specified. Thus the default value (of "<sch:value-of select="normalize-space(tei:defaultVal)"/>") will never be used. Either change the definition of the attribute so it is not required ("rec" or "opt"), or remove the defaultVal element.</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:attDef[ tei:defaultVal and tei:valList[ @type eq 'closed'] and 
 tei:datatype[ @maxOccurs > 1 or @minOccurs > 1 or @maxOccurs eq 'unbounded'] 
 ]">
<sch:assert test="tokenize(normalize-space(tei:defaultVal),' ') = tei:valList/tei:valItem/@ident">In the <sch:value-of select="local-name(ancestor::*[@ident][1])"/> defining
<sch:value-of select="ancestor::*[@ident][1]/@ident"/> the default value of the
 @<sch:value-of select="@ident"/> attribute is not among the closed list of possible
 values</sch:assert>
</sch:rule>Schematron
<sch:rule context="tei:attDef[ tei:defaultVal and tei:valList[ @type eq 'closed'] and 
 tei:datatype[ not(@maxOccurs) or ( if ( @maxOccurs castable as xs:integer 
 ) then ( @maxOccurs cast as xs:integer eq 1 ) else false() ) ] ]">
<sch:assert test="string(tei:defaultVal) = tei:valList/tei:valItem/@ident">In the <sch:value-of select="local-name(ancestor::*[@ident][1])"/> defining
<sch:value-of select="ancestor::*[@ident][1]/@ident"/> the default value of the
 @<sch:value-of select="@ident"/> attribute is not among the closed list of possible
 values</sch:assert>
</sch:rule>Content model
<content>
 <sequence minOccurs="1" maxOccurs="1">
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identSynonyms"/>
   <classRef key="model.descLike"/>
  </alternate>
  <elementRef key="datatype" minOccurs="0"/>
  <elementRef key="constraintSpec"
   minOccurs="0" maxOccurs="unbounded"/>
  <elementRef key="defaultVal"
   minOccurs="0"/>
  <alternate minOccurs="0" maxOccurs="1">
   <elementRef key="valList"/>
   <elementRef key="valDesc" minOccurs="1"
    maxOccurs="unbounded"/>
  </alternate>
  <elementRef key="exemplum" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="remarks" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element attDef
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   [att.namespaceable.attributes](#TEI.att.namespaceable),
   attribute usage { "req" | "rec" | "opt" }?,
   (
      ( [model.identSynonyms](#TEI.model.identSynonyms) | [model.descLike](#TEI.model.descLike) )*,
      [datatype](#TEI.datatype)?,
      [constraintSpec](#TEI.constraintSpec)*,
      [defaultVal](#TEI.defaultVal)?,
      ( [valList](#TEI.valList) | [valDesc](#TEI.valDesc)+ )?,
      [exemplum](#TEI.exemplum)*,
      [remarks](#TEI.remarks)*
   )
}
## <attList>
<attList>@org<attList> (attribute list) contains documentation for all the attributes associated with this element, as a series of [<attDef>](#TEI.attDef) elements. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG) [23.6. Class Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDCLA)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


org(organization) specifies whether only one (choice) or all (group) of the attributes in the list are available.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:group
* grouped[Default] 
choice
* alternated
Contained bytagdocs: [attList](#TEI.attList) [classSpec](#TEI.classSpec) [elementSpec](#TEI.elementSpec)May containtagdocs: [attDef](#TEI.attDef) [attList](#TEI.attList) [attRef](#TEI.attRef)Exampletype of schemaExampleidentifies the active participants in a non-mutual relationship, or all the participants in a mutual one.supplies a list of participants amongst all of whom the relationship holds equally.Content model
<content>
 <alternate minOccurs="1"
  maxOccurs="unbounded">
  <elementRef key="attRef"/>
  <elementRef key="attDef"/>
  <elementRef key="attList"/>
 </alternate>
</content>
    Schema Declaration
element attList
{
   [att.global.attributes](#TEI.att.global),
   attribute org { "group" | "choice" }?,
   ( [attRef](#TEI.attRef) | [attDef](#TEI.attDef) | [attList](#TEI.attList) )+
}
## <attRef>
<attRef>@class@name<attRef> (attribute pointer) points to the definition of an attribute or group of attributes. [[23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


classthe name of the attribute classStatusOptionalDatatype[teidata.name](#TEI.teidata.name)namethe name of the attributeStatusOptionalDatatype[teidata.name](#TEI.teidata.name)Contained bytagdocs: [attList](#TEI.attList)May containEmpty elementExampleContent model
<content>
 <empty/>
</content>
    Schema Declaration
element attRef
{
   [att.global.attributes](#TEI.att.global),
   attribute class { text }?,
   attribute name { text }?,
   empty
}
## <availability>
<availability>@status<availability> (availability) supplies information about the availability of a text, for example any restrictions on its use or distribution, its copyright status, any licence applying to it, etc. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


status(status) supplies a code identifying the current availability of the text.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:free
* (free) the text is freely available.
unknown
* (unknown) the status of the text is unknown.
restricted
* (restricted) the text is not freely available.
Member of[model.publicationStmtPart.detail](#TEI.model.publicationStmtPart.detail)Contained byheader: [publicationStmt](#TEI.publicationStmt)May containcore: [p](#TEI.p)header: [licence](#TEI.licence)Note
A consistent format should be adopted
ExampleAvailable for academic research purposes only.In the public domainAvailable under licence from the publishers.ExampleThe MIT License applies to this document.Copyright (C) 2011 by The University of VictoriaPermission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.Content model
<content>
 <alternate minOccurs="1"
  maxOccurs="unbounded">
  <classRef key="model.availabilityPart"/>
  <classRef key="model.pLike"/>
 </alternate>
</content>
    Schema Declaration
element availability
{
   [att.global.attributes](#TEI.att.global),
   attribute status { "free" | "unknown" | "restricted" }?,
   ( [model.availabilityPart](#TEI.model.availabilityPart) | [model.pLike](#TEI.model.pLike) )+
}
## <back>
<back><back> (back matter) contains any appendixes, etc. following the main part of a text. [[4.7. Back Matter](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSBACK) [4. Default Text Structure](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DS)]ModuletextstructureAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained bytextstructure: [text](#TEI.text)May containcore: [divGen](#TEI.divGen) [head](#TEI.head) [list](#TEI.list) [note](#TEI.note) [p](#TEI.p)derived-module-tei_xinclude: [include](#TEI.include)figures: [figure](#TEI.figure) [table](#TEI.table)tagdocs: [schemaSpec](#TEI.schemaSpec)textstructure: [div](#TEI.div)Note
Because cultural conventions differ as to which elements are grouped as back matter and which as front matter, the content models for the [<back>](#TEI.back) and [<front>](#TEI.front) elements are identical.
ExampleThe Golden Dream or, the Ingenuous ConfessionTO shew the Depravity of human Nature, and how apt the Mind is to be misled by Trinkets and false Appearances, Mrs. Two-Shoes does acknowledge, that after she became rich, she had like to have been, too fond of Money A letter from the Printer, which he desires may be insertedSir.I have done with your Copy, so you may return it to the Vatican, if you please; The Books usually read by the Scholars of Mrs Two-Shoes are these and are sold at Mr Newbery's at the Bible and Sun in St Paul's Church-yard.The Christmas Box, Price 1d.The History of Giles Gingerbread, 1d.A Curious Collection of Travels, selected from the Writers of all Nations, 10 Vol, Pr. bound 1l.By the KING's Royal Patent, Are sold by J. NEWBERY, at the Bible and Sun in St. Paul's Church-Yard.Dr. James's Powders for Fevers, the Small-Pox, Measles, Colds, &c. 2s. 6dDr. Hooper's Female Pills, 1s.Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.frontPart"/>
   <classRef key="model.pLike.front"/>
   <classRef key="model.pLike"/>
   <classRef key="model.listLike"/>
   <classRef key="model.global"/>
  </alternate>
  <alternate minOccurs="0">
   <sequence>
    <classRef key="model.div1Like"/>
    <alternate minOccurs="0"
     maxOccurs="unbounded">
     <classRef key="model.frontPart"/>
     <classRef key="model.div1Like"/>
     <classRef key="model.global"/>
    </alternate>
   </sequence>
   <sequence>
    <classRef key="model.divLike"/>
    <alternate minOccurs="0"
     maxOccurs="unbounded">
     <classRef key="model.frontPart"/>
     <classRef key="model.divLike"/>
     <classRef key="model.global"/>
    </alternate>
   </sequence>
  </alternate>
  <sequence minOccurs="0">
   <classRef key="model.divBottomPart"/>
   <alternate minOccurs="0"
    maxOccurs="unbounded">
    <classRef key="model.divBottomPart"/>
    <classRef key="model.global"/>
   </alternate>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element back
{
   [att.global.attributes](#TEI.att.global),
   (
      (
         [model.frontPart](#TEI.model.frontPart)
       | [model.pLike.front](#TEI.model.pLike.front)
       | [model.pLike](#TEI.model.pLike)
       | [model.listLike](#TEI.model.listLike)
       | [model.global](#TEI.model.global)
      )*,
      (
         (
            [model.div1Like](#TEI.model.div1Like),
            ( [model.frontPart](#TEI.model.frontPart) | [model.div1Like](#TEI.model.div1Like) | [model.global](#TEI.model.global) )*
         )
       | ( [model.divLike](#TEI.model.divLike), ( [model.frontPart](#TEI.model.frontPart) | [model.divLike](#TEI.model.divLike) | [model.global](#TEI.model.global) )* )
      )?,
      ( ( [model.divBottomPart](#TEI.model.divBottomPart), ( [model.divBottomPart](#TEI.model.divBottomPart) | [model.global](#TEI.model.global) )* )? )
   )
}
## <body>
<body><body> (text body) contains the whole body of a single unitary text, excluding any front or back matter. [[4. Default Text Structure](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DS)]ModuletextstructureAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained bytextstructure: [text](#TEI.text)May containcore: [desc](#TEI.desc) [divGen](#TEI.divGen) [head](#TEI.head) [label](#TEI.label) [list](#TEI.list) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote)derived-module-tei_xinclude: [include](#TEI.include)figures: [figure](#TEI.figure) [table](#TEI.table)tagdocs: [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)textstructure: [div](#TEI.div)ExampleNu scylun hergan hefaenricaes uardmetudæs maecti end his modgidancuerc uuldurfadur sue he uundra gihuaeseci dryctin or astelidæhe aerist scop aelda barnumheben til hrofe haleg scepen.tha middungeard moncynnæs uardeci dryctin æfter tiadæfirum foldu frea allmectigprimo cantauit Cædmon istud carmen.Content model
<content>
 <sequence>
  <classRef key="model.global"
   minOccurs="0" maxOccurs="unbounded"/>
  <sequence minOccurs="0">
   <classRef key="model.divTop"/>
   <alternate minOccurs="0"
    maxOccurs="unbounded">
    <classRef key="model.global"/>
    <classRef key="model.divTop"/>
   </alternate>
  </sequence>
  <sequence minOccurs="0">
   <classRef key="model.divGenLike"/>
   <alternate minOccurs="0"
    maxOccurs="unbounded">
    <classRef key="model.global"/>
    <classRef key="model.divGenLike"/>
   </alternate>
  </sequence>
  <alternate>
   <sequence minOccurs="1"
    maxOccurs="unbounded">
    <classRef key="model.divLike"/>
    <alternate minOccurs="0"
     maxOccurs="unbounded">
     <classRef key="model.global"/>
     <classRef key="model.divGenLike"/>
    </alternate>
   </sequence>
   <sequence minOccurs="1"
    maxOccurs="unbounded">
    <classRef key="model.div1Like"/>
    <alternate minOccurs="0"
     maxOccurs="unbounded">
     <classRef key="model.global"/>
     <classRef key="model.divGenLike"/>
    </alternate>
   </sequence>
   <sequence>
    <sequence minOccurs="1"
     maxOccurs="unbounded">
     <alternate minOccurs="1" maxOccurs="1">
      <elementRef key="schemaSpec"/>
      <classRef key="model.common"/>
     </alternate>
     <classRef key="model.global"
      minOccurs="0" maxOccurs="unbounded"/>
    </sequence>
    <alternate minOccurs="0">
     <sequence minOccurs="1"
      maxOccurs="unbounded">
      <classRef key="model.divLike"/>
      <alternate minOccurs="0"
       maxOccurs="unbounded">
       <classRef key="model.global"/>
       <classRef key="model.divGenLike"/>
      </alternate>
     </sequence>
     <sequence minOccurs="1"
      maxOccurs="unbounded">
      <classRef key="model.div1Like"/>
      <alternate minOccurs="0"
       maxOccurs="unbounded">
       <classRef key="model.global"/>
       <classRef key="model.divGenLike"/>
      </alternate>
     </sequence>
    </alternate>
   </sequence>
  </alternate>
  <sequence minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.divBottom"/>
   <classRef key="model.global"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element body
{
   [att.global.attributes](#TEI.att.global),
   (
      [model.global](#TEI.model.global)*,
      ( ( [model.divTop](#TEI.model.divTop), ( [model.global](#TEI.model.global) | [model.divTop](#TEI.model.divTop) )* )? ),
      ( ( [model.divGenLike](#TEI.model.divGenLike), ( [model.global](#TEI.model.global) | [model.divGenLike](#TEI.model.divGenLike) )* )? ),
      (
         ( ( [model.divLike](#TEI.model.divLike), ( [model.global](#TEI.model.global) | [model.divGenLike](#TEI.model.divGenLike) )* )+ )
       | ( ( [model.div1Like](#TEI.model.div1Like), ( [model.global](#TEI.model.global) | [model.divGenLike](#TEI.model.divGenLike) )* )+ )
       | (
            ( ( ( [schemaSpec](#TEI.schemaSpec) | [model.common](#TEI.model.common) ), [model.global](#TEI.model.global)* )+ ),
            (
               ( ( [model.divLike](#TEI.model.divLike), ( [model.global](#TEI.model.global) | [model.divGenLike](#TEI.model.divGenLike) )* )+ )
             | ( ( [model.div1Like](#TEI.model.div1Like), ( [model.global](#TEI.model.global) | [model.divGenLike](#TEI.model.divGenLike) )* )+ )
            )?
         )
      ),
      ( ( [model.divBottom](#TEI.model.divBottom), [model.global](#TEI.model.global)* )* )
   )
}
## <cell>
<cell><cell> (cell) contains one cell of a table. [[15.1.1. TEI Tables](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html#FTTAB1)]ModulefiguresAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byfigures: [row](#TEI.row)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleGeneral conductNot satisfactory, on account of his great unpunctuality and inattention to dutiesContent model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element cell { [att.global.attributes](#TEI.att.global), [macro.specialPara](#TEI.macro.specialPara) }
## <change>
<change>@target<change> (change) documents a change or set of changes made during the production of a source document, or during the revision of an electronic file. [[2.6. The Revision Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD6) [2.4.1. Creation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD4C) [12.7. Identifying Changes and Revisions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html#PH-changes)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.ascribed](#TEI.att.ascribed)
* @who


* [att.datable](#TEI.att.datable)
* [att.datable.w3c](#TEI.att.datable.w3c)
* @when

* @notBefore

* @notAfter

* @from

* @to



* [att.typed](#TEI.att.typed)
* @type

target(target) points to one or more elements that belong to this change.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceContained byheader: [revisionDesc](#TEI.revisionDesc)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The who attribute may be used to point to any other element, but will typically specify a [<respStmt>](#TEI.respStmt) or person element elsewhere in the header, identifying the person responsible for the change and their role in making it.

It is recommended that changes be recorded with the most recent first. The status attribute may be used to indicate the status of a document following the change documented.
Example... Lou Burnardcopy editingBrett ZamirFinished chapter 23Finished chapter 2Added examples to section 3Deleted chapter 10ExampleFirst draft in pencilFirst revision, mostly using green inkFinal corrections as supplied to printer.Content model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element change
{
   [att.global.attributes](#TEI.att.global),
   [att.ascribed.attributes](#TEI.att.ascribed),
   [att.datable.attributes](#TEI.att.datable),
   [att.typed.attributes](#TEI.att.typed),
   attribute target { list { + } }?,
   [macro.specialPara](#TEI.macro.specialPara)
}
## <classRef>
<classRef>@key@expand@include@except<classRef> points to the specification for an attribute or model class which is to be included in a schema. [[23.6. Class Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDCLA)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.repeatable](#TEI.att.repeatable)
* @minOccurs

* @maxOccurs

keythe identifier used for the required class within the source indicated.StatusRequiredDatatype[teidata.xmlName](#TEI.teidata.xmlName)expandindicates how references to this class within a content model should be interpreted.StatusOptionalLegal values are:alternation
* any one member of the class may appear
sequence
* a single occurrence of all members of the class may appear in sequence
sequenceOptional
* a single occurrence of one or more members of the class may appear in sequence
sequenceOptionalRepeatable
* one or more occurrences of one or more members of the class may appear in sequence.
sequenceRepeatable
* one or more occurrences of all members of the class may appear in sequence
Note
If the members of the class are a, b and c, then a reference to the class within a content model is understood as being a reference to a|b|c when expand is omitted or has the value alternation; to a,b,c when it has the value sequence; to (a?,b?,c?) when it has the value sequenceOptional; to (a*,b*,c*) when it has the value sequenceOptionalRepeatable; or to (a+,b+,c+) when it has the value sequenceRepeatable.
includesupplies a list of class members which are to be included in the schema being defined.StatusOptionalDatatype0–∞ occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespaceexceptsupplies a list of class members which are to be excluded from the schema being defined.StatusOptionalDatatype0–∞ occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespaceMember of[model.contentPart](#TEI.model.contentPart) [model.oddRef](#TEI.model.oddRef)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [specGrp](#TEI.specGrp)May containEmpty elementNote
Attribute and model classes are identified by the name supplied as value for the ident attribute on the [<classSpec>](#TEI.classSpec) element in which they are declared. All TEI class names are unique; attribute class names conventionally begin with the letters att..
ExampleContent model
<content>
 <empty/>
</content>
    Schema Declaration
element classRef
{
   [att.global.attributes](#TEI.att.global),
   [att.repeatable.attributes](#TEI.att.repeatable),
   attribute key { text },
   attribute expand
   {
      "alternation"
    | "sequence"
    | "sequenceOptional"
    | "sequenceOptionalRepeatable"
    | "sequenceRepeatable"
   }?,
   ( attribute include { list { * } }? | attribute except { list { * } }? ),
   empty
}
## <classSpec>
<classSpec>@type@generate<classSpec> (class specification) contains reference information for a TEI element class; that is a group of elements which appear together in content models, or which share some common attribute, or both. [[23.3. Specification Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDcrystals) [23.6. Class Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDCLA)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil



typeindicates whether this is a model class or an attribute classDerived from[att.typed](#TEI.att.typed)StatusRequiredDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:model
* (content model) members of this class appear in the same content models
atts
* (attributes) members of this class share common attributes
generateindicates which alternation and sequence instantiations of a model class may be referenced. By default, all variations are permitted.StatusOptionalDatatype1–5 occurrences of [teidata.enumerated](#TEI.teidata.enumerated) separated by whitespaceLegal values are:alternation
* members of the class are alternatives
sequence
* members of the class are to be provided in sequence
sequenceOptional
* members of the class may be provided, in sequence, but are optional
sequenceOptionalRepeatable
* members of the class may be provided one or more times, in sequence, but are optional.
sequenceRepeatable
* members of the class may be provided one or more times, in sequence
Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [attList](#TEI.attList) [classes](#TEI.classes) [constraintSpec](#TEI.constraintSpec) [exemplum](#TEI.exemplum) [listRef](#TEI.listRef) [remarks](#TEI.remarks)Examplegroups elements used for arbitrary segmentation.The principles on which segmentation is carried out, and any special codes or attribute values used, should be defined explicitly in the segmentation element of the encodingDesc within the associated TEI header.Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identSynonyms"/>
   <classRef key="model.descLike"/>
  </alternate>
  <elementRef key="classes" minOccurs="0"/>
  <elementRef key="constraintSpec"
   minOccurs="0" maxOccurs="unbounded"/>
  <elementRef key="attList" minOccurs="0"/>
  <elementRef key="exemplum" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="remarks" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="listRef" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element classSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   attribute type { "model" | "atts" },
   attribute generate
   {
      list
      {
         (
            "alternation"
          | "sequence"
          | "sequenceOptional"
          | "sequenceOptionalRepeatable"
          | "sequenceRepeatable"
         ),
         (
            "alternation"
          | "sequence"
          | "sequenceOptional"
          | "sequenceOptionalRepeatable"
          | "sequenceRepeatable"
         )?,
         (
            "alternation"
          | "sequence"
          | "sequenceOptional"
          | "sequenceOptionalRepeatable"
          | "sequenceRepeatable"
         )?,
         (
            "alternation"
          | "sequence"
          | "sequenceOptional"
          | "sequenceOptionalRepeatable"
          | "sequenceRepeatable"
         )?,
         (
            "alternation"
          | "sequence"
          | "sequenceOptional"
          | "sequenceOptionalRepeatable"
          | "sequenceRepeatable"
         )?
      }
   }?,
   (
      ( [model.identSynonyms](#TEI.model.identSynonyms) | [model.descLike](#TEI.model.descLike) )*,
      [classes](#TEI.classes)?,
      [constraintSpec](#TEI.constraintSpec)*,
      [attList](#TEI.attList)?,
      [exemplum](#TEI.exemplum)*,
      [remarks](#TEI.remarks)*,
      [listRef](#TEI.listRef)*
   )
}
## <classes>
<classes>@mode<classes> (classes) specifies all the classes of which the documented element or class is a member or subclass. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG) [23.6. Class Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDCLA)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


modespecifies the effect of this declaration on its parent module.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:change
* this declaration changes the declaration of the same name in the current definition
replace
* this declaration replaces the declaration of the same name in the current definition[Default] 
Contained bytagdocs: [classSpec](#TEI.classSpec) [elementSpec](#TEI.elementSpec)May containtagdocs: [memberOf](#TEI.memberOf)Note
An empty [<classes>](#TEI.classes) element indicates that the element documented is not a member of any class. This should not generally happen.
ExampleThis [<classes>](#TEI.classes) element indicates that the element documented (which may be an element or a class) is a member of two distinct classes: model.attributable and att.declarable.Content model
<content>
 <elementRef key="memberOf" minOccurs="0"
  maxOccurs="unbounded"/>
</content>
    Schema Declaration
element classes
{
   [att.global.attributes](#TEI.att.global),
   attribute mode { "change" | "replace" }?,
   [memberOf](#TEI.memberOf)*
}
## <code>
<code>@lang<code> contains literal code from some formal language such as a programming language. [[23.1.1. Phrase Level Terms](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDphraseTE)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


lang(formal language) a name identifying the formal language in which the code is expressed.StatusOptionalDatatype[teidata.word](#TEI.teidata.word)Member of[model.emphLike](#TEI.model.emphLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containCharacter data onlyExampleSize fCheckbox1Size = new Size(); fCheckbox1Size.Height = 500; fCheckbox1Size.Width = 500; xCheckbox1.setSize(fCheckbox1Size); Content model
<content>
 <textNode/>
</content>
    Schema Declaration
element code { [att.global.attributes](#TEI.att.global), attribute lang { text }?, text }
## <constraint>
<constraint><constraint> (constraint rules) the formal rules of a constraint [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained bytagdocs: [constraintSpec](#TEI.constraintSpec)May containANYExamplea main title must be suppliedExample(output = (ident(title) ident(author) "You must supply a title or an author")) Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <anyElement/>
 </alternate>
</content>
    Schema Declaration
element constraint
{
   [att.global.attributes](#TEI.att.global),
   ( text | [anyElement_constraint_4](#TEI.anyElement_constraint_4) )*
}
## <constraintDecl>
<constraintDecl>@scheme@queryBinding<constraintDecl> (constraint declaration) contains declarations pertaining to formal constraints expressed elsewhere in [<constraintSpec>](#TEI.constraintSpec) elements [[23.5.2. Additional Constraints](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAGCONS)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


schemesupplies the name of the language to which the declarations herein applyStatusRequiredDatatype[teidata.enumerated](#TEI.teidata.enumerated)Suggested values include:schematron
* (ISO Schematron)
Note
The declarations contained in a particular [<constraintDecl>](#TEI.constraintDecl) (including queryBinding, if present) apply to the [<constraintSpec>](#TEI.constraintSpec) elements whose scheme matches the scheme of the [<constraintDecl>](#TEI.constraintDecl).
queryBinding(query language binding) specifies the query language binding for rule-based schema expressions in [<constraintSpec>](#TEI.constraintSpec) elements that have a matching scheme attributeStatusRecommendedDatatype[teidata.enumerated](#TEI.teidata.enumerated)Suggested values include:exslt
* 
stx
* 
xslt
* 
xslt2
* 
xslt3
* 
xpath
* 
xpath2
* 
xpath3
* 
xpath31
* 
xquery
* 
xquery3
* 
xquery31
* 
Note
The suggested values above are the values reserved by the Schematron specification. Only exslt, stx, xslt, xslt2, xslt3, xpath2, and xpath3 are defined by the specification. Most processors only support one or more of xslt, xslt2, and xslt3.
Contained bytagdocs: [schemaSpec](#TEI.schemaSpec)May containANYExampleSchematron
<sch:rule context="/*[ count( //tei:constraintDecl ) gt 1 ]">
<sch:let name="schemes"
 value="//tei:constraintDecl[ not(ancestor::*[local-name(.) eq 'egXML'] ) 
 ]/@scheme"/>
<sch:let name="disctinct_schemes"
 value="distinct-values( $schemes )"/>
<sch:assert test="count( $schemes ) eq count( $disctinct_schemes )"> Each <constraintDecl> element should have a @scheme attribute that is distinct from that of all the other <constraintDecl>s.
</sch:assert>
</sch:rule>Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identEquiv"/>
   <classRef key="model.descLike"/>
  </alternate>
  <anyElement minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element constraintDecl
{
   [att.global.attributes](#TEI.att.global),
   attribute scheme { "schematron" },
   attribute queryBinding
   {
      "exslt"
    | "stx"
    | "xslt"
    | "xslt2"
    | "xslt3"
    | "xpath"
    | "xpath2"
    | "xpath3"
    | "xpath31"
    | "xquery"
    | "xquery3"
    | "xquery31"
   }?,
   ( ( [model.identEquiv](#TEI.model.identEquiv) | [model.descLike](#TEI.model.descLike) )*, [anyElement_constraintDecl_3](#TEI.anyElement_constraintDecl_3)* )
}
## <constraintSpec>
<constraintSpec>@type@scheme<constraintSpec> (constraint on schema) contains a formal constraint, typically expressed in a rule-based schema language, to which a construct must conform in order to be considered valid [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil



typecharacterizes the [<constraintSpec>](#TEI.constraintSpec) element in some sense; used to indicate when a [<constraintSpec>](#TEI.constraintSpec) warns about a deprecated construct.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Suggested values include:deprecationWarning
* Indicates that this constraint specification warns that some other construct in the schema is deprecated.
schemesupplies the name of the language in which the constraints are definedStatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Schematron
<sch:rule context="tei:constraintSpec[ @mode = ('add','replace') or not( @mode ) ]">
<sch:assert test="@scheme">The @scheme attribute of <constraintSpec> is required when the @mode is <sch:value-of select="if (@mode) then concat('"',@mode,'"') else 'not specified'"/> (here on "<sch:value-of select="@ident"/>")</sch:assert>
</sch:rule>Suggested values include:schematron
* (ISO Schematron)
Note
These Guidelines no longer recommend, and the current TEI stylesheets no longer support, the use of Schematron 1.x within [<constraintSpec>](#TEI.constraintSpec). Thus the value schematron is used to indicate that ISO Schematron is used within the [<constraintSpec>](#TEI.constraintSpec).

The scheme attribute is required when the value of mode is add or replace. The scheme attribute is permitted when the value of mode is delete, but these Guidelines make no reccomendation for what a processor should do if its value does not match that of the [<constraintSpec>](#TEI.constraintSpec) being deleted.
Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [constraint](#TEI.constraint)Note
A child [<constraint>](#TEI.constraint) is required when the mode attribute has the value replace or add (or is not specified, as add is the default). No child elements are permitted when the mode attribute has the value delete. At least one child element is required when the mode attribute has the value change.
ExampleThis constraint uses Schematron to enforce the presence of the spanTo attribute (which comes from an attribute class) on the addSpan element:Enforce the presence of the spanTo attributeThe spanTo= attribute of  is required.ExampleImplement an accessibility rule which says that pictures should have textual explanationsYou should provide information in a figure from which we can construct an alt attribute in HTMLExampleThis constraint uses SPITBOL (a language which is not expressed in XML) to check whether the title and author are identical: (output = leq(title,author) "title and author cannot be the same") Schematron
<sch:rule context="tei:constraintSpec[ @mode eq 'delete']">
<sch:report test="child::*">This constraintSpec element has a mode= of "delete" even though it has child elements. Change the mode= to "add", "change", or "replace", or remove the child elements.</sch:report>
</sch:rule>
<sch:rule context="tei:constraintSpec[ @mode eq 'change']">
<sch:assert test="child::*">This constraintSpec element has a mode= of "change", but does not have any child elements. Specify child elements, or change the mode= to "delete".</sch:assert>
</sch:rule>
<sch:rule context="tei:constraintSpec[ @mode = ('add','replace') ]">
<sch:assert test="child::tei:constraint">This constraintSpec element has a mode= of "<sch:value-of select="@mode"/>", but does not have a child 'constraint' element. Use a child 'constraint' element or change the mode= to "delete" or "change".</sch:assert>
</sch:rule>SchematronRelationship between scheme attribute and contents: Schematron 1.x
<sch:rule context="tei:constraintSpec">
<sch:report test="tei:constraint/sch1x:* and @scheme = ('isoschematron','schematron')">Rules
 in the Schematron 1.* language must be inside a constraintSpec
 with a value other than 'schematron' or 'isoschematron' on the
 scheme attribute</sch:report>
</sch:rule>SchematronRelationship between scheme attribute and contents: ISO Schematron
<sch:rule context="tei:constraintSpec[ @mode = ('add','replace') or not( @mode ) ]">
<sch:report test="tei:constraint/sch:* and not( @scheme eq 'schematron')">Rules
 in the ISO Schematron language must be inside a constraintSpec
 with the value 'schematron' on the scheme attribute</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:constraintSpec[ @scheme eq 'schematron']/tei:constraint[ .//sch:assert 
 | .//sch:report ]">
<sch:let name="assertsHaveContext"
 value="for $a in .//sch:assert return exists( $a/ancestor::sch:rule/@context 
 )"/>
<sch:let name="reportsHaveContext"
 value="for $r in .//sch:report return exists( $r/ancestor::sch:rule/@context 
 )"/>
<sch:report test="( $assertsHaveContext, $reportsHaveContext ) = false()"
 role="warning">The use of an <sch:assert> or <sch:report> that does not have a context (i.e., does not have an ancestor <sch:rule> with a @context attribute) in an ISO Schematron constraint specification is deprecated, and will become invalid after 2025-03-15.</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:constraintSpec[ @mode eq 'add' or not( @mode ) ]">
<sch:let name="myIdent"
 value="normalize-space(@ident)"/>
<sch:report test="preceding::tei:constraintSpec[ normalize-space(@ident) eq $myIdent 
 ]"> The @ident of 'constraintSpec' should be unique; this one (<sch:value-of select="$myIdent"/>) is the same as that of a previous 'constraintSpec'.
</sch:report>
</sch:rule>Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identSynonyms"/>
   <classRef key="model.descLike"/>
  </alternate>
  <elementRef key="constraint"
   minOccurs="0" maxOccurs="1"/>
 </sequence>
</content>
    Schema Declaration
element constraintSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   attribute type { "deprecationWarning" }?,
   attribute scheme { "schematron" }?,
   ( ( [model.identSynonyms](#TEI.model.identSynonyms) | [model.descLike](#TEI.model.descLike) )*, [constraint](#TEI.constraint)? )
}
## <content>
<content>@autoPrefix<content> (content model) contains a declaration of the intended content model for the element (or other construct) being specified. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


autoPrefixcontrols whether or not pattern names generated in the corresponding RELAX NG schema source are automatically prefixed to avoid potential nameclashes.StatusOptionalDatatype[teidata.truthValue](#TEI.teidata.truthValue)Legal values are:true
* Each name referenced in e.g. an rng:ref element within a content model is automatically prefixed by the value of the prefix attribute on the current [<schemaSpec>](#TEI.schemaSpec)[Default] 
false
* No prefixes are added: any prefix required by the value of the prefix attribute on the current [<schemaSpec>](#TEI.schemaSpec) must therefore be supplied explicitly, as appropriate.
Contained bytagdocs: [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleRef](#TEI.moduleRef)May containANYNote
It is required that the [<content>](#TEI.content) element has only one child element. If several RELAX NG elements are desired, they must be wrapped in a rng:div.
ExampleThis sample [<content>](#TEI.content) element indicates that the element being specified has no content:ExampleThis [<content>](#TEI.content) element defines a content model, expressed directly in the TEI ODD language, that allows either a sequence of paragraphs or a series of msItem elements optionally preceded by a summary:ExampleThis sample [<content>](#TEI.content) element defines a content model, expressed in the RELAX NG schema language, that allows either a sequence of paragraphs or a series of msItem elements optionally preceded by a summary:Content model
<content>
 <alternate>
  <elementRef key="valList" minOccurs="1"
   maxOccurs="1"/>
  <classRef key="model.contentPart"
   minOccurs="1" maxOccurs="1"/>
  <anyElement minOccurs="1" maxOccurs="1"
   require="http://relaxng.org/ns/compatibility/annotations/1.0 http://relaxng.org/ns/structure/1.0"/>
 </alternate>
</content>
    Schema Declaration
element content
{
   [att.global.attributes](#TEI.att.global),
   attribute autoPrefix { "true" | "false" }?,
   ( [valList](#TEI.valList) | model.contentPart | [anyElement_content_2](#TEI.anyElement_content_2) )
}
## <dataFacet>
<dataFacet>@name@value<dataFacet> Restricts the value of the strings used to represent values of a datatype, according to [XML Schema Part 2: Datatypes Second Edition](#XSD2). [[23.5.3.1. Datatypes](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD-datatypes)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


namethe name of the facet.StatusRequiredDatatype[teidata.word](#TEI.teidata.word)Legal values are:length
* 
minLength
* 
maxLength
* 
pattern
* 
enumeration
* 
whiteSpace
* 
maxInclusive
* 
minInclusive
* 
maxExclusive
* 
minExclusive
* 
totalDigits
* 
fractionDigits
* 
valuethe facet value.StatusRequiredDatatype[string](https://www.w3.org/TR/xmlschema-2/#string)Contained bytagdocs: [dataRef](#TEI.dataRef)May containEmpty elementNote
This element is only allowed when the parent [<dataRef>](#TEI.dataRef) refers with name to a datatype from the specification [XML Schema Part 2: Datatypes Second Edition](#XSD2).
ExampleExampledatatype used for attributes taking an integer value between 0 and 99Content model
<content>
 <empty/>
</content>
    Schema Declaration
element dataFacet
{
   [att.global.attributes](#TEI.att.global),
   attribute name
   {
      "length"
    | "minLength"
    | "maxLength"
    | "pattern"
    | "enumeration"
    | "whiteSpace"
    | "maxInclusive"
    | "minInclusive"
    | "maxExclusive"
    | "minExclusive"
    | "totalDigits"
    | "fractionDigits"
   },
   attribute value { text },
   empty
}
## <dataRef>
<dataRef>@key@name@ref@restriction<dataRef> identifies the datatype of an attribute value, either by referencing an item in an externally defined datatype library, or by pointing to a TEI-defined data specification [[23.5.3.1. Datatypes](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD-datatypes)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


keythe identifier used for this datatype specificationStatusOptionalDatatype[teidata.xmlName](#TEI.teidata.xmlName)namethe name of a datatype in the list provided by [XML Schema Part 2: Datatypes Second Edition](#XSD2)StatusOptionalDatatype[teidata.xmlName](#TEI.teidata.xmlName)refa pointer to a datatype defined in some datatype libraryStatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)restrictionsupplies a string representing a regular expression providing additional constraints on the strings used to represent values of this datatypeStatusOptionalDatatype[teidata.pattern](#TEI.teidata.pattern)Member of[model.contentPart](#TEI.model.contentPart) [model.oddRef](#TEI.model.oddRef)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [datatype](#TEI.datatype) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [specGrp](#TEI.specGrp)May containtagdocs: [dataFacet](#TEI.dataFacet)Note
Only one of the attributes key, name, and ref may be used on any given instance of [<dataRef>](#TEI.dataRef).

Neither a restriction attribute nor a [<dataFacet>](#TEI.dataFacet) child element may be used unless the [<dataRef>](#TEI.dataRef) refers to a datatype from the specification [XML Schema Part 2: Datatypes Second Edition](#XSD2) with a name attribute.
ExampleExampleExampledatatype used for attributes taking an integer value between 0 and 99Schematron
<sch:rule context="tei:dataRef[tei:dataFacet]">
<sch:assert test="@name" role="nonfatal">Data facets can only be specified for references to datatypes specified by
 XML Schema Part 2: Datatypes Second Edition — that is, for there to be a 'dataFacet' child there must be a @name attribute.</sch:assert>
<sch:report test="@restriction"
 role="nonfatal">Data facets and restrictions cannot both be expressed on the same data reference — that is, the @restriction attribute cannot be used when a 'dataFacet' element is present.</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:dataRef[@restriction]">
<sch:assert test="@name" role="nonfatal">Restrictions can only be specified for references to datatypes specified by
 XML Schema Part 2: Datatypes Second Edition — that is, for there to be a @restriction attribute there must be a @name attribute, too.</sch:assert>
</sch:rule>Content model
<content>
 <elementRef minOccurs="0"
  maxOccurs="unbounded" key="dataFacet"/>
</content>
    Schema Declaration
element dataRef
{
   [att.global.attributes](#TEI.att.global),
   (
      attribute key { text }?
    | attribute name { text }?
    | attribute ref { text }?
   ),
   attribute restriction { text }?,
   [dataFacet](#TEI.dataFacet)*
}
## <dataSpec>
<dataSpec><dataSpec> (datatype specification) documents a datatype. [[23.3. Specification Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDcrystals) [23.7. Macro Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDENT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil



Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [exemplum](#TEI.exemplum) [listRef](#TEI.listRef) [remarks](#TEI.remarks) [valList](#TEI.valList)Exampledefines the range of attribute values used to provide a single URI, absolute or relative, pointing to some other resource, either within the current document or elsewhere.Schematron
<sch:rule role="warn"
 context="tei:dataSpec/tei:content">
<sch:report test=".//tei:anyElement | .//tei:classRef | .//tei:elementRef"> A datatype specification should not refer to an element or a class.
</sch:report>
</sch:rule>Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identSynonyms"/>
   <classRef key="model.descLike"/>
  </alternate>
  <alternate minOccurs="0" maxOccurs="1">
   <elementRef key="content"/>
   <elementRef key="valList"/>
  </alternate>
  <elementRef key="constraintSpec"
   minOccurs="0" maxOccurs="unbounded"/>
  <elementRef key="exemplum" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="remarks" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="listRef" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element dataSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   (
      ( [model.identSynonyms](#TEI.model.identSynonyms) | [model.descLike](#TEI.model.descLike) )*,
      ( [content](#TEI.content) | [valList](#TEI.valList) )?,
      [constraintSpec](#TEI.constraintSpec)*,
      [exemplum](#TEI.exemplum)*,
      [remarks](#TEI.remarks)*,
      [listRef](#TEI.listRef)*
   )
}
## <datatype>
<datatype>@minOccurs@maxOccurs<datatype> (datatype) specifies the declared value for an attribute, by referring to any datatype defined by the chosen schema language. [[1.4.2. Datatype Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#DTYPES) [23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


minOccurs(minimum number of occurences) indicates the minimum number of times this datatype may occur in an instance of the attribute being defined.Derived from[att.repeatable](#TEI.att.repeatable)StatusOptionalDatatype[teidata.count](#TEI.teidata.count)Default1maxOccurs(maximum number of occurences) indicates the maximum number of times this datatype may occur in an instance of the attribute being defined.Derived from[att.repeatable](#TEI.att.repeatable)StatusOptionalDatatype[teidata.unboundedCount](#TEI.teidata.unboundedCount)Default1Contained bytagdocs: [attDef](#TEI.attDef)May containANYNote
In the TEI scheme, most datatypes are expressed using pre-defined TEI macros, which map a name in the form teidata.xxxx to a datatype defined by RELAX NG or the W3C Schema Language.
ExampleExampleExampleThe encoding in the following example requires that the attribute being defined contain at least two URIs in its value, as is the case for the target attribute of join.Content model
<content>
 <alternate>
  <elementRef key="dataRef"/>
  <anyElement require="http://relaxng.org/ns/structure/1.0"/>
 </alternate>
</content>
    Schema Declaration
element datatype
{
   [att.global.attributes](#TEI.att.global),
   attribute minOccurs { text }?,
   attribute maxOccurs { text }?,
   ( [dataRef](#TEI.dataRef) | [anyElement_datatype_5](#TEI.anyElement_datatype_5) )
}
## <defaultVal>
<defaultVal><defaultVal> (default value) specifies the default declared value for an attribute. [[23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil


Contained bytagdocs: [attDef](#TEI.attDef)May containCharacter data onlyNote
any legal declared value or TEI-defined keyword
Example#IMPLIEDContent model
<content>
 <textNode/>
</content>
    Schema Declaration
element defaultVal { [att.global.attributes](#TEI.att.global), [att.combinable.attributes](#TEI.att.combinable), text }
## <desc>
<desc>@type<desc> (description) contains a short description of the purpose, function, or use of its parent element, or when the parent is a documentation element, describes or defines the object being documented.  [[23.4.1. Description of Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDcrystalsCEdc)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.translatable](#TEI.att.translatable)
* @versionDate

typecharacterizes the element in some sense, using any convenient classification scheme or typology.Derived from[att.typed](#TEI.att.typed)StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Suggested values include:deprecationInfo
* (deprecation information) This element describes why or how its parent element is being deprecated, typically including recommendations for alternate encoding.
Several standards bodies, including NIST in the USA, strongly recommend against ending the representation of a number with a decimal point. So instead of 3. use either 3 or 3.0.Member of[model.descLike](#TEI.model.descLike) [model.labelLike](#TEI.model.labelLike)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [graphic](#TEI.graphic) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [list](#TEI.list) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec) [valItem](#TEI.valItem)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [tag](#TEI.tag) [val](#TEI.val)character dataNote
When used in a specification element such as [<elementSpec>](#TEI.elementSpec), TEI convention requires that this be expressed as a finite clause, begining with an active verb.
ExampleExample of a [<desc>](#TEI.desc) element inside a documentation element.defines the data type used to express a point in cartesian space.ExampleExample of a [<desc>](#TEI.desc) element in a non-documentation element.Kerguelen Islandsantarctic tundraSchematronA [<desc>](#TEI.desc) with a type of deprecationInfo should only occur when its parent element is being deprecated. Furthermore, it should always occur in an element that is being deprecated when [<desc>](#TEI.desc) is a valid child of that element.
<sch:rule context="tei:desc[ @type eq 'deprecationInfo']">
<sch:assert test="../@validUntil">Information about a
 deprecation should only be present in a specification element
 that is being deprecated: that is, only an element that has a
 @validUntil attribute should have a child <desc
 type="deprecationInfo">.</sch:assert>
</sch:rule>Content model
<content>
 <macroRef key="macro.limitedContent"/>
</content>
    Schema Declaration
element desc
{
   [att.global.attributes](#TEI.att.global),
   [att.translatable.attributes](#TEI.att.translatable),
   attribute type { "deprecationInfo" }?,
   [macro.limitedContent](#TEI.macro.limitedContent)
}
## <distributor>
<distributor><distributor> (distributor) supplies the name of a person or other agency responsible for the distribution of a text. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.canonical](#TEI.att.canonical)
* @key

* @ref

Member of[model.publicationStmtPart.agency](#TEI.model.publicationStmtPart.agency)Contained byheader: [publicationStmt](#TEI.publicationStmt)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleOxford Text ArchiveRedwood and Burn LtdContent model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element distributor
{
   [att.global.attributes](#TEI.att.global),
   [att.canonical.attributes](#TEI.att.canonical),
   [macro.phraseSeq](#TEI.macro.phraseSeq)
}
## <div>
<div><div> (text division) contains a subdivision of the front, body, or back of a text. [[4.1. Divisions of the Body](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSDIV)]ModuletextstructureAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.divLike](#TEI.model.divLike)Contained bytextstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)May containcore: [desc](#TEI.desc) [divGen](#TEI.divGen) [head](#TEI.head) [label](#TEI.label) [list](#TEI.list) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote)derived-module-tei_xinclude: [include](#TEI.include)figures: [figure](#TEI.figure) [table](#TEI.table)tagdocs: [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)textstructure: [div](#TEI.div)ExampleFallacies of AuthorityThe subject of which is Authority in various shapes, and the object, to repress all exercise of the reasoning faculty.The Nature of AuthorityWith reference to any proposed measures having for their object the greatest happiness of the greatest number [...]Analysis of AuthorityWhat on any given occasion is the legitimate weight or influence to be attached to authority [...] Appeal to Authority, in What Cases Fallacious.Reference to authority is open to the charge of fallacy when [...] Schematron
<sch:rule context="tei:l//tei:div">
<sch:assert test="ancestor::tei:floatingText"> Abstract model violation: Metrical lines may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
</sch:assert>
</sch:rule>Schematron
<sch:rule context="tei:div">
<sch:report test="(ancestor::tei:p or ancestor::tei:ab) and not(ancestor::tei:floatingText)"> Abstract model violation: p and ab may not contain higher-level structural elements such as div, unless div is a descendant of floatingText.
</sch:report>
</sch:rule>Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.divTop"/>
   <classRef key="model.global"/>
  </alternate>
  <sequence minOccurs="0">
   <alternate>
    <sequence minOccurs="1"
     maxOccurs="unbounded">
     <alternate>
      <classRef key="model.divLike"/>
      <classRef key="model.divGenLike"/>
     </alternate>
     <classRef key="model.global"
      minOccurs="0" maxOccurs="unbounded"/>
    </sequence>
    <sequence>
     <sequence minOccurs="1"
      maxOccurs="unbounded">
      <alternate minOccurs="1"
       maxOccurs="1">
       <elementRef key="schemaSpec"/>
       <classRef key="model.common"/>
      </alternate>
      <classRef key="model.global"
       minOccurs="0" maxOccurs="unbounded"/>
     </sequence>
     <sequence minOccurs="0"
      maxOccurs="unbounded">
      <alternate>
       <classRef key="model.divLike"/>
       <classRef key="model.divGenLike"/>
      </alternate>
      <classRef key="model.global"
       minOccurs="0" maxOccurs="unbounded"/>
     </sequence>
    </sequence>
   </alternate>
   <sequence minOccurs="0"
    maxOccurs="unbounded">
    <classRef key="model.divBottom"/>
    <classRef key="model.global"
     minOccurs="0" maxOccurs="unbounded"/>
   </sequence>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element div
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   (
      ( [model.divTop](#TEI.model.divTop) | [model.global](#TEI.model.global) )*,
      (
         (
            (
               ( ( ( [model.divLike](#TEI.model.divLike) | [model.divGenLike](#TEI.model.divGenLike) ), [model.global](#TEI.model.global)* )+ )
             | (
                  ( ( ( [schemaSpec](#TEI.schemaSpec) | [model.common](#TEI.model.common) ), [model.global](#TEI.model.global)* )+ ),
                  ( ( ( [model.divLike](#TEI.model.divLike) | [model.divGenLike](#TEI.model.divGenLike) ), [model.global](#TEI.model.global)* )* )
               )
            ),
            ( ( [model.divBottom](#TEI.model.divBottom), [model.global](#TEI.model.global)* )* )
         )?
      )
   )
}
## <divGen>
<divGen>@type<divGen> (automatically generated text division) indicates the location at which a textual division generated automatically by a text-processing application is to appear. [[3.9.2. Index Entries](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONOIX)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


typespecifies what type of generated text division (e.g. index, table of contents, etc.) is to appear.Derived from[att.typed](#TEI.att.typed)StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Sample values include:index
* an index is to be generated and inserted at this point.
toc
* a table of contents
figlist
* a list of figures
tablist
* a list of tables
Note
Valid values are application-dependent; those shown are of obvious utility in document production, but are by no means exhaustive.
Member of[model.divGenLike](#TEI.model.divGenLike) [model.frontPart](#TEI.model.frontPart)Contained bytextstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)May containcore: [head](#TEI.head)Note
This element is intended primarily for use in document production or manipulation, rather than in the transcription of pre-existing materials; it makes it easier to specify the location of indices, tables of contents, etc., to be generated by text preparation or word processing software. 
ExampleOne use for this element is to allow document preparation software to generate an index and insert it in the appropriate place in the output. The example below assumes that the indexName attribute on index elements in the text has been used to specify index entries for the two generated indexes, named NAMES and THINGS:BibliographyIndicesExampleAnother use for [<divGen>](#TEI.divGen) is to specify the location of an automatically produced table of contents:Preface... Content model
<content>
 <classRef key="model.headLike"
  minOccurs="0" maxOccurs="unbounded"/>
</content>
    Schema Declaration
element divGen
{
   [att.global.attributes](#TEI.att.global),
   attribute type { text }?,
   [model.headLike](#TEI.model.headLike)*
}
## <edition>
<edition><edition> (edition) describes the particularities of one edition of a text. [[2.2.2. The Edition Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD22)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [editionStmt](#TEI.editionStmt)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleFirst edition Oct 1990Students' editionContent model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element edition { [att.global.attributes](#TEI.att.global), [macro.phraseSeq](#TEI.macro.phraseSeq) }
## <editionStmt>
<editionStmt><editionStmt> (edition statement) groups information relating to one edition of a text. [[2.2.2. The Edition Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD22) [2.2. The File Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD2)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [fileDesc](#TEI.fileDesc)May containcore: [p](#TEI.p) [respStmt](#TEI.respStmt)header: [edition](#TEI.edition)ExampleStudents' editionAdapted by Elizabeth KirkExampleFirst edition, Michaelmas Term, 1991.Content model
<content>
 <alternate>
  <classRef key="model.pLike" minOccurs="1"
   maxOccurs="unbounded"/>
  <sequence>
   <elementRef key="edition"/>
   <classRef key="model.respLike"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
 </alternate>
</content>
    Schema Declaration
element editionStmt
{
   [att.global.attributes](#TEI.att.global),
   ( [model.pLike](#TEI.model.pLike)+ | ( [edition](#TEI.edition), [model.respLike](#TEI.model.respLike)* ) )
}
## <eg>
<eg><eg> (example) contains any kind of illustrative example. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG) [23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.egLike](#TEI.model.egLike)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [exemplum](#TEI.exemplum)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
If the example contains material in XML markup, either it must be enclosed within a CDATA marked section, or character entity references must be used to represent the markup delimiters. If the example contains well-formed XML, it should be marked using the more specific [<egXML>](#TEI.teix_egXML) element.
ExampleThe term element is declared using the following syntax: <![CDATA[<!ELEMENT term (%phrase.content;)>]]Content model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element eg { [att.global.attributes](#TEI.att.global), [macro.phraseSeq](#TEI.macro.phraseSeq) }
## <egXML>
<egXML>@valid<egXML> (example of XML) a single XML fragment demonstrating the use of some XML, such as elements, attributes, or processing instructions, etc., in which the [<egXML>](#TEI.teix_egXML) element functions as the root element. [[23.1.1. Phrase Level Terms](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDphraseTE)]Namespacehttp://www.tei-c.org/ns/ExamplesModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


validindicates the intended validity of the example with respect to a schema.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:true
* the example is intended to be fully valid, assuming that its root element, or a provided root element, could have been used as a possible root element in the schema concerned.[Default] 
feasible
* the example could be transformed into a valid document by inserting any number of valid attributes and child elements anywhere within it; or it is valid against a version of the schema concerned in which the provision of character data, list, element, or attribute values has been made optional.
false
* the example is not intended to be valid, and contains deliberate errors.
Member of[model.egLike](#TEI.model.egLike)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [exemplum](#TEI.exemplum)textstructure: [body](#TEI.body) [div](#TEI.div)May containANYNote
In the source of the TEI Guidelines, this element declares itself and its content as belonging to the namespace http://www.tei-c.org/ns/Examples. This enables the content of the element to be validated independently against the TEI scheme. Where this element is used outside this context, a different namespace or none at all may be preferable. The content must however be a well-formed XML fragment or document: where this is not the case, the more general [<eg>](#TEI.eg) element should be used in preference.
ExampleA slide about egXMLegXML can be used to give XML examples in the TEI Examples namespaceAttributes values for valid: true: intended to be fully validfeasible: valid if missing nodes providedfalse: not intended to be validThe rend attribute can be used for recording how parts of the example were rendered.ExampleExample<egXML xmlns="http://www.tei-c.org/ns/Examples" valid="false"> <para xml:lang="en">Doubloons are a pirate's best friend</para> </egXML> Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <anyElement/>
 </alternate>
</content>
    Schema Declaration
element egXML
{
   [att.global.attributes](#TEI.att.global),
   attribute valid { "true" | "feasible" | "false" }?,
   ( text | [anyElement_egXML_1](#TEI.anyElement_egXML_1) )*
}
## <elementRef>
<elementRef>@key<elementRef> points to the specification for some element which is to be included in a schema. [[23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.repeatable](#TEI.att.repeatable)
* @minOccurs

* @maxOccurs

keythe identifier used for the required element within the source indicated.StatusRequiredDatatype[teidata.xmlName](#TEI.teidata.xmlName)Member of[model.contentPart](#TEI.model.contentPart) [model.oddRef](#TEI.model.oddRef)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [specGrp](#TEI.specGrp)May containEmpty elementNote
Elements are identified by the name supplied as value for the ident attribute on the [<elementSpec>](#TEI.elementSpec) element in which they are declared. TEI element names are unique.
ExampleInclude in the schema an element named [<p>](#TEI.p) available from the current default source.ExampleInclude in the schema an element named [<p>](#TEI.p) available from the TEI P5 1.2.1 release.Schematron
<sch:pattern>
<sch:rule context="tei:elementRef[ parent::tei:schemaSpec | parent::tei:specGrp ]">
 <sch:report test="@minOccurs | @maxOccurs"
  role="error">An element reference is not repeatable when part of a schema specification (and thus this <elementRef> should not have @minOccurs or @maxOccurs).</sch:report>
</sch:rule>
<sch:rule context="tei:content//tei:elementRef">
 <sch:report test="@source" role="error">An element reference within a content model must refer to a locally defined element specification (and thus this <elementRef> should not have @source).</sch:report>
</sch:rule>
</sch:pattern>Content model
<content>
 <empty/>
</content>
    Schema Declaration
element elementRef
{
   [att.global.attributes](#TEI.att.global),
   [att.repeatable.attributes](#TEI.att.repeatable),
   attribute key { text },
   empty
}
## <elementSpec>
<elementSpec>@prefix<elementSpec> (element specification) documents the structure, content, and purpose of a single element type. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG) [23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil




* [att.namespaceable](#TEI.att.namespaceable)
* @ns

prefixspecifies a default prefix which will be prepended to all patterns relating to the element, unless otherwise stated.StatusOptionalDatatype0–1 occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespaceMember of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [attList](#TEI.attList) [classes](#TEI.classes) [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [exemplum](#TEI.exemplum) [listRef](#TEI.listRef) [remarks](#TEI.remarks) [valList](#TEI.valList)Examplecontains literal codethe language of the codeSchematron
<sch:rule context="tei:elementSpec[ @mode eq 'delete' ]">
<sch:report test="child::*">This elementSpec element has a mode= of "delete" even though it has child elements. Change the mode= to "add", "change", or "replace", or remove the child elements.</sch:report>
</sch:rule>
<sch:rule context="tei:elementSpec[ @mode = ('add','change','replace') ]">
<sch:assert test="child::* | (@* except (@mode, @ident))">This elementSpec element has a mode= of "<sch:value-of select="@mode"/>", but does not have any child elements or schema-changing attributes. Specify child elements, use validUntil=, predeclare=, ns=, or prefix=, or change the mode= to "delete".</sch:assert>
</sch:rule>Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identSynonyms"/>
   <classRef key="model.descLike"/>
  </alternate>
  <elementRef key="classes" minOccurs="0"/>
  <elementRef key="content" minOccurs="0"/>
  <elementRef key="valList" minOccurs="0"/>
  <elementRef key="constraintSpec"
   minOccurs="0" maxOccurs="unbounded"/>
  <elementRef key="attList" minOccurs="0"/>
  <alternate maxOccurs="unbounded"
   minOccurs="0">
   <elementRef key="model"/>
   <elementRef key="modelGrp"/>
   <elementRef key="modelSequence"/>
  </alternate>
  <elementRef key="exemplum" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="remarks" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="listRef" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element elementSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   [att.namespaceable.attributes](#TEI.att.namespaceable),
   attribute prefix { ? }?,
   (
      ( [model.identSynonyms](#TEI.model.identSynonyms) | [model.descLike](#TEI.model.descLike) )*,
      [classes](#TEI.classes)?,
      [content](#TEI.content)?,
      [valList](#TEI.valList)?,
      [constraintSpec](#TEI.constraintSpec)*,
      [attList](#TEI.attList)?,
      ( [model](#TEI.model) | [modelGrp](#TEI.modelGrp) | [modelSequence](#TEI.modelSequence) )*,
      [exemplum](#TEI.exemplum)*,
      [remarks](#TEI.remarks)*,
      [listRef](#TEI.listRef)*
   )
}
## <emph>
<emph><emph> (emphasized) marks words or phrases which are stressed or emphasized for linguistic or rhetorical effect. [[3.3.2.2. Emphatic Words and Phrases](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQHE) [3.3.2. Emphasis, Foreign Words, and Unusual Language](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQH)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.emphLike](#TEI.model.emphLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleYou took the car and did what?!!ExampleWhat it all comes to is this, he said. What does Christopher Robin do in the morning nowadays?Content model
<content>
 <macroRef key="macro.paraContent"/>
</content>
    Schema Declaration
element emph { [att.global.attributes](#TEI.att.global), [macro.paraContent](#TEI.macro.paraContent) }
## <empty>
<empty><empty> indicates the presence of an empty node within a content model. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.contentPart](#TEI.model.contentPart)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [sequence](#TEI.sequence)May containEmpty elementExampleContent model
<content>
 <empty/>
</content>
    Schema Declaration
element empty { [att.global.attributes](#TEI.att.global), empty }
## <exemplum>
<exemplum><exemplum> (exemplum) groups an example demonstrating the use of an element along with optional paragraphs of commentary. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.translatable](#TEI.att.translatable)
* @versionDate


* [att.typed](#TEI.att.typed)
* @type

Contained bytagdocs: [attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec)May containcore: [p](#TEI.p)tagdocs: [eg](#TEI.eg) [egXML](#TEI.egXML)ExampleThe name element can be used for both personal names and place names:<![CDATA[ <q>My dear <name type="person">Mr.
          Bennet</name>,</q> said his lady to him one day,
          <q>have you heard that <name type="place">Netherfield
          Park</name> is let at last?</q>]]>As shown above, the type attribute may be used to distinguish the one from the other.Content model
<content>
 <sequence>
  <classRef key="model.pLike" minOccurs="0"
   maxOccurs="unbounded"/>
  <alternate>
   <elementRef key="egXML"/>
   <elementRef key="eg"/>
  </alternate>
  <classRef key="model.pLike" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element exemplum
{
   [att.global.attributes](#TEI.att.global),
   [att.translatable.attributes](#TEI.att.translatable),
   [att.typed.attributes](#TEI.att.typed),
   ( [model.pLike](#TEI.model.pLike)*, ( [egXML](#TEI.egXML) | [eg](#TEI.eg) ), [model.pLike](#TEI.model.pLike)* )
}
## <figDesc>
<figDesc><figDesc> (description of figure) contains a brief prose description of the appearance or content of a graphic figure, for use when documenting an image without displaying it. [[15.4. Specific Elements for Graphic Images](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html#FTGRA)]ModulefiguresAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byfigures: [figure](#TEI.figure)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [tag](#TEI.tag) [val](#TEI.val)character dataNote
This element is intended for use as an alternative to the content of its parent [<figure>](#TEI.figure) element ; for example, to display when the image is required but the equipment in use cannot display graphic images. It may also be used for indexing or documentary purposes.
ExampleEmblemi d'AmoreA pair of naked winged cupids, each holding a flaming torch, in a rural setting.Content model
<content>
 <macroRef key="macro.limitedContent"/>
</content>
    Schema Declaration
element figDesc { [att.global.attributes](#TEI.att.global), [macro.limitedContent](#TEI.macro.limitedContent) }
## <figure>
<figure><figure> (figure) groups elements representing or containing graphic information such as an illustration, formula, or figure. [[15.4. Specific Elements for Graphic Images](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html#FTGRA)]ModulefiguresAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.global](#TEI.model.global)Contained bycore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figure](#TEI.figure) [table](#TEI.table)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front) [text](#TEI.text)May containcore: [desc](#TEI.desc) [graphic](#TEI.graphic) [head](#TEI.head) [label](#TEI.label) [list](#TEI.list) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote)figures: [figDesc](#TEI.figDesc) [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)ExampleThe View from the BridgeA Whistleresque view showing four or five sailing boats in the foreground, and a series of buoys strung out between them.Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <classRef key="model.headLike"/>
  <classRef key="model.common"/>
  <elementRef key="figDesc"/>
  <classRef key="model.graphicLike"/>
  <classRef key="model.global"/>
  <classRef key="model.divBottom"/>
 </alternate>
</content>
    Schema Declaration
element figure
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   (
      [model.headLike](#TEI.model.headLike)
    | [model.common](#TEI.model.common)
    | [figDesc](#TEI.figDesc)
    | [model.graphicLike](#TEI.model.graphicLike)
    | [model.global](#TEI.model.global)
    | [model.divBottom](#TEI.model.divBottom)
   )*
}
## <fileDesc>
<fileDesc><fileDesc> (file description) contains a full bibliographic description of an electronic file. [[2.2. The File Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD2) [2.1.1. The TEI Header and Its Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD11)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [teiHeader](#TEI.teiHeader)May containheader: [editionStmt](#TEI.editionStmt) [publicationStmt](#TEI.publicationStmt) [sourceDesc](#TEI.sourceDesc) [titleStmt](#TEI.titleStmt)Note
The major source of information for those seeking to create a catalogue entry or bibliographic citation for an electronic file. As such, it provides a title and statements of responsibility together with details of the publication or distribution of the file, of any series to which it belongs, and detailed bibliographic notes for matters not addressed elsewhere in the header. It also contains a full bibliographic description for the source or sources from which the electronic text was derived.
ExampleThe shortest possible TEI documentDistributed as part of TEI P5No print source exists: this is an original digital textContent model
<content>
 <sequence>
  <sequence>
   <elementRef key="titleStmt"/>
   <elementRef key="editionStmt"
    minOccurs="0"/>
   <elementRef key="extent" minOccurs="0"/>
   <elementRef key="publicationStmt"/>
   <elementRef key="seriesStmt"
    minOccurs="0" maxOccurs="unbounded"/>
   <elementRef key="notesStmt"
    minOccurs="0"/>
  </sequence>
  <elementRef key="sourceDesc"
   minOccurs="1" maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element fileDesc
{
   [att.global.attributes](#TEI.att.global),
   (
      (
         [titleStmt](#TEI.titleStmt),
         [editionStmt](#TEI.editionStmt)?,
         [extent](#TEI.extent)?,
         [publicationStmt](#TEI.publicationStmt),
         [seriesStmt](#TEI.seriesStmt)*,
         [notesStmt](#TEI.notesStmt)?
      ),
      [sourceDesc](#TEI.sourceDesc)+
   )
}
## <foreign>
<foreign><foreign> (foreign) identifies a word or phrase as belonging to some language other than that of the surrounding text. [[3.3.2.1. Foreign Words or Expressions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQHF)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.emphLike](#TEI.model.emphLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The global xml:lang attribute should be supplied for this element to identify the language of the word or phrase marked. As elsewhere, its value should be a language tag as defined in [6.1. Language Identification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CH.html#CHSH).

This element is intended for use only where no other element is available to mark the phrase or words concerned. The global xml:lang attribute should be used in preference to this element where it is intended to mark the language of the whole of some text element.

The distinct element may be used to identify phrases belonging to sublanguages or registers not generally regarded as true languages.
ExampleThis is heathen Greek to you still? Your lapis philosophicus?Content model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element foreign { [att.global.attributes](#TEI.att.global), [macro.phraseSeq](#TEI.macro.phraseSeq) }
## <formula>
<formula><formula> (formula) contains a mathematical or other formula. [[15.2. Formulæ and Mathematical Expressions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html#FTFOR)]ModulefiguresAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.graphicLike](#TEI.model.graphicLike)Contained bycore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg)May containcore: [graphic](#TEI.graphic) [hi](#TEI.hi) [q](#TEI.q)figures: [formula](#TEI.formula)character dataExample$E=mc^2$ExampleE=mc2ExampleE=mc2Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.graphicLike"/>
  <classRef key="model.hiLike"/>
 </alternate>
</content>
    Schema Declaration
element formula
{
   [att.global.attributes](#TEI.att.global),
   ( text | [model.graphicLike](#TEI.model.graphicLike) | [model.hiLike](#TEI.model.hiLike) )*
}
## <front>
<front><front> (front matter) contains any prefatory matter (headers, abstracts, title page, prefaces, dedications, etc.) found at the start of a document, before the main body. [[4.6. Title Pages](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSTITL) [4. Default Text Structure](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DS)]ModuletextstructureAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained bytextstructure: [text](#TEI.text)May containcore: [divGen](#TEI.divGen) [head](#TEI.head) [note](#TEI.note) [p](#TEI.p)derived-module-tei_xinclude: [include](#TEI.include)figures: [figure](#TEI.figure)tagdocs: [schemaSpec](#TEI.schemaSpec)textstructure: [div](#TEI.div)Note
Because cultural conventions differ as to which elements are grouped as front matter and which as back matter, the content models for the [<front>](#TEI.front) and [<back>](#TEI.back) elements are identical.
ExampleNam Sibyllam quidem Cumis ego ipse oculis meis vidi in ampulla pendere, et cum illi pueri dicerent: Σίβυλλα τί θέλεις; respondebat illa: ὰποθανεῖν θέλω.For Ezra Pound il miglior fabbro.ExampleTo our three selvesAuthor's NoteAll the characters in this book are purely imaginary, and if the author has used names that may suggest a reference to living persons she has done so inadvertently. ...ExampleBACKGROUND:Food insecurity can put children at greater risk of obesity because of altered food choices and nonuniform consumption patterns.OBJECTIVE:We examined the association between obesity and both child-level food insecurity and personal food insecurity in US children.DESIGN:Data from 9,701 participants in the National Health and Nutrition Examination Survey, 2001-2010, aged 2 to 11 years were analyzed. Child-level food insecurity was assessed with the US Department of Agriculture's Food Security Survey Module based on eight child-specific questions. Personal food insecurity was assessed with five additional questions. Obesity was defined, using physical measurements, as body mass index (calculated as kg/m2) greater than or equal to the age- and sex-specific 95th percentile of the Centers for Disease Control and Prevention growth charts. Logistic regressions adjusted for sex, race/ethnic group, poverty level, and survey year were conducted to describe associations between obesity and food insecurity.RESULTS:Obesity was significantly associated with personal food insecurity for children aged 6 to 11 years (odds ratio=1.81; 95% CI 1.33 to 2.48), but not in children aged 2 to 5 years (odds ratio=0.88; 95% CI 0.51 to 1.51). Child-level food insecurity was not associated with obesity among 2- to 5-year-olds or 6- to 11-year-olds.CONCLUSIONS:Personal food insecurity is associated with an increased risk of obesity only in children aged 6 to 11 years. Personal food-insecurity measures may give different results than aggregate food-insecurity measures in children.Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.frontPart"/>
   <classRef key="model.pLike"/>
   <classRef key="model.pLike.front"/>
   <classRef key="model.global"/>
  </alternate>
  <sequence minOccurs="0">
   <alternate>
    <sequence>
     <classRef key="model.div1Like"/>
     <alternate minOccurs="0"
      maxOccurs="unbounded">
      <classRef key="model.div1Like"/>
      <classRef key="model.frontPart"/>
      <classRef key="model.global"/>
     </alternate>
    </sequence>
    <sequence>
     <classRef key="model.divLike"/>
     <alternate minOccurs="0"
      maxOccurs="unbounded">
      <classRef key="model.divLike"/>
      <classRef key="model.frontPart"/>
      <classRef key="model.global"/>
     </alternate>
    </sequence>
   </alternate>
   <sequence minOccurs="0">
    <classRef key="model.divBottom"/>
    <alternate minOccurs="0"
     maxOccurs="unbounded">
     <classRef key="model.divBottom"/>
     <classRef key="model.global"/>
    </alternate>
   </sequence>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element front
{
   [att.global.attributes](#TEI.att.global),
   (
      ( [model.frontPart](#TEI.model.frontPart) | [model.pLike](#TEI.model.pLike) | [model.pLike.front](#TEI.model.pLike.front) | [model.global](#TEI.model.global) )*,
      (
         (
            (
               (
                  [model.div1Like](#TEI.model.div1Like),
                  ( [model.div1Like](#TEI.model.div1Like) | [model.frontPart](#TEI.model.frontPart) | [model.global](#TEI.model.global) )*
               )
             | (
                  [model.divLike](#TEI.model.divLike),
                  ( [model.divLike](#TEI.model.divLike) | [model.frontPart](#TEI.model.frontPart) | [model.global](#TEI.model.global) )*
               )
            ),
            ( ( [model.divBottom](#TEI.model.divBottom), ( [model.divBottom](#TEI.model.divBottom) | [model.global](#TEI.model.global) )* )? )
         )?
      )
   )
}
## <gi>
<gi>@scheme<gi> (element name) contains the name (generic identifier) of an element. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD) [23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


schemesupplies the name of the scheme in which this name is defined.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Sample values include:TEI
* this element is part of the TEI scheme.[Default] 
DBK
* (docbook) this element is part of the Docbook scheme.
XX
* (unknown) this element is part of an unknown scheme.
Schematron
* this element is from Schematron.
HTML
* this element is from the HTML scheme.
Member of[model.phrase.xml](#TEI.model.phrase.xml)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containXSD NameExampleThe xhtml:li element is roughly analogous to the item element, as is the listItem element.This example shows the use of both a namespace prefix and the scheme attribute as alternative ways of indicating that the [<gi>](#TEI.gi) in question is not a TEI element name: in practice only one method should be adopted.Content model
<content>
 <dataRef key="teidata.name"/>
</content>
    Schema Declaration
element gi { [att.global.attributes](#TEI.att.global), attribute scheme { text }?, [teidata.name](#TEI.teidata.name) }
## <gloss>
<gloss><gloss> (gloss) identifies a phrase or word used to provide a gloss or definition for some other word or phrase. [[3.4.1. Terms and Glosses](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHTG) [23.4.1. Description of Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDcrystalsCEdc)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.pointing](#TEI.att.pointing)
* @targetLang

* @target

* @evaluate


* [att.translatable](#TEI.att.translatable)
* @versionDate


* [att.typed](#TEI.att.typed)
* @type

Member of[model.emphLike](#TEI.model.emphLike) [model.identEquiv](#TEI.model.identEquiv)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The target and cRef attributes are mutually exclusive.
ExampleWe may define discoursal point of view as the relationship, expressed through discourse structure, between the implied author or some other addresser, and the fiction.Content model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element gloss
{
   [att.global.attributes](#TEI.att.global),
   [att.pointing.attributes](#TEI.att.pointing),
   [att.translatable.attributes](#TEI.att.translatable),
   [att.typed.attributes](#TEI.att.typed),
   [macro.phraseSeq](#TEI.macro.phraseSeq)
}
## <graphic>
<graphic><graphic> (graphic) indicates the location of a graphic or illustration, either forming part of a text, or providing an image of it. [[3.10. Graphics and Other Non-textual Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COGR) [12.1. Digital Facsimiles](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html#PHFAX)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.resourced](#TEI.att.resourced)
* @url


* [att.typed](#TEI.att.typed)
* @type

Member of[model.graphicLike](#TEI.model.graphicLike)Contained bycore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg)May containcore: [desc](#TEI.desc)Note
The mimeType attribute should be used to supply the MIME media type of the image specified by the url attribute.

Within the body of a text, a [<graphic>](#TEI.graphic) element indicates the presence of a graphic component in the source itself. Within the context of a facsimile or sourceDoc element, however, a [<graphic>](#TEI.graphic) element provides an additional digital representation of some part of the source being encoded.
ExampleFigure One: The View from the BridgeA Whistleresque view showing four or five sailing boats in the foreground, and a series of buoys strung out between them.ExampleExampleContent model
<content>
 <classRef key="model.descLike"
  minOccurs="0" maxOccurs="unbounded"/>
</content>
    Schema Declaration
element graphic
{
   [att.global.attributes](#TEI.att.global),
   [att.resourced.attributes](#TEI.att.resourced),
   [att.typed.attributes](#TEI.att.typed),
   [model.descLike](#TEI.model.descLike)*
}
## <head>
<head><head> (heading) contains any type of heading, for example the title of a section, or the heading of a list, glossary, manuscript description, etc. [[4.2.1. Headings and Trailers](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSHD)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.headLike](#TEI.model.headLike) [model.pLike.front](#TEI.model.pLike.front)Contained bycore: [divGen](#TEI.divGen) [list](#TEI.list)figures: [figure](#TEI.figure) [table](#TEI.table)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The [<head>](#TEI.head) element is used for headings at all levels; software which treats (e.g.) chapter headings, section headings, and list titles differently must determine the proper processing of a [<head>](#TEI.head) element based on its structural position. A [<head>](#TEI.head) occurring as the first element of a list is the title of that list; one occurring as the first element of a div1 is the title of that chapter or section.
ExampleThe most common use for the [<head>](#TEI.head) element is to mark the headings of sections. In older writings, the headings or incipits may be rather longer than usual in modern works. If a section has an explicit ending as well as a heading, it should be marked as a trailer, as in this example:In the name of Christ here begins the first book of the ecclesiastical history of Georgius Florentinus, known as Gregory, Bishop of Tours.In the name of Christ here begins Book I of the history.Proposing as I do ...From the Passion of our Lord until the death of Saint Martin four hundred and twelve years passed.Here ends the first Book, which covers five thousand, five hundred and ninety-six years from the beginning of the world down to the death of Saint Martin.ExampleWhen headings are not inline with the running text (see e.g. [the heading "Secunda conclusio"](http://diglib.hab.de/show_image.php?dir=drucke/ed000364&pointer=34)) they might however be encoded as if. The actual placement in the source document can be captured with the place attribute.Secunda conclusioPotencia: habitus: et actus: recipiunt speciem ab obiectis.Probatur sic. Omne importans necessariam habitudinem ad proprium [...]ExampleThe [<head>](#TEI.head) element is also used to mark headings of other units, such as lists:With a few exceptions, connectives are equally useful in all kinds of discourse: description, narration, exposition, argument. Connectivesaboveaccordinglyacross fromadjacent toagainContent model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <elementRef key="lg"/>
  <classRef key="model.gLike"/>
  <classRef key="model.phrase"/>
  <classRef key="model.inter"/>
  <classRef key="model.lLike"/>
  <classRef key="model.global"/>
 </alternate>
</content>
    Schema Declaration
element head
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   (
      text
    | [lg](#TEI.lg)
    | [model.gLike](#TEI.model.gLike)
    | [model.phrase](#TEI.model.phrase)
    | [model.inter](#TEI.model.inter)
    | [model.lLike](#TEI.model.lLike)
    | [model.global](#TEI.model.global)
   )*
}
## <hi>
<hi><hi> (highlighted) marks a word or phrase as graphically distinct from the surrounding text, for reasons concerning which no claim is made. [[3.3.2.2. Emphatic Words and Phrases](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQHE) [3.3.2. Emphasis, Foreign Words, and Unusual Language](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQH)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.hiLike](#TEI.model.hiLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [formula](#TEI.formula)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleAnd this Indenture further witnesseth that the said Walter Shandy, merchant, in consideration of the said intended marriage ...Content model
<content>
 <macroRef key="macro.paraContent"/>
</content>
    Schema Declaration
element hi { [att.global.attributes](#TEI.att.global), [macro.paraContent](#TEI.macro.paraContent) }
## <ident>
<ident><ident> (identifier) contains an identifier or name for an object of some kind in a formal language. [<ident>](#TEI.ident) is used for tokens such as variable names, class names, type names, function names etc. in formal programming languages. [[23.1.1. Phrase Level Terms](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDphraseTE)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.emphLike](#TEI.model.emphLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containCharacter data onlyNote
In running prose, this element may be used for any kind of identifier in any formal language. It should not be used for element and attribute names in XML, for which the special elements [<gi>](#TEI.gi) and [<att>](#TEI.att) are provided.
Examplehttp://www.tei-c.org/ns/ExamplesContent model
<content>
 <textNode/>
</content>
    Schema Declaration
element ident { [att.global.attributes](#TEI.att.global), [att.typed.attributes](#TEI.att.typed), text }
## <include>
<include>@href@parse@xpointer@encoding@accept@accept-charset@accept-language<include> The W3C XInclude elementNamespacehttp://www.w3.org/2001/XIncludeModulederived-module-tei_xincludeAttributeshrefpointer to the resource being includedStatusRequiredDatatype[teidata.pointer](#TEI.teidata.pointer)parseStatusOptionalLegal values are:xml
* [Default] 
text
* 
xpointerStatusOptionalDatatype[teidata.text](#TEI.teidata.text)encodingStatusOptionalDatatype[teidata.text](#TEI.teidata.text)acceptStatusOptionalDatatype[teidata.text](#TEI.teidata.text)accept-charsetStatusOptionalDatatype[teidata.text](#TEI.teidata.text)accept-languageStatusOptionalDatatype[teidata.text](#TEI.teidata.text)Member of[model.divLike](#TEI.model.divLike) [model.oddRef](#TEI.model.oddRef)Contained bytagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)May containEmpty elementContent model
<content>
 <empty/>
</content>
    Schema Declaration
element include
{
   attribute href { text },
   attribute parse { "xml" | "text" }?,
   attribute xpointer { text }?,
   attribute encoding { text }?,
   attribute accept { text }?,
   attribute accept-charset { text }?,
   attribute accept-language { text }?,
   empty
}
## <item>
<item><item> (item) contains one component of a list. [[3.8. Lists](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COLI) [2.6. The Revision Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD6)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained bycore: [list](#TEI.list)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
May contain simple prose or a sequence of chunks.

Whatever string of characters is used to label a list item in the copy text may be used as the value of the global n attribute, but it is not required that numbering be recorded explicitly. In ordered lists, the n attribute on the [<item>](#TEI.item) element is by definition synonymous with the use of the [<label>](#TEI.label) element to record the enumerator of the list item. In glossary lists, however, the term being defined should be given with the [<label>](#TEI.label) element, not n.
ExampleHere begin the chapter headings of Book IVThe death of Queen Clotild.How King Lothar wanted to appropriate one third of the Church revenues.The wives and children of Lothar.The Counts of the Bretons.Saint Gall the Bishop.The priest Cato....Content model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element item { [att.global.attributes](#TEI.att.global), [macro.specialPara](#TEI.macro.specialPara) }
## <keywords>
<keywords>@scheme<keywords> (keywords) contains a list of keywords or phrases identifying the topic or nature of a text. [[2.4.3. The Text Classification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD43)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


schemeidentifies the controlled vocabulary within which the set of keywords concerned is defined, for example by a taxonomy element, or by some other resource.StatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)Contained byheader: [textClass](#TEI.textClass)May containcore: [list](#TEI.list) [term](#TEI.term)Note
Each individual keyword (including compound subject headings) should be supplied as a [<term>](#TEI.term) element directly within the [<keywords>](#TEI.keywords) element. An alternative usage, in which each [<term>](#TEI.term) appears within an [<item>](#TEI.item) inside a [<list>](#TEI.list) is permitted for backwards compatibility, but is deprecated.

If no control list exists for the keywords used, then no value should be supplied for the scheme attribute.
ExampleBabbage, CharlesMathematicians - Great Britain - BiographyExampleFermented beveragesCentral AndesSchinus molleMolle beerIndigenous peoplesEthnographyArchaeologyContent model
<content>
 <alternate>
  <elementRef key="term" minOccurs="1"
   maxOccurs="unbounded"/>
  <elementRef key="list"/>
 </alternate>
</content>
    Schema Declaration
element keywords
{
   [att.global.attributes](#TEI.att.global),
   attribute scheme { text }?,
   ( [term](#TEI.term)+ | [list](#TEI.list) )
}
## <label>
<label><label> (label) contains any label or heading used to identify part of a text, typically but not exclusively in a list or glossary. [[3.8. Lists](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COLI)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.labelLike](#TEI.model.labelLike)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [list](#TEI.list) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleLabels are commonly used for the headwords in glossary lists; note the use of the global xml:lang attribute to set the default language of the glossary list to Middle English, and identify the glosses and headings as modern English or Latin:VocabularyMiddle EnglishNew Englishnunowlhudeloudlyblowethbloomsmedmeadowwudewoodaweewelhouthlowsstertethbounds, frisks (cf. Chaucer, K.T.644a courser, stertingas the fyrvertethpeditmuriemerrilyswikceasenaverneverExampleLabels may also be used to record explicitly the numbers or letters which mark list items in ordered lists, as in this extract from Gibbon's Autobiography. In this usage the [<label>](#TEI.label) element is synonymous with the n attribute on the [<item>](#TEI.item) element:I will add two facts, which have seldom occurred in the composition of six, or at least of five quartos. (1)My first rough manuscript, without any intermediate copy, has been sent to the press.(2) Not a sheet has been seen by any human eyes, excepting those of the author and the printer: the faults and the merits are exclusively my own.ExampleLabels may also be used for other structured list items, as in this extract from the journal of Edward Gibbon:March 1757.I wrote some critical observations upon Plautus.March 8th.I wrote a long dissertation upon some lines of Virgil.June.I saw Mademoiselle Curchod — Omnia vincit amor, et nos cedamus amori.August.I went to Crassy, and staid two days.Note that the [<label>](#TEI.label) might also appear within the [<item>](#TEI.item) rather than as its sibling. Though syntactically valid, this usage is not recommended TEI practice.ExampleLabels may also be used to represent a label or heading attached to a paragraph or sequence of paragraphs not treated as a structural division, or to a group of verse lines. Note that, in this case, the [<label>](#TEI.label) element appears within the [<p>](#TEI.p) or lg element, rather than as a preceding sibling of it.[...] & n’entrer en mauuais & mal-heu- ré meſnage. Or des que le conſente- ment des parties y eſt le mariage eſt  arreſté, quoy que de faict il ne ſoit Puiſſance maritale entre les Romains. conſommé. Depuis la conſomma- tion du mariage la femme eſt ſoubs  la puiſſance du mary, s’il n’eſt eſcla- ue ou enfant de famille : car en ce  cas, la femme, qui a eſpouſé vn en- fant de famille, eſt ſous la puiſſance [...]In this example the text of the label appears in the right hand margin of the original source, next to the paragraph it describes, but approximately in the middle of it. If so desired the type attribute may be used to distinguish different categories of label.Content model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element label { [att.global.attributes](#TEI.att.global), [att.typed.attributes](#TEI.att.typed), [macro.phraseSeq](#TEI.macro.phraseSeq) }
## <licence>
<licence><licence> contains information about a licence or other legal agreement applicable to the text. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.datable](#TEI.att.datable)
* [att.datable.w3c](#TEI.att.datable.w3c)
* @when

* @notBefore

* @notAfter

* @from

* @to



* [att.pointing](#TEI.att.pointing)
* @targetLang

* @target

* @evaluate

Member of[model.availabilityPart](#TEI.model.availabilityPart)Contained byheader: [availability](#TEI.availability)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
A [<licence>](#TEI.licence) element should be supplied for each licence agreement applicable to the text in question. The target attribute may be used to reference a full version of the licence. The when, notBefore, notAfter, from or to attributes may be used in combination to indicate the date or dates of applicability of the licence.
ExampleLicence: Creative Commons Attribution-Share Alike 3.0 New Zealand Licence ExampleThe Creative Commons Attribution 3.0 Unported (CC BY 3.0) Licence applies to this document.The licence was added on January 1, 2013.Content model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element licence
{
   [att.global.attributes](#TEI.att.global),
   [att.datable.attributes](#TEI.att.datable),
   [att.pointing.attributes](#TEI.att.pointing),
   [macro.specialPara](#TEI.macro.specialPara)
}
## <list>
<list>@type<list> (list) contains any sequence of items organized as a list. [[3.8. Lists](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COLI)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


type(type) describes the nature of the items in the list.Derived from[att.typed](#TEI.att.typed)StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Suggested values include:gloss
* (gloss) each list item glosses some term or concept, which is given by a [<label>](#TEI.label) element preceding the list item.
index
* (index) each list item is an entry in an index such as the alphabetical topical index at the back of a print volume.
instructions
* (instructions) each list item is a step in a sequence of instructions, as in a recipe.
litany
* (litany) each list item is one of a sequence of petitions, supplications or invocations, typically in a religious ritual.
syllogism
* (syllogism) each list item is part of an argument consisting of two or more propositions and a final conclusion derived from them.
Note
Previous versions of these Guidelines recommended the use of type on [<list>](#TEI.list) to encode the rendering or appearance of a list (whether it was bulleted, numbered, etc.). The current recommendation is to use the rend or style attributes for these aspects of a list, while using type for the more appropriate task of characterizing the nature of the content of a list.

The formal syntax of the element declarations allows [<label>](#TEI.label) tags to be omitted from lists tagged <list type="gloss">; this is however a semantic error.
Member of[model.listLike](#TEI.model.listLike) Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [abstract](#TEI.abstract) [change](#TEI.change) [keywords](#TEI.keywords) [licence](#TEI.licence) [revisionDesc](#TEI.revisionDesc) [sourceDesc](#TEI.sourceDesc)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [head](#TEI.head) [item](#TEI.item) [label](#TEI.label) [note](#TEI.note)figures: [figure](#TEI.figure)Note
May contain an optional heading followed by a series of items, or a series of label and item pairs, the latter being optionally preceded by one or two specialized headings.
Examplea butchera bakera candlestick maker, with rings on his fingersbells on his toesExampleAll Cretans are liars.Epimenides is a Cretan.ERGO Epimenides is a liar.ExampleGod save us from drought.God save us from pestilence.God save us from wickedness in high places.Praise be to God.ExampleThe following example treats the short numbered clauses of Anglo-Saxon legal codes as lists of items. The text is from an ordinance of King Athelstan (924–939):Athelstan's OrdinanceConcerning thieves. First, that no thief is to be spared who is caught with the stolen goods, [if he is] over twelve years and [if the value of the goods is] over eightpence. And if anyone does spare one, he is to pay for the thief with his wergild — and the thief is to be no nearer a settlement on that account — or to clear himself by an oath of that amount.If, however, he [the thief] wishes to defend himself or to escape, he is not to be spared [whether younger or older than twelve].If a thief is put into prison, he is to be in prison 40 days, and he may then be redeemed with 120 shillings; and the kindred are to stand surety for him that he will desist for ever.And if he steals after that, they are to pay for him with his wergild, or to bring him back there.And if he steals after that, they are to pay for him with his wergild, whether to the king or to him to whom it rightly belongs; and everyone of those who supported him is to pay 120 shillings to the king as a fine.Concerning lordless men. And we pronounced about these lordless men, from whom no justice can be obtained, that one should order their kindred to fetch back such a person to justice and to find him a lord in public meeting. And if they then will not, or cannot, produce him on that appointed day, he is then to be a fugitive afterwards, and he who encounters him is to strike him down as a thief.And he who harbours him after that, is to pay for him with his wergild or to clear himself by an oath of that amount.Concerning the refusal of justice. The lord who refuses justice and upholds his guilty man, so that the king is appealed to, is to repay the value of the goods and 120 shillings to the king; and he who appeals to the king before he demands justice as often as he ought, is to pay the same fine as the other would have done, if he had refused him justice. And the lord who is an accessory to a theft by his slave, and it becomes known about him, is to forfeit the slave and be liable to his wergild on the first occasionp if he does it more often, he is to be liable to pay all that he owns.And likewise any of the king's treasurers or of our reeves, who has been an accessory of thieves who have committed theft, is to liable to the same.Concerning treachery to a lord. And we have pronounced concerning treachery to a lord, that he [who is accused] is to forfeit his life if he cannot deny it or is afterwards convicted at the three-fold ordeal.Note that nested lists have been used so the tagging mirrors the structure indicated by the two-level numbering of the clauses. The clauses could have been treated as a one-level list with irregular numbering, if desired.ExampleThese decrees, most blessed Pope Hadrian, we propounded in the public council ... and they confirmed them in our hand in your stead with the sign of the Holy Cross, and afterwards inscribed with a careful pen on the paper of this page, affixing thus the sign of the Holy Cross. I, Eanbald, by the grace of God archbishop of the holy church of York, have subscribed to the pious and catholic validity of this document with the sign of the Holy Cross.I, Ælfwold, king of the people across the Humber, consenting have subscribed with the sign of the Holy Cross.I, Tilberht, prelate of the church of Hexham, rejoicing have subscribed with the sign of the Holy Cross.I, Higbald, bishop of the church of Lindisfarne, obeying have subscribed with the sign of the Holy Cross.I, Ethelbert, bishop of Candida Casa, suppliant, have subscribed with thef sign of the Holy Cross.I, Ealdwulf, bishop of the church of Mayo, have subscribed with devout will.I, Æthelwine, bishop, have subscribed through delegates.I, Sicga, patrician, have subscribed with serene mind with the sign of the Holy Cross.Schematron
<sch:rule context="tei:list[@type='gloss']">
<sch:assert test="tei:label">The content of a "gloss" list should include a sequence of one or more pairs of a label element followed by an item element</sch:assert>
</sch:rule>Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.divTop"/>
   <classRef key="model.global"/>
   <elementRef key="desc" minOccurs="0"
    maxOccurs="unbounded"/>
  </alternate>
  <alternate>
   <sequence minOccurs="1"
    maxOccurs="unbounded">
    <elementRef key="item"/>
    <classRef key="model.global"
     minOccurs="0" maxOccurs="unbounded"/>
   </sequence>
   <sequence>
    <elementRef key="headLabel"
     minOccurs="0"/>
    <elementRef key="headItem"
     minOccurs="0"/>
    <sequence minOccurs="1"
     maxOccurs="unbounded">
     <elementRef key="label"/>
     <classRef key="model.global"
      minOccurs="0" maxOccurs="unbounded"/>
     <elementRef key="item"/>
     <classRef key="model.global"
      minOccurs="0" maxOccurs="unbounded"/>
    </sequence>
   </sequence>
  </alternate>
  <sequence minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.divBottom"/>
   <classRef key="model.global"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element list
{
   [att.global.attributes](#TEI.att.global),
   attribute type
   {
      "gloss" | "index" | "instructions" | "litany" | "syllogism"
   }?,
   (
      ( [model.divTop](#TEI.model.divTop) | [model.global](#TEI.model.global) | [desc](#TEI.desc)* )*,
      (
         ( ( [item](#TEI.item), [model.global](#TEI.model.global)* )+ )
       | (
            [headLabel](#TEI.headLabel)?,
            [headItem](#TEI.headItem)?,
            ( ( [label](#TEI.label), [model.global](#TEI.model.global)*, [item](#TEI.item), [model.global](#TEI.model.global)* )+ )
         )
      ),
      ( ( [model.divBottom](#TEI.model.divBottom), [model.global](#TEI.model.global)* )* )
   )
}
## <listRef>
<listRef><listRef> (list of references) supplies a list of significant references in the current document or elsewhere.ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.ptrLike](#TEI.model.ptrLike) Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence) [publicationStmt](#TEI.publicationStmt)tagdocs: [classSpec](#TEI.classSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [elementSpec](#TEI.elementSpec) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp) [valDesc](#TEI.valDesc)May containcore: [desc](#TEI.desc) [ptr](#TEI.ptr) [ref](#TEI.ref)tagdocs: [listRef](#TEI.listRef)Note
When [<listRef>](#TEI.listRef) is used in the context of tagdocs, further restrictons apply: 
* It may only contain [<ptr>](#TEI.ptr) or [<ref>](#TEI.ref) elements.

* Each [<ptr>](#TEI.ptr) or [<ref>](#TEI.ref) child should bear a target attribute, the value of which should be a single URI pointer.

ExampleSchematron
<sch:rule context="( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | 
 tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef">
<sch:report test="tei:listRef">In the context of tagset documentation, the listRef element must not self-nest.</sch:report>
</sch:rule>Schematron
<sch:rule context="( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec | 
 tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef/tei:ptr 
 | ( tei:classSpec | tei:dataSpec | tei:elementSpec | tei:macroSpec 
 | tei:moduleSpec | tei:schemaSpec | tei:specGrp )/tei:listRef/tei:ref">
<sch:assert test="@target and not( matches( @target,'\s') )">In the context of tagset documentation, each ptr or ref element inside a listRef must have a target attribute with only 1 pointer as its value.</sch:assert>
</sch:rule>Content model
<content>
 <sequence>
  <elementRef key="desc" minOccurs="0"
   maxOccurs="unbounded"/>
  <classRef key="model.ptrLike"
   minOccurs="1" maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element listRef
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   ( [desc](#TEI.desc)*, [model.ptrLike](#TEI.model.ptrLike)+ )
}
## <macroRef>
<macroRef>@key<macroRef> points to the specification for some pattern which is to be included in a schema. [[23.7. Macro Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDENT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


keythe identifier used for the required pattern within the source indicated.StatusRequiredDatatype[teidata.xmlName](#TEI.teidata.xmlName)Member of[model.contentPart](#TEI.model.contentPart) [model.oddRef](#TEI.model.oddRef)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [specGrp](#TEI.specGrp)May containEmpty elementNote
Patterns or macros are identified by the name supplied as value for the ident attribute on the [<macroSpec>](#TEI.macroSpec) element in which they are declared. All TEI macro names are unique.
ExampleContent model
<content>
 <empty/>
</content>
    Schema Declaration
element macroRef { [att.global.attributes](#TEI.att.global), attribute key { text }, empty }
## <macroSpec>
<macroSpec><macroSpec> (macro specification) documents the function and implementation of a pattern. [[23.3. Specification Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDcrystals) [23.7. Macro Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDENT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil



Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [exemplum](#TEI.exemplum) [listRef](#TEI.listRef) [remarks](#TEI.remarks) [valList](#TEI.valList)ExampleContent model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identSynonyms"/>
   <classRef key="model.descLike"/>
  </alternate>
  <alternate minOccurs="0" maxOccurs="1">
   <elementRef key="content"/>
   <elementRef key="valList"/>
  </alternate>
  <elementRef key="constraintSpec"
   minOccurs="0" maxOccurs="unbounded"/>
  <elementRef key="exemplum" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="remarks" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="listRef" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element macroSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   (
      ( [model.identSynonyms](#TEI.model.identSynonyms) | [model.descLike](#TEI.model.descLike) )*,
      ( [content](#TEI.content) | [valList](#TEI.valList) )?,
      [constraintSpec](#TEI.constraintSpec)*,
      [exemplum](#TEI.exemplum)*,
      [remarks](#TEI.remarks)*,
      [listRef](#TEI.listRef)*
   )
}
## <memberOf>
<memberOf>@key@mode@max@min<memberOf> specifies class membership of the documented element or class. [[23.4.3. Classification of Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDcrystalsCEcl)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


keyspecifies the identifier for a class of which the documented element or class is a member or subclass.StatusOptionalDatatype[teidata.name](#TEI.teidata.name)modespecifies the effect of this declaration on its parent module.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:add
* this declaration is added to the current definitions[Default] 
delete
* this declaration and all of its children are removed from the current setup
maxsupplies the maximum number of times the element can occur in elements which use this model class in their content modelStatusOptionalDatatype[teidata.numeric](#TEI.teidata.numeric)minsupplies the minumum number of times the element must occur in elements which use this model class in their content modelStatusOptionalDatatype[teidata.numeric](#TEI.teidata.numeric)Contained bytagdocs: [classes](#TEI.classes)May containCharacter data onlyNote
Elements or classes which are members of multiple (unrelated) classes will have more than one [<memberOf>](#TEI.memberOf) element, grouped by a [<classes>](#TEI.classes) element. If an element is a member of a class C1, which is itself a subclass of a class C2, there is no need to state this, other than in the documentation for class C1.

Any additional comment or explanation of the class membership may be provided as content for this element.
ExampleThis element will appear in any content model which references model.divLike, and will have attributes defined in att.identified (in addition to any defined explicitly for this element).Content model
<content>
 <macroRef key="macro.xtext"/>
</content>
    Schema Declaration
element memberOf
{
   [att.global.attributes](#TEI.att.global),
   attribute key { text }?,
   attribute mode { "add" | "delete" }?,
   attribute max { text }?,
   attribute min { text }?,
   [macro.xtext](#TEI.macro.xtext)
}
## <moduleRef>
<moduleRef>@prefix@include@except@key@url<moduleRef> (module reference) references a module which is to be incorporated into a schema. [[23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


prefixspecifies a default prefix which will be prepended to all patterns from the imported module.StatusOptionalDatatype0–1 occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespaceSchematron
<sch:rule context="tei:moduleRef">
<sch:report test="//*[ not( generate-id(.) eq generate-id( current() ) ) ]/@prefix = 
 @prefix">The prefix attribute
 of <sch:name/> should not match that of any other
 element (it would defeat the purpose)</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:moduleRef">
<sch:report test="@except and @include">It is an error to supply both the @include and @except attributes</sch:report>
</sch:rule>Note
Use of this attribute avoids name collisions (and thus invalid schemas) when the external schema being mixed in with TEI uses a name the TEI or some other included external schema already uses for a pattern.
includesupplies a list of the elements which are to be copied from the specified module into the schema being defined.StatusOptionalDatatype0–∞ occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespaceexceptsupplies a list of the elements which are not to be copied from the specified module into the schema being defined.StatusOptionalDatatype0–∞ occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespacekeythe name of a TEI moduleStatusOptionalDatatype[teidata.xmlName](#TEI.teidata.xmlName)url(uniform resource locator) refers to a non-TEI module of RELAX NG code by external locationStatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)Member of[model.oddRef](#TEI.model.oddRef)Contained bytagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)May containtagdocs: [content](#TEI.content)Note
If neither include nor except is supplied, the effect of this element is to make all the declarations contained by the referenced module available to the schema being compiled. If both attributes are supplied, an ODD processor should signal an error.

A TEI module is identified by the name supplied as value for the ident attribute on a [<moduleSpec>](#TEI.moduleSpec) element. The source attribute may be used to specify an online source from which the specification of that module may be read. A URI may alternatively be supplied in the case of a non-TEI module, and this is expected to be written as a RELAX NG schema.

If the url attribute is used, the [<content>](#TEI.content) element may also be supplied as a child of this element. Its content (which is assumed to be a fragment of RELAX NG code) will be copied along with the content of the resource indicated by the url attribute into the target RELAX NG schema.
ExampleThis includes all objects available from the linking module.ExampleThis includes all elements available from the linking module except for the link and linkGrp elements.ExampleThis includes only the link and linkGrp elements from the linking module.Schematron
<sch:rule context="tei:moduleRef">
<sch:report test="* and @key"> Child elements of <sch:name/> are only allowed when an external module is being loaded
</sch:report>
</sch:rule>Content model
<content>
 <elementRef key="content" minOccurs="0"/>
</content>
    Schema Declaration
element moduleRef
{
   [att.global.attributes](#TEI.att.global),
   attribute prefix { ? }?,
   ( attribute include { list { * } }? | attribute except { list { * } }? ),
   ( attribute key { text }? | attribute url { text }? ),
   [content](#TEI.content)?
}
## <moduleSpec>
<moduleSpec><moduleSpec> (module specification) documents the structure, content, and purpose of a single module, i.e. a named and externally visible group of declarations. [[23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil




* [att.typed](#TEI.att.typed)
* @type

Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [exemplum](#TEI.exemplum) [listRef](#TEI.listRef) [remarks](#TEI.remarks)ExampleNames and DatesAdditional elements for names and datesContent model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identEquiv"/>
   <elementRef key="idno"/>
   <classRef key="model.descLike"/>
  </alternate>
  <elementRef key="exemplum" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="remarks" minOccurs="0"/>
  <elementRef key="listRef" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element moduleSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   [att.typed.attributes](#TEI.att.typed),
   (
      ( [model.identEquiv](#TEI.model.identEquiv) | [idno](#TEI.idno) | [model.descLike](#TEI.model.descLike) )*,
      [exemplum](#TEI.exemplum)*,
      [remarks](#TEI.remarks)?,
      [listRef](#TEI.listRef)*
   )
}
## <name>
<name><name> (name, proper noun) contains a proper noun or noun phrase. [[3.6.1. Referring Strings](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONARS)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.datable](#TEI.att.datable)
* [att.datable.w3c](#TEI.att.datable.w3c)
* @when

* @notBefore

* @notAfter

* @from

* @to



* [att.personal](#TEI.att.personal)
* [att.naming](#TEI.att.naming)
* @role

* [att.canonical](#TEI.att.canonical)
* @key

* @ref




* [att.typed](#TEI.att.typed)
* @type

Member of[model.nameLike.agent](#TEI.model.nameLike.agent)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
Proper nouns referring to people, places, and organizations may be tagged instead with persName, placeName, or orgName, when the TEI module for names and dates is included.
ExampleThomas HoccleveVillingaholtVetus Latina InstitutOccleveContent model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element name
{
   [att.global.attributes](#TEI.att.global),
   [att.datable.attributes](#TEI.att.datable),
   [att.personal.attributes](#TEI.att.personal),
   [att.typed.attributes](#TEI.att.typed),
   [macro.phraseSeq](#TEI.macro.phraseSeq)
}
## <note>
<note><note> (note) contains a note or annotation. [[3.9.1. Notes and Simple Annotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONONO) [2.2.6. The Notes Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD27) [3.12.2.8. Notes and Statement of Language](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COBICON) [10.3.5.4. Notes within Entries](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DI.html#DITPNO)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.pointing](#TEI.att.pointing)
* @targetLang

* @target

* @evaluate


* [att.typed](#TEI.att.typed)
* @type

Member of[model.noteLike](#TEI.model.noteLike) Contained bycore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figure](#TEI.figure) [table](#TEI.table)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front) [text](#TEI.text)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleIn the following example, the translator has supplied a footnote containing an explanation of the term translated as "painterly":And yet it is not only in the great line of Italian renaissance art, but even in the painterly Malerisch. This word has, in the German, two distinct meanings, one objective, a quality residing in the object, the other subjective, a mode of apprehension and creation. To avoid confusion, they have been distinguished in English as picturesque and painterly respectively. style of the Dutch genre painters of the seventeenth century that drapery has this psychological significance. translation from German to EnglishHottinger, Marie Donald MackieFor this example to be valid, the code MDMH must be defined elsewhere, for example by means of a responsibility statement in the associated TEI header.ExampleThe global n attribute may be used to supply the symbol or number used to mark the note's point of attachment in the source text, as in the following example:Mevorakh b. Saadya's mother, the matriarch of the family during the second half of the eleventh century, The alleged mention of Judah Nagid's mother in a letter from 1071 is, in fact, a reference to Judah's children; cf. above, nn. 111 and 54.  is well known from Geniza documents published by Jacob Mann.However, if notes are numbered in sequence and their numbering can be reconstructed automatically by processing software, it may well be considered unnecessary to record the note numbers.Content model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element note
{
   [att.global.attributes](#TEI.att.global),
   [att.pointing.attributes](#TEI.att.pointing),
   [att.typed.attributes](#TEI.att.typed),
   [macro.specialPara](#TEI.macro.specialPara)
}
## <p>
<p><p> (paragraph) marks paragraphs in prose. [[3.1. Paragraphs](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COPA) [7.2.5. Speech Contents](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DR.html#DRPAL)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.pLike](#TEI.model.pLike)Contained bycore: [item](#TEI.item) [note](#TEI.note) [q](#TEI.q) [quote](#TEI.quote)figures: [cell](#TEI.cell) [figure](#TEI.figure)header: [abstract](#TEI.abstract) [availability](#TEI.availability) [change](#TEI.change) [editionStmt](#TEI.editionStmt) [licence](#TEI.licence) [publicationStmt](#TEI.publicationStmt) [sourceDesc](#TEI.sourceDesc)tagdocs: [exemplum](#TEI.exemplum) [remarks](#TEI.remarks) [specGrp](#TEI.specGrp)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataExampleHallgerd was outside. There is blood on your axe, she said. What have you done?I have now arranged that you can be married a second time, replied Thjostolf.Then you must mean that Thorvald is dead, she said.Yes, said Thjostolf. And now you must think up some plan for me.Schematron
<sch:rule context="tei:p">
<sch:report test="(ancestor::tei:ab or ancestor::tei:p) and not( ancestor::tei:floatingText 
 | parent::tei:exemplum | parent::tei:item | parent::tei:note | parent::tei:q 
 | parent::tei:quote | parent::tei:remarks | parent::tei:said | parent::tei:sp 
 | parent::tei:stage | parent::tei:cell | parent::tei:figure )"> Abstract model violation: Paragraphs may not occur inside other paragraphs or ab elements.
</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:l//tei:p">
<sch:assert test="ancestor::tei:floatingText | parent::tei:figure | parent::tei:note"> Abstract model violation: Metrical lines may not contain higher-level structural elements such as div, p, or ab, unless p is a child of figure or note, or is a descendant of floatingText.
</sch:assert>
</sch:rule>Content model
<content>
 <macroRef key="macro.paraContent"/>
</content>
    Schema Declaration
element p { [att.global.attributes](#TEI.att.global), [macro.paraContent](#TEI.macro.paraContent) }
## <profileDesc>
<profileDesc><profileDesc> (text-profile description) provides a detailed description of non-bibliographic aspects of a text, specifically the languages and sublanguages used, the situation in which it was produced, the participants and their setting. [[2.4. The Profile Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD4) [2.1.1. The TEI Header and Its Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD11)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.teiHeaderPart](#TEI.model.teiHeaderPart)Contained byheader: [teiHeader](#TEI.teiHeader)May containheader: [abstract](#TEI.abstract) [textClass](#TEI.textClass)Note
Although the content model permits it, it is rarely meaningful to supply multiple occurrences for any of the child elements of [<profileDesc>](#TEI.profileDesc) unless these are documenting multiple texts.
ExampleFrenchprint; part issuesParis, FranceLate 19th centuryContent model
<content>
 <classRef key="model.profileDescPart"
  minOccurs="0" maxOccurs="unbounded"/>
</content>
    Schema Declaration
element profileDesc { [att.global.attributes](#TEI.att.global), [model.profileDescPart](#TEI.model.profileDescPart)* }
## <ptr>
<ptr><ptr> (pointer) defines a pointer to another location. [[3.7. Simple Links and Cross-References](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COXR) [17.1. Links](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAPT)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.pointing](#TEI.att.pointing)
* @targetLang

* @target

* @evaluate


* [att.typed](#TEI.att.typed)
* @type

Member of[model.ptrLike](#TEI.model.ptrLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence) [publicationStmt](#TEI.publicationStmt)tagdocs: [eg](#TEI.eg) [listRef](#TEI.listRef) [valDesc](#TEI.valDesc)May containEmpty elementNote
The target and cRef attributes are mutually exclusive.
ExampleSchematron
<sch:rule context="tei:ptr">
<sch:report test="@target and @cRef">Only one of the attributes @target and @cRef may be supplied on <sch:name/>.</sch:report>
</sch:rule>Content model
<content>
 <empty/>
</content>
    Schema Declaration
element ptr
{
   [att.global.attributes](#TEI.att.global),
   [att.pointing.attributes](#TEI.att.pointing),
   [att.typed.attributes](#TEI.att.typed),
   empty
}
## <publicationStmt>
<publicationStmt><publicationStmt> (publication statement) groups information concerning the publication or distribution of an electronic or other text. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24) [2.2. The File Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD2)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [fileDesc](#TEI.fileDesc)May containcore: [p](#TEI.p) [ptr](#TEI.ptr) [publisher](#TEI.publisher) [ref](#TEI.ref)header: [availability](#TEI.availability) [distributor](#TEI.distributor)tagdocs: [listRef](#TEI.listRef)Note
Where a publication statement contains several members of the model.publicationStmtPart.agency or model.publicationStmtPart.detail classes rather than one or more paragraphs or anonymous blocks, care should be taken to ensure that the repeated elements are presented in a meaningful order. It is a conformance requirement that elements supplying information about publication place, address, identifier, availability, and date be given following the name of the publisher, distributor, or authority concerned, and preferably in that order.
ExampleC. Muquardt Bruxelles & LeipzigExampleChadwyck HealeyCambridgeAvailable under licence only1992ExampleZea BooksLincoln, NE2017This is an open access work licensed under a Creative Commons Attribution 4.0 International license.Content model
<content>
 <alternate>
  <sequence minOccurs="1"
   maxOccurs="unbounded">
   <classRef key="model.publicationStmtPart.agency"/>
   <classRef key="model.publicationStmtPart.detail"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
  <classRef key="model.pLike" minOccurs="1"
   maxOccurs="unbounded"/>
 </alternate>
</content>
    Schema Declaration
element publicationStmt
{
   [att.global.attributes](#TEI.att.global),
   (
      (
         (
            [model.publicationStmtPart.agency](#TEI.model.publicationStmtPart.agency),
            [model.publicationStmtPart.detail](#TEI.model.publicationStmtPart.detail)*
         )+
      )
    | [model.pLike](#TEI.model.pLike)+
   )
}
## <publisher>
<publisher><publisher> (publisher) provides the name of the organization responsible for the publication or distribution of a bibliographic item. [[3.12.2.4. Imprint, Size of a Document, and Reprint Information](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COBICOI) [2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.canonical](#TEI.att.canonical)
* @key

* @ref

Member of[model.publicationStmtPart.agency](#TEI.model.publicationStmtPart.agency)Contained byheader: [publicationStmt](#TEI.publicationStmt)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
Use the full form of the name by which a company is usually referred to, rather than any abbreviation of it which may appear on a title page
ExampleOxfordClarendon Press1987Content model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element publisher
{
   [att.global.attributes](#TEI.att.global),
   [att.canonical.attributes](#TEI.att.canonical),
   [macro.phraseSeq](#TEI.macro.phraseSeq)
}
## <q>
<q>@type<q> (quoted) contains material which is distinguished from the surrounding text using quotation marks or a similar method, for any one of a variety of reasons including, but not limited to: direct speech or thought, technical terms or jargon, authorial distance, quotations from elsewhere, and passages that are mentioned but not used. [[3.3.3. Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQQ)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


type(type) may be used to indicate whether the offset passage is spoken or thought, or to characterize it more finely.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Suggested values include:spoken
* (spoken) representation of speech
thought
* (thought) representation of thought, e.g. internal monologue
written
* (written) quotation from a written source
soCalled
* (so called) authorial distance
foreign
* (foreign) foreign words
distinct
* (distinct) linguistically distinct
term
* technical term
emph
* (emph) rhetorically emphasized
mentioned
* (mentioned) refering to itself, not its normal referent
Member of[model.common](#TEI.model.common) [model.hiLike](#TEI.model.hiLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure) [formula](#TEI.formula)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
May be used to indicate that a passage is distinguished from the surrounding text for reasons concerning which no claim is made. When used in this manner, [<q>](#TEI.q) may be thought of as syntactic sugar for [<hi>](#TEI.hi) with a value of rend that indicates the use of such mechanisms as quotation marks.
ExampleIt is spelled Tübingen — to enter the letter u with an umlaut hold down the option key and press 0 0 f cContent model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element q
{
   [att.global.attributes](#TEI.att.global),
   attribute type
   {
      "spoken"
    | "thought"
    | "written"
    | "soCalled"
    | "foreign"
    | "distinct"
    | "term"
    | "emph"
    | "mentioned"
   }?,
   [macro.specialPara](#TEI.macro.specialPara)
}
## <quote>
<quote><quote> (quotation) contains a phrase or passage attributed by the narrator or author to some agency external to the text. [[3.3.3. Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQQ) [4.3.1. Grouped Texts](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSGRP)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.quoteLike](#TEI.model.quoteLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
If a bibliographic citation is supplied for the source of a quotation, the two may be grouped using the cit element.
ExampleLexicography has shown little sign of being affected by the work of followers of J.R. Firth, probably best summarized in his slogan, You shall know a word by the company it keeps(Firth, 1957)Content model
<content>
 <macroRef key="macro.specialPara"/>
</content>
    Schema Declaration
element quote
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   [macro.specialPara](#TEI.macro.specialPara)
}
## <ref>
<ref><ref> (reference) defines a reference to another location, possibly modified by additional text or comment. [[3.7. Simple Links and Cross-References](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COXR) [17.1. Links](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAPT)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.pointing](#TEI.att.pointing)
* @targetLang

* @target

* @evaluate


* [att.typed](#TEI.att.typed)
* @type

Member of[model.ptrLike](#TEI.model.ptrLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence) [publicationStmt](#TEI.publicationStmt)tagdocs: [eg](#TEI.eg) [listRef](#TEI.listRef) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The target and cRef attributes are mutually exclusive.
ExampleSee especially the second sentenceExampleSee also s.v. locution.Schematron
<sch:rule context="tei:ref">
<sch:report test="@target and @cRef">Only one of the attributes @target and @cRef may be supplied on <sch:name/>.</sch:report>
</sch:rule>Content model
<content>
 <macroRef key="macro.paraContent"/>
</content>
    Schema Declaration
element ref
{
   [att.global.attributes](#TEI.att.global),
   [att.pointing.attributes](#TEI.att.pointing),
   [att.typed.attributes](#TEI.att.typed),
   [macro.paraContent](#TEI.macro.paraContent)
}
## <remarks>
<remarks>@ident<remarks> (remarks) contains any commentary or discussion about the usage of an element, attribute, class, or entity not otherwise documented within the containing element. [[23.5. Element Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAG) [23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT) [23.6. Class Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDCLA) [23.7. Macro Specifications](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDENT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil



* [att.translatable](#TEI.att.translatable)
* @versionDate

identspecifies the remark concerned.StatusOptionalDatatype[teidata.text](#TEI.teidata.text)Contained bytagdocs: [attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [valItem](#TEI.valItem)May containcore: [p](#TEI.p)Note
Contains at least one paragraph, unless it is empty.

As defined in ODD, must contain paragraphs; should be special.para
ExampleThis element is probably redundant.Content model
<content>
 <classRef key="model.pLike" minOccurs="1"
  maxOccurs="unbounded"/>
</content>
    Schema Declaration
element remarks
{
   [att.global.attributes](#TEI.att.global),
   [att.combinable.attributes](#TEI.att.combinable),
   [att.translatable.attributes](#TEI.att.translatable),
   attribute ident { text }?,
   [model.pLike](#TEI.model.pLike)+
}
## <resp>
<resp><resp> (responsibility) contains a phrase describing the nature of a person's intellectual responsibility, or an organization's role in the production or distribution of a work. [[3.12.2.2. Titles, Authors, and Editors](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COBICOR) [2.2.1. The Title Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD21) [2.2.2. The Edition Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD22) [2.2.5. The Series Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD26)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.canonical](#TEI.att.canonical)
* @key

* @ref


* [att.datable](#TEI.att.datable)
* [att.datable.w3c](#TEI.att.datable.w3c)
* @when

* @notBefore

* @notAfter

* @from

* @to


Contained bycore: [respStmt](#TEI.respStmt)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The attribute ref, inherited from the class att.canonical may be used to indicate the kind of responsibility in a normalized form by referring directly to a standardized list of responsibility types, such as that maintained by a naming authority, for example the list maintained at  for bibliographic usage.
ExamplecompilerEdward ChildContent model
<content>
 <macroRef key="macro.phraseSeq.limited"/>
</content>
    Schema Declaration
element resp
{
   [att.global.attributes](#TEI.att.global),
   [att.canonical.attributes](#TEI.att.canonical),
   [att.datable.attributes](#TEI.att.datable),
   [macro.phraseSeq.limited](#TEI.macro.phraseSeq.limited)
}
## <respStmt>
<respStmt><respStmt> (statement of responsibility) supplies a statement of responsibility for the intellectual content of a text, edition, recording, or series, where the specialized elements for authors, editors, etc. do not suffice or do not apply. May also be used to encode information about individuals or organizations which have played a role in the production or distribution of a bibliographic work. [[3.12.2.2. Titles, Authors, and Editors](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COBICOR) [2.2.1. The Title Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD21) [2.2.2. The Edition Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD22) [2.2.5. The Series Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD26)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.canonical](#TEI.att.canonical)
* @key

* @ref

Member of[model.respLike](#TEI.model.respLike)Contained byheader: [editionStmt](#TEI.editionStmt) [titleStmt](#TEI.titleStmt)May containcore: [name](#TEI.name) [note](#TEI.note) [resp](#TEI.resp)Exampletranscribed from original msClaus HuitfeldtExampleconverted to XML encodingAlan MorrisonContent model
<content>
 <sequence>
  <alternate>
   <sequence>
    <elementRef key="resp" minOccurs="1"
     maxOccurs="unbounded"/>
    <classRef key="model.nameLike.agent"
     minOccurs="1" maxOccurs="unbounded"/>
   </sequence>
   <sequence>
    <classRef key="model.nameLike.agent"
     minOccurs="1" maxOccurs="unbounded"/>
    <elementRef key="resp" minOccurs="1"
     maxOccurs="unbounded"/>
   </sequence>
  </alternate>
  <elementRef key="note" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element respStmt
{
   [att.global.attributes](#TEI.att.global),
   [att.canonical.attributes](#TEI.att.canonical),
   (
      ( ( [resp](#TEI.resp)+, [model.nameLike.agent](#TEI.model.nameLike.agent)+ ) | ( [model.nameLike.agent](#TEI.model.nameLike.agent)+, [resp](#TEI.resp)+ ) ),
      [note](#TEI.note)*
   )
}
## <revisionDesc>
<revisionDesc><revisionDesc> (revision description) summarizes the revision history for a file. [[2.6. The Revision Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD6) [2.1.1. The TEI Header and Its Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD11)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [teiHeader](#TEI.teiHeader)May containcore: [list](#TEI.list)header: [change](#TEI.change)Note
If present on this element, the status attribute should indicate the current status of the document. The same attribute may appear on any [<change>](#TEI.change) to record the status at the time of that change. Conventionally [<change>](#TEI.change) elements should be given in reverse date order, with the most recent change at the start of the list.
Exampledeleted chapter 10 Content model
<content>
 <alternate>
  <elementRef key="list" minOccurs="1"
   maxOccurs="unbounded"/>
  <elementRef key="listChange"
   minOccurs="1" maxOccurs="unbounded"/>
  <elementRef key="change" minOccurs="1"
   maxOccurs="unbounded"/>
 </alternate>
</content>
    Schema Declaration
element revisionDesc
{
   [att.global.attributes](#TEI.att.global),
   ( [list](#TEI.list)+ | [listChange](#TEI.listChange)+ | [change](#TEI.change)+ )
}
## <row>
<row><row> (row) contains one row of a table. [[15.1.1. TEI Tables](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html#FTTAB1)]ModulefiguresAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byfigures: [table](#TEI.table)May containfigures: [cell](#TEI.cell)ExampleClassicsIdle listless and unimprovingContent model
<content>
 <elementRef key="cell" minOccurs="1"
  maxOccurs="unbounded"/>
</content>
    Schema Declaration
element row { [att.global.attributes](#TEI.att.global), [cell](#TEI.cell)+ }
## <schemaSpec>
<schemaSpec>@start@prefix@targetLang@docLang@defaultExceptions<schemaSpec> (schema specification) generates a TEI-conformant schema and documentation for it. [[2.3. The Encoding Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD5) [23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules) [24.5.1. Making a Unified ODD](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/USE.html#IM-unified)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.identified](#TEI.att.identified)
* @ident

* @predeclare

* @module

* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil




* [att.namespaceable](#TEI.att.namespaceable)
* @ns

startspecifies entry points to the schema, i.e. which patterns may be used as the root of documents conforming to it.StatusOptionalDatatype1–∞ occurrences of [teidata.name](#TEI.teidata.name) separated by whitespaceDefaultTEIprefixspecifies a default prefix which will be prepended to all patterns relating to TEI elements, unless otherwise stated.StatusOptionalDatatype0–1 occurrences of [teidata.xmlName](#TEI.teidata.xmlName) separated by whitespaceNote
Use of this attribute allows an external schema which has an element with the same local name as a TEI element to be mixed in.
targetLang(target language) specifies which language to use when creating the objects in a schema if names for elements or attributes are available in more than one language.StatusOptionalDatatype[teidata.language](#TEI.teidata.language)docLang(documentation language) specifies which languages to use when creating documentation if the description for an element, attribute, class or macro is available in more than one language.StatusOptionalDatatype1–∞ occurrences of [teidata.language](#TEI.teidata.language) separated by whitespaceNote
Although multiple languages may be specified, the current TEI ODD processor is only capable of handling one.
defaultExceptions(default namespace exclusions) provides a list of namespaces and/or prefixed element names to be excluded by default from anyName in RELAX NG schemas.StatusRecommendedDatatype1–∞ occurrences of [teidata.namespaceOrName](#TEI.teidata.namespaceOrName) separated by whitespaceDefaultNote
Specifies defaults for the except attribute of [<anyElement>](#TEI.anyElement). RELAX NG validation (unless DTD Compatibility Mode is turned off) requires that any elements which may take an xml:id be excluded from the content of anyName name classes. For normal TEI purposes, this includes anything in the TEI namespace and the [<egXML>](#TEI.teix_egXML) element. The defaultExceptions attribute sets the global defaults for these exclusions. Element prefixes must be declared using a namespace declaration on the parent or an ancestor element.
Member of[model.frontPart](#TEI.model.frontPart)Contained bytextstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)derived-module-tei_xinclude: [include](#TEI.include)tagdocs: [classRef](#TEI.classRef) [classSpec](#TEI.classSpec) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [dataRef](#TEI.dataRef) [dataSpec](#TEI.dataSpec) [elementRef](#TEI.elementRef) [elementSpec](#TEI.elementSpec) [listRef](#TEI.listRef) [macroRef](#TEI.macroRef) [macroSpec](#TEI.macroSpec) [moduleRef](#TEI.moduleRef) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)Note
A [<schemaSpec>](#TEI.schemaSpec) combines references to modules, individual element or macro declarations, and specification groups together to form a unified schema.

The processing of the [<schemaSpec>](#TEI.schemaSpec) element must resolve any conflicts amongst the declarations it either contains or refers to. Different ODD processors may generate schemas and documentation using different concrete syntaxes.

The source may be specified (on the source attribute) in the form of a private URI, for which the recommended format is tei:x.y.z, where x.y.z indicates the version number, e.g. tei:1.5.1 for 1.5.1 release of TEI P5 or (as a special case) tei:current for whatever is the latest release. The source indicated must provide a set of TEI-conformant specifications in a form directly usable by an ODD processor. By default, this will be the location of the current release of the TEI Guidelines.
ExampleThis schema combines elements from the current versions of the drama and core modules, the current release version of the header module, and elements from an existing RELAX NG schema available from the URL indicated.ExampleThis schema starts with a pre-existing customization of the TEI called TEI Bare (a customization with a minimal selection of elements). The [<q>](#TEI.q) element is not available in TEI Bare, but it can be brought back. In this case, we will get the version defined in TEI P5 release 3.0.0Content model
<content>
 <sequence minOccurs="1" maxOccurs="1">
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.identEquiv"/>
   <classRef key="model.descLike"/>
  </alternate>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <elementRef key="constraintDecl"/>
   <classRef key="model.oddRef"/>
   <classRef key="model.oddDecl"/>
   <elementRef key="listRef"/>
  </alternate>
 </sequence>
</content>
    Schema Declaration
element schemaSpec
{
   [att.global.attributes](#TEI.att.global),
   [att.identified.attributes](#TEI.att.identified),
   [att.namespaceable.attributes](#TEI.att.namespaceable),
   attribute start { list { + } }?,
   attribute prefix { ? }?,
   attribute targetLang { text }?,
   attribute docLang { list { + } }?,
   attribute defaultExceptions { list { + } }?,
   (
      ( [model.identEquiv](#TEI.model.identEquiv) | [model.descLike](#TEI.model.descLike) )*,
      ( [constraintDecl](#TEI.constraintDecl) | [model.oddRef](#TEI.model.oddRef) | [model.oddDecl](#TEI.model.oddDecl) | [listRef](#TEI.listRef) )*
   )
}
## <sequence>
<sequence>@preserveOrder<sequence> indicates that the constructs referenced by its children form a sequence. [[23.5.1. Defining Content Models](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#DEFCON)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.repeatable](#TEI.att.repeatable)
* @minOccurs

* @maxOccurs

preserveOrderif false, indicates that component elements of a sequence may occur in any order.StatusOptionalDatatype[teidata.truthValue](#TEI.teidata.truthValue)Member of[model.contentPart](#TEI.model.contentPart)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [sequence](#TEI.sequence)May containtagdocs: [alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [classRef](#TEI.classRef) [dataRef](#TEI.dataRef) [elementRef](#TEI.elementRef) [empty](#TEI.empty) [macroRef](#TEI.macroRef) [sequence](#TEI.sequence) [textNode](#TEI.textNode)ExampleThis example content model matches a sequence consisting of either a [<name>](#TEI.name) or a persName followed by nothing, or by a sequence of up to five placeName elements.Schematron
<sch:rule context="tei:sequence">
<sch:assert test="count(*) gt 1">The sequence element must have at least two child elements</sch:assert>
</sch:rule>Content model
<content>
 <classRef key="model.contentPart"
  maxOccurs="unbounded"/>
</content>
    Schema Declaration
element sequence
{
   [att.global.attributes](#TEI.att.global),
   [att.repeatable.attributes](#TEI.att.repeatable),
   attribute preserveOrder { text }?,
   model.contentPart+
}
## <sourceDesc>
<sourceDesc><sourceDesc> (source description) describes the source(s) from which an electronic text was derived or generated, typically a bibliographic description in the case of a digitized text, or a phrase such as “born digital” for a text which has no previous existence. [[2.2.7. The Source Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD3)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [fileDesc](#TEI.fileDesc)May containcore: [list](#TEI.list) [p](#TEI.p)figures: [table](#TEI.table)ExampleThe Interesting story of the Children in the Wood. In Victor E Neuberg, The Penny Histories. OUP1968.ExampleBorn digital: no previous source exists.Content model
<content>
 <alternate>
  <classRef key="model.pLike" minOccurs="1"
   maxOccurs="unbounded"/>
  <alternate minOccurs="1"
   maxOccurs="unbounded">
   <classRef key="model.biblLike"/>
   <classRef key="model.sourceDescPart"/>
   <classRef key="model.listLike"/>
  </alternate>
 </alternate>
</content>
    Schema Declaration
element sourceDesc
{
   [att.global.attributes](#TEI.att.global),
   (
      [model.pLike](#TEI.model.pLike)+
    | ( [model.biblLike](#TEI.model.biblLike) | [model.sourceDescPart](#TEI.model.sourceDescPart) | [model.listLike](#TEI.model.listLike) )+
   )
}
## <specDesc>
<specDesc>@key@atts<specDesc> (specification description) indicates that a description of the specified element, class, or macro should be included at this point within a document. [[23.1.2. Element and Attribute Descriptions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDphraseEA)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


key(identifier) supplies the identifier of the documentary element or class for which a description is to be obtained.StatusRequiredDatatype[teidata.name](#TEI.teidata.name)Note
The value should match the ident of a documentary element (that is, a member of att.identified).
atts(attributes) supplies attribute names for which descriptions should additionally be obtained.StatusRecommendedDatatype0–∞ occurrences of [teidata.name](#TEI.teidata.name) separated by whitespaceNote
The attribute names listed may include both attributes inherited from a class and those defined explicitly for the associated element. 
Member of[model.specDescLike](#TEI.model.specDescLike) Contained bycore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [specList](#TEI.specList)May containEmpty elementNote
The description is usually displayed as a label and an item. The list of attributes may include some which are inherited by virtue of an element's class membership; descriptions for such attributes may also be retrieved using another [<specDesc>](#TEI.specDesc), this time pointing at the relevant class.
ExampleExampleExampleContent model
<content>
 <empty/>
</content>
    Schema Declaration
element specDesc
{
   [att.global.attributes](#TEI.att.global),
   attribute key { text },
   attribute atts { list { * } }?,
   empty
}
## <specGrp>
<specGrp><specGrp> (specification group) contains any convenient grouping of specifications for use within the current module. [[23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containcore: [p](#TEI.p)derived-module-tei_xinclude: [include](#TEI.include)tagdocs: [classRef](#TEI.classRef) [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataRef](#TEI.dataRef) [dataSpec](#TEI.dataSpec) [elementRef](#TEI.elementRef) [elementSpec](#TEI.elementSpec) [listRef](#TEI.listRef) [macroRef](#TEI.macroRef) [macroSpec](#TEI.macroSpec) [moduleRef](#TEI.moduleRef) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)Note
A specification group is referenced by means of its xml:id attribute. The declarations it contains may be included in a [<schemaSpec>](#TEI.schemaSpec) or [<moduleSpec>](#TEI.moduleSpec) element only by reference (using a [<specGrpRef>](#TEI.specGrpRef) element): it may not be nested within a [<moduleSpec>](#TEI.moduleSpec) element.

Different ODD processors may generate representations of the specifications contained by a [<specGrp>](#TEI.specGrp) in different concrete syntaxes.
ExampleThis specification group with identifier xDAILC contains specifications for the elements s,cl,w, etc.Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <classRef key="model.oddDecl"/>
  <classRef key="model.oddRef"/>
  <classRef key="model.divPart"/>
  <elementRef key="listRef"/>
 </alternate>
</content>
    Schema Declaration
element specGrp
{
   [att.global.attributes](#TEI.att.global),
   ( [model.oddDecl](#TEI.model.oddDecl) | [model.oddRef](#TEI.model.oddRef) | [model.divPart](#TEI.model.divPart) | [listRef](#TEI.listRef) )*
}
## <specGrpRef>
<specGrpRef>@target<specGrpRef> (reference to a specification group) indicates that the declarations contained by the [<specGrp>](#TEI.specGrp) referenced should be inserted at this point. [[23.2. Modules and Schemas](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDmodules)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


targetpoints at the specification group which logically belongs here.StatusRequiredDatatype[teidata.pointer](#TEI.teidata.pointer)Member of[model.oddDecl](#TEI.model.oddDecl)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [change](#TEI.change) [licence](#TEI.licence)tagdocs: [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)textstructure: [body](#TEI.body) [div](#TEI.div)May containEmpty elementNote
In ODD documentation processing, a [<specGrpRef>](#TEI.specGrpRef) usually produces a comment indicating that a set of declarations printed in another section will be inserted at this point in the [<specGrp>](#TEI.specGrp) being discussed. In schema processing, the contents of the specified [<specGrp>](#TEI.specGrp) are made available for inclusion in the generated schema.

The specification group identified by the target attribute will normally be part of the current ODD document.
ExampleThis part of the module contains declarations for names of persons, places, and organisations: Content model
<content>
 <empty/>
</content>
    Schema Declaration
element specGrpRef { [att.global.attributes](#TEI.att.global), attribute target { text }, empty }
## <specList>
<specList><specList> (specification list) marks where a list of descriptions is to be inserted into the prose documentation. [[23.1.2. Element and Attribute Descriptions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDphraseEA)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.specDescLike](#TEI.model.specDescLike)Contained bycore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg)May containtagdocs: [specDesc](#TEI.specDesc)ExampleContent model
<content>
 <elementRef key="specDesc" minOccurs="1"
  maxOccurs="unbounded"/>
</content>
    Schema Declaration
element specList { [att.global.attributes](#TEI.att.global), [specDesc](#TEI.specDesc)+ }
## <table>
<table>@rows@cols<table> (table) contains text displayed in tabular form, in rows and columns. [[15.1.1. TEI Tables](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html#FTTAB1)]ModulefiguresAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

rows(rows) indicates the number of rows in the table.StatusOptionalDatatype[teidata.count](#TEI.teidata.count)Note
If no number is supplied, an application must calculate the number of rows.

Rows should be presented from top to bottom.
cols(columns) indicates the number of columns in each row of the table.StatusOptionalDatatype[teidata.count](#TEI.teidata.count)Note
If no number is supplied, an application must calculate the number of columns.

Within each row, columns should be presented left to right.
Member of[model.listLike](#TEI.model.listLike)Contained bycore: [desc](#TEI.desc) [emph](#TEI.emph) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [note](#TEI.note) [p](#TEI.p) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc) [figure](#TEI.figure)header: [abstract](#TEI.abstract) [change](#TEI.change) [licence](#TEI.licence) [sourceDesc](#TEI.sourceDesc)textstructure: [back](#TEI.back) [body](#TEI.body) [div](#TEI.div)May containcore: [graphic](#TEI.graphic) [head](#TEI.head) [note](#TEI.note)figures: [figure](#TEI.figure) [formula](#TEI.formula) [row](#TEI.row)Note
Contains an optional heading and a series of rows.

Any rendition information should be supplied using the global rend attribute, at the table, row, or cell level as appropriate.
ExamplePoor Men's Lodgings in Norfolk (Mayhew, 1843)Dossing Cribs or Lodging HousesBedsNeedys or Nightly LodgersBury St Edmund's58128Thetford3636Attleboro'3520Wymondham11122Content model
<content>
 <sequence>
  <alternate minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.headLike"/>
   <classRef key="model.global"/>
  </alternate>
  <alternate>
   <sequence minOccurs="1"
    maxOccurs="unbounded">
    <elementRef key="row"/>
    <classRef key="model.global"
     minOccurs="0" maxOccurs="unbounded"/>
   </sequence>
   <sequence minOccurs="1"
    maxOccurs="unbounded">
    <classRef key="model.graphicLike"/>
    <classRef key="model.global"
     minOccurs="0" maxOccurs="unbounded"/>
   </sequence>
  </alternate>
  <sequence minOccurs="0"
   maxOccurs="unbounded">
   <classRef key="model.divBottom"/>
   <classRef key="model.global"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element table
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   attribute rows { text }?,
   attribute cols { text }?,
   (
      ( [model.headLike](#TEI.model.headLike) | [model.global](#TEI.model.global) )*,
      (
         ( ( [row](#TEI.row), [model.global](#TEI.model.global)* )+ )
       | ( ( [model.graphicLike](#TEI.model.graphicLike), [model.global](#TEI.model.global)* )+ )
      ),
      ( ( [model.divBottom](#TEI.model.divBottom), [model.global](#TEI.model.global)* )* )
   )
}
## <tag>
<tag>@type@scheme<tag> (tag) contains text of a complete start- or end-tag, possibly including attribute specifications, but excluding the opening and closing markup delimiter characters. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


typeindicates the type of XML tag intended.Derived from[att.typed](#TEI.att.typed)StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:start
* a start-tag, with delimiters < and > is intended
end
* an end-tag, with delimiters </ and > is intended
empty
* an empty tag, with delimiters < and /> is intended
pi
* a pi (processing instruction), with delimiters <? and ?> is intended
comment
* a comment, with delimiters <!-- and --> is intended
ms
* a marked-section, with delimiters <[CDATA[ and ]]> is intended
schemesupplies the name of the schema in which this tag is defined.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Sample values include:TEI
* (text encoding initiative) This tag is defined as part of the TEI scheme.[Default] 
DBK
* (docbook) this tag is part of the Docbook scheme.
XX
* (unknown) this tag is part of an unknown scheme.
Schematron
* 
HTML
* 
Member of[model.phrase.xml](#TEI.model.phrase.xml)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containCharacter data onlyExampleMark the start of each italicised phrase with a hi rend="it" tag, and its end with a hi tag.Example updated on 2008-04-05Content model
<content>
 <textNode/>
</content>
    Schema Declaration
element tag
{
   [att.global.attributes](#TEI.att.global),
   attribute type { "start" | "end" | "empty" | "pi" | "comment" | "ms" }?,
   attribute scheme { text }?,
   text
}
## <tagsDecl>
<tagsDecl>@partial<tagsDecl> (tagging declaration) provides detailed information about the tagging applied to a document. [[2.3.4. The Tagging Declaration](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD57) [2.3. The Encoding Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD5)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


partialindicates whether the element types listed exhaustively include all those found within [<text>](#TEI.text), or represent only a subset.StatusRecommendedDatatype[teidata.truthValue](#TEI.teidata.truthValue)Note
TEI recommended practice is to specify this attribute. When the tagUsage elements inside [<tagsDecl>](#TEI.tagsDecl) are used to list each of the element types in the associated [<text>](#TEI.text), the value should be given as false. When the tagUsage elements inside [<tagsDecl>](#TEI.tagsDecl) are used to provide usage information or default renditions for only a subset of the elements types within the associated [<text>](#TEI.text), the value should be true.
Contained by—May containEmpty elementExamplefont-style: italic;If the partial attribute were not specified here, the implication would be that the document in question contains only [<hi>](#TEI.hi), [<title>](#TEI.title), and para elements.Content model
<content>
 <sequence>
  <elementRef key="rendition" minOccurs="0"
   maxOccurs="unbounded"/>
  <elementRef key="namespace" minOccurs="0"
   maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element tagsDecl
{
   [att.global.attributes](#TEI.att.global),
   attribute partial { text }?,
   ( [rendition](#TEI.rendition)*, [namespace](#TEI.namespace)* )
}
## <teiHeader>
<teiHeader><teiHeader> (TEI header) supplies descriptive and declarative metadata associated with a digital resource or set of resources. [[2.1.1. The TEI Header and Its Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD11) [16.1. Varieties of Composite Text](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CC.html#CCDEF)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained bytextstructure: [TEI](#TEI.TEI)May containheader: [fileDesc](#TEI.fileDesc) [profileDesc](#TEI.profileDesc) [revisionDesc](#TEI.revisionDesc)Note
One of the few elements unconditionally required in any TEI document.
ExampleShakespeare: the first folio (1623) in electronic formShakespeare, William (1564–1616)Originally prepared byTrevor Howard-HillRevised and edited byChristine Avern-CarrOxford Text Archive13 Banbury Road, Oxford OX2 6NN, UK119Freely available on a non-commercial basis.1968The first folio of Shakespeare, prepared by Charlton Hinman (The Norton Facsimile, 1968)Originally prepared for use in the production of a series of old-spelling concordances in 1968, this text was extensively checked and revised for use during the editing of the new Oxford Shakespeare (Wells and Taylor, 1989).Turned letters are silently corrected.Original spelling and typography is retained, except that long s and ligatured forms are not encoded.A reference is created by assembling the following, in the reverse order as that listed here: the n value of the preceding lba periodthe n value of the ancestor div2a spacethe n value of the parent div112 Apr 89 Last checked by CAC1 Mar 89 LB made new fileContent model
<content>
 <sequence>
  <elementRef key="fileDesc"/>
  <classRef key="model.teiHeaderPart"
   minOccurs="0" maxOccurs="unbounded"/>
  <elementRef key="revisionDesc"
   minOccurs="0"/>
 </sequence>
</content>
    Schema Declaration
element teiHeader
{
   [att.global.attributes](#TEI.att.global),
   ( [fileDesc](#TEI.fileDesc), [model.teiHeaderPart](#TEI.model.teiHeaderPart)*, [revisionDesc](#TEI.revisionDesc)? )
}
## <term>
<term><term> (term) contains a single-word, multi-word, or symbolic designation which is regarded as a technical term. [[3.4.1. Terms and Glosses](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHTG)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.canonical](#TEI.att.canonical)
* @key

* @ref


* [att.pointing](#TEI.att.pointing)
* @targetLang

* @target

* @evaluate


* [att.typed](#TEI.att.typed)
* @type

Member of[model.emphLike](#TEI.model.emphLike)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [keywords](#TEI.keywords) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [specDesc](#TEI.specDesc) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
When this element appears within an index element, it is understood to supply the form under which an index entry is to be made for that location. Elsewhere, it is understood simply to indicate that its content is to be regarded as a technical or specialised term. It may be associated with a [<gloss>](#TEI.gloss) element by means of its ref attribute; alternatively a [<gloss>](#TEI.gloss) element may point to a [<term>](#TEI.term) element by means of its target attribute.

In formal terminological work, there is frequently discussion over whether terms must be atomic or may include multi-word lexical items, symbolic designations, or phraseological units. The [<term>](#TEI.term) element may be used to mark any of these. No position is taken on the philosophical issue of what a term can be; the looser definition simply allows the [<term>](#TEI.term) element to be used by practitioners of any persuasion.

As with other members of the att.canonical class, instances of this element occuring in a text may be associated with a canonical definition, either by means of a URI (using the ref attribute), or by means of some system-specific code value (using the key attribute). Because the mutually exclusive target and cRef attributes overlap with the function of the ref attribute, they are deprecated and may be removed at a subsequent release.
ExampleA computational device that infers structure from grammatical strings of words is known as a parser, and much of the history of NLP over the last 20 years has been occupied with the design of parsers.ExampleWe may define discoursal point of view as the relationship, expressed through discourse structure, between the implied author or some other addresser, and the fiction.ExampleWe may define discoursal point of view as the relationship, expressed through discourse structure, between the implied author or some other addresser, and the fiction.ExampleWe discuss Leech's concept of discoursal point of view below.Content model
<content>
 <macroRef key="macro.phraseSeq"/>
</content>
    Schema Declaration
element term
{
   [att.global.attributes](#TEI.att.global),
   [att.canonical.attributes](#TEI.att.canonical),
   [att.pointing.attributes](#TEI.att.pointing),
   [att.typed.attributes](#TEI.att.typed),
   [macro.phraseSeq](#TEI.macro.phraseSeq)
}
## <text>
<text><text> (text) contains a single text of any kind, whether unitary or composite, for example a poem or drama, a collection of essays, a novel, a dictionary, or a corpus sample. [[4. Default Text Structure](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DS) [16.1. Varieties of Composite Text](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CC.html#CCDEF)]ModuletextstructureAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.typed](#TEI.att.typed)
* @type

Member of[model.resource](#TEI.model.resource)Contained bytextstructure: [TEI](#TEI.TEI)May containcore: [note](#TEI.note)figures: [figure](#TEI.figure)textstructure: [back](#TEI.back) [body](#TEI.body) [front](#TEI.front)Note
This element should not be used to represent a text which is inserted at an arbitrary point within the structure of another, for example as in an embedded or quoted narrative; the floatingText is provided for this purpose.
ExampleAutumn HazeIs it a dragonfly or a maple leafThat settles softly down upon the water?ExampleThe body of a text may be replaced by a group of nested texts, as in the following schematic:Content model
<content>
 <sequence>
  <classRef key="model.global"
   minOccurs="0" maxOccurs="unbounded"/>
  <sequence minOccurs="0">
   <elementRef key="front"/>
   <classRef key="model.global"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
  <alternate>
   <elementRef key="body"/>
   <elementRef key="group"/>
  </alternate>
  <classRef key="model.global"
   minOccurs="0" maxOccurs="unbounded"/>
  <sequence minOccurs="0">
   <elementRef key="back"/>
   <classRef key="model.global"
    minOccurs="0" maxOccurs="unbounded"/>
  </sequence>
 </sequence>
</content>
    Schema Declaration
element text
{
   [att.global.attributes](#TEI.att.global),
   [att.typed.attributes](#TEI.att.typed),
   (
      [model.global](#TEI.model.global)*,
      ( ( [front](#TEI.front), [model.global](#TEI.model.global)* )? ),
      ( [body](#TEI.body) | [group](#TEI.group) ),
      [model.global](#TEI.model.global)*,
      ( ( [back](#TEI.back), [model.global](#TEI.model.global)* )? )
   )
}
## <textClass>
<textClass><textClass> (text classification) groups information which describes the nature or topic of a text in terms of a standard classification scheme, thesaurus, etc. [[2.4.3. The Text Classification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD43)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.profileDescPart](#TEI.model.profileDescPart)Contained byheader: [profileDesc](#TEI.profileDesc)May containheader: [keywords](#TEI.keywords)ExampleAcademic prose001.9End of the worldHistory - philosophyContent model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <elementRef key="classCode"/>
  <elementRef key="catRef"/>
  <elementRef key="keywords"/>
 </alternate>
</content>
    Schema Declaration
element textClass { [att.global.attributes](#TEI.att.global), ( [classCode](#TEI.classCode) | [catRef](#TEI.catRef) | [keywords](#TEI.keywords) )* }
## <textNode>
<textNode><textNode> indicates the presence of a text node in a content model. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.contentPart](#TEI.model.contentPart)Contained bytagdocs: [alternate](#TEI.alternate) [content](#TEI.content) [sequence](#TEI.sequence)May containEmpty elementExampleContent model
<content>
 <empty/>
</content>
    Schema Declaration
element textNode { [att.global.attributes](#TEI.att.global), empty }
## <title>
<title>@type@level<title> (title) contains a title for any kind of work. [[3.12.2.2. Titles, Authors, and Editors](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COBICOR) [2.2.1. The Title Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD21) [2.2.5. The Series Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD26)]ModulecoreAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.canonical](#TEI.att.canonical)
* @key

* @ref


* [att.datable](#TEI.att.datable)
* [att.datable.w3c](#TEI.att.datable.w3c)
* @when

* @notBefore

* @notAfter

* @from

* @to


typeclassifies the title according to some convenient typology.Derived from[att.typed](#TEI.att.typed)StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Sample values include:main
* main title
sub
* (subordinate) subtitle, title of part
alt
* (alternate) alternate title, often in another language, by which the work is also known
short
* abbreviated form of title
desc
* (descriptive) descriptive paraphrase of the work functioning as a title
Note
This attribute is provided for convenience in analysing titles and processing them according to their type; where such specialized processing is not necessary, there is no need for such analysis, and the entire title, including subtitles and any parallel titles, may be enclosed within a single [<title>](#TEI.title) element.
levelindicates the bibliographic level for a title, that is, whether it identifies an article, book, journal, series, or unpublished material.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:a
* (analytic) the title applies to an analytic item, such as an article, poem, or other work published as part of a larger item.
m
* (monographic) the title applies to a monograph such as a book or other item considered to be a distinct publication, including single volumes of multi-volume works
j
* (journal) the title applies to any serial or periodical publication such as a journal, magazine, or newspaper
s
* (series) the title applies to a series of otherwise distinct publications such as a collection
u
* (unpublished) the title applies to any unpublished material (including theses and dissertations unless published by a commercial press)
Note
The level of a title is sometimes implied by its context: for example, a title appearing directly within an analytic element is ipso facto of level “a”, and one appearing within a series element of level “s”. For this reason, the level attribute is not required in contexts where its value can be unambiguously inferred. Where it is supplied in such contexts, its value should not contradict the value implied by its parent element.
Member of[model.emphLike](#TEI.model.emphLike) Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence) [titleStmt](#TEI.titleStmt)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containcore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [hi](#TEI.hi) [label](#TEI.label) [list](#TEI.list) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure) [formula](#TEI.formula) [table](#TEI.table)tagdocs: [att](#TEI.att) [classSpec](#TEI.classSpec) [code](#TEI.code) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementSpec](#TEI.elementSpec) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [tag](#TEI.tag) [val](#TEI.val)character dataNote
The attributes key and ref, inherited from the class att.canonical may be used to indicate the canonical form for the title; the former, by supplying (for example) the identifier of a record in some external library system; the latter by pointing to an XML element somewhere containing the canonical form of the title.
ExampleInformation Technology and the Research Process: Proceedings of a conference held at Cranfield Institute of Technology, UK, 18–21 July 1989ExampleHardy's Tess of the D'Urbervilles: a machine readable editionExampleSynthèsean international journal for epistemology, methodology and history of scienceContent model
<content>
 <macroRef key="macro.paraContent"/>
</content>
    Schema Declaration
element title
{
   [att.global.attributes](#TEI.att.global),
   [att.canonical.attributes](#TEI.att.canonical),
   [att.datable.attributes](#TEI.att.datable),
   attribute type { text }?,
   attribute level { "a" | "m" | "j" | "s" | "u" }?,
   [macro.paraContent](#TEI.macro.paraContent)
}
## <titleStmt>
<titleStmt><titleStmt> (title statement) groups information about the title of a work and those responsible for its content. [[2.2.1. The Title Statement](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD21) [2.2. The File Description](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD2)]ModuleheaderAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Contained byheader: [fileDesc](#TEI.fileDesc)May containcore: [respStmt](#TEI.respStmt) [title](#TEI.title)ExampleCapgrave's Life of St. John Norbert: a machine-readable transcriptioncompiled byP.J. LucasContent model
<content>
 <sequence>
  <elementRef key="title" minOccurs="1"
   maxOccurs="unbounded"/>
  <classRef key="model.respLike"
   minOccurs="0" maxOccurs="unbounded"/>
 </sequence>
</content>
    Schema Declaration
element titleStmt { [att.global.attributes](#TEI.att.global), ( [title](#TEI.title)+, [model.respLike](#TEI.model.respLike)* ) }
## <val>
<val><val> (value) contains a single attribute value. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD) [23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source


Member of[model.phrase.xml](#TEI.model.phrase.xml)Contained bycore: [abbr](#TEI.abbr) [desc](#TEI.desc) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [head](#TEI.head) [hi](#TEI.hi) [item](#TEI.item) [label](#TEI.label) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [resp](#TEI.resp) [term](#TEI.term) [title](#TEI.title)figures: [cell](#TEI.cell) [figDesc](#TEI.figDesc)header: [change](#TEI.change) [distributor](#TEI.distributor) [edition](#TEI.edition) [licence](#TEI.licence)tagdocs: [eg](#TEI.eg) [valDesc](#TEI.valDesc)May containCharacter data onlyExampleunknownContent model
<content>
 <textNode/>
</content>
    Schema Declaration
element val { [att.global.attributes](#TEI.att.global), text }
## <valDesc>
<valDesc><valDesc> (value description) specifies any semantic or syntactic constraint on the value that an attribute may take, additional to the information carried by the [<datatype>](#TEI.datatype) element. [[23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil



* [att.translatable](#TEI.att.translatable)
* @versionDate

Contained bytagdocs: [attDef](#TEI.attDef)May containcore: [abbr](#TEI.abbr) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [hi](#TEI.hi) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [q](#TEI.q) [ref](#TEI.ref) [term](#TEI.term) [title](#TEI.title)figures: [figure](#TEI.figure)tagdocs: [att](#TEI.att) [code](#TEI.code) [gi](#TEI.gi) [ident](#TEI.ident) [listRef](#TEI.listRef) [tag](#TEI.tag) [val](#TEI.val)character dataExamplemust point to another align element logically preceding this one.Content model
<content>
 <macroRef key="macro.phraseSeq.limited"/>
</content>
    Schema Declaration
element valDesc
{
   [att.global.attributes](#TEI.att.global),
   [att.combinable.attributes](#TEI.att.combinable),
   [att.translatable.attributes](#TEI.att.translatable),
   [macro.phraseSeq.limited](#TEI.macro.phraseSeq.limited)
}
## <valItem>
<valItem>@ident<valItem> documents a single value in a predefined list of values. [[23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil


identspecifies the value concerned.StatusRequiredDatatype[teidata.text](#TEI.teidata.text)Contained bytagdocs: [valList](#TEI.valList)May containcore: [desc](#TEI.desc) [gloss](#TEI.gloss)tagdocs: [remarks](#TEI.remarks)Exampledoudubiousused when the application of this element is doubtful or uncertainExampleThe [<remarks>](#TEI.remarks) element is only allowed within [<valItem>](#TEI.valItem) if the [<desc>](#TEI.desc) element is also present:used to signify that there is border around a page.used to signify that there is a border made of ruled lines.used to signify that there is an ornamental border.catchwordfor catch words.line numberfor printed line numbers (usually in poetry).list headingfor headings of lists or similar constructs; often used in tables of contents for the page heading.page numberfor page numbers.press figurefor press figures. These are usually numbers, but are not sequential or regularly printed like signatures.signaturefor printed signatures.for a metawork whose function you do not know.volume numberfor printed volume numbers.anything not covered by the above values.Used for an ornament, decorated tool line, or symbol(s) that is not officially a delimiter (and thus there is no element on which to put pre() or post()) but is used to fill space at the bottom of a page so that a floatingText or similar can start at the top of the next.Content model
<content>
 <sequence>
  <classRef key="model.identSynonyms"
   minOccurs="0" maxOccurs="unbounded"/>
  <sequence minOccurs="0">
   <classRef key="model.descLike"
    minOccurs="1" maxOccurs="unbounded"/>
   <sequence minOccurs="0"
    maxOccurs="unbounded">
    <classRef key="model.identSynonyms"
     minOccurs="1" maxOccurs="1"/>
    <classRef key="model.descLike"
     minOccurs="0" maxOccurs="unbounded"/>
   </sequence>
   <elementRef key="remarks" minOccurs="0"
    maxOccurs="unbounded"/>
  </sequence>
  <elementRef key="paramList" minOccurs="0"
   maxOccurs="1"/>
 </sequence>
</content>
    Schema Declaration
element valItem
{
   [att.global.attributes](#TEI.att.global),
   [att.combinable.attributes](#TEI.att.combinable),
   attribute ident { text },
   (
      [model.identSynonyms](#TEI.model.identSynonyms)*,
      (
         (
            [model.descLike](#TEI.model.descLike)+,
            ( ( [model.identSynonyms](#TEI.model.identSynonyms), [model.descLike](#TEI.model.descLike)* )* ),
            [remarks](#TEI.remarks)*
         )?
      ),
      [paramList](#TEI.paramList)?
   )
}
## <valList>
<valList>@type<valList> (value list) contains one or more [<valItem>](#TEI.valItem) elements defining possible values. [[23.5.3. Attribute List Specification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDATT)]ModuletagdocsAttributes
* [att.global](#TEI.att.global)
* @xml:id

* @n

* @xml:lang

* @xml:base

* @xml:space

* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source



* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil


typespecifies the extensibility of the list of values specified.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:closed
* only the values specified are permitted.
semi
* (semi-open) all the values specified should be supported, but other values are legal and software should have appropriate fallback processing for them.
open
* the values specified are sample values only.[Default] 
Contained bytagdocs: [alternate](#TEI.alternate) [attDef](#TEI.attDef) [content](#TEI.content) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec)May containtagdocs: [valItem](#TEI.valItem)ExamplerequiredrecommendedoptionalContent model
<content>
 <elementRef key="valItem" minOccurs="0"
  maxOccurs="unbounded"/>
</content>
    Schema Declaration
element valList
{
   [att.global.attributes](#TEI.att.global),
   [att.combinable.attributes](#TEI.att.combinable),
   attribute type { "closed" | "semi" | "open" }?,
   [valItem](#TEI.valItem)*
}
# Model classes

## model.attributable
model.attributablemodel.attributable (model class) groups elements that contain a word or phrase that can be attributed to a source. [[3.3.3. Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQQ) [4.3.2. Floating Texts](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSFLT)]ModuleteiUsed by[macro.phraseSeq](#TEI.macro.phraseSeq) [model.inter](#TEI.model.inter)Members[model.quoteLike](#TEI.model.quoteLike)[[quote](#TEI.quote)]
## model.availabilityPart
model.availabilityPartmodel.availabilityPart (model class) groups elements such as licences and paragraphs of text which may appear as part of an availability statement. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModuleteiUsed by[availability](#TEI.availability)Members[licence](#TEI.licence)
## model.common
model.commonmodel.common (model class) groups common chunk- and inter-level elements. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[body](#TEI.body) [div](#TEI.div) [figure](#TEI.figure)Members[model.cmc](#TEI.model.cmc) [model.divPart](#TEI.model.divPart)[[model.lLike](#TEI.model.lLike) [model.pLike](#TEI.model.pLike)[[p](#TEI.p)]] [model.inter](#TEI.model.inter)[[model.attributable](#TEI.model.attributable)[[model.quoteLike](#TEI.model.quoteLike)[[quote](#TEI.quote)]] [model.biblLike](#TEI.model.biblLike) [model.egLike](#TEI.model.egLike)[[eg](#TEI.eg) [egXML](#TEI.egXML)] [model.labelLike](#TEI.model.labelLike)[[desc](#TEI.desc) [label](#TEI.label)] [model.listLike](#TEI.model.listLike)[[list](#TEI.list) [table](#TEI.table)] [model.oddDecl](#TEI.model.oddDecl)[[classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)] [model.stageLike](#TEI.model.stageLike)] [q](#TEI.q)Note
This class defines the set of chunk- and inter-level elements; it is used in many content models, including those for textual divisions.

## model.contentPart
model.contentPartmodel.contentPart (model class) groups elements which may appear as part of the content element. [[23.5.1. Defining Content Models](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#DEFCON)]ModuletagdocsUsed by[alternate](#TEI.alternate) [content](#TEI.content) [sequence](#TEI.sequence)Members[alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [classRef](#TEI.classRef) [dataRef](#TEI.dataRef) [elementRef](#TEI.elementRef) [empty](#TEI.empty) [macroRef](#TEI.macroRef) [sequence](#TEI.sequence) [textNode](#TEI.textNode)
## model.descLike
model.descLikemodel.descLike (model class) groups elements which contain a description of their function.ModuleteiUsed by[attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [graphic](#TEI.graphic) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec) [valItem](#TEI.valItem)Members[desc](#TEI.desc)
## model.divBottom
model.divBottommodel.divBottom (model class) groups elements appearing at the end of a text division. [[4.2. Elements Common to All Divisions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSDTB)]ModuleteiUsed by[body](#TEI.body) [div](#TEI.div) [figure](#TEI.figure) [front](#TEI.front) [list](#TEI.list) [table](#TEI.table)Members[model.divBottomPart](#TEI.model.divBottomPart) [model.divWrapper](#TEI.model.divWrapper)
## model.divGenLike
model.divGenLikemodel.divGenLike (model class) groups elements used to represent a structural division which is generated rather than explicitly present in the source.ModuleteiUsed by[body](#TEI.body) [div](#TEI.div)Members[divGen](#TEI.divGen)
## model.divLike
model.divLikemodel.divLike (model class) groups elements used to represent un-numbered generic structural divisions.ModuleteiUsed by[back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [front](#TEI.front)Members[div](#TEI.div) [include](#TEI.include)
## model.divPart
model.divPartmodel.divPart (model class) groups paragraph-level elements appearing directly within divisions. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[macro.specialPara](#TEI.macro.specialPara) [model.common](#TEI.model.common) [specGrp](#TEI.specGrp)Members[model.lLike](#TEI.model.lLike) [model.pLike](#TEI.model.pLike)[[p](#TEI.p)]Note
Note that this element class does not include members of the model.inter class, which can appear either within or between paragraph-level items.

## model.divTop
model.divTopmodel.divTop (model class) groups elements appearing at the beginning of a text division. [[4.2. Elements Common to All Divisions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSDTB)]ModuleteiUsed by[body](#TEI.body) [div](#TEI.div) [list](#TEI.list)Members[model.divTopPart](#TEI.model.divTopPart)[[model.headLike](#TEI.model.headLike)[[head](#TEI.head)]] [model.divWrapper](#TEI.model.divWrapper)
## model.divTopPart
model.divTopPartmodel.divTopPart (model class) groups elements which can occur only at the beginning of a text division. [[4.6. Title Pages](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSTITL)]ModuleteiUsed by[model.divTop](#TEI.model.divTop)Members[model.headLike](#TEI.model.headLike)[[head](#TEI.head)]
## model.egLike
model.egLikemodel.egLike (model class) groups elements containing examples or illustrations. [[23.1.1. Phrase Level Terms](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDphraseTE)]ModuleteiUsed by[model.inter](#TEI.model.inter)Members[eg](#TEI.eg) [egXML](#TEI.egXML)
## model.emphLike
model.emphLikemodel.emphLike (model class) groups phrase-level elements which are typographically distinct and to which a specific function can be attributed. [[3.3. Highlighting and Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQ)]ModuleteiUsed by[model.highlighted](#TEI.model.highlighted) [model.limitedPhrase](#TEI.model.limitedPhrase)Members[code](#TEI.code) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [ident](#TEI.ident) [term](#TEI.term) [title](#TEI.title)
## model.frontPart
model.frontPartmodel.frontPart (model class) groups elements which appear at the level of divisions within front or back matter. [[7.1. Front and Back Matter ](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DR.html#DRFAB)]ModuleteiUsed by[back](#TEI.back) [front](#TEI.front)Members[model.frontPart.drama](#TEI.model.frontPart.drama) [divGen](#TEI.divGen) [schemaSpec](#TEI.schemaSpec)
## model.global
model.globalmodel.global (model class) groups elements which may appear at any point within a TEI text. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[back](#TEI.back) [body](#TEI.body) [div](#TEI.div) [figure](#TEI.figure) [front](#TEI.front) [head](#TEI.head) [list](#TEI.list) [macro.phraseSeq](#TEI.macro.phraseSeq) [macro.phraseSeq.limited](#TEI.macro.phraseSeq.limited) [macro.specialPara](#TEI.macro.specialPara) [model.paraPart](#TEI.model.paraPart) [table](#TEI.table) [text](#TEI.text)Members[model.global.edit](#TEI.model.global.edit) [model.global.meta](#TEI.model.global.meta) [model.milestoneLike](#TEI.model.milestoneLike) [model.noteLike](#TEI.model.noteLike)[[note](#TEI.note)] [figure](#TEI.figure)
## model.graphicLike
model.graphicLikemodel.graphicLike (model class) groups elements containing images, formulae, and similar objects. [[3.10. Graphics and Other Non-textual Components](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COGR)]ModuleteiUsed by[figure](#TEI.figure) [formula](#TEI.formula) [model.phrase](#TEI.model.phrase) [table](#TEI.table)Members[formula](#TEI.formula) [graphic](#TEI.graphic)
## model.headLike
model.headLikemodel.headLike (model class) groups elements used to provide a title or heading at the start of a text division.ModuleteiUsed by[divGen](#TEI.divGen) [figure](#TEI.figure) [model.divTopPart](#TEI.model.divTopPart) [table](#TEI.table)Members[head](#TEI.head)
## model.hiLike
model.hiLikemodel.hiLike (model class) groups phrase-level elements which are typographically distinct but to which no specific function can be attributed. [[3.3. Highlighting and Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQ)]ModuleteiUsed by[formula](#TEI.formula) [model.highlighted](#TEI.model.highlighted) [model.limitedPhrase](#TEI.model.limitedPhrase)Members[hi](#TEI.hi) [q](#TEI.q)
## model.highlighted
model.highlightedmodel.highlighted (model class) groups phrase-level elements which are typographically distinct. [[3.3. Highlighting and Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQ)]ModuleteiUsed by[model.phrase](#TEI.model.phrase)Members[model.emphLike](#TEI.model.emphLike)[[code](#TEI.code) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [ident](#TEI.ident) [term](#TEI.term) [title](#TEI.title)] [model.hiLike](#TEI.model.hiLike)[[hi](#TEI.hi) [q](#TEI.q)]
## model.identEquiv
model.identEquivmodel.identEquiv (model class) groups elements which provide an equivalent value to the identity of their parent element, either as a formal construct or in natural language.ModuleteiUsed by[constraintDecl](#TEI.constraintDecl) [model.identSynonyms](#TEI.model.identSynonyms) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec)Members[gloss](#TEI.gloss)
## model.identSynonyms
model.identSynonymsmodel.identSynonyms (model class) groups elements which provide an explanation, equivalency, or alternative name for a markup construct.ModuleteiUsed by[attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [valItem](#TEI.valItem)Members[model.identEquiv](#TEI.model.identEquiv)[[gloss](#TEI.gloss)]
## model.inter
model.intermodel.inter (model class) groups elements which can appear either within or between paragraph-like elements. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[head](#TEI.head) [macro.limitedContent](#TEI.macro.limitedContent) [macro.specialPara](#TEI.macro.specialPara) [model.common](#TEI.model.common) [model.paraPart](#TEI.model.paraPart)Members[model.attributable](#TEI.model.attributable)[[model.quoteLike](#TEI.model.quoteLike)[[quote](#TEI.quote)]] [model.biblLike](#TEI.model.biblLike) [model.egLike](#TEI.model.egLike)[[eg](#TEI.eg) [egXML](#TEI.egXML)] [model.labelLike](#TEI.model.labelLike)[[desc](#TEI.desc) [label](#TEI.label)] [model.listLike](#TEI.model.listLike)[[list](#TEI.list) [table](#TEI.table)] [model.oddDecl](#TEI.model.oddDecl)[[classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)] [model.stageLike](#TEI.model.stageLike)
## model.labelLike
model.labelLikemodel.labelLike (model class) groups elements used to gloss or explain other parts of a document.ModuleteiUsed by[model.inter](#TEI.model.inter)Members[desc](#TEI.desc) [label](#TEI.label)
## model.limitedPhrase
model.limitedPhrasemodel.limitedPhrase (model class) groups phrase-level elements excluding those elements primarily intended for transcription of existing sources. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[macro.limitedContent](#TEI.macro.limitedContent) [macro.phraseSeq.limited](#TEI.macro.phraseSeq.limited)Members[model.emphLike](#TEI.model.emphLike)[[code](#TEI.code) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [ident](#TEI.ident) [term](#TEI.term) [title](#TEI.title)] [model.hiLike](#TEI.model.hiLike)[[hi](#TEI.hi) [q](#TEI.q)] [model.pPart.data](#TEI.model.pPart.data)[[model.addressLike](#TEI.model.addressLike) [model.dateLike](#TEI.model.dateLike) [model.measureLike](#TEI.model.measureLike) [model.nameLike](#TEI.model.nameLike)[[model.nameLike.agent](#TEI.model.nameLike.agent)[[name](#TEI.name)] [model.offsetLike](#TEI.model.offsetLike) [model.placeStateLike](#TEI.model.placeStateLike)[[model.placeNamePart](#TEI.model.placeNamePart)]]] [model.pPart.editorial](#TEI.model.pPart.editorial)[[abbr](#TEI.abbr)] [model.pPart.msdesc](#TEI.model.pPart.msdesc) [model.phrase.xml](#TEI.model.phrase.xml)[[att](#TEI.att) [gi](#TEI.gi) [tag](#TEI.tag) [val](#TEI.val)] [model.ptrLike](#TEI.model.ptrLike)[[listRef](#TEI.listRef) [ptr](#TEI.ptr) [ref](#TEI.ref)]
## model.listLike
model.listLikemodel.listLike (model class) groups list-like elements. [[3.8. Lists](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COLI)]ModuleteiUsed by[abstract](#TEI.abstract) [back](#TEI.back) [model.inter](#TEI.model.inter) [sourceDesc](#TEI.sourceDesc)Members[list](#TEI.list) [table](#TEI.table)
## model.nameLike
model.nameLikemodel.nameLike (model class) groups elements which name or refer to a person, place, or organization.ModuleteiUsed by[model.pPart.data](#TEI.model.pPart.data)Members[model.nameLike.agent](#TEI.model.nameLike.agent)[[name](#TEI.name)] [model.offsetLike](#TEI.model.offsetLike) [model.placeStateLike](#TEI.model.placeStateLike)[[model.placeNamePart](#TEI.model.placeNamePart)]Note
A superset of the naming elements that may appear in datelines, addresses, statements of responsibility, etc.

## model.nameLike.agent
model.nameLike.agentmodel.nameLike.agent (model class) groups elements which contain names of individuals or corporate bodies. [[3.6. Names, Numbers, Dates, Abbreviations, and Addresses](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONA)]ModuleteiUsed by[model.nameLike](#TEI.model.nameLike) [respStmt](#TEI.respStmt)Members[name](#TEI.name)Note
This class is used in the content model of elements which reference names of people or organizations.

## model.noteLike
model.noteLikemodel.noteLike (model class) groups globally-available note-like elements. [[3.9. Notes, Annotation, and Indexing](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONO)]ModuleteiUsed by[model.global](#TEI.model.global)Members[note](#TEI.note)
## model.oddDecl
model.oddDeclmodel.oddDecl (model class) groups elements which generate declarations in some markup language in ODD documents.ModuleteiUsed by[model.inter](#TEI.model.inter) [schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)Members[classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)
## model.oddRef
model.oddRefmodel.oddRef (model class) groups elements which reference declarations in some markup language in ODD documents.ModuleteiUsed by[schemaSpec](#TEI.schemaSpec) [specGrp](#TEI.specGrp)Members[classRef](#TEI.classRef) [dataRef](#TEI.dataRef) [elementRef](#TEI.elementRef) [include](#TEI.include) [macroRef](#TEI.macroRef) [moduleRef](#TEI.moduleRef)
## model.pLike
model.pLikemodel.pLike (model class) groups paragraph-like elements.ModuleteiUsed by[abstract](#TEI.abstract) [availability](#TEI.availability) [back](#TEI.back) [editionStmt](#TEI.editionStmt) [exemplum](#TEI.exemplum) [front](#TEI.front) [model.divPart](#TEI.model.divPart) [publicationStmt](#TEI.publicationStmt) [remarks](#TEI.remarks) [sourceDesc](#TEI.sourceDesc)Members[p](#TEI.p)
## model.pLike.front
model.pLike.frontmodel.pLike.front (model class) groups paragraph-like elements which can occur as direct constituents of front matter. [[4.6. Title Pages](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSTITL)]ModuleteiUsed by[back](#TEI.back) [front](#TEI.front)Members[head](#TEI.head)
## model.pPart.data
model.pPart.datamodel.pPart.data (model class) groups phrase-level elements containing names, dates, numbers, measures, and similar data. [[3.6. Names, Numbers, Dates, Abbreviations, and Addresses](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONA)]ModuleteiUsed by[model.limitedPhrase](#TEI.model.limitedPhrase) [model.phrase](#TEI.model.phrase)Members[model.addressLike](#TEI.model.addressLike) [model.dateLike](#TEI.model.dateLike) [model.measureLike](#TEI.model.measureLike) [model.nameLike](#TEI.model.nameLike)[[model.nameLike.agent](#TEI.model.nameLike.agent)[[name](#TEI.name)] [model.offsetLike](#TEI.model.offsetLike) [model.placeStateLike](#TEI.model.placeStateLike)[[model.placeNamePart](#TEI.model.placeNamePart)]]
## model.pPart.edit
model.pPart.editmodel.pPart.edit (model class) groups phrase-level elements for simple editorial correction and transcription. [[3.5. Simple Editorial Changes](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COED)]ModuleteiUsed by[model.phrase](#TEI.model.phrase)Members[model.pPart.editorial](#TEI.model.pPart.editorial)[[abbr](#TEI.abbr)] [model.pPart.transcriptional](#TEI.model.pPart.transcriptional)
## model.pPart.editorial
model.pPart.editorialmodel.pPart.editorial (model class) groups phrase-level elements for simple editorial interventions that may be useful both in transcribing and in authoring. [[3.5. Simple Editorial Changes](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COED)]ModuleteiUsed by[model.limitedPhrase](#TEI.model.limitedPhrase) [model.pPart.edit](#TEI.model.pPart.edit)Members[abbr](#TEI.abbr)
## model.paraPart
model.paraPartmodel.paraPart (model class) groups elements that may appear in paragraphs and similar elements. [[3.1. Paragraphs](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COPA)]ModuleteiUsed by[macro.paraContent](#TEI.macro.paraContent)Members[model.gLike](#TEI.model.gLike) [model.global](#TEI.model.global)[[model.global.edit](#TEI.model.global.edit) [model.global.meta](#TEI.model.global.meta) [model.milestoneLike](#TEI.model.milestoneLike) [model.noteLike](#TEI.model.noteLike)[[note](#TEI.note)] [figure](#TEI.figure)] [model.inter](#TEI.model.inter)[[model.attributable](#TEI.model.attributable)[[model.quoteLike](#TEI.model.quoteLike)[[quote](#TEI.quote)]] [model.biblLike](#TEI.model.biblLike) [model.egLike](#TEI.model.egLike)[[eg](#TEI.eg) [egXML](#TEI.egXML)] [model.labelLike](#TEI.model.labelLike)[[desc](#TEI.desc) [label](#TEI.label)] [model.listLike](#TEI.model.listLike)[[list](#TEI.list) [table](#TEI.table)] [model.oddDecl](#TEI.model.oddDecl)[[classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef)] [model.stageLike](#TEI.model.stageLike)] [model.lLike](#TEI.model.lLike) [model.phrase](#TEI.model.phrase)[[model.graphicLike](#TEI.model.graphicLike)[[formula](#TEI.formula) [graphic](#TEI.graphic)] [model.highlighted](#TEI.model.highlighted)[[model.emphLike](#TEI.model.emphLike)[[code](#TEI.code) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [ident](#TEI.ident) [term](#TEI.term) [title](#TEI.title)] [model.hiLike](#TEI.model.hiLike)[[hi](#TEI.hi) [q](#TEI.q)]] [model.lPart](#TEI.model.lPart) [model.pPart.data](#TEI.model.pPart.data)[[model.addressLike](#TEI.model.addressLike) [model.dateLike](#TEI.model.dateLike) [model.measureLike](#TEI.model.measureLike) [model.nameLike](#TEI.model.nameLike)[[model.nameLike.agent](#TEI.model.nameLike.agent)[[name](#TEI.name)] [model.offsetLike](#TEI.model.offsetLike) [model.placeStateLike](#TEI.model.placeStateLike)[[model.placeNamePart](#TEI.model.placeNamePart)]]] [model.pPart.edit](#TEI.model.pPart.edit)[[model.pPart.editorial](#TEI.model.pPart.editorial)[[abbr](#TEI.abbr)] [model.pPart.transcriptional](#TEI.model.pPart.transcriptional)] [model.pPart.msdesc](#TEI.model.pPart.msdesc) [model.phrase.xml](#TEI.model.phrase.xml)[[att](#TEI.att) [gi](#TEI.gi) [tag](#TEI.tag) [val](#TEI.val)] [model.ptrLike](#TEI.model.ptrLike)[[listRef](#TEI.listRef) [ptr](#TEI.ptr) [ref](#TEI.ref)] [model.segLike](#TEI.model.segLike) [model.specDescLike](#TEI.model.specDescLike)[[specDesc](#TEI.specDesc) [specList](#TEI.specList)]]
## model.phrase
model.phrasemodel.phrase (model class) groups elements which can occur at the level of individual words or phrases. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[head](#TEI.head) [macro.phraseSeq](#TEI.macro.phraseSeq) [macro.specialPara](#TEI.macro.specialPara) [model.paraPart](#TEI.model.paraPart)Members[model.graphicLike](#TEI.model.graphicLike)[[formula](#TEI.formula) [graphic](#TEI.graphic)] [model.highlighted](#TEI.model.highlighted)[[model.emphLike](#TEI.model.emphLike)[[code](#TEI.code) [emph](#TEI.emph) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [ident](#TEI.ident) [term](#TEI.term) [title](#TEI.title)] [model.hiLike](#TEI.model.hiLike)[[hi](#TEI.hi) [q](#TEI.q)]] [model.lPart](#TEI.model.lPart) [model.pPart.data](#TEI.model.pPart.data)[[model.addressLike](#TEI.model.addressLike) [model.dateLike](#TEI.model.dateLike) [model.measureLike](#TEI.model.measureLike) [model.nameLike](#TEI.model.nameLike)[[model.nameLike.agent](#TEI.model.nameLike.agent)[[name](#TEI.name)] [model.offsetLike](#TEI.model.offsetLike) [model.placeStateLike](#TEI.model.placeStateLike)[[model.placeNamePart](#TEI.model.placeNamePart)]]] [model.pPart.edit](#TEI.model.pPart.edit)[[model.pPart.editorial](#TEI.model.pPart.editorial)[[abbr](#TEI.abbr)] [model.pPart.transcriptional](#TEI.model.pPart.transcriptional)] [model.pPart.msdesc](#TEI.model.pPart.msdesc) [model.phrase.xml](#TEI.model.phrase.xml)[[att](#TEI.att) [gi](#TEI.gi) [tag](#TEI.tag) [val](#TEI.val)] [model.ptrLike](#TEI.model.ptrLike)[[listRef](#TEI.listRef) [ptr](#TEI.ptr) [ref](#TEI.ref)] [model.segLike](#TEI.model.segLike) [model.specDescLike](#TEI.model.specDescLike)[[specDesc](#TEI.specDesc) [specList](#TEI.specList)]Note
This class of elements can occur within paragraphs, list items, lines of verse, etc.

## model.phrase.xml
model.phrase.xmlmodel.phrase.xml (model class) groups phrase-level elements used to encode XML constructs such as element names, attribute names, and attribute values. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuleteiUsed by[model.limitedPhrase](#TEI.model.limitedPhrase) [model.phrase](#TEI.model.phrase)Members[att](#TEI.att) [gi](#TEI.gi) [tag](#TEI.tag) [val](#TEI.val)
## model.placeStateLike
model.placeStateLikemodel.placeStateLike (model class) groups elements which describe changing states of a place.ModuleteiUsed by[model.nameLike](#TEI.model.nameLike)Members[model.placeNamePart](#TEI.model.placeNamePart)
## model.profileDescPart
model.profileDescPartmodel.profileDescPart (model class) groups elements which may be used inside [<profileDesc>](#TEI.profileDesc) and appear multiple times.ModuleteiUsed by[profileDesc](#TEI.profileDesc)Members[abstract](#TEI.abstract) [textClass](#TEI.textClass)
## model.ptrLike
model.ptrLikemodel.ptrLike (model class) groups elements used for purposes of location and reference. [[3.7. Simple Links and Cross-References](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COXR)]ModuleteiUsed by[listRef](#TEI.listRef) [model.limitedPhrase](#TEI.model.limitedPhrase) [model.phrase](#TEI.model.phrase) [model.publicationStmtPart.detail](#TEI.model.publicationStmtPart.detail)Members[listRef](#TEI.listRef) [ptr](#TEI.ptr) [ref](#TEI.ref)
## model.publicationStmtPart.agency
model.publicationStmtPart.agencymodel.publicationStmtPart.agency (model class) groups the child elements of a [<publicationStmt>](#TEI.publicationStmt) element of the TEI header that indicate an authorising agent. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModuleteiUsed by[publicationStmt](#TEI.publicationStmt)Members[distributor](#TEI.distributor) [publisher](#TEI.publisher)Note
The agency child elements, while not required, are required if one of the detail child elements is to be used. It is not valid to have a detail child element without a preceding agency child element.

See also model.publicationStmtPart.detail.

## model.publicationStmtPart.detail
model.publicationStmtPart.detailmodel.publicationStmtPart.detail (model class) groups the agency-specific child elements of the [<publicationStmt>](#TEI.publicationStmt) element of the TEI header. [[2.2.4. Publication, Distribution, Licensing, etc.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html#HD24)]ModuleteiUsed by[publicationStmt](#TEI.publicationStmt)Members[model.ptrLike](#TEI.model.ptrLike)[[listRef](#TEI.listRef) [ptr](#TEI.ptr) [ref](#TEI.ref)] [availability](#TEI.availability)Note
A detail child element may not occur unless an agency child element precedes it.

See also model.publicationStmtPart.agency.

## model.quoteLike
model.quoteLikemodel.quoteLike (model class) groups elements used to directly contain quotations.ModuleteiUsed by[model.attributable](#TEI.model.attributable)Members[quote](#TEI.quote)
## model.resource
model.resourcemodel.resource (model class) groups separate elements which constitute the content of a digital resource, as opposed to its metadata. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[TEI](#TEI.TEI)Members[text](#TEI.text)
## model.respLike
model.respLikemodel.respLike (model class) groups elements which are used to indicate intellectual or other significant responsibility, for example within a bibliographic element.ModuleteiUsed by[editionStmt](#TEI.editionStmt) [titleStmt](#TEI.titleStmt)Members[respStmt](#TEI.respStmt)
## model.specDescLike
model.specDescLikemodel.specDescLike (model class) groups elements for referring to specification elements. [[23. Documentation Elements](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TD)]ModuleteiUsed by[model.phrase](#TEI.model.phrase)Members[specDesc](#TEI.specDesc) [specList](#TEI.specList)
## model.teiHeaderPart
model.teiHeaderPartmodel.teiHeaderPart (model class) groups high level elements which may appear more than once in a TEI header.ModuleteiUsed by[teiHeader](#TEI.teiHeader)Members[profileDesc](#TEI.profileDesc)
# Attribute classes

## att.ascribed
att.ascribedatt.ascribed (attribute class)@who provides attributes for elements representing speech or action that can be ascribed to a specific individual. [[3.3.3. Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQQ) [8.3. Elements Unique to Spoken Texts](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TS.html#TSBA)]ModuleteiMembers[change](#TEI.change)Attributeswhoindicates the person, or group of people, to whom the element content is ascribed.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceIn the following example from Hamlet, speeches (sp) in the body of the play are linked to role elements in the castList using the who attribute.BernardoFranciscoa soldierBernardoWho's there?FranciscoNay, answer me: stand, and unfold yourself.Note
For transcribed speech, this will typically identify a participant or participant group; in other contexts, it will point to any identified person element.

## att.canonical
att.canonicalatt.canonical (attribute class)@key@ref provides attributes that can be used to associate a representation such as a name or title with canonical information about the object being named or referenced. [[14.1.1. Linking Names and Their Referents](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDATTSnr)]ModuleteiMembers[att.naming](#TEI.att.naming)[[att.personal](#TEI.att.personal)[[name](#TEI.name)]] [distributor](#TEI.distributor) [publisher](#TEI.publisher) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [term](#TEI.term) [title](#TEI.title)Attributeskeyprovides an externally-defined means of identifying the entity (or entities) being named, using a coded value of some kind.StatusOptionalDatatype[teidata.text](#TEI.teidata.text)Victor HugoNote
The value may be a unique identifier from a database, or any other externally-defined string identifying the referent. No particular syntax is proposed for the values of the key attribute, since its form will depend entirely on practice within a given project.
ref(reference) provides an explicit means of locating a full definition or identity for the entity being named by means of one or more URIs.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceSeamus HeaneyNote
The value must point directly to one or more XML elements or other resources by means of one or more URIs, separated by whitespace. If more than one is supplied the implication is that the name identifies several distinct entities.
ExampleIn this contrived example, a canonical reference to the same organisation is provided in four different ways.New Zealand Parliament, Legislative Council   New Zealand Parliament, Legislative Council   New Zealand Parliament, Legislative Council   New Zealand Parliament, Legislative CouncilThe first presumes the availability of an internet connection and a processor that can resolve a URI (most can). The second requires, in addition, a prefixDef that declares how the nzvm prefix should be interpreted. The third does not require an internet connection, but does require that a file named named_entities.xml be in the same directory as the TEI document. The fourth requires that an entire external system for key resolution be available.Note
The key attribute is more flexible and general-purpose, but its use in interchange requires that documentation about how the key is to be resolved be sent to the recipient of the TEI document. In contrast values of the ref attribute are resolved using the widely accepted protocols for a URI, and thus less documentation, if any, is likely required by the recipient in data interchange.

These guidelines provide no semantic basis or suggested precedence when both key and ref are provided. For this reason simultaneous use of both is not recommended unless documentation explaining the use is provided, probably in an ODD customizaiton, for interchange.

## att.combinable
att.combinableatt.combinable (attribute class)@mode provides attributes indicating how multiple references to the same object in a schema should be combined.ModuletagdocsMembers[att.identified](#TEI.att.identified)[[attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec)] [defaultVal](#TEI.defaultVal) [remarks](#TEI.remarks) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem) [valList](#TEI.valList)Attributes
* [att.deprecated](#TEI.att.deprecated)
* @validUntil

modespecifies the effect of this declaration on its parent object.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:add
* this declaration is part of the current definitions.[Default] 
delete
* the object with the same identifier (and namespace in the case of an element or attribute) as the current one is no longer part of the current definitions
change
* this declaration changes the object of the same identifier (and namespace in the case of an element or attribute) in the current definition
replace
* this declaration replaces the object with the same identifier (and namespace in the case of an element or attribute) in the current definition.
Note
An ODD processor should handle the values for mode as follows: add
* the object should be created (processing any children in add mode); raise an error if the object has an identifier and an object with the same identifier (and namespace in the case of an element or attribute) already exists.
replace
* use this object in preference to any existing object with the same identifier (and namespace in the case of an element or attribute), and ignore any children of that object; process any new children in replace mode
delete
* do not process this object or any existing object with the same identifier (and namespace in the case of an element or attribute); the element carrying this attribute must be empty: raise an error if there are any children
change
* process this object and its children, replacing only those components of an existing object of the same type with the same identifier (and namespace in case of an element or attribute) that are explicitly specified. This will change only those existing attribute values and child elements that appear both in the original specification and in the new specification. Other children from the original specification will be preserved.


## att.datable
att.datableatt.datable (attribute class) provides attributes for normalization of elements that contain dates, times, or datable events. [[3.6.4. Dates and Times](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONADA) [14.4. Dates](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDDATE)]ModuleteiMembers[change](#TEI.change) [licence](#TEI.licence) [name](#TEI.name) [resp](#TEI.resp) [title](#TEI.title)Attributes
* [att.datable.w3c](#TEI.att.datable.w3c)
* @when

* @notBefore

* @notAfter

* @from

* @to

Note
This superclass provides attributes that can be used to provide normalized values of temporal information. By default, the attributes from the att.datable.w3c class are provided. If the module for names & dates is loaded, this class also provides attributes from the att.datable.iso and att.datable.custom classes. In general, the possible values of attributes restricted to the W3C datatypes form a subset of those values available via the ISO 8601 standard. However, the greater expressiveness of the ISO datatypes may not be needed, and there exists much greater software support for the W3C datatypes.

## att.datable.w3c
att.datable.w3catt.datable.w3c (attribute class)@when@notBefore@notAfter@from@to provides attributes for normalization of elements that contain datable events conforming to the W3C [XML Schema Part 2: Datatypes Second Edition](#XSD2). [[3.6.4. Dates and Times](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONADA) [14.4. Dates](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDDATE)]ModuleteiMembers[att.datable](#TEI.att.datable)[[change](#TEI.change) [licence](#TEI.licence) [name](#TEI.name) [resp](#TEI.resp) [title](#TEI.title)]Attributeswhensupplies the value of the date or time in a standard form, e.g. yyyy-mm-dd.StatusOptionalDatatype[teidata.temporal.w3c](#TEI.teidata.temporal.w3c)Examples of W3C date, time, and date & time formats.24 Oct 45September 24th, 1996 at 3:25 in the morningJan 4 1999 at 8 pmfourteen twelve and 38 secondsOctober of 1962June 12ththe first of the monthAugustMMVIAD 5656 BCThis list begins in the year 1632, more precisely on Trinity Sunday, i.e. the Sunday after Pentecost, in that year the 27th of May (old style).Dorchester, Village,March 2d. 1828.To Mrs. Cornell, Sunday noon.notBeforespecifies the earliest possible date for the event in standard form, e.g. yyyy-mm-dd.StatusOptionalDatatype[teidata.temporal.w3c](#TEI.teidata.temporal.w3c)notAfterspecifies the latest possible date for the event in standard form, e.g. yyyy-mm-dd.StatusOptionalDatatype[teidata.temporal.w3c](#TEI.teidata.temporal.w3c)fromindicates the starting point of the period in standard form, e.g. yyyy-mm-dd.StatusOptionalDatatype[teidata.temporal.w3c](#TEI.teidata.temporal.w3c)toindicates the ending point of the period in standard form, e.g. yyyy-mm-dd.StatusOptionalDatatype[teidata.temporal.w3c](#TEI.teidata.temporal.w3c)Schematron
<sch:rule context="tei:*[@when]">
<sch:report test="@notBefore|@notAfter|@from|@to"
 role="nonfatal">The @when attribute cannot be used with any other att.datable.w3c attributes.</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:*[@from]">
<sch:report test="@notBefore"
 role="nonfatal">The @from and @notBefore attributes cannot be used together.</sch:report>
</sch:rule>Schematron
<sch:rule context="tei:*[@to]">
<sch:report test="@notAfter"
 role="nonfatal">The @to and @notAfter attributes cannot be used together.</sch:report>
</sch:rule>Example28 May through 1 June 1863Note
The value of these attributes should be a normalized representation of the date, time, or combined date & time intended, in any of the standard formats specified by [XML Schema Part 2: Datatypes Second Edition](#XSD2), using the Gregorian calendar.

The most commonly-encountered format for the date portion of a temporal attribute is yyyy-mm-dd, but yyyy, --mm, ---dd, yyyy-mm, or --mm-dd may also be used. For the time part, the form hh:mm:ss is used.

Note that this format does not currently permit use of the value 0000 to represent the year 1 BCE; instead the value -0001 should be used.

## att.deprecated
att.deprecatedatt.deprecated (attribute class)@validUntil provides attributes indicating how a deprecated feature will be treated in future releases.ModuletagdocsMembers[att.combinable](#TEI.att.combinable)[[att.identified](#TEI.att.identified)[[attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec)] [defaultVal](#TEI.defaultVal) [remarks](#TEI.remarks) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem) [valList](#TEI.valList)]AttributesvalidUntilprovides a date before which the construct being defined will not be removed.StatusOptionalDatatype[date](https://www.w3.org/TR/xmlschema-2/#date)Schematron
<sch:rule context="tei:*[@validUntil]">
<sch:let name="advance_warning_period"
 value="current-date() + xs:dayTimeDuration('P60D')"/>
<sch:let name="me_phrase"
 value="if (@ident) then concat('The ', @ident ) else concat('This ', local-name(.), 
 ' of ', ancestor::tei:*[@ident][1]/@ident )"/>
<sch:assert test="@validUntil cast as xs:date ge current-date()">
 <sch:value-of select="concat( $me_phrase, ' construct is outdated (as of ', @validUntil, 
 '); ODD processors may ignore it, and its use is no longer supported' 
 )"/>
</sch:assert>
<sch:assert role="warning"
 test="@validUntil cast as xs:date ge $advance_warning_period">
 <sch:value-of select="concat( $me_phrase, ' construct becomes outdated on ', @validUntil 
 )"/>
</sch:assert>
</sch:rule>Schematron
<sch:rule context="tei:*[@validUntil][ not( self::tei:valDesc | self::tei:valList | self::tei:defaultVal 
 | self::tei:remarks )]">
<sch:assert test="child::tei:desc[ @type eq 'deprecationInfo']"> A deprecated construct should include, whenever possible, an explanation, but this <sch:value-of select="name(.)"/> does not have a child <desc type="deprecationInfo"></sch:assert>
</sch:rule>Note
The value of this attribute should represent a date (in standard yyyy-mm-dd format) which is later than the date on which the attribute is added to an ODD. Technically, this attribute asserts only the intent to leave a construct in future releases of the markup language being defined up to at least the specified date, and makes no assertion about what happens past that date. In practice, the expectation is that the construct will be removed from future releases of the markup language being defined sometime shortly after the validUntil date.

An ODD processor will typically not process a specification element which has a validUntil date that is in the past. An ODD processor will typically warn users about constructs which have a validUntil date that is in the future. E.g., the documentation for such a construct might include the phrase warning: deprecated in red.

## att.global
att.globalatt.global (attribute class)@xml:id@n@xml:lang@xml:base@xml:space provides attributes common to all elements in the TEI encoding scheme. [[1.3.1.1. Global Attributes](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STGA)]ModuleteiMembers[TEI](#TEI.TEI) [abbr](#TEI.abbr) [abstract](#TEI.abstract) [alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [att](#TEI.att) [attDef](#TEI.attDef) [attList](#TEI.attList) [attRef](#TEI.attRef) [availability](#TEI.availability) [back](#TEI.back) [body](#TEI.body) [cell](#TEI.cell) [change](#TEI.change) [classRef](#TEI.classRef) [classSpec](#TEI.classSpec) [classes](#TEI.classes) [code](#TEI.code) [constraint](#TEI.constraint) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [dataFacet](#TEI.dataFacet) [dataRef](#TEI.dataRef) [dataSpec](#TEI.dataSpec) [datatype](#TEI.datatype) [defaultVal](#TEI.defaultVal) [desc](#TEI.desc) [distributor](#TEI.distributor) [div](#TEI.div) [divGen](#TEI.divGen) [edition](#TEI.edition) [editionStmt](#TEI.editionStmt) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementRef](#TEI.elementRef) [elementSpec](#TEI.elementSpec) [emph](#TEI.emph) [empty](#TEI.empty) [exemplum](#TEI.exemplum) [figDesc](#TEI.figDesc) [figure](#TEI.figure) [fileDesc](#TEI.fileDesc) [foreign](#TEI.foreign) [formula](#TEI.formula) [front](#TEI.front) [gi](#TEI.gi) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [head](#TEI.head) [hi](#TEI.hi) [ident](#TEI.ident) [item](#TEI.item) [keywords](#TEI.keywords) [label](#TEI.label) [licence](#TEI.licence) [list](#TEI.list) [listRef](#TEI.listRef) [macroRef](#TEI.macroRef) [macroSpec](#TEI.macroSpec) [memberOf](#TEI.memberOf) [moduleRef](#TEI.moduleRef) [moduleSpec](#TEI.moduleSpec) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [profileDesc](#TEI.profileDesc) [ptr](#TEI.ptr) [publicationStmt](#TEI.publicationStmt) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [remarks](#TEI.remarks) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [revisionDesc](#TEI.revisionDesc) [row](#TEI.row) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [sourceDesc](#TEI.sourceDesc) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [table](#TEI.table) [tag](#TEI.tag) [tagsDecl](#TEI.tagsDecl) [teiHeader](#TEI.teiHeader) [term](#TEI.term) [text](#TEI.text) [textClass](#TEI.textClass) [textNode](#TEI.textNode) [title](#TEI.title) [titleStmt](#TEI.titleStmt) [val](#TEI.val) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem) [valList](#TEI.valList)Attributes
* [att.global.linking](#TEI.att.global.linking)
* @corresp

* @synch

* @sameAs

* @copyOf

* @next

* @prev

* @exclude

* @select


* [att.global.rendition](#TEI.att.global.rendition)
* @rend

* @style

* @rendition


* [att.global.source](#TEI.att.global.source)
* @source

xml:id(identifier) provides a unique identifier for the element bearing the attribute.StatusOptionalDatatype[ID](https://www.w3.org/TR/xmlschema-2/#ID)Note
The xml:id attribute may be used to specify a canonical reference for an element; see section [3.11. Reference Systems](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CORS).
n(number) gives a number (or other label) for an element, which is not necessarily unique within the document.StatusOptionalDatatype[teidata.text](#TEI.teidata.text)Note
The value of this attribute is always understood to be a single token, even if it contains space or other punctuation characters, and need not be composed of numbers only. It is typically used to specify the numbering of chapters, sections, list items, etc.; it may also be used in the specification of a standard reference system for the text.
xml:lang(language) indicates the language of the element content using a tag generated according to [BCP 47](http://www.rfc-editor.org/rfc/bcp/bcp47.txt).StatusOptionalDatatype[teidata.language](#TEI.teidata.language)… The consequences of this rapid depopulation were the loss of the last ariki or chief (Routledge 1920:205,210) and their connections to ancestral territorial organization.Note
The xml:lang value will be inherited from the immediately enclosing element, or from its parent, and so on up the document hierarchy. It is generally good practice to specify xml:lang at the highest appropriate level, noticing that a different default may be needed for the [<teiHeader>](#TEI.teiHeader) from that needed for the associated resource element or elements, and that a single TEI document may contain texts in many languages.

Only attributes with free text values (rare in these guidelines) will be in the scope of xml:lang.

The authoritative list of registered language subtags is maintained by IANA and is available at . For a good general overview of the construction of language tags, see , and for a practical step-by-step guide, see .

The value used must conform with BCP 47. If the value is a private use code (i.e., starts with x- or contains -x-), a language element with a matching value for its ident attribute should be supplied in the TEI header to document this value. Such documentation may also optionally be supplied for non-private-use codes, though these must remain consistent with their IETF definitions.
xml:baseprovides a base URI reference with which applications can resolve relative URI references into absolute URI references.StatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)Selections from The Collected Letters of Robert Southey. Part 1: 1791-1797Robert Southey to Grosvenor Charles Bedford, 3 April 1792.Robert Southey to Anna Seward, 18 September 1793.Robert Southey to Robert Lovell, 5-6 April, 1794.xml:spacesignals an intention about how white space should be managed by applications.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:default
* signals that the application's default white-space processing modes are acceptable
preserve
* indicates the intent that applications preserve all white space
Note
The [XML specification](https://www.w3.org/TR/REC-xml/#sec-white-space) provides further guidance on the use of this attribute. Note that many parsers may not handle xml:space correctly.

## att.global.linking
att.global.linkingatt.global.linking (attribute class)@corresp@synch@sameAs@copyOf@next@prev@exclude@select provides a set of attributes for hypertextual linking. [[17. Linking, Segmentation, and Alignment](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SA)]ModulelinkingMembers[att.global](#TEI.att.global)[[TEI](#TEI.TEI) [abbr](#TEI.abbr) [abstract](#TEI.abstract) [alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [att](#TEI.att) [attDef](#TEI.attDef) [attList](#TEI.attList) [attRef](#TEI.attRef) [availability](#TEI.availability) [back](#TEI.back) [body](#TEI.body) [cell](#TEI.cell) [change](#TEI.change) [classRef](#TEI.classRef) [classSpec](#TEI.classSpec) [classes](#TEI.classes) [code](#TEI.code) [constraint](#TEI.constraint) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [dataFacet](#TEI.dataFacet) [dataRef](#TEI.dataRef) [dataSpec](#TEI.dataSpec) [datatype](#TEI.datatype) [defaultVal](#TEI.defaultVal) [desc](#TEI.desc) [distributor](#TEI.distributor) [div](#TEI.div) [divGen](#TEI.divGen) [edition](#TEI.edition) [editionStmt](#TEI.editionStmt) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementRef](#TEI.elementRef) [elementSpec](#TEI.elementSpec) [emph](#TEI.emph) [empty](#TEI.empty) [exemplum](#TEI.exemplum) [figDesc](#TEI.figDesc) [figure](#TEI.figure) [fileDesc](#TEI.fileDesc) [foreign](#TEI.foreign) [formula](#TEI.formula) [front](#TEI.front) [gi](#TEI.gi) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [head](#TEI.head) [hi](#TEI.hi) [ident](#TEI.ident) [item](#TEI.item) [keywords](#TEI.keywords) [label](#TEI.label) [licence](#TEI.licence) [list](#TEI.list) [listRef](#TEI.listRef) [macroRef](#TEI.macroRef) [macroSpec](#TEI.macroSpec) [memberOf](#TEI.memberOf) [moduleRef](#TEI.moduleRef) [moduleSpec](#TEI.moduleSpec) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [profileDesc](#TEI.profileDesc) [ptr](#TEI.ptr) [publicationStmt](#TEI.publicationStmt) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [remarks](#TEI.remarks) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [revisionDesc](#TEI.revisionDesc) [row](#TEI.row) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [sourceDesc](#TEI.sourceDesc) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [table](#TEI.table) [tag](#TEI.tag) [tagsDecl](#TEI.tagsDecl) [teiHeader](#TEI.teiHeader) [term](#TEI.term) [text](#TEI.text) [textClass](#TEI.textClass) [textNode](#TEI.textNode) [title](#TEI.title) [titleStmt](#TEI.titleStmt) [val](#TEI.val) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem) [valList](#TEI.valList)]Attributescorresp(corresponds) points to elements that correspond to the current element in some way.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceHe Whakamaramatanga mo te Ture Hoko, Riihi hoki, i nga Whenua Maori, 1876.…An Act to regulate the Sale, Letting, and Disposal of Native Lands, 1876.…In this example a group contains two [<text>](#TEI.text)s, each containing the same document in a different language. The correspondence is indicated using corresp. The language is indicated using xml:lang, whose value is inherited; both the tag with the corresp and the tag pointed to by the corresp inherit the value from their immediate parent.LondonThe city of London...LondonAllegorical character representing the city of London.London’s GeniusPersonification of London’s genius. Appears as an allegorical character in mayoral shows. In this example, a place element containing information about the city of London is linked with two person elements in a literary personography. This correspondence represents a slightly looser relationship than the one in the preceding example; there is no sense in which an allegorical character could be substituted for the physical city, or vice versa, but there is obviously a correspondence between them.synch(synchronous) points to elements that are synchronous with the current element.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespacesameAspoints to an element that is the same as the current element.StatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)copyOfpoints to an element of which the current element is a copy.StatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)Note
Any content of the current element should be ignored. Its true content is that of the element being pointed at.
nextpoints to the next element of a virtual aggregate of which the current element is part.StatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)Note
It is recommended that the element indicated be of the same type as the element bearing this attribute.
prev(previous) points to the previous element of a virtual aggregate of which the current element is part.StatusOptionalDatatype[teidata.pointer](#TEI.teidata.pointer)Note
It is recommended that the element indicated be of the same type as the element bearing this attribute.
excludepoints to elements that are in exclusive alternation with the current element.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceselectselects one or more alternants; if one alternant is selected, the ambiguity or uncertainty is marked as resolved. If more than one alternant is selected, the degree of ambiguity or uncertainty is marked as reduced by the number of alternants not selected.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceNote
This attribute should be placed on an element which is superordinate to all of the alternants from which the selection is being made.

## att.global.rendition
att.global.renditionatt.global.rendition (attribute class)@rend@style@rendition provides rendering attributes common to all elements in the TEI encoding scheme. [[1.3.1.1.3. Rendition Indicators](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STGAre)]ModuleteiMembers[att.global](#TEI.att.global)[[TEI](#TEI.TEI) [abbr](#TEI.abbr) [abstract](#TEI.abstract) [alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [att](#TEI.att) [attDef](#TEI.attDef) [attList](#TEI.attList) [attRef](#TEI.attRef) [availability](#TEI.availability) [back](#TEI.back) [body](#TEI.body) [cell](#TEI.cell) [change](#TEI.change) [classRef](#TEI.classRef) [classSpec](#TEI.classSpec) [classes](#TEI.classes) [code](#TEI.code) [constraint](#TEI.constraint) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [dataFacet](#TEI.dataFacet) [dataRef](#TEI.dataRef) [dataSpec](#TEI.dataSpec) [datatype](#TEI.datatype) [defaultVal](#TEI.defaultVal) [desc](#TEI.desc) [distributor](#TEI.distributor) [div](#TEI.div) [divGen](#TEI.divGen) [edition](#TEI.edition) [editionStmt](#TEI.editionStmt) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementRef](#TEI.elementRef) [elementSpec](#TEI.elementSpec) [emph](#TEI.emph) [empty](#TEI.empty) [exemplum](#TEI.exemplum) [figDesc](#TEI.figDesc) [figure](#TEI.figure) [fileDesc](#TEI.fileDesc) [foreign](#TEI.foreign) [formula](#TEI.formula) [front](#TEI.front) [gi](#TEI.gi) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [head](#TEI.head) [hi](#TEI.hi) [ident](#TEI.ident) [item](#TEI.item) [keywords](#TEI.keywords) [label](#TEI.label) [licence](#TEI.licence) [list](#TEI.list) [listRef](#TEI.listRef) [macroRef](#TEI.macroRef) [macroSpec](#TEI.macroSpec) [memberOf](#TEI.memberOf) [moduleRef](#TEI.moduleRef) [moduleSpec](#TEI.moduleSpec) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [profileDesc](#TEI.profileDesc) [ptr](#TEI.ptr) [publicationStmt](#TEI.publicationStmt) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [remarks](#TEI.remarks) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [revisionDesc](#TEI.revisionDesc) [row](#TEI.row) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [sourceDesc](#TEI.sourceDesc) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [table](#TEI.table) [tag](#TEI.tag) [tagsDecl](#TEI.tagsDecl) [teiHeader](#TEI.teiHeader) [term](#TEI.term) [text](#TEI.text) [textClass](#TEI.textClass) [textNode](#TEI.textNode) [title](#TEI.title) [titleStmt](#TEI.titleStmt) [val](#TEI.val) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem) [valList](#TEI.valList)]Attributesrend(rendition) indicates how the element in question was rendered or presented in the source text.StatusOptionalDatatype1–∞ occurrences of [teidata.word](#TEI.teidata.word) separated by whitespaceTo The Duchesse of Newcastle, On Her New Blazing-World.Note
These Guidelines make no binding recommendations for the values of the rend attribute; the characteristics of visual presentation vary too much from text to text and the decision to record or ignore individual characteristics varies too much from project to project. Some potentially useful conventions are noted from time to time at appropriate points in the Guidelines. The values of the rend attribute are a set of sequence-indeterminate individual tokens separated by whitespace.
stylecontains an expression in some formal style definition language which defines the rendering or presentation used for this element in the source text.StatusOptionalDatatype[teidata.text](#TEI.teidata.text)To The Duchesse of Newcastle, On Her New Blazing-World.Note
Unlike the attribute values of rend, which uses whitespace as a separator, the style attribute may contain whitespace. This attribute is intended for recording inline stylistic information concerning the source, not any particular output.

The formal language in which values for this attribute are expressed may be specified using the styleDefDecl element in the TEI header.

If style and rendition are both present on an element, then style overrides or complements rendition. style should not be used in conjunction with rend, because the latter does not employ a formal style definition language.
renditionpoints to a description of the rendering or presentation used for this element in the source text.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceTo The Duchesse of Newcastle, On Her New Blazing-World.font-variant: small-capsfont-variant: normaltext-align: centerNote
The rendition attribute is used in a very similar way to the class attribute defined for XHTML but with the important distinction that its function is to describe the appearance of the source text, not necessarily to determine how that text should be presented on screen or paper.

If rendition is used to refer to a style definition in a formal language like CSS, it is recommended that it not be used in conjunction with rend. Where both rendition and rend are supplied, the latter is understood to override or complement the former.

Each URI provided should indicate a rendition element defining the intended rendition in terms of some appropriate style language, as indicated by the scheme attribute.

## att.global.source
att.global.sourceatt.global.source (attribute class)@source provides attributes used by elements to point to an external source. [[1.3.1.1.4. Sources, certainty, and responsibility](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STGAso) [3.3.3. Quotation](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COHQQ) [8.3.4. Writing](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TS.html#TSBAWR)]ModuleteiMembers[att.global](#TEI.att.global)[[TEI](#TEI.TEI) [abbr](#TEI.abbr) [abstract](#TEI.abstract) [alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [att](#TEI.att) [attDef](#TEI.attDef) [attList](#TEI.attList) [attRef](#TEI.attRef) [availability](#TEI.availability) [back](#TEI.back) [body](#TEI.body) [cell](#TEI.cell) [change](#TEI.change) [classRef](#TEI.classRef) [classSpec](#TEI.classSpec) [classes](#TEI.classes) [code](#TEI.code) [constraint](#TEI.constraint) [constraintDecl](#TEI.constraintDecl) [constraintSpec](#TEI.constraintSpec) [content](#TEI.content) [dataFacet](#TEI.dataFacet) [dataRef](#TEI.dataRef) [dataSpec](#TEI.dataSpec) [datatype](#TEI.datatype) [defaultVal](#TEI.defaultVal) [desc](#TEI.desc) [distributor](#TEI.distributor) [div](#TEI.div) [divGen](#TEI.divGen) [edition](#TEI.edition) [editionStmt](#TEI.editionStmt) [eg](#TEI.eg) [egXML](#TEI.egXML) [elementRef](#TEI.elementRef) [elementSpec](#TEI.elementSpec) [emph](#TEI.emph) [empty](#TEI.empty) [exemplum](#TEI.exemplum) [figDesc](#TEI.figDesc) [figure](#TEI.figure) [fileDesc](#TEI.fileDesc) [foreign](#TEI.foreign) [formula](#TEI.formula) [front](#TEI.front) [gi](#TEI.gi) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [head](#TEI.head) [hi](#TEI.hi) [ident](#TEI.ident) [item](#TEI.item) [keywords](#TEI.keywords) [label](#TEI.label) [licence](#TEI.licence) [list](#TEI.list) [listRef](#TEI.listRef) [macroRef](#TEI.macroRef) [macroSpec](#TEI.macroSpec) [memberOf](#TEI.memberOf) [moduleRef](#TEI.moduleRef) [moduleSpec](#TEI.moduleSpec) [name](#TEI.name) [note](#TEI.note) [p](#TEI.p) [profileDesc](#TEI.profileDesc) [ptr](#TEI.ptr) [publicationStmt](#TEI.publicationStmt) [publisher](#TEI.publisher) [q](#TEI.q) [quote](#TEI.quote) [ref](#TEI.ref) [remarks](#TEI.remarks) [resp](#TEI.resp) [respStmt](#TEI.respStmt) [revisionDesc](#TEI.revisionDesc) [row](#TEI.row) [schemaSpec](#TEI.schemaSpec) [sequence](#TEI.sequence) [sourceDesc](#TEI.sourceDesc) [specDesc](#TEI.specDesc) [specGrp](#TEI.specGrp) [specGrpRef](#TEI.specGrpRef) [specList](#TEI.specList) [table](#TEI.table) [tag](#TEI.tag) [tagsDecl](#TEI.tagsDecl) [teiHeader](#TEI.teiHeader) [term](#TEI.term) [text](#TEI.text) [textClass](#TEI.textClass) [textNode](#TEI.textNode) [title](#TEI.title) [titleStmt](#TEI.titleStmt) [val](#TEI.val) [valDesc](#TEI.valDesc) [valItem](#TEI.valItem) [valList](#TEI.valList)]Attributessourcespecifies the source from which some aspect of this element is drawn.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceSchematron
<sch:rule context="tei:*[@source]">
<sch:let name="srcs"
 value="tokenize( normalize-space(@source),' ')"/>
<sch:report test="( self::tei:classRef | self::tei:dataRef | self::tei:elementRef | 
 self::tei:macroRef | self::tei:moduleRef | self::tei:schemaSpec ) 
 and $srcs[2]"> When used on a schema description element (like
<sch:value-of select="name(.)"/>), the @source attribute
 should have only 1 value. (This one has <sch:value-of select="count($srcs)"/>.)
</sch:report>
</sch:rule>Note
The source attribute points to an external source. When used on an element describing a schema component ([<classRef>](#TEI.classRef), [<dataRef>](#TEI.dataRef), [<elementRef>](#TEI.elementRef), [<macroRef>](#TEI.macroRef), [<moduleRef>](#TEI.moduleRef), or [<schemaSpec>](#TEI.schemaSpec)), it identifies the source from which declarations for the components should be obtained.

On other elements it provides a pointer to the bibliographical source from which a quotation or citation is drawn.

In either case, the location may be provided using any form of URI, for example an absolute URI, a relative URI, a private scheme URI of the form tei:x.y.z, where x.y.z indicates the version number, e.g. tei:4.3.2 for TEI P5 release 4.3.2 or (as a special case) tei:current for whatever is the latest release, or a private scheme URI that is expanded to an absolute URI as documented in a prefixDef.

When used on elements describing schema components, source should have only one value; when used on other elements multiple values are permitted.
Example As Willard McCarty (2012, p.2) tells us, ‘Collaboration’ is a problematic and should be a contested term.ExampleGrammatical theories are in flux, and the more we learn, the less we seem to know.The Chicago Manual of Style, 15th edition. Chicago: University of Chicago Press (2003), p.147.ExampleInclude in the schema an element named [<p>](#TEI.p) available from the TEI P5 2.0.1 release.ExampleCreate a schema using components taken from the file mycompiledODD.xml.
## att.identified
att.identifiedatt.identified (attribute class)@ident@predeclare@module provides identifying attributes for elements which can be subsequently referenced by means of a key attribute.ModuletagdocsMembers[attDef](#TEI.attDef) [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [dataSpec](#TEI.dataSpec) [elementSpec](#TEI.elementSpec) [macroSpec](#TEI.macroSpec) [moduleSpec](#TEI.moduleSpec) [schemaSpec](#TEI.schemaSpec)Attributes
* [att.combinable](#TEI.att.combinable)
* @mode

* [att.deprecated](#TEI.att.deprecated)
* @validUntil


identsupplies the identifier by which this element may be referenced.StatusRequiredDatatype[teidata.name](#TEI.teidata.name)predeclaresays whether this object should be predeclared in the tei infrastructure module.StatusOptionalDatatype[teidata.truthValue](#TEI.teidata.truthValue)Defaultfalsemodulesupplies a name for the module in which this object is to be declared.StatusOptionalDatatype[teidata.xmlName](#TEI.teidata.xmlName)Schematron
<sch:rule context="tei:elementSpec[@module]|tei:classSpec[@module]|tei:macroSpec[@module]">
<sch:assert test="(not(ancestor::tei:schemaSpec | ancestor::tei:TEI | ancestor::tei:teiCorpus)) 
 or (not(@module) or (not(//tei:moduleSpec) and not(//tei:moduleRef)) 
 or (//tei:moduleSpec[@ident = current()/@module]) or (//tei:moduleRef[@key 
 = current()/@module]))"> Specification <sch:value-of select="@ident"/>: the value of the module attribute ("<sch:value-of select="@module"/>")
 should correspond to an existing module, via a moduleSpec or
 moduleRef</sch:assert>
</sch:rule>
## att.namespaceable
att.namespaceableatt.namespaceable (attribute class)@ns provides attributes indicating the target namespace for an object being created.ModuletagdocsMembers[attDef](#TEI.attDef) [elementSpec](#TEI.elementSpec) [schemaSpec](#TEI.schemaSpec)Attributesns(namespace) specifies the namespace to which the element(s) being specified belongs.StatusOptionalDatatype0–1 occurrences of [teidata.namespace](#TEI.teidata.namespace) separated by whitespaceDefaulthttp://www.tei-c.org/ns/1.0Note
When specified on an [<elementSpec>](#TEI.elementSpec), this attribute specifies the namespace of the element being added, deleted, replaced, or changed. When specified on a [<schemaSpec>](#TEI.schemaSpec), this attribute specifies the namespace of every element that is added, deleted, replaced, or changed by [<elementSpec>](#TEI.elementSpec) children of the [<schemaSpec>](#TEI.schemaSpec), or by [<elementSpec>](#TEI.elementSpec)s referred to by [<specGrpRef>](#TEI.specGrpRef) children of the [<schemaSpec>](#TEI.schemaSpec), unless overridden by an ns attribute on the [<elementSpec>](#TEI.elementSpec).

Note that the value of ns of [<attDef>](#TEI.attDef) is not inherited from its ancestors.

## att.naming
att.namingatt.naming (attribute class)@role provides attributes common to elements which refer to named persons, places, organizations etc. [[3.6.1. Referring Strings](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONARS) [14.3.7. Names and Nyms](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDNYM)]ModuleteiMembers[att.personal](#TEI.att.personal)[[name](#TEI.name)]Attributes
* [att.canonical](#TEI.att.canonical)
* @key

* @ref

rolemay be used to specify further information about the entity referenced by this name in the form of a set of whitespace-separated values, for example the occupation of a person, or the status of a place.StatusOptionalDatatype1–∞ occurrences of [teidata.enumerated](#TEI.teidata.enumerated) separated by whitespace
## att.personal
att.personalatt.personal (attribute class) (attributes for components of names usually, but not necessarily, personal names) common attributes for those elements which form part of a name usually, but not necessarily, a personal name. [[14.2.1. Personal Names](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDPER)]ModuleteiMembers[name](#TEI.name)Attributes
* [att.naming](#TEI.att.naming)
* @role

* [att.canonical](#TEI.att.canonical)
* @key

* @ref



## att.pointing
att.pointingatt.pointing (attribute class)@targetLang@target@evaluate provides a set of attributes used by all elements which point to other elements by means of one or more URI references. [[1.3.1.1.2. Language Indicators](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STGAla) [3.7. Simple Links and Cross-References](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COXR)]ModuleteiMembers[gloss](#TEI.gloss) [licence](#TEI.licence) [note](#TEI.note) [ptr](#TEI.ptr) [ref](#TEI.ref) [term](#TEI.term)AttributestargetLangspecifies the language of the content to be found at the destination referenced by target, using a language tag generated according to [BCP 47](http://www.rfc-editor.org/rfc/bcp/bcp47.txt).StatusOptionalDatatype[teidata.language](#TEI.teidata.language)Schematron
<sch:rule context="tei:*[not(self::tei:schemaSpec)][@targetLang]">
<sch:assert test="@target">@targetLang should only be used on <sch:name/> if @target is specified.</sch:assert>
</sch:rule>In the example above, the linkGrp combines pointers at parallel fragments of the Universal Declaration of Human Rights: one of them is in Polish, the other in Swahili.Note
The value must conform to BCP 47. If the value is a private use code (i.e., starts with x- or contains -x-), a language element with a matching value for its ident attribute should be supplied in the TEI header to document this value. Such documentation may also optionally be supplied for non-private-use codes, though these must remain consistent with their IETF definitions.
targetspecifies the destination of the reference by supplying one or more URI References.StatusOptionalDatatype1–∞ occurrences of [teidata.pointer](#TEI.teidata.pointer) separated by whitespaceNote
One or more syntactically valid URI references, separated by whitespace. Because whitespace is used to separate URIs, no whitespace is permitted inside a single URI. If a whitespace character is required in a URI, it should be escaped with the normal mechanism, e.g. TEI%20Consortium.
evaluate(evaluate) specifies the intended meaning when the target of a pointer is itself a pointer.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Legal values are:all
* if the element pointed to is itself a pointer, then the target of that pointer will be taken, and so on, until an element is found which is not a pointer.
one
* if the element pointed to is itself a pointer, then its target (whether a pointer or not) is taken as the target of this pointer.
none
* no further evaluation of targets is carried out beyond that needed to find the element specified in the pointer's target.
Note
If no value is given, the application program is responsible for deciding (possibly on the basis of user input) how far to trace a chain of pointers.

## att.repeatable
att.repeatableatt.repeatable (attribute class)@minOccurs@maxOccurs provides attributes for the elements which define component parts of a content model.ModuletagdocsMembers[alternate](#TEI.alternate) [anyElement](#TEI.anyElement) [classRef](#TEI.classRef) [datatype](#TEI.datatype) [elementRef](#TEI.elementRef) [sequence](#TEI.sequence)AttributesminOccurs(minimum number of occurences) indicates the smallest number of times this component may occur.StatusOptionalDatatype[teidata.count](#TEI.teidata.count)Default1maxOccurs(maximum number of occurences) indicates the largest number of times this component may occur.StatusOptionalDatatype[teidata.unboundedCount](#TEI.teidata.unboundedCount)Default1Schematron
<sch:rule context="tei:*[ @minOccurs and @maxOccurs ]">
<sch:let name="min"
 value="@minOccurs cast as xs:integer"/>
<sch:let name="max"
 value="if ( normalize-space( @maxOccurs ) eq 'unbounded') then -1 else @maxOccurs 
 cast as xs:integer"/>
<sch:assert test="$max eq -1 or $max ge $min">@maxOccurs should be greater than or equal to @minOccurs</sch:assert>
</sch:rule>
<sch:rule context="tei:*[ @minOccurs and not( @maxOccurs ) ]">
<sch:assert test="@minOccurs cast as xs:integer lt 2">When @maxOccurs is not specified, @minOccurs must be 0 or 1</sch:assert>
</sch:rule>Note
The value of minOccurs must always be less than or equal to that of maxOccurs. Since the default value of maxOccurs is 1, when maxOccurs is not specified minOccurs must always be less than or equal to 1. The default value of minOccurs is also 1, and therefore, when minOccurs is not specified the value of maxOccurs must always be greater than or equal to 1. An ODD processor should raise an error if either of these conditions is not met.

## att.resourced
att.resourcedatt.resourced (attribute class)@url provides attributes by which a resource (such as an externally held media file) may be located.ModuleteiMembers[graphic](#TEI.graphic)Attributesurl(uniform resource locator) specifies the URL from which the media concerned may be obtained.StatusRequiredDatatype[teidata.pointer](#TEI.teidata.pointer)
## att.translatable
att.translatableatt.translatable (attribute class)@versionDate provides attributes used to indicate the status of a translatable portion of an ODD document.ModuletagdocsMembers[desc](#TEI.desc) [exemplum](#TEI.exemplum) [gloss](#TEI.gloss) [remarks](#TEI.remarks) [valDesc](#TEI.valDesc)AttributesversionDatespecifies the date on which the source text was extracted and sent to the translatorStatusOptionalDatatype[teidata.temporal.working](#TEI.teidata.temporal.working)Note
The versionDate attribute can be used to determine whether a translation might need to be revisited, by comparing the modification date on the containing file with the versionDate value on the translation. If the file has changed, changelogs can be checked to see whether the source text has been modified since the translation was made.

## att.typed
att.typedatt.typed (attribute class)@type provides attributes that can be used to classify or subclassify elements in any way. [[1.3.1. Attribute Classes](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STECAT) [18.1.1. Words and Above](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/AI.html#AILCW) [3.6.1. Referring Strings](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONARS) [3.7. Simple Links and Cross-References](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COXR) [3.6.5. Abbreviations and Their Expansions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#CONAAB) [3.13.1. Core Tags for Verse](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html#COVE) [7.2.5. Speech Contents](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DR.html#DRPAL) [4.1.1. Un-numbered Divisions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSDIV1) [4.1.2. Numbered Divisions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSDIV2) [4.2.1. Headings and Trailers](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSHD) [4.4. Virtual Divisions](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html#DSVIRT) [14.3.2.3. Personal Relationships](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html#NDPERSREL) [12.3.1.1. Core Elements for Transcriptional Work](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html#PHCO) [17.1.1. Pointers and Links](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAPTL) [17.3. Blocks, Segments, and Anchors](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SASE) [13.2. Linking the Apparatus to the Text](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TC.html#TCAPLK) [23.5.1.2. Defining Content Models: RELAX NG](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TD.html#TDTAGCONT) [8.3. Elements Unique to Spoken Texts](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/TS.html#TSBA) [24.3.1.3. Modification of Attribute and Attribute Value Lists](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/USE.html#MDMDAL)]ModuleteiMembers[TEI](#TEI.TEI) [abbr](#TEI.abbr) [change](#TEI.change) [classSpec](#TEI.classSpec) [constraintSpec](#TEI.constraintSpec) [desc](#TEI.desc) [div](#TEI.div) [divGen](#TEI.divGen) [exemplum](#TEI.exemplum) [figure](#TEI.figure) [gloss](#TEI.gloss) [graphic](#TEI.graphic) [head](#TEI.head) [ident](#TEI.ident) [label](#TEI.label) [list](#TEI.list) [listRef](#TEI.listRef) [moduleSpec](#TEI.moduleSpec) [name](#TEI.name) [note](#TEI.note) [ptr](#TEI.ptr) [quote](#TEI.quote) [ref](#TEI.ref) [table](#TEI.table) [tag](#TEI.tag) [term](#TEI.term) [text](#TEI.text) [title](#TEI.title)Attributestypecharacterizes the element in some sense, using any convenient classification scheme or typology.StatusOptionalDatatype[teidata.enumerated](#TEI.teidata.enumerated)Night in TarrasAt evening tramping on the hot white road…A wind sprang up from nowhere as the sky…Note
The type attribute is present on a number of elements, not all of which are members of att.typed, usually because these elements restrict the possible values for the attribute in a specific way.
Schematron
<sch:rule context="tei:*[@subtype]">
<sch:assert test="@type">The <sch:name/> element should not be categorized in detail with @subtype unless also categorized in general with @type</sch:assert>
</sch:rule>Note
When appropriate, values from an established typology should be used. Alternatively a typology may be defined in the associated TEI header. If values are to be taken from a project-specific list, this should be defined using the [<valList>](#TEI.valList) element in the project-specific schema description, as described in [24.3.1.3. Modification of Attribute and Attribute Value Lists](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/USE.html#MDMDAL) .

# Macros

## macro.limitedContent
macro.limitedContent (macro)macro.limitedContent (paragraph content) defines the content of prose elements that are not used for transcription of extant materials. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[desc](#TEI.desc) [figDesc](#TEI.figDesc)Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.limitedPhrase"/>
  <classRef key="model.inter"/>
 </alternate>
</content>
    Declaration
macro.limitedContent = ( text | [model.limitedPhrase](#TEI.model.limitedPhrase) | [model.inter](#TEI.model.inter) )*
## macro.paraContent
macro.paraContent (macro)macro.paraContent (paragraph content) defines the content of paragraphs and similar elements. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[emph](#TEI.emph) [hi](#TEI.hi) [p](#TEI.p) [ref](#TEI.ref) [title](#TEI.title)Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.paraPart"/>
 </alternate>
</content>
    Declaration
macro.paraContent = ( text | [model.paraPart](#TEI.model.paraPart) )*
## macro.phraseSeq
macro.phraseSeq (macro)macro.phraseSeq (phrase sequence) defines a sequence of character data and phrase-level elements. [[1.4.1. Standard Content Models](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STECST)]ModuleteiUsed by[abbr](#TEI.abbr) [distributor](#TEI.distributor) [edition](#TEI.edition) [eg](#TEI.eg) [foreign](#TEI.foreign) [gloss](#TEI.gloss) [label](#TEI.label) [name](#TEI.name) [publisher](#TEI.publisher) [term](#TEI.term)Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.gLike"/>
  <classRef key="model.attributable"/>
  <classRef key="model.phrase"/>
  <classRef key="model.global"/>
 </alternate>
</content>
    Declaration
macro.phraseSeq =
   ( text | [model.gLike](#TEI.model.gLike) | [model.attributable](#TEI.model.attributable) | [model.phrase](#TEI.model.phrase) | [model.global](#TEI.model.global) )*
## macro.phraseSeq.limited
macro.phraseSeq.limited (macro)macro.phraseSeq.limited (limited phrase sequence) defines a sequence of character data and those phrase-level elements that are not typically used for transcribing extant documents. [[1.4.1. Standard Content Models](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STECST)]ModuleteiUsed by[resp](#TEI.resp) [valDesc](#TEI.valDesc)Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.limitedPhrase"/>
  <classRef key="model.global"/>
 </alternate>
</content>
    Declaration
macro.phraseSeq.limited = ( text | [model.limitedPhrase](#TEI.model.limitedPhrase) | [model.global](#TEI.model.global) )*
## macro.specialPara
macro.specialPara (macro)macro.specialPara ('special' paragraph content) defines the content model of elements such as notes or list items, which either contain a series of component-level elements or else have the same structure as a paragraph, containing a series of phrase-level and inter-level elements. [[1.3. The TEI Class System](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STEC)]ModuleteiUsed by[cell](#TEI.cell) [change](#TEI.change) [item](#TEI.item) [licence](#TEI.licence) [note](#TEI.note) [q](#TEI.q) [quote](#TEI.quote)Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.gLike"/>
  <classRef key="model.phrase"/>
  <classRef key="model.inter"/>
  <classRef key="model.divPart"/>
  <classRef key="model.global"/>
 </alternate>
</content>
    Declaration
macro.specialPara =
   (
      text
    | [model.gLike](#TEI.model.gLike)
    | [model.phrase](#TEI.model.phrase)
    | [model.inter](#TEI.model.inter)
    | [model.divPart](#TEI.model.divPart)
    | [model.global](#TEI.model.global)
   )*
## macro.xtext
macro.xtext (macro)macro.xtext (extended text) defines a sequence of character data and gaiji elements.ModuleteiUsed by[memberOf](#TEI.memberOf)Content model
<content>
 <alternate minOccurs="0"
  maxOccurs="unbounded">
  <textNode/>
  <classRef key="model.gLike"/>
 </alternate>
</content>
    Declaration
macro.xtext = ( text | [model.gLike](#TEI.model.gLike) )*
# Datatypes

## teidata.certainty
teidata.certainty defines the range of attribute values expressing a degree of certainty.ModuleteiUsed byContent model
<content>
 <valList type="closed">
  <valItem ident="high"/>
  <valItem ident="medium"/>
  <valItem ident="low"/>
  <valItem ident="unknown"/>
 </valList>
</content>
    Declaration
teidata.certainty = "high" | "medium" | "low" | "unknown"Note
Certainty may be expressed by one of the predefined symbolic values high, medium, or low. The value unknown should be used in cases where the encoder does not wish to assert an opinion about the matter.

## teidata.count
teidata.count defines the range of attribute values used for a non-negative integer value used as a count.ModuleteiUsed byElement: 
* [datatype](#TEI.datatype)/@minOccurs

* [table](#TEI.table)/@rows

* [table](#TEI.table)/@cols
Content model
<content>
 <dataRef name="nonNegativeInteger"/>
</content>
    Declaration
teidata.count = xsd:nonNegativeIntegerNote
Any positive integer value or zero is permitted

## teidata.enumerated
teidata.enumerated defines the range of attribute values expressed as a single XML name taken from a list of documented possibilities.ModuleteiUsed byElement: 
* [abbr](#TEI.abbr)/@type

* [att](#TEI.att)/@scheme

* [attDef](#TEI.attDef)/@usage

* [attList](#TEI.attList)/@org

* [availability](#TEI.availability)/@status

* [classSpec](#TEI.classSpec)/@type

* [classSpec](#TEI.classSpec)/@generate

* [classes](#TEI.classes)/@mode

* [constraintDecl](#TEI.constraintDecl)/@scheme

* [constraintDecl](#TEI.constraintDecl)/@queryBinding

* [constraintSpec](#TEI.constraintSpec)/@type

* [constraintSpec](#TEI.constraintSpec)/@scheme

* [desc](#TEI.desc)/@type

* [divGen](#TEI.divGen)/@type

* [egXML](#TEI.egXML)/@valid

* [gi](#TEI.gi)/@scheme

* [list](#TEI.list)/@type

* [memberOf](#TEI.memberOf)/@mode

* [q](#TEI.q)/@type

* [tag](#TEI.tag)/@type

* [tag](#TEI.tag)/@scheme

* [title](#TEI.title)/@type

* [title](#TEI.title)/@level

* [valList](#TEI.valList)/@type
Content model
<content>
 <dataRef key="teidata.word"/>
</content>
    Declaration
teidata.enumerated = [teidata.word](#TEI.teidata.word)Note
Attributes using this datatype must contain a single word which contains only letters, digits, punctuation characters, or symbols: thus it cannot include whitespace.

Typically, the list of documented possibilities will be provided (or exemplified) by a value list in the associated attribute specification, expressed with a [<valList>](#TEI.valList) element.

## teidata.language
teidata.language defines the range of attribute values used to identify a particular combination of human language and writing system. [[6.1. Language Identification](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/CH.html#CHSH)]ModuleteiUsed byElement: 
* [schemaSpec](#TEI.schemaSpec)/@targetLang

* [schemaSpec](#TEI.schemaSpec)/@docLang
Content model
<content>
 <alternate>
  <dataRef name="language"/>
  <valList>
   <valItem ident=""/>
  </valList>
 </alternate>
</content>
    Declaration
teidata.language = xsd:language | ( "" )Note
The values for this attribute are language tags as defined in [BCP 47](https://tools.ietf.org/html/bcp47). Currently BCP 47 comprises RFC 5646 and RFC 4647; over time, other IETF documents may succeed these as the best current practice.

A language tag, per BCP 47, is assembled from a sequence of components or subtags separated by the hyphen character (-, U+002D). The tag is made of the following subtags, in the following order. Every subtag except the first is optional. If present, each occurs only once, except the fourth and fifth components (variant and extension), which are repeatable. language
* The IANA-registered code for the language. This is almost always the same as the ISO 639 2-letter language code if there is one. The list of available registered language subtags can be found at . It is recommended that this code be written in lower case.
script
* The ISO 15924 code for the script. These codes consist of 4 letters, and it is recommended they be written with an initial capital, the other three letters in lower case. The canonical list of codes is maintained by the Unicode Consortium, and is available at . The IETF recommends this code be omitted unless it is necessary to make a distinction you need.
region
* Either an ISO 3166 country code or a UN M.49 region code that is registered with IANA (not all such codes are registered, e.g. UN codes for economic groupings or codes for countries for which there is already an ISO 3166 2-letter code are not registered). The former consist of 2 letters, and it is recommended they be written in upper case; the list of codes can be searched or browsed at . The latter consist of 3 digits; the list of codes can be found at .
variant
* An IANA-registered variation. These codes are used to indicate additional, well-recognized variations that define a language or its dialects that are not covered by other available subtags.
extension
* An extension has the format of a single letter followed by a hyphen followed by additional subtags. There are currently only two extensions in use. Extension T indicates that the content was transformed. For example en-t-it could be used for content in English that was translated from Italian. Extension T is described in the informational [RFC 6497](https://www.rfc-editor.org/info/rfc6497). Extension U can be used to embed a variety of locale attributes. It is described in the informational [RFC 6067](https://www.rfc-editor.org/info/rfc6067).
private use
* An extension that uses the initial subtag of the single letter x (i.e., starts with x-) has no meaning except as negotiated among the parties involved. These should be used with great care, since they interfere with the interoperability that use of RFC 4646 is intended to promote. In order for a document that makes use of these subtags to be TEI-conformant, a corresponding language element must be present in the TEI header.


There are two exceptions to the above format. First, there are language tags in the [IANA registry](https://www.iana.org/assignments/language-subtag-registry) that do not match the above syntax, but are present because they have been grandfathered from previous specifications.

Second, an entire language tag can consist of only a private use subtag. These tags start with x-, and do not need to follow any further rules established by the IETF and endorsed by these Guidelines. Like all language tags that make use of private use subtags, the language in question must be documented in a corresponding language element in the TEI header.

Examples include sn
* Shona
zh-TW
* Taiwanese
zh-Hant-HK
* Chinese written in traditional script as used in Hong Kong
en-SL
* English as spoken in Sierra Leone
pl
* Polish
es-MX
* Spanish as spoken in Mexico
es-419
* Spanish as spoken in Latin America


The W3C Internationalization Activity has published a useful introduction to BCP 47, [Language tags in HTML and XML](https://www.w3.org/International/articles/language-tags/Overview.en.php).

## teidata.name
teidata.name defines the range of attribute values expressed as an XML Name.ModuleteiUsed by[att](#TEI.att) [gi](#TEI.gi)Element: 
* [attRef](#TEI.attRef)/@class

* [attRef](#TEI.attRef)/@name

* [memberOf](#TEI.memberOf)/@key

* [schemaSpec](#TEI.schemaSpec)/@start

* [specDesc](#TEI.specDesc)/@key

* [specDesc](#TEI.specDesc)/@atts
Content model
<content>
 <dataRef name="Name"/>
</content>
    Declaration
teidata.name = xsd:NameNote
Attributes using this datatype must contain a single word which follows the rules defining a legal XML name (see ): for example they cannot include whitespace or begin with digits.

## teidata.namespace
teidata.namespace defines the range of attribute values used to indicate XML namespaces as defined by the W3C [Namespaces in XML](https://www.w3.org/TR/1999/REC-xml-names-19990114/) Technical Recommendation.ModuleteiUsed byElement: 
* [anyElement](#TEI.anyElement)/@require
Content model
<content>
 <dataRef restriction="\S+" name="anyURI"/>
</content>
    Declaration
teidata.namespace = xsd:anyURI { pattern = "\S+" }Note
The range of syntactically valid values is defined by [RFC 3986 Uniform Resource Identifier (URI): Generic Syntax](https://www.ietf.org/rfc/rfc3986.txt)

## teidata.namespaceOrName
teidata.namespaceOrName defines attribute values which contain either an absolute namespace URI or a qualified XML name.ModuleteiUsed byElement: 
* [anyElement](#TEI.anyElement)/@except

* [schemaSpec](#TEI.schemaSpec)/@defaultExceptions
Content model
<content>
 <alternate>
  <dataRef name="anyURI">
   <dataFacet name="pattern"
    value="[^/\s]+:\S*"/>
  </dataRef>
  <dataRef name="Name">
   <dataFacet name="pattern" value=".+:.+"/>
  </dataRef>
 </alternate>
</content>
    Declaration
teidata.namespaceOrName = xsd:anyURI | xsd:Name
## teidata.numeric
teidata.numeric defines the range of attribute values used for numeric values.ModuleteiUsed byElement: 
* [memberOf](#TEI.memberOf)/@max

* [memberOf](#TEI.memberOf)/@min
Content model
<content>
 <alternate>
  <dataRef name="double"/>
  <dataRef name="token"
   restriction="(\-?[\d]+/\-?[\d]+)"/>
  <dataRef name="decimal"/>
 </alternate>
</content>
    Declaration
teidata.numeric =
   xsd:double | token { pattern = "(\-?[\d]+/\-?[\d]+)" } | xsd:decimalNote
Any numeric value, represented as a decimal number, in floating point format, or as a ratio.

To represent a floating point number, expressed in scientific notation, E notation, a variant of exponential notation, may be used. In this format, the value is expressed as two numbers separated by the letter E. The first number, the significand (sometimes called the mantissa) is given in decimal format, while the second is an integer. The value is obtained by multiplying the mantissa by 10 the number of times indicated by the integer. Thus the value represented in decimal notation as 1000.0 might be represented in scientific notation as 10E3.

A value expressed as a ratio is represented by two integer values separated by a solidus (/) character. Thus, the value represented in decimal notation as 0.5 might be represented as a ratio by the string 1/2.

## teidata.pattern
teidata.pattern defines attribute values which are expressed as a regular expression.ModuleteiUsed byElement: 
* [dataRef](#TEI.dataRef)/@restriction
Content model
<content>
 <dataRef name="token"/>
</content>
    Declaration
teidata.pattern = tokenNote
A regular expression, often called a pattern, is an expression that describes a set of strings. They are usually used to give a concise description of a set, without having to list all elements. For example, the set containing the three strings Handel, Händel, and Haendel can be described by the pattern H(ä|ae?)ndel (or alternatively, it is said that the pattern H(ä|ae?)ndel matches each of the three strings)[Wikipedia](http://en.wikipedia.org/wiki/Regular_expression#Basic_concepts)

This TEI datatype is mapped to the XSD token datatype, and may therefore contain any string of characters. However, it is recommended that the value used conform to the particular flavour of regular expression syntax supported by XSD Schema. 

## teidata.pointer
teidata.pointer defines the range of attribute values used to provide a single URI, absolute or relative, pointing to some other resource, either within the current document or elsewhere.ModuleteiUsed byElement: 
* [change](#TEI.change)/@target

* [dataRef](#TEI.dataRef)/@ref

* [include](#TEI.include)/@href

* [keywords](#TEI.keywords)/@scheme

* [moduleRef](#TEI.moduleRef)/@url

* [specGrpRef](#TEI.specGrpRef)/@target
Content model
<content>
 <dataRef restriction="\S+" name="anyURI"/>
</content>
    Declaration
teidata.pointer = xsd:anyURI { pattern = "\S+" }Note
The range of syntactically valid values is defined by [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) Uniform Resource Identifier (URI): Generic Syntax. Note that the values themselves are encoded using [RFC 3987](https://www.ietf.org/rfc/rfc3987.txt) Internationalized Resource Identifiers (IRIs) mapping to URIs. For example, https://secure.wikimedia.org/wikipedia/en/wiki/% is encoded as https://secure.wikimedia.org/wikipedia/en/wiki/%25 while http://موقع.وزارة-الاتصالات.مصر/ is encoded as http://xn--4gbrim.xn----rmckbbajlc6dj7bxne2c.xn--wgbh1c/

## teidata.probability
teidata.probability defines the range of attribute values expressing a probability.ModuleteiUsed byContent model
<content>
 <dataRef name="double">
  <dataFacet name="minInclusive" value="0"/>
  <dataFacet name="maxInclusive" value="1"/>
 </dataRef>
</content>
    Declaration
teidata.probability = xsd:doubleNote
Probability is expressed as a real number between 0 and 1; 0 representing certainly false and 1 representing certainly true.

## teidata.temporal.w3c
teidata.temporal.w3c defines the range of attribute values expressing a temporal expression such as a date, a time, or a combination of them, that conform to the W3C [XML Schema Part 2: Datatypes Second Edition](#XSD2) specification.ModuleteiUsed byContent model
<content>
 <alternate>
  <dataRef name="date"/>
  <dataRef name="gYear"/>
  <dataRef name="gMonth"/>
  <dataRef name="gDay"/>
  <dataRef name="gYearMonth"/>
  <dataRef name="gMonthDay"/>
  <dataRef name="time"/>
  <dataRef name="dateTime"/>
 </alternate>
</content>
    Declaration
teidata.temporal.w3c =
   xsd:date
 | xsd:gYear
 | xsd:gMonth
 | xsd:gDay
 | xsd:gYearMonth
 | xsd:gMonthDay
 | xsd:time
 | xsd:dateTimeNote
If it is likely that the value used is to be compared with another, then a time zone indicator should always be included, and only the dateTime representation should be used.

## teidata.temporal.working
teidata.temporal.working defines the range of values, conforming to the W3C [XML Schema Part 2: Datatypes Second Edition](#XSD2) specification, expressing a date or a date and a time within the working life of the document.ModuleteiUsed byContent model
<content>
 <alternate>
  <dataRef name="date"
   restriction="(19[789][0-9]|[2-9][0-9]{3}).*"/>
  <dataRef name="dateTime"
   restriction="(19[789][0-9]|[2-9][0-9]{3}).*"/>
 </alternate>
</content>
    Declaration
teidata.temporal.working =
   xsd:date { pattern = "(19[789][0-9]|[2-9][0-9]{3}).*" }
 | xsd:dateTime { pattern = "(19[789][0-9]|[2-9][0-9]{3}).*" }Note
If it is likely that the value used is to be compared with another, then a time zone indicator should always be included, and only the dateTime representation should be used.

The earliest time expressable with this datatype is 01 January 1970 (the Unix Epoch), which could be written as either 1970-01-01 or 1970-01-01T00:00:00Z.

## teidata.text
teidata.text defines the range of attribute values used to express some kind of identifying string as a single sequence of Unicode characters possibly including whitespace.ModuleteiUsed byElement: 
* [include](#TEI.include)/@xpointer

* [include](#TEI.include)/@encoding

* [include](#TEI.include)/@accept

* [include](#TEI.include)/@accept-charset

* [include](#TEI.include)/@accept-language

* [remarks](#TEI.remarks)/@ident

* [valItem](#TEI.valItem)/@ident
Content model
<content>
 <dataRef name="string"/>
</content>
    Declaration
teidata.text = stringNote
Attributes using this datatype must contain a single token in which whitespace and other punctuation characters are permitted.

## teidata.truthValue
teidata.truthValue defines the range of attribute values used to express a truth value.ModuleteiUsed byElement: 
* [content](#TEI.content)/@autoPrefix

* [sequence](#TEI.sequence)/@preserveOrder

* [tagsDecl](#TEI.tagsDecl)/@partial
Content model
<content>
 <dataRef name="boolean"/>
</content>
    Declaration
teidata.truthValue = xsd:booleanNote
The possible values of this datatype are 1 or true, or 0 or false.

This datatype applies only for cases where uncertainty is inappropriate; if the attribute concerned may have a value other than true or false, e.g. unknown, or inapplicable, it should have the extended version of this datatype: teidata.xTruthValue.

## teidata.unboundedCount
teidata.unboundedCount defines the range of values used for a counting number or the string unbounded for infinity.ModuleteiUsed byElement: 
* [datatype](#TEI.datatype)/@maxOccurs
Content model
<content>
 <alternate>
  <dataRef name="nonNegativeInteger"/>
  <valList type="closed">
   <valItem ident="unbounded"/>
  </valList>
 </alternate>
</content>
    Declaration
teidata.unboundedCount = xsd:nonNegativeInteger | ( "unbounded" )
## teidata.version
teidata.version defines the range of attribute values which may be used to specify a TEI or Unicode version number.ModuleteiUsed byElement: 
* [TEI](#TEI.TEI)/@version
Content model
<content>
 <dataRef name="token"
  restriction="[\d]+(\.[\d]+){0,2}"/>
</content>
    Declaration
teidata.version = token { pattern = "[\d]+(\.[\d]+){0,2}" }Note
The value of this attribute follows the pattern specified by the Unicode consortium for its version number (). A version number contains digits and fullstop characters only. The first number supplied identifies the major version number. A second and third number, for minor and sub-minor version numbers, may also be supplied.

## teidata.word
teidata.word defines the range of attribute values expressed as a single word or token.ModuleteiUsed by[teidata.enumerated](#TEI.teidata.enumerated)Element: 
* [code](#TEI.code)/@lang

* [dataFacet](#TEI.dataFacet)/@name
Content model
<content>
 <dataRef name="token"
  restriction="[^\p{C}\p{Z}]+"/>
</content>
    Declaration
teidata.word = token { pattern = "[^\p{C}\p{Z}]+" }Note
Attributes using this datatype must contain a single word which contains only letters, digits, punctuation characters, or symbols: thus it cannot include whitespace.

## teidata.xmlName
teidata.xmlName defines attribute values which contain an XML name.ModuleteiUsed byElement: 
* [classRef](#TEI.classRef)/@key

* [classRef](#TEI.classRef)/@include

* [classRef](#TEI.classRef)/@except

* [dataRef](#TEI.dataRef)/@key

* [dataRef](#TEI.dataRef)/@name

* [elementRef](#TEI.elementRef)/@key

* [elementSpec](#TEI.elementSpec)/@prefix

* [macroRef](#TEI.macroRef)/@key

* [moduleRef](#TEI.moduleRef)/@prefix

* [moduleRef](#TEI.moduleRef)/@include

* [moduleRef](#TEI.moduleRef)/@except

* [moduleRef](#TEI.moduleRef)/@key

* [schemaSpec](#TEI.schemaSpec)/@prefix
Content model
<content>
 <dataRef name="NCName"/>
</content>
    Declaration
teidata.xmlName = xsd:NCNameNote
The rules defining an XML name form a part of the XML Specification.

## teidata.xpath
teidata.xpath defines attribute values which contain an XPath expression.ModuleteiUsed byContent model
<content>
 <textNode/>
</content>
    Declaration
teidata.xpath = textNote
Any XPath expression using the syntax defined in [6.2.](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/BIB.html#XSLT2).

When writing programs that evaluate XPath expressions, programmers should be mindful of the possibility of malicious code injection attacks. For further information about XPath injection attacks, see the [article at OWASP](https://owasp.org/www-community/attacks/XPATH_Injection).
