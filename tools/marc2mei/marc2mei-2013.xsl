<?xml version="1.0" encoding="UTF-8"?>

<!--
	
	marc2mei-2013.xsl - XSLT (1.0) stylesheet for transformation of RISM MARC XML to MEI header XML
	
	Perry Roland <pdr4h@virginia.edu>
	Music Library
	University of Virginia
	Written: 2013-11-12
	Last modified: 2013-11-12
	
	For info on MARC XML, see http://www.loc.gov/marc/marcxml.html
	For info on the MEI header, see http://music-encoding.org
	For info on RISM, see http://www.rism-ch.org
	
	Based on:
	1. https://code.google.com/p/mei-incubator/source/browse/rism2mei/rism2mei-2012.xsl
	Laurent Pugin <laurent.pugin@rism-ch.org> / Swiss RISM Office 
	2. http://oreo.grainger.uiuc.edu/stylesheets/MARC_TEI-twc.xsl
	3. marc2tei.xsl - XSLT (1.0) stylesheet for transformation of MARC XML to TEI header XML (TEI P4)
	Greg Murray <gpm2a@virginia.edu> / Digital Library Production Services, University of Virginia Library
	
-->

<xsl:stylesheet version="2.0" xmlns="http://www.music-encoding.org/ns/mei"
  xmlns:mei="http://www.music-encoding.org/ns/mei" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:marc="http://www.loc.gov/MARC21/slim" exclude-result-prefixes="marc mei">

  <xsl:output method="xml" encoding="UTF-8" indent="yes" media-type="text/xml"/>

  <!-- version -->
  <xsl:variable name="version">
    <xsl:text>1.0 beta</xsl:text>
  </xsl:variable>

  <!-- PARAMETERS -->
  <xsl:param name="rng_model_path"
    >http://music-encoding.googlecode.com/svn/tags/MEI2013_v2.1.0/schemata/mei-all.rng</xsl:param>
  <xsl:param name="sch_model_path"
    >http://music-encoding.googlecode.com/svn/tags/MEI2013_v2.1.0/schemata/mei-all.rng</xsl:param>
  <!-- agency name -->
  <xsl:param name="agency"/>
  <!-- agency code, could also be taken from 003 -->
  <xsl:param name="agency_code"/>
  <!-- output analog attributes -->
  <xsl:param name="analog">true</xsl:param>
  <!-- preserve main entry -->
  <xsl:param name="preserveMainEntry">true</xsl:param>

  <!-- ======================================================================= -->
  <!-- UTILITIES                                                               -->
  <!-- ======================================================================= -->

  <xsl:template name="analog">
    <xsl:param name="tag"/>
    <xsl:attribute name="analog">
      <xsl:value-of select="concat('marc:', $tag)"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="datafield">
    <xsl:param name="tag"/>
    <xsl:param name="ind1">
      <xsl:text> </xsl:text>
    </xsl:param>
    <xsl:param name="ind2">
      <xsl:text> </xsl:text>
    </xsl:param>
    <xsl:param name="subfields"/>
    <datafield>
      <xsl:attribute name="tag">
        <xsl:value-of select="$tag"/>
      </xsl:attribute>
      <xsl:attribute name="ind1">
        <xsl:value-of select="$ind1"/>
      </xsl:attribute>
      <xsl:attribute name="ind2">
        <xsl:value-of select="$ind2"/>
      </xsl:attribute>
      <xsl:copy-of select="$subfields"/>
    </datafield>
  </xsl:template>

  <xsl:template name="subfieldSelect">
    <xsl:param name="codes"/>
    <xsl:param name="delimiter">
      <xsl:text> </xsl:text>
    </xsl:param>
    <xsl:param name="element"/>
    <xsl:choose>
      <xsl:when test="string-length($element) &gt; 0">
        <xsl:element name="{$element}">
          <xsl:variable name="str">
            <xsl:for-each select="marc:subfield">
              <xsl:if test="contains($codes, @code)">
                <xsl:value-of select="text()"/>
                <xsl:value-of select="$delimiter"/>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>
          <xsl:value-of select="substring($str,1,string-length($str)-string-length($delimiter))"/>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="str">
          <xsl:for-each select="marc:subfield">
            <xsl:if test="contains($codes, @code)">
              <xsl:value-of select="text()"/>
              <xsl:value-of select="$delimiter"/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="substring($str,1,string-length($str)-string-length($delimiter))"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="buildSpaces">
    <xsl:param name="spaces"/>
    <xsl:param name="char">
      <xsl:text> </xsl:text>
    </xsl:param>
    <xsl:if test="$spaces>0">
      <xsl:value-of select="$char"/>
      <xsl:call-template name="buildSpaces">
        <xsl:with-param name="spaces" select="$spaces - 1"/>
        <xsl:with-param name="char" select="$char"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="chopPunctuation">
    <xsl:param name="chopString"/>
    <xsl:variable name="length" select="string-length($chopString)"/>
    <xsl:choose>
      <xsl:when test="$length=0"/>
      <xsl:when test="contains('.:,;+/ ', substring($chopString,$length,1))">
        <xsl:call-template name="chopPunctuation">
          <xsl:with-param name="chopString" select="substring($chopString,1,$length - 1)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="not($chopString)"/>
      <xsl:otherwise>
        <xsl:value-of select="$chopString"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="chopPunctuationFront">
    <xsl:param name="chopString"/>
    <xsl:variable name="length" select="string-length($chopString)"/>
    <xsl:choose>
      <xsl:when test="$length=0"/>
      <xsl:when test="contains('.:,;/[ ', substring($chopString,1,1))">
        <xsl:call-template name="chopPunctuationFront">
          <xsl:with-param name="chopString" select="substring($chopString,2,$length - 1)"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="not($chopString)"/>
      <xsl:otherwise>
        <xsl:value-of select="$chopString"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- TOP-LEVEL TEMPLATE                                                      -->
  <!-- ======================================================================= -->

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="//marc:record">
        <xsl:apply-templates select="//marc:record[1]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>marc2mei.xsl: ERROR: No records found.</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="marc:record">
    <xsl:call-template name="meiHead"/>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- MAIN OUTPUT TEMPLATE                                                    -->
  <!-- ======================================================================= -->

  <xsl:template name="meiHead">

    <!-- UNUSED -->
    <!--<xsl:variable name="leader" select="marc:leader"/>
    <xsl:variable name="leader6" select="substring($leader,7,1)"/>
    <xsl:variable name="leader7" select="substring($leader,8,1)"/>
    <xsl:variable name="controlField005" select="marc:controlfield[@tag='005']"/>
    <xsl:variable name="controlField008" select="marc:controlfield[@tag='008']"/>-->

    <xsl:if test="$rng_model_path != ''">
      <xsl:processing-instruction name="xml-model">
        <xsl:value-of select="concat('&#32;href=&quot;', $rng_model_path, '&quot;')"/>
        <xsl:text> type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
      </xsl:processing-instruction>
    </xsl:if>
    <xsl:if test="$sch_model_path != ''">
      <xsl:processing-instruction name="xml-model">
        <xsl:value-of select="concat('&#32;href=&quot;', $sch_model_path, '&quot;')"/>
        <xsl:text> type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
      </xsl:processing-instruction>
    </xsl:if>

    <meiHead>
      <xsl:attribute name="meiversion">2013</xsl:attribute>
      <xsl:if test="marc:datafield[@tag='040']/marc:subfield[@code='b']">
        <xsl:attribute name="xml:lang">
          <xsl:value-of select="marc:datafield[@tag='040']/marc:subfield[@code='b']"/>
        </xsl:attribute>
      </xsl:if>
      <altId analog="marc:001">
        <xsl:apply-templates select="marc:controlfield[@tag='001']"/>
      </altId>
      <fileDesc>

        <!-- file title(s) -->
        <titleStmt>
          <!-- title for electronic text (240 and 245) -->
          <xsl:apply-templates select="marc:datafield[@tag='240' or @tag='245']"/>
          <title type="subtitle">an electronic transcription</title>

          <!-- statements of responsibility -->
          <xsl:variable name="respStmts">
            <xsl:apply-templates select="marc:datafield[@tag='100' or @tag='110']"/>
            <xsl:if test="not($preserveMainEntry = 'true')">
              <xsl:apply-templates select="marc:datafield[@tag='700' or @tag='710']"/>
            </xsl:if>
          </xsl:variable>
          <xsl:variable name="sortedRespStmts">
            <xsl:for-each select="$respStmts/mei:respStmt">
              <xsl:sort select="mei:*[local-name()='persName' or local-name()='corpName']/@analog"/>
              <xsl:sort/>
              <xsl:copy-of select="."/>
            </xsl:for-each>
          </xsl:variable>
          <xsl:for-each select="$sortedRespStmts/mei:respStmt">
            <xsl:if test="not(preceding-sibling::mei:respStmt = .)">
              <xsl:copy-of select="."/>
            </xsl:if>
          </xsl:for-each>
        </titleStmt>

        <!-- edtStmt -->
        <!-- UNUSED -->

        <!-- extent -->
        <!-- UNUSED -->

        <!-- publication statement -->
        <pubStmt>
          <xsl:call-template name="pubStmt"/>
        </pubStmt>

        <!-- seriesStmt -->
        <!-- UNUSED -->

        <!-- notesStmt-->
        <xsl:variable name="notes" select="marc:datafield[@tag='500' or @tag='506' or
          @tag='510' or @tag='520' or @tag='525' or @tag='533' or @tag='541' or @tag='545' or
          @tag='546' or @tag='555' or @tag='561' or @tag='563' or @tag='580' or @tag='591' or
          @tag='594' or @tag='596' or @tag='597' or @tag='598']"/>
        <xsl:variable name="musicPresentation" select="datafield[@tag='254']"/>
        <xsl:if test="$notes or $musicPresentation">
          <notesStmt>
            <xsl:apply-templates select="$notes"/>
            <xsl:apply-templates select="$musicPresentation"/>
          </notesStmt>
        </xsl:if>

        <!-- sourceDesc -->
        <sourceDesc>
          <xsl:choose>
            <!-- if no fields with $3, there's a single source -->
            <xsl:when test="count(//marc:subfield[@code='3'])=0">
              <source>
                <!-- pubStmt and physDesc -->
                <xsl:apply-templates select="marc:datafield[@tag='260' or @tag='300']"/>
                <!-- seriesStmt -->
                <xsl:apply-templates select="marc:datafield[@tag='490']"/>
                <!-- contentNote -->
                <xsl:apply-templates select="marc:datafield[@tag='505']"/>
                <!-- language(s) of the source material -->
                <xsl:variable name="langUsage" select="marc:datafield[@tag='041']"/>
                <xsl:if test="$langUsage">
                  <langUsage>
                    <xsl:apply-templates select="$langUsage"/>
                  </langUsage>
                </xsl:if>

                <!-- notesStmt -->
                <xsl:if test="marc:datafield[@tag='590' or @tag='592' or @tag='593']">
                  <notesStmt>
                    <xsl:apply-templates select="marc:datafield[@tag='590' or @tag='592' or
                      @tag='593']"/>
                  </notesStmt>
                </xsl:if>
              </source>
            </xsl:when>
            <xsl:otherwise>
              <!-- group 260, 300, 490, 590, 592, and 593 on subfield 3 -->
              <xsl:for-each-group select="marc:datafield[@tag='260' or @tag='300' or @tag='490' or
                @tag='590' or @tag='592' or @tag='593'][marc:subfield[@code='3']]"
                group-by="marc:subfield[@code='3']">
                <xsl:sort select="current-grouping-key()"/>
                <source>
                  <xsl:attribute name="label">
                    <xsl:value-of select="current-grouping-key()"/>
                  </xsl:attribute>
                  <xsl:variable name="sourceContent">
                    <xsl:for-each select="current-group()">
                      <xsl:apply-templates select="."/>
                    </xsl:for-each>
                  </xsl:variable>
                  <xsl:copy-of select="$sourceContent/*[not(local-name()='annot')]"/>
                  <notesStmt>
                    <xsl:copy-of select="$sourceContent/*[local-name()='annot']"/>
                  </notesStmt>
                </source>
              </xsl:for-each-group>
            </xsl:otherwise>
          </xsl:choose>
        </sourceDesc>
      </fileDesc>

      <!-- encodingDesc -->
      <encodingDesc>
        <appInfo>
          <application>
            <xsl:attribute name="version">
              <xsl:value-of select="$version"/>
            </xsl:attribute>
            <name>marc2mei-2013.xsl</name>
          </application>
        </appInfo>
      </encodingDesc>

      <!-- workDesc -->
      <workDesc>
        <work>

          <!-- work title(s) -->
          <titleStmt>
            <xsl:apply-templates select="marc:datafield[@tag='130' or @tag='240']"/>
            <xsl:if test="not(marc:datafield[@tag='130' or @tag='240'])">
              <xsl:apply-templates select="marc:datafield[@tag='245']"/>
            </xsl:if>

            <!-- statements of responsibility -->
            <xsl:variable name="respStmts">
              <xsl:apply-templates select="marc:datafield[@tag='100' or @tag='110']"/>
              <xsl:apply-templates select="marc:datafield[@tag='700' or @tag='710']"/>
            </xsl:variable>
            <xsl:variable name="sortedRespStmts">
              <xsl:for-each select="$respStmts/mei:respStmt">
                <xsl:sort select="mei:*[local-name()='persName' or local-name()='corpName']/@analog"/>
                <xsl:sort/>
                <xsl:copy-of select="."/>
              </xsl:for-each>
            </xsl:variable>
            <xsl:for-each select="$sortedRespStmts/mei:respStmt">
              <xsl:if test="not(preceding-sibling::mei:respStmt = .)">
                <xsl:copy-of select="."/>
              </xsl:if>
            </xsl:for-each>
          </titleStmt>

          <!-- creation -->
          <xsl:variable name="creation_note" select="marc:datafield[@tag='508']"/>

          <!-- incipits -->
          <xsl:variable name="incipits" select="marc:datafield[@tag='031']"/>
          <xsl:if test="$incipits">
            <xsl:apply-templates select="$incipits"/>
          </xsl:if>

          <!-- eventList -->
          <xsl:variable name="events" select="marc:datafield[@tag='511' or @tag='518']"/>
          <xsl:if test="$creation_note or $events">
            <history>
              <xsl:if test="$creation_note">
                <creation>
                  <xsl:if test="$analog='true'">
                    <xsl:call-template name="analog">
                      <xsl:with-param name="tag">
                        <xsl:value-of select="'508'"/>
                      </xsl:with-param>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:for-each select="marc:datafield[@tag='508']">
                    <xsl:apply-templates select="."/>
                    <xsl:if test="position() != last()">
                      <xsl:text>;&#32;</xsl:text>
                    </xsl:if>
                  </xsl:for-each>
                </creation>
              </xsl:if>
              <xsl:if test="$events">
                <eventList>
                  <xsl:apply-templates select="$events"/>
                </eventList>
              </xsl:if>
            </history>
          </xsl:if>

          <!-- language of the work -->
          <xsl:variable name="langUsage" select="marc:datafield[@tag='041'][marc:subfield[@code='a'
            or @code='d' or @code='e']]"/>
          <xsl:if test="$langUsage">
            <langUsage>
              <xsl:apply-templates select="$langUsage"/>
            </langUsage>
          </xsl:if>

          <!-- cast list -->
          <xsl:variable name="castNotes" select="marc:datafield[@tag='595']"/>
          <xsl:if test="$castNotes">
            <perfMedium>
              <castList>
                <xsl:variable name="sortedCastList">
                  <xsl:apply-templates select="$castNotes">
                    <xsl:sort/>
                  </xsl:apply-templates>
                </xsl:variable>
                <xsl:variable name="uniqueItems">
                  <xsl:for-each select="$sortedCastList/mei:castItem">
                    <xsl:if test="not(preceding-sibling::mei:castItem = .)">
                      <xsl:copy-of select="."/>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:variable>
                <xsl:for-each select="$uniqueItems/mei:castItem">
                  <xsl:sort select="@analog"/>
                  <xsl:copy-of select="."/>
                </xsl:for-each>
              </castList>
            </perfMedium>
          </xsl:if>

          <!-- contents -->
          <xsl:variable name="contents" select="marc:datafield[@tag='730' or @tag='740']"/>
          <xsl:if test="$contents">
            <contents>
              <xsl:apply-templates select="$contents" mode="contents"/>
            </contents>
          </xsl:if>

          <!-- classification -->
          <xsl:variable name="classification" select="marc:datafield[@tag='090' or @tag='648' or
            @tag='650' or @tag='651' or @tag='653' or @tag='654' or @tag='655' or
            @tag='656' or @tag='657' or @tag='658']"/>

          <xsl:if test="$classification">
            <!-- classification codes -->
            <classification>
              <xsl:variable name="classCodes">

                <!-- common schemes -->
                <xsl:if test="marc:datafield[@tag='090']">
                  <classCode n="-1" xml:id="LCCN">Library of Congress Classification
                    Number</classCode>
                </xsl:if>
                <xsl:if test="marc:datafield[@tag='648' or @tag='650' or
                  @tag='651' or @tag='653' or @tag='654' or @tag='655' or
                  @tag='656' or @tag='657' or @tag='658'][@ind2='0']">
                  <classCode n="0" xml:id="LCSH">Library of Congress Subject Headings</classCode>
                </xsl:if>
                <xsl:if test="marc:datafield[@tag='648' or @tag='650' or
                  @tag='651' or @tag='653' or @tag='654' or @tag='655' or
                  @tag='656' or @tag='657' or @tag='658'][@ind2='1']">
                  <classCode n="1" xml:id="LCCL">LC subject headings for children's
                    literature</classCode>
                </xsl:if>
                <xsl:if test="marc:datafield[@tag='648' or @tag='650' or
                  @tag='651' or @tag='653' or @tag='654' or @tag='655' or
                  @tag='656' or @tag='657' or @tag='658'][@ind2='2']">
                  <classCode n="2" xml:id="MeSH">Medical Subject Headings </classCode>
                </xsl:if>
                <xsl:if test="marc:datafield[@tag='648' or @tag='650' or
                  @tag='651' or @tag='653' or @tag='654' or @tag='655' or
                  @tag='656' or @tag='657' or @tag='658'][@ind2='3']">
                  <classCode n="3" xml:id="NALSA">National Agricultural Library subject authority
                    file</classCode>
                </xsl:if>
                <xsl:if test="marc:datafield[@tag='648' or @tag='650' or
                  @tag='651' or @tag='653' or @tag='654' or @tag='655' or
                  @tag='656' or @tag='657' or @tag='658'][@ind2='5']">
                  <classCode n="5" xml:id="CSH">Canadian Subject Headings</classCode>
                </xsl:if>
                <xsl:if test="marc:datafield[@tag='648' or @tag='650' or
                  @tag='651' or @tag='653' or @tag='654' or @tag='655' or
                  @tag='656' or @tag='657' or @tag='658'][@ind2='6']">
                  <classCode n="6" xml:id="RVM">Répertoire de vedettes-matière</classCode>
                </xsl:if>

                <!-- record-defined schemes -->
                <xsl:for-each select="marc:datafield[@tag='650' or @tag='651' or
                  @tag='653' or @tag='657'][marc:subfield[@code='2']]">
                  <xsl:variable name="classScheme">
                    <xsl:value-of select="marc:subfield[@code='2']"/>
                  </xsl:variable>
                  <classCode>
                    <xsl:attribute name="xml:id">
                      <xsl:value-of select="replace($classScheme, '&#32;', '_')"/>
                    </xsl:attribute>
                    <xsl:value-of select="$classScheme"/>
                  </classCode>
                </xsl:for-each>
              </xsl:variable>

              <!-- unique schemes -->
              <xsl:variable name="uniqueClassCodes">
                <xsl:for-each select="$classCodes/mei:classCode">
                  <xsl:sort/>
                  <xsl:if test="not(preceding-sibling::mei:classCode = .)">
                    <xsl:copy-of select="."/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:variable>

              <!-- sort based on @n; record-defined schemes will bubble
              to the top of the list, schemes provided in this stylesheet
              will sink to the bottom but remain in the order of their
              coded value in MARC. -->
              <xsl:for-each select="$uniqueClassCodes/mei:classCode">
                <xsl:sort select="@n"/>
                <xsl:copy>
                  <xsl:copy-of select="@* except(@n)"/>
                  <xsl:value-of select="."/>
                </xsl:copy>
              </xsl:for-each>

              <termList>
                <xsl:variable name="sortedTerms">
                  <xsl:apply-templates select="$classification">
                    <xsl:sort/>
                  </xsl:apply-templates>
                </xsl:variable>
                <xsl:variable name="uniqueTerms">
                  <xsl:for-each select="$sortedTerms/mei:term">
                    <xsl:if test="not(preceding-sibling::mei:term = .)">
                      <xsl:copy-of select="."/>
                    </xsl:if>
                  </xsl:for-each>
                </xsl:variable>
                <xsl:for-each select="$uniqueTerms/mei:term">
                  <xsl:sort select="@analog"/>
                  <xsl:copy-of select="."/>
                </xsl:for-each>
              </termList>
            </classification>
          </xsl:if>

        </work>
      </workDesc>
    </meiHead>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- title (130, 240, 245, 246, 730, 740)                                    -->
  <!-- ======================================================================= -->

  <!-- uniform title 130, 240, 730, 740 (subfields a, k, m, n, o, p, r) -->
  <xsl:template match="marc:datafield[@tag='130' or @tag='240']">
    <!-- main title: subfield a (non-repeatable) -->
    <xsl:variable name="tag" select="@tag"/>
    <title type="uniform">
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="chopPunctuation">
        <xsl:with-param name="chopString">
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">a</xsl:with-param>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>

      <!-- test for certain other subfields to append to main value -->
      <!-- some subfields are repeatable, so loop through all -->
      <xsl:for-each select="marc:subfield[@code='k' or @code='m' or @code='n' or @code='o' or
        @code='p' or @code='r']">
        <xsl:choose>
          <xsl:when test="@code='r'">
            <!-- subfield r = 'Key for music'; add 'in' -->
            <xsl:text>, in </xsl:text>
            <xsl:value-of select="."/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="."/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </title>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='730' or @tag='740']" mode="contents">
    <xsl:variable name="tag" select="@tag"/>
    <contentItem>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="chopPunctuation">
        <xsl:with-param name="chopString">
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">a</xsl:with-param>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </contentItem>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='730' or @tag='740']" mode="analytics">
    <!-- analytic title: subfield a (non-repeatable) -->
    <xsl:variable name="tag" select="@tag"/>
    <work>
      <xsl:attribute name="n">
        <xsl:value-of select="concat('c', position())"/>
      </xsl:attribute>
      <titleStmt>
        <title level="a">
          <xsl:if test="$analog='true'">
            <xsl:call-template name="analog">
              <xsl:with-param name="tag">
                <xsl:value-of select="$tag"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:call-template name="chopPunctuation">
            <xsl:with-param name="chopString">
              <xsl:call-template name="subfieldSelect">
                <xsl:with-param name="codes">a</xsl:with-param>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>

          <!-- test for certain other subfields to append to main value -->
          <!-- some subfields are repeatable, so loop through all -->
          <xsl:for-each select="marc:subfield[@code='k' or @code='m' or @code='n' or @code='o' or
            @code='p' or @code='r']">
            <xsl:choose>
              <xsl:when test="@code='r'">
                <!-- subfield r = 'Key for music'; add 'in' -->
                <xsl:text>, in </xsl:text>
                <xsl:value-of select="."/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="."/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:for-each>
        </title>
      </titleStmt>
    </work>
  </xsl:template>

  <!-- diplomatic title 245, 246 (subfields a, b) -->
  <xsl:template match="marc:datafield[@tag='245']">
    <!-- main title: subfield a (non-repeatable) -->
    <title type="diplomatic">
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="chopPunctuation">
        <xsl:with-param name="chopString">
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">ab</xsl:with-param>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </title>
  </xsl:template>

  <!-- series title -->
  <xsl:template match="marc:datafield[@tag='490']">
    <seriesStmt>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <title>
        <xsl:call-template name="chopPunctuation">
          <xsl:with-param name="chopString">
            <xsl:call-template name="subfieldSelect">
              <xsl:with-param name="codes">a</xsl:with-param>
            </xsl:call-template>
          </xsl:with-param>
        </xsl:call-template>
      </title>
      <xsl:if test="marc:subfield[@code='v']">
        <biblScope>
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">v</xsl:with-param>
          </xsl:call-template>
        </biblScope>
      </xsl:if>
      <xsl:if test="marc:subfield[@code='x']">
        <identifier>
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">x</xsl:with-param>
          </xsl:call-template>
        </identifier>
      </xsl:if>
    </seriesStmt>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- Main Entry (100, 110)                                                   -->
  <!-- ======================================================================= -->

  <xsl:template match="marc:datafield[@tag='100' or @tag='110']">
    <xsl:variable name="tag">
      <xsl:value-of select="@tag"/>
    </xsl:variable>
    <!-- each name is contained within a <respStmt> to account for possible <resp>
      elements -->
    <respStmt>
      <xsl:choose>
        <xsl:when test="$tag='110'">
          <!-- corporate name; use subfield a (non-repeatable) -->
          <corpName role="creator">
            <xsl:if test="marc:subfield[@code='0']">
              <xsl:attribute name="dbkey">
                <xsl:value-of select="marc:subfield[@code='0']"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="$analog='true'">
              <xsl:call-template name="analog">
                <xsl:with-param name="tag">
                  <xsl:value-of select="$tag"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='d']">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:text>&#32;</xsl:text>
                <date>
                  <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString">
                      <xsl:value-of select="marc:subfield[@code='d']"/>
                    </xsl:with-param>
                  </xsl:call-template>
                </date>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:value-of select="marc:subfield[@code='a']"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </corpName>
        </xsl:when>
        <xsl:otherwise>
          <!-- personal name; use subfields a and d -->
          <persName role="creator">
            <xsl:if test="marc:subfield[@code='0']">
              <xsl:attribute name="dbkey">
                <xsl:value-of select="marc:subfield[@code='0']"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="$analog='true'">
              <xsl:call-template name="analog">
                <xsl:with-param name="tag">
                  <xsl:value-of select="$tag"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='d']">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:text>&#32;</xsl:text>
                <date>
                  <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString">
                      <xsl:value-of select="marc:subfield[@code='d']"/>
                    </xsl:with-param>
                  </xsl:call-template>
                </date>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:value-of select="marc:subfield[@code='a']"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </persName>
        </xsl:otherwise>
      </xsl:choose>
    </respStmt>
    <xsl:if test="marc:subfield[@code='e']">
      <resp>
        <xsl:for-each select="marc:subfield[@code='e']">
          <xsl:call-template name="chopPunctuation">
            <xsl:with-param name="chopString">
              <xsl:value-of select="."/>
            </xsl:with-param>
          </xsl:call-template>
          <xsl:if test="position() != last()">
            <xsl:text>, </xsl:text>
          </xsl:if>
        </xsl:for-each>
      </resp>
    </xsl:if>

  </xsl:template>

  <!-- ======================================================================= -->
  <!-- respStmt (700, 710)                                                     -->
  <!-- ======================================================================= -->

  <xsl:template match="marc:datafield[@tag='700' or @tag='710']">
    <xsl:variable name="tag">
      <xsl:value-of select="@tag"/>
    </xsl:variable>

    <respStmt>
      <xsl:choose>
        <xsl:when test="$tag='710'">
          <!-- corporate name; use subfield a (non-repeatable) -->
          <corpName>
            <xsl:if test="marc:subfield[@code='0']">
              <xsl:attribute name="dbkey">
                <xsl:value-of select="marc:subfield[@code='0']"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="$analog='true'">
              <xsl:call-template name="analog">
                <xsl:with-param name="tag">
                  <xsl:value-of select="$tag"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='d']">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:text>&#32;</xsl:text>
                <date>
                  <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString">
                      <xsl:value-of select="marc:subfield[@code='d']"/>
                    </xsl:with-param>
                  </xsl:call-template>
                </date>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="chopPunctuation">
                  <xsl:with-param name="chopString">
                    <xsl:value-of select="marc:subfield[@code='a']"/>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="marc:subfield[@code='4']" mode="respStmt"/>
          </corpName>
        </xsl:when>
        <xsl:otherwise>
          <!-- personal name -->
          <persName>
            <xsl:if test="marc:subfield[@code='0']">
              <xsl:attribute name="dbkey">
                <xsl:value-of select="marc:subfield[@code='0']"/>
              </xsl:attribute>
            </xsl:if>
            <xsl:if test="$analog='true'">
              <xsl:call-template name="analog">
                <xsl:with-param name="tag">
                  <xsl:value-of select="$tag"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='d']">
                <xsl:value-of select="marc:subfield[@code='a']"/>
                <xsl:text>&#32;</xsl:text>
                <date>
                  <xsl:call-template name="chopPunctuation">
                    <xsl:with-param name="chopString">
                      <xsl:value-of select="marc:subfield[@code='d']"/>
                    </xsl:with-param>
                  </xsl:call-template>
                </date>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="marc:subfield[@code='a']"/>
              </xsl:otherwise>
            </xsl:choose>
          </persName>
          <xsl:apply-templates select="marc:subfield[@code='4']" mode="respStmt"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="marc:subfield[@code='e']">
        <resp>
          <xsl:for-each select="marc:subfield[@code='e']">
            <xsl:call-template name="chopPunctuation">
              <xsl:with-param name="chopString">
                <xsl:value-of select="."/>
              </xsl:with-param>
            </xsl:call-template>
            <xsl:if test="position() != last()">
              <xsl:text>, </xsl:text>
            </xsl:if>
          </xsl:for-each>
        </resp>
      </xsl:if>
    </respStmt>
  </xsl:template>

  <!-- relator codes for 700 and 710 -->
  <xsl:template match="marc:subfield[@code='4']" mode="respStmt">
    <resp>
      <xsl:variable name="code">
        <xsl:value-of select="."/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$code = 'arr'">arranger</xsl:when>
        <xsl:when test="$code = 'art'">artist</xsl:when>
        <xsl:when test="$code = 'asn'">associated name</xsl:when>
        <xsl:when test="$code = 'aut'">author</xsl:when>
        <xsl:when test="$code = 'bnd'">binder</xsl:when>
        <xsl:when test="$code = 'bsl'">bookseller</xsl:when>
        <xsl:when test="$code = 'ccp'">conceptor</xsl:when>
        <xsl:when test="$code = 'chr'">choreographer</xsl:when>
        <xsl:when test="$code = 'clb'">collaborator</xsl:when>
        <xsl:when test="$code = 'cmp'">composer</xsl:when>
        <xsl:when test="$code = 'cnd'">conductor</xsl:when>
        <xsl:when test="$code = 'cns'">censor</xsl:when>
        <xsl:when test="$code = 'com'">compiler</xsl:when>
        <xsl:when test="$code = 'cst'">costume designer</xsl:when>
        <xsl:when test="$code = 'dnc'">dancer</xsl:when>
        <xsl:when test="$code = 'dnr'">donor</xsl:when>
        <xsl:when test="$code = 'dte'">dedicatee</xsl:when>
        <xsl:when test="$code = 'dub'">dubious</xsl:when>
        <xsl:when test="$code = 'edt'">editor</xsl:when>
        <xsl:when test="$code = 'egr'">engraver</xsl:when>
        <xsl:when test="$code = 'fmo'">former owner</xsl:when>
        <xsl:when test="$code = 'ill'">illustrator</xsl:when>
        <xsl:when test="$code = 'itr'">instrumentalist</xsl:when>
        <xsl:when test="$code = 'lbt'">librettist</xsl:when>
        <xsl:when test="$code = 'ltg'">lithograph</xsl:when>
        <xsl:when test="$code = 'lyr'">lyricist</xsl:when>
        <xsl:when test="$code = 'otm'">event organizer</xsl:when>
        <xsl:when test="$code = 'pat'">patron</xsl:when>
        <xsl:when test="$code = 'pbl'">publisher</xsl:when>
        <xsl:when test="$code = 'ppm'">paper maker</xsl:when>
        <xsl:when test="$code = 'prd'">production personnel</xsl:when>
        <xsl:when test="$code = 'prf'">performer</xsl:when>
        <xsl:when test="$code = 'prt'">printer</xsl:when>
        <xsl:when test="$code = 'scr'">scribe</xsl:when>
        <xsl:when test="$code = 'trl'">translator</xsl:when>
        <xsl:when test="$code = 'voc'">vocalist</xsl:when>
        <xsl:otherwise>[unknown]</xsl:otherwise>
      </xsl:choose>
    </resp>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- pubStmt (001, 005)                                                      -->
  <!-- ======================================================================= -->

  <xsl:template name="pubStmt">
    <!-- use <publisher> element? -->
    <respStmt>
      <corpName>
        <xsl:value-of select="$agency"/>
        <xsl:if test="$agency_code != ''">
          <xsl:text>&#32;</xsl:text>
          <identifier authority="MARC Code List for Organizations">
            <xsl:value-of select="$agency_code"/>
          </identifier>
        </xsl:if>
      </corpName>
    </respStmt>
    <date>
      <xsl:choose>
        <xsl:when test="marc:controlfield[@tag='005']">
          <xsl:variable name="pubdate" select="substring(marc:controlfield[@tag='005'],1,4)"/>
          <xsl:value-of select="concat('[', $pubdate, ']')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat('[', format-date(current-date(), '[Y]'), ']')"/>
        </xsl:otherwise>
      </xsl:choose>
    </date>
  </xsl:template>

  <xsl:template match="marc:controlfield[@tag='001']">
    <!-- record ID -->
    <xsl:value-of select="."/>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- notesStmt (254, 5xx)                                               -->
  <!-- ======================================================================= -->

  <!-- music presentation (254) -->
  <xsl:template match="marc:datafield[@tag='254']">
    <xsl:variable name="tag" select="@tag"/>
    <annot type="musical_presentation" n="{$tag}">
      <xsl:call-template name="subfieldSelect">
        <xsl:with-param name="codes">a</xsl:with-param>
      </xsl:call-template>
    </annot>
  </xsl:template>

  <!-- notes (5XX) -->
  <xsl:template match="marc:datafield[@tag='500' or @tag='506' or @tag='510' or @tag='520' or
    @tag='525' or @tag='533' or @tag='541' or @tag='545' or @tag='546' or @tag='555' or
    @tag='561' or @tag='563' or @tag='580' or @tag='591' or @tag='596' or @tag='597' or
    @tag='598']">
    <xsl:variable name="tag" select="@tag"/>
    <xsl:variable name="annottype">
      <xsl:choose>
        <xsl:when test="$tag = '500'">general</xsl:when>
        <!--<xsl:when test="$tag = '505'">content</xsl:when>-->
        <xsl:when test="$tag = '506'">access</xsl:when>
        <xsl:when test="$tag = '510'">reference</xsl:when>
        <xsl:when test="$tag = '520'">summary</xsl:when>
        <xsl:when test="$tag = '525'">supplementary_material</xsl:when>
        <xsl:when test="$tag = '533'">reproduction</xsl:when>
        <xsl:when test="$tag = '541'">acquisition</xsl:when>
        <xsl:when test="$tag = '545'">biography</xsl:when>
        <xsl:when test="$tag = '546'">language</xsl:when>
        <xsl:when test="$tag = '555'">aid</xsl:when>
        <xsl:when test="$tag = '561'">provenance</xsl:when>
        <xsl:when test="$tag = '563'">binding</xsl:when>
        <xsl:when test="$tag = '580'">linking</xsl:when>
        <xsl:when test="$tag = '591'">local</xsl:when>
        <xsl:when test="$tag = '596'">local</xsl:when>
        <xsl:when test="$tag = '597'">local</xsl:when>
        <xsl:when test="$tag = '598'">local</xsl:when>

        <!-- RISM specifications for 59x fields -->
        <!--
        <xsl:when test="$tag = '591'">olim</xsl:when>
        <xsl:when test="$tag = '596'">rism_reference</xsl:when>
        <xsl:when test="$tag = '597'">binding</xsl:when>
        <xsl:when test="$tag = '598'">original_parts</xsl:when>
        -->

        <xsl:otherwise>[unspecified]</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <annot type="{$annottype}">
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$tag='541'">
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">acd</xsl:with-param>
            <xsl:with-param name="delimiter">, </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$tag='591'">
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">a4</xsl:with-param>
            <xsl:with-param name="delimiter">, </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">a</xsl:with-param>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </annot>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='505']">
    <contents>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="not(@ind1='8')">
        <xsl:attribute name="label">
          <xsl:choose>
            <xsl:when test="@ind1='0'">
              <xsl:text>Contents</xsl:text>
            </xsl:when>
            <xsl:when test="@ind1='1'">
              <xsl:text>Incomplete contents</xsl:text>
            </xsl:when>
            <xsl:when test="@ind1='2'">
              <xsl:text>Partial contents</xsl:text>
            </xsl:when>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>
      <p>
        <xsl:call-template name="chopPunctuation">
          <xsl:with-param name="chopString">
            <xsl:call-template name="subfieldSelect">
              <xsl:with-param name="codes">a</xsl:with-param>
            </xsl:call-template>
          </xsl:with-param>
        </xsl:call-template>
      </p>
    </contents>
  </xsl:template>

  <!-- scoring information (594) -->
  <xsl:template match="marc:datafield[@tag='594']">
    <xsl:variable name="tag" select="@tag"/>
    <annot type="scoring">
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:variable name="delimiter">
        <xsl:text>; </xsl:text>
      </xsl:variable>
      <!-- cat everything into the $str variable -->
      <xsl:variable name="str">
        <xsl:for-each select="marc:subfield">
          <xsl:variable name="code">
            <xsl:value-of select="@code"/>
          </xsl:variable>
          <xsl:variable name="scoring">
            <xsl:choose>
              <xsl:when test="$code = 'a'">Solo voice</xsl:when>
              <xsl:when test="$code = 'b'">Additional solo voice</xsl:when>
              <xsl:when test="$code = 'c'">Choir voice</xsl:when>
              <xsl:when test="$code = 'd'">Additional choir voice</xsl:when>
              <xsl:when test="$code = 'e'">Solo intrument</xsl:when>
              <xsl:when test="$code = 'f'">Strings</xsl:when>
              <xsl:when test="$code = 'g'">Woodwinds</xsl:when>
              <xsl:when test="$code = 'h'">Brasses</xsl:when>
              <xsl:when test="$code = 'i'">Plucked instruments</xsl:when>
              <xsl:when test="$code = 'k'">Percussion</xsl:when>
              <xsl:when test="$code = 'l'">Keyboards</xsl:when>
              <xsl:when test="$code = 'm'">Other instruments</xsl:when>
              <xsl:when test="$code = 'n'">Basso continuo</xsl:when>
              <xsl:otherwise>[unspecified]</xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <!-- cat the values: -->
          <xsl:value-of select="$scoring"/>
          <xsl:text>: </xsl:text>
          <xsl:value-of select="text()"/>
          <xsl:value-of select="$delimiter"/>
        </xsl:for-each>
      </xsl:variable>
      <!-- truncate the last delimiter -->
      <xsl:value-of select="substring($str,1,string-length($str)-string-length($delimiter))"/>
    </annot>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='595']">
    <xsl:variable name="tag" select="@tag"/>
    <castItem xmlns="http://www.music-encoding.org/ns/mei">
      <xsl:if test="$analog='true'">
        <!-- Unfortunately, castItem doesn't allow @analog, so we have to abuse @label -->
        <xsl:attribute name="label">
          <xsl:value-of select="concat('marc:', $tag)"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:call-template name="subfieldSelect">
        <xsl:with-param name="codes">a</xsl:with-param>
      </xsl:call-template>
    </castItem>
  </xsl:template>


  <!-- ======================================================================= -->
  <!-- sourceDesc (028, 041, 260, 300, 590, 592, 593)                          -->
  <!-- ======================================================================= -->

  <!-- plate number (028) -->
  <xsl:template match="marc:datafield[@tag='028']">
    <xsl:variable name="tag" select="@tag"/>
    <xsl:variable name="elementName">
      <xsl:choose>
        <xsl:when test="@ind1='2'">plateNum</xsl:when>
        <xsl:otherwise>identifier</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:element name="{$elementName}">
      <xsl:if test="$elementName='identifier'">
        <xsl:variable name="identifierType">
          <xsl:choose>
            <xsl:when test="@ind1='0'">issue</xsl:when>
            <xsl:when test="@ind1='1'">matrix</xsl:when>
            <xsl:when test="@ind1='3'">otherMusic</xsl:when>
            <xsl:when test="@ind1='4'">videorecording</xsl:when>
            <xsl:when test="@ind1='5'">publisher</xsl:when>
          </xsl:choose>
        </xsl:variable>
        <xsl:attribute name="type">
          <xsl:value-of select="concat($identifierType, 'Number')"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="subfieldSelect">
        <xsl:with-param name="codes">a</xsl:with-param>
      </xsl:call-template>
      <!-- plate number source -->
      <xsl:if test="marc:subfield[@code='b']">
        <xsl:text> (</xsl:text>
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">b</xsl:with-param>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='041']">
    <xsl:for-each select="marc:subfield[matches(@code, '[a-z]')]">
      <language>
        <xsl:if test="$analog='true'">
          <xsl:call-template name="analog">
            <xsl:with-param name="tag">
              <xsl:value-of select="concat(../@tag, @code)"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:if>
        <xsl:attribute name="label">
          <xsl:choose>
            <xsl:when test="@code='a'">text/sound track</xsl:when>
            <xsl:when test="@code='b'">summary/abstract</xsl:when>
            <xsl:when test="@code='d'">sung/spoken text</xsl:when>
            <xsl:when test="@code='e'">libretto</xsl:when>
            <xsl:when test="@code='f'">table of contents</xsl:when>
            <xsl:when test="@code='g'">accompanying material</xsl:when>
            <xsl:when test="@code='h'">original</xsl:when>
            <xsl:when test="@code='k'">intermediate translation</xsl:when>
            <xsl:when test="@code='j'">subtitles/captions</xsl:when>
            <xsl:when test="@code='m'">original accompanying material</xsl:when>
            <xsl:when test="@code='n'">original libretto</xsl:when>
          </xsl:choose>
        </xsl:attribute>
        <xsl:value-of select="."/>
      </language>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='260']">
    <pubStmt>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <pubPlace>
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">a</xsl:with-param>
        </xsl:call-template>
      </pubPlace>
      <publisher>
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">b</xsl:with-param>
        </xsl:call-template>
      </publisher>
      <xsl:call-template name="subfieldSelect">
        <xsl:with-param name="codes">c</xsl:with-param>
        <xsl:with-param name="element">date</xsl:with-param>
      </xsl:call-template>
      <xsl:if test="marc:subfield[@code='e' or @code='f' or @code='g']">
        <distributor>
          <xsl:if test="marc:subfield[@code='e']">
            <xsl:call-template name="subfieldSelect">
              <xsl:with-param name="codes">e</xsl:with-param>
              <xsl:with-param name="element">geogName</xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">f</xsl:with-param>
            <xsl:with-param name="element">name</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="subfieldSelect">
            <xsl:with-param name="codes">g</xsl:with-param>
            <xsl:with-param name="element">date</xsl:with-param>
          </xsl:call-template>
        </distributor>
      </xsl:if>
      <xsl:apply-templates select="../marc:datafield[@tag='028'][not(@ind1='2')]"/>
    </pubStmt>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='300']">
    <physDesc>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="subfieldSelect">
        <xsl:with-param name="codes">ab</xsl:with-param>
        <xsl:with-param name="element">extent</xsl:with-param>
      </xsl:call-template>
      <xsl:if test="marc:subfield[@code='c']">
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">c</xsl:with-param>
          <xsl:with-param name="element">dimensions</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="marc:subfield[@code='e']">
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">e</xsl:with-param>
          <xsl:with-param name="element">carrierForm</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:apply-templates select="../marc:datafield[@tag='028'][@ind1='2']"/>
    </physDesc>
  </xsl:template>

  <xsl:template match="marc:datafield[@tag='590' or @tag='592' or @tag='593']">
    <annot>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="@tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:value-of select="normalize-space(.)"/>
    </annot>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- profileDesc (508, 511, 518, 650, 651, 653, 657)                         -->
  <!-- ======================================================================= -->

  <!-- creation note (508) -->
  <xsl:template match="marc:datafield[@tag='508']">
    <xsl:variable name="tag" select="@tag"/>
    <xsl:call-template name="subfieldSelect">
      <xsl:with-param name="codes">a</xsl:with-param>
    </xsl:call-template>
  </xsl:template>

  <!-- classification (090, 648, 650, 651, 653, 654, 655, 656, 657, 658) -->
  <xsl:template match="marc:datafield[ @tag='090' or @tag='648' or @tag='650' or @tag='651' or
    @tag='653' or @tag='654' or @tag='655' or @tag='656' or @tag='657' or @tag='658']">
    <xsl:variable name="tag" select="@tag"/>
    <xsl:variable name="label">
      <xsl:choose>
        <xsl:when test="$tag = '090'">callNum</xsl:when>
        <xsl:when test="$tag = '650'">topic</xsl:when>
        <xsl:when test="$tag = '651'">geogName</xsl:when>
        <xsl:when test="$tag = '654'">facet</xsl:when>
        <xsl:when test="$tag = '655'">genreForm</xsl:when>
        <xsl:when test="$tag = '656'">occupation</xsl:when>
        <xsl:when test="$tag = '657'">function</xsl:when>
        <xsl:when test="$tag = '658'">curriculum</xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="ind2" select="@ind2"/>
    <xsl:variable name="classcode">
      <xsl:choose>
        <xsl:when test="$tag='090'">LCCN</xsl:when>
        <xsl:when test="$ind2 = '0'">LCSH</xsl:when>
        <xsl:when test="$ind2 = '1'">LCCL</xsl:when>
        <xsl:when test="$ind2 = '2'">MeSH</xsl:when>
        <xsl:when test="$ind2 = '3'">NALSA</xsl:when>
        <xsl:when test="$ind2 = '5'">CSH</xsl:when>
        <xsl:when test="$ind2 = '6'">RVM</xsl:when>
        <xsl:when test="$ind2 = '7'">
          <xsl:value-of select="replace(marc:subfield[@code='2'], '&#32;', '_')"/>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <term>
      <xsl:if test="not($label = '')">
        <xsl:attribute name="label">
          <xsl:value-of select="$label"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="not($classcode = '')">
        <xsl:attribute name="classcode" select="concat('#', $classcode)"/>
      </xsl:if>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:call-template name="subfieldSelect">
        <xsl:with-param name="codes">
          <xsl:choose>
            <xsl:when test="$tag = '090'">
              <xsl:text>ab</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>a</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </term>
  </xsl:template>

  <!-- participants in event -->
  <xsl:template match="marc:datafield[@tag='511']">
    <xsl:variable name="tag" select="@tag"/>
    <event>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <p>
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">a</xsl:with-param>
        </xsl:call-template>
      </p>
    </event>
  </xsl:template>

  <!-- notes (518) -->
  <xsl:template match="marc:datafield[@tag='518']">
    <xsl:variable name="tag" select="@tag"/>
    <event>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="$tag"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <p>
        <xsl:call-template name="subfieldSelect">
          <xsl:with-param name="codes">a</xsl:with-param>
          <xsl:with-param name="delimiter">; </xsl:with-param>
        </xsl:call-template>
      </p>
    </event>
  </xsl:template>

  <!-- ======================================================================= -->
  <!-- incipit (031)                                                           -->
  <!-- ======================================================================= -->

  <xsl:template match="marc:datafield[@tag='031']">
    <incip>
      <xsl:attribute name="n">
        <xsl:value-of select="normalize-space(concat(marc:subfield[@code='a'], '&#32;',
          marc:subfield[@code='b'], '&#32;', marc:subfield[@code='c']))"/>
      </xsl:attribute>
      <xsl:attribute name="label">
        <xsl:choose>
          <xsl:when test="marc:subfield[@code='d']">
            <xsl:value-of select="marc:subfield[@code='d'][1]"/>
          </xsl:when>
          <xsl:when test="marc:subfield[@code='e']">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="marc:subfield[@code='e'][1]"/>
            <xsl:text>]</xsl:text>
          </xsl:when>
        </xsl:choose>
      </xsl:attribute>
      <xsl:if test="$analog='true'">
        <xsl:call-template name="analog">
          <xsl:with-param name="tag">
            <xsl:value-of select="'031'"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <!-- Not currently allowed; customization required -->
      <!-- <label>
        <xsl:choose>
          <xsl:when test="marc:subfield[@code='d']">
            <xsl:value-of select="marc:subfield[@code='d'][1]"/>
          </xsl:when>
          <xsl:when test="marc:subfield[@code='e']">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="marc:subfield[@code='e'][1]"/>
            <xsl:text>]</xsl:text>
          </xsl:when>
        </xsl:choose>
      </label>
      <xsl:if test="marc:subfield[@code='r']">
        <key>
          <xsl:variable name="key" select="marc:subfield[@code='r']"/>
          <xsl:choose>
            <!-\- minor key -\->
            <xsl:when test="matches(substring($key, 1, 1), '[a-g]')">
              <xsl:value-of select="translate(substring($key, 1, 1), 'abcdefg',
                'ABCDEFG')"/>
              <xsl:value-of select="normalize-space(substring($key, 2, 1))"/>
              <xsl:text> minor</xsl:text>
            </xsl:when>
            <!-\- major key -\->
            <xsl:when test="matches(substring($key, 1, 1), '[A-G]')">
              <xsl:value-of select="substring($key, 1, 1)"/>
              <xsl:value-of select="normalize-space(substring($key, 2, 1))"/>
              <xsl:text> major</xsl:text>
            </xsl:when>
            <!-\- coding error -\->
            <xsl:otherwise>
              <xsl:value-of select="$key"/>
              <xsl:comment>potential coding error?</xsl:comment>
            </xsl:otherwise>
          </xsl:choose>
        </key>
      </xsl:if>
      <xsl:if test="marc:subfield[@code='o']">
        <meter>
          <xsl:value-of select="upper-case(marc:subfield[@code='o'])"/>
        </meter>
      </xsl:if>
      <xsl:if test="count(marc:subfield[@code='d']) &gt; 1">
        <tempo>
          <xsl:variable name="tempo">
            <xsl:for-each select="marc:subfield[@code='d'][position() &gt; 1]">
              <xsl:value-of select="."/>
              <xsl:if test="position() != last()">
                <xsl:text>; </xsl:text>
              </xsl:if>
            </xsl:for-each>
          </xsl:variable>
          <xsl:value-of select="normalize-space($tempo)"/>
        </tempo>
      </xsl:if> -->
      <xsl:if test="marc:subfield[@code='p']">
        <incipCode>
          <xsl:attribute name="form">
            <xsl:choose>
              <xsl:when test="marc:subfield[@code='2']='pe'">
                <xsl:text>plaineAndEasie</xsl:text>
              </xsl:when>
            </xsl:choose>
          </xsl:attribute>
          <xsl:value-of select="marc:subfield[@code='p']"/>
        </incipCode>
      </xsl:if>
      <xsl:if test="marc:subfield[@code='t']">
        <incipText>
          <p>
            <xsl:value-of select="marc:subfield[@code='t']"/>
          </p>
        </incipText>
      </xsl:if>
    </incip>
  </xsl:template>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>