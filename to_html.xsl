<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    
    
    <xsl:template match="/">
        <html>
            <head>
               
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </title>

                <link rel="stylesheet" type="text/css" href="stile.css" />
                
                <!-- jquery e bootstrap -->
                <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
                <!-- nostro foglio di stile -->
                <link rel="stylesheet" type="text/css" href="stile.css" />
            </head>

            <body>
                <h1>Applicazione web versione elettronica diari di Emanuele Artom</h1>
                <div id="introduction">
                    <h2>Descrizione della versione elettronica</h2>
                    <xsl:apply-templates select="//tei:fileDesc"/>

                    <div class='divinternointro'>
                        <h3>Informazioni aggiuntive riguardo la codifica del testo</h3>
                        <ul>
                            <xsl:apply-templates select="//tei:encodingDesc//[tei:editorialDecl | tei:refsDecl]"/>
                        </ul>
                    </div>
                </div>
                
            </body>
        </html>
    </xsl:template>


    <!-- titleStmt -->
    <xsl:template match="tei:titleStmt" mode="#default">
        <p>Titolo: <b><xsl:value-of select="."/></b></p>
    </xsl:template>

    <!-- editionStmt -->
    <xsl:template match="tei:editionStmt" mode="#default">
        <p>Realizzato da: <b><xsl:value-of select="//tei:name[(@xml:id='ID')]"/>, <xsl:value-of select="//tei:name[(@xml:id='GL')]"/>.</b></p>
        <p>Coordinamento: <b><xsl:apply-templates select="//tei:name[(@xml:id='ADG')]"/>.</b></p>
        <p><xsl:value-of select="//tei:edition"/></p>
    </xsl:template>

    <!-- publicationStmt -->
    <xsl:template match="tei:publicationStmt" mode="#default">
        <p>
            Informazioni pubblicazione: 
            <b>
            <xsl:value-of select="tei:publisher"/>, 
            <xsl:value-of select="tei:date"/>, 
            <xsl:value-of select="tei:availability"/>.
            </b>
        </p>
    </xsl:template>

    <!--  sourceDesc -->
    <xsl:template match="tei:sourceDesc" mode="#default">
        <button id='btn_mostra_info' class='btn btn-secondary'>Mostra di più</button>

        <div id='sourceDesc' class='divinternointro'>
            <h3>Descrizione della fonte:</h3>
            <p><xsl:apply-templates select="//tei:msIdentifier"/></p>
            <p><xsl:apply-templates select="//tei:msContents"/> | Lingua: <b><xsl:value-of select="../..//tei:langUsage/tei:language"/></b></p>
            <xsl:apply-templates select="//tei:objectDesc/[tei:supportDesc | tei:layoutDesc]"/>
            <p>Origine del manoscritto: <xsl:value-of select="//tei:history/tei:origin"/></p>

        </div>    
    </xsl:template>

        <xsl:template match="tei:msIdentifier" mode="#default">
            Luogo: <b><xsl:value-of select="tei:settlement"/>, <xsl:value-of select="tei:country"/></b> 
            | Archivio: <b><xsl:element name="a">
                            <xsl:attribute name='href'><xsl:value-of select="tei:repository/@ref"/></xsl:attribute>
                            <xsl:value-of select="tei:repository"/>
                        </xsl:element></b>
            | Id: <b><xsl:value-of select="tei:idno"/></b>
        </xsl:template>

        <xsl:template match="tei:msContents" mode="#default">
            Autore: <b><xsl:value-of select="tei:msItem/tei:author"/></b> | Titolo dell'opera: <b><xsl:value-of select="tei:msItem/tei:title"/></b>
        </xsl:template>

        <xsl:template match="tei:supportDesc" mode="#default">
            <p>Estensione: <xsl:value-of select="tei:extent"/></p>
            <p>Materiale: <xsl:value-of select="tei:support"/></p>
        </xsl:template>

        <xsl:template match="tei:layoutDesc" mode="#default">
            <p>Layout: <xsl:value-of select="."/></p>
        </xsl:template>

    
    <!-- encodingDesc -->
    <xsl:template match="(tei:editorialDecl | tei:refsDecl)//*" mode="#default">
        <li><xsl:value-of select="."/></li>
    </xsl:template>

    





















</xsl:stylesheet>