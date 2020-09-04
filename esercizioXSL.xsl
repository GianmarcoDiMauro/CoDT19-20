<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="fileDesc">
        <h1><xsl:value-of select="titleStmt/title"/></h1>
        <h4>A cura di <xsl:value-of select="titleStmt/respStmt/name"/></h4>
    </xsl:template>


</xsl:stylesheet>