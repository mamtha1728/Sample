<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:ns0="http://xmlns.oracle.com/enrolapp/getbenchmark/service/wsdl/v1/types" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:client="http://xmlns.oracle.com/NEW_APP/EAGetBenchMarkPlanService/EAGetBenchMarkPlanABCSImpl" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:WL5G3N0="http://schemas.xmlsoap.org/wsdl/" xmlns:xdgdecv="http://xmlns.dc.gov/DCAS/ESB/CTCService/V1" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:bench="http://openhbx.org/api/terms/1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:tns="http://xmlns.oracle.com/enrolapp/getbenchmark/service/wsdl/v1" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsl xsi xsd ns0 soap soap12 WL5G3N0 xdgdecv bench tns mime plnk client oraext socket ora bpws xdk ids mhdr bpm xp20 hwf xref dvm med bpel ldap">
   <xsl:template match="/">
      <xdgdecv:get-benchmark-plan-response>
         <xdgdecv:plan>
            <plan-id>
               <xsl:value-of select="/bench:coverage_quote/bench:enrollment/bench:plan/bench:id/bench:id"/>
            </plan-id>
            <plan-carrier>
               <carrier-name>
                  <xsl:value-of select="/bench:coverage_quote/bench:enrollment/bench:plan/bench:carrier/bench:name"/>
               </carrier-name>
               <carrier-id>
                  <xsl:value-of select="/bench:coverage_quote/bench:enrollment/bench:plan/bench:carrier/bench:id/bench:id"/>
               </carrier-id>
            </plan-carrier>
            <plan-name>
               <xsl:value-of select="/bench:coverage_quote/bench:enrollment/bench:plan/bench:name"/>
            </plan-name>
            <ehb-premium>
               <xsl:value-of select="format-number(((/bench:coverage_quote/bench:enrollment/bench:plan/bench:ehb_percent * /bench:coverage_quote/bench:enrollment/bench:premium_total_amount) div &quot;100&quot;),'###.00')"/>
            </ehb-premium>
            <ehb-percent>
               <xsl:value-of select="/bench:coverage_quote/bench:enrollment/bench:plan/bench:ehb_percent"/>
            </ehb-percent>
         </xdgdecv:plan>
      </xdgdecv:get-benchmark-plan-response>
   </xsl:template>
</xsl:stylesheet>
