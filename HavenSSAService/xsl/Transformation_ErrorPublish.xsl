<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:ns1="http://niem.gov/niem/niem-core/2.0" xmlns:pc="http://xmlns.oracle.com/pcbpel/" xmlns:ns5="http://niem.gov/niem/appinfo/2.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns2="http://niem.gov/niem/structures/2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns3="http://niem.gov/niem/usps_states/2.0" xmlns:imp1="http://ssac.ee.sim.dsh.cms.hhs.gov" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/jms/SOA_APP/HbxJmsConsumer/test" xmlns:ns4="http://codes.ssac.ee.sim.dsh.cms.hhs.gov" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns0="http://extn.ssac.ee.sim.dsh.cms.hhs.gov" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" xmlns:ns6="http://niem.gov/niem/proxy/xsd/2.0" exclude-result-prefixes="xsl xsi xsd plt ns1 pc ns5 ns2 ns3 imp1 tns ns4 wsdl ns0 jca ns6 oraext socket ora bpws xdk ids mhdr bpm xp20 hwf xref dvm med bpel ldap">
   <xsl:template match="/">
      <xsl:for-each select="/imp1:SSACompositeRequest">
         <imp1:SSACompositeResponse>
            <xsl:if test="@ns2:id">
               <xsl:attribute name="ns2:id">
                  <xsl:value-of select="@ns2:id"/>
               </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ns2:metadata">
               <xsl:attribute name="ns2:metadata">
                  <xsl:value-of select="@ns2:metadata"/>
               </xsl:attribute>
            </xsl:if>
            <xsl:if test="@ns2:linkMetadata">
               <xsl:attribute name="ns2:linkMetadata">
                  <xsl:value-of select="@ns2:linkMetadata"/>
               </xsl:attribute>
            </xsl:if>
            <ns0:SSACompositeIndividualResponse>
               <ns0:ResponseMetadata>
                  <ns0:ResponseCode>
                     <xsl:text disable-output-escaping="no">500</xsl:text>
                  </ns0:ResponseCode>
                  <ns0:ResponseDescriptionText>
                     <xsl:text disable-output-escaping="no">Validation Failed</xsl:text>
                  </ns0:ResponseDescriptionText>
               </ns0:ResponseMetadata>
               <ns0:PersonSSNIdentification>
                  <xsl:if test="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification/@ns2:id">
                     <xsl:attribute name="ns2:id">
                        <xsl:value-of select="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification/@ns2:id"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification/@ns2:metadata">
                     <xsl:attribute name="ns2:metadata">
                        <xsl:value-of select="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification/@ns2:metadata"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:if test="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification/@ns2:linkMetadata">
                     <xsl:attribute name="ns2:linkMetadata">
                        <xsl:value-of select="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification/@ns2:linkMetadata"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification"/>
               </ns0:PersonSSNIdentification>
               <xsl:variable name="PersonSSN" select="ns0:SSACompositeIndividualRequest/ns0:Person/ns0:PersonSSNIdentification"/>
               <ns0:HavenID>
                  <xsl:value-of select="/imp1:SSACompositeRequest/ns0:SSACompositeIndividualRequest[ns0:Person/ns0:PersonSSNIdentification = $PersonSSN]/ns0:Person/ns0:HavenID"/>
               </ns0:HavenID>
            </ns0:SSACompositeIndividualResponse>
            <ns0:ResponseMetadata>
               <ns0:ResponseCode>
                  <xsl:text disable-output-escaping="no">500</xsl:text>
               </ns0:ResponseCode>
               <ns0:ResponseDescriptionText>
                  <xsl:text disable-output-escaping="no">Validation Failed</xsl:text>
               </ns0:ResponseDescriptionText>
            </ns0:ResponseMetadata>
         </imp1:SSACompositeResponse>
      </xsl:for-each>
   </xsl:template>
</xsl:stylesheet>
