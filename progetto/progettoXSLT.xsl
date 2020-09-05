<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output 
        method="html"
        ecoding="UTF-8"
        indent="yes"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Lettera LL1.2</title>
                <link href="progetto.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:facsimile">
        		<div class="allinea" id="immagini" style="overflow-x:auto;">
					<img class="img" src="LL1.2_0001.jpg"/>
					<img class="img" src="LL1.2_0002.jpg"/>
					<img class="img" src="LL1.2_0003.jpg"/>
					<img class="img" src="LL1.2_0004.jpg"/>

				</div>	
    </xsl:template>

    <xsl:template match="tei:text/tei:body">
        <h3>Testo</h3> 
        <div class="allinea" style="overflow-x:auto;">
            <xsl:value-of select="tei:div/tei:salute"/>
            <xsl:for-each select="./tei:div">
                <xsl:for-each select="./tei:ab">
                    <xsl:choose> 
                        <xsl:when test="self::node()[@subtype='addition']">
                            <span style="display:none"><xsl:value-of select="."/></span>
                        </xsl:when>
                        <xsl:otherwise>
                            <p><xsl:apply-templates /></p>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="tei:text/tei:back">
        <h3>Appendici</h3>
        <div id="note">
            <xsl:for-each select="./tei:div/tei:div/tei:note">
                <div><xsl:apply-templates /></div><br/>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="tei:teiHeader">
        <h1>LL1.2</h1>
        <h3>Informazioni sul documento </h3>
        <div id="intro">
            <p>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:msItem/tei:title"/>. 
            </p>
            <p>
                <xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:support/tei:p"/>.
            </p>
            <p>
                <xsl:value-of select="tei:fileDesc/tei:titleStmt/tei:respStmt"/>
            </p>
            <p>
                <xsl:for-each select="tei:fileDesc/tei:editionStmt/tei:respStmt/*">
                    <xsl:choose>
                        <xsl:when test="@ref= '#DS' or @ref= '#GDM'">
                            <xsl:value-of select="."/>.
                        </xsl:when>
                        <xsl:when test="@ref= '#AMDG'">
                            <xsl:value-of select="."/>,
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>&#32;
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </p>
        </div>
    </xsl:template>

    <xsl:template match="tei:front">   
    </xsl:template>

    <xsl:template match="*[@rend='italic']">
        <i><xsl:value-of select="."/></i>
    </xsl:template>

    <xsl:template match="*[@rend='underline']">
        <u><xsl:value-of select="."/></u>
    </xsl:template>

    <xsl:template match="tei:corr">
        <span style="display:none"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:expan">
        <span style="display:none"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

    <xsl:template match="*[@subtype='addition']">
        <span style="display:none"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:note/tei:bibl/tei:citedRange">
        <span style="display:none"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:stamp">
        <span style="display:none"><xsl:value-of select="."/></span>
    </xsl:template>
    
</xsl:stylesheet>