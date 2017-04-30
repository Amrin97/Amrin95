<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:foo="http://www.foo.org/" xmlns:bar="http://www.bar.org">
<xsl:template match="/">
  <html>
  <body>
  <h2>Student Library System</h2>
  <h3>Records are sorted by first name. Clients older than 18 are highlighted with green color. For those who paid less that .</h3>
    <table border="1">
      <tr bgcolor="#EAEAEA">
        <th>First name</th>
        <th>Last name</th>
        <th>Account Type</th>
        <th>Age</th>
        <th>Discount</th>
      </tr>
      <xsl:for-each select="library/customer">
        <xsl:sort select="firstName" />
      <tr>
        <td><xsl:value-of select="lastName"/></td>
        <td><xsl:value-of select="firstName"/></td>
        <td><xsl:value-of select="libraryAccount/type"/></td>
        <xsl:choose>
            <xsl:when test="age>18">
                <td style="background-color:#05FC8C">
                    <xsl:value-of select="age" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td>
                    <xsl:value-of select="age" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="libraryAccount/discount>0">
                <td>
                    <xsl:value-of select="libraryAccount/discount" />
                </td>
            </xsl:when>
            <xsl:otherwise>
                <td style="background-color:#BA4848">
                    <xsl:value-of select="libraryAccount/discount" />
                </td>
            </xsl:otherwise>
        </xsl:choose>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>