<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:wix="http://schemas.microsoft.com/wix/2006/wi">

  <xsl:output omit-xml-declaration="yes" indent="yes" encoding="utf-8"/>
  <xsl:strip-space  elements="*"/>

  <!--copy all contents recursively-->
  <xsl:template match="@*|*">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="*" />
    </xsl:copy>
  </xsl:template>
  <xsl:output method="xml" indent="yes" />

  <!--Set Component's files to 64 bit-->
  <xsl:template match="wix:Component[contains
                           (wix:File/@Source, '$(var.SourceDir)')]">
    <xsl:copy>
      <xsl:attribute name="Win64">yes</xsl:attribute>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!--Exclude files from harvested directory-->
  <xsl:key name="unwanted-Files"
           match="wix:Component[contains
                      (wix:File/@Source, '.pdb')
           ]" use="@Id"/>
  <xsl:template match="wix:Component[key('unwanted-Files', @Id)]" />
  <xsl:template match="wix:ComponentRef[key('unwanted-Files', @Id)]" />

</xsl:stylesheet>