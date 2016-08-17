<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:aia="http://www.oracle.com/XSL/Transform/java/oracle.apps.aia.core.xpath.AIAFunctions" xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:bpel="http://docs.oasis-open.org/wsbpel/2.0/process/executable" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:bpm="http://xmlns.oracle.com/bpmn20/extensions" xmlns:bench="http://openhbx.org/api/terms/1.0" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:client="http://xmlns.oracle.com/NEW_APP/EAGetBenchMarkPlanService/EAGetBenchMarkPlanABCSImpl" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:WL5G3N0="http://schemas.xmlsoap.org/wsdl/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:ora="http://schemas.oracle.com/xpath/extension" xmlns:ns0="http://xmlns.oracle.com/enrolapp/getbenchmark/service/wsdl/v1/types" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:tns="http://xmlns.oracle.com/enrolapp/getbenchmark/service/wsdl/v1" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath" xmlns:med="http://schemas.oracle.com/mediator/xpath" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath" xmlns:xdgdecv="http://xmlns.dc.gov/DCAS/ESB/CTCService/V1" xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:bpmn="http://schemas.oracle.com/bpm/xpath" xmlns:ldap="http://schemas.oracle.com/xpath/extension/ldap" exclude-result-prefixes="xsl bench soap12 plnk client soap WL5G3N0 mime ns0 tns xdgdecv ns2 aia bpws xp20 bpel bpm ora socket mhdr oraext dvm hwf med ids xdk xref bpmn ldap">
   <xsl:param name="inputVariable.payload"/>
   <xsl:template match="/">
      <bench:coverage_quote_request>
         <bench:enrollees>
            <xsl:for-each select="$inputVariable.payload/xdgdecv:get-benchmark-plan-request/xdgdecv:applicants/primary">
               <bench:enrollee>
                  <bench:member>
                     <bench:id>
                        <bench:id>
                           <xsl:value-of select="person-id"/>
                        </bench:id>
                     </bench:id>
                     <bench:person>
                        <bench:id>
                           <bench:id>
                              <xsl:value-of select="person-id"/>
                           </bench:id>
                        </bench:id>
                        <bench:person_name>
                           <bench:person_surname>
                              <xsl:value-of select="contact-info/last-name"/>
                           </bench:person_surname>
                           <bench:person_given_name>
                              <xsl:value-of select="contact-info/first-name"/>
                           </bench:person_given_name>
                           <xsl:if test="contact-info/middle-name">
                              <bench:person_middle_name>
                                 <xsl:value-of select="contact-info/middle-name"/>
                              </bench:person_middle_name>
                           </xsl:if>
                        </bench:person_name>
                        <xsl:choose>
                           <xsl:when test="concat(contact-info/address-line-1,contact-info/address-line-2) != &quot;&quot;">
                              <bench:addresses>
                                 <bench:address>
                                    <bench:type>
                                       <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:address_type#home</xsl:text>
                                    </bench:type>
                                    <xsl:choose>
                                       <xsl:when test="contact-info/address-line-1 != &quot;&quot;">
                                          <bench:address_line_1>
                                             <xsl:value-of select="contact-info/address-line-1"/>
                                          </bench:address_line_1>
                                       </xsl:when>
                                       <xsl:when test="(contact-info/address-line-1 = &quot;&quot;) and (contact-info/address-line-2 != &quot;&quot;)">
                                          <bench:address_line_1>
                                             <xsl:value-of select="contact-info/address-line-2"/>
                                          </bench:address_line_1>
                                       </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="(contact-info/address-line-1 != &quot;&quot;) and (contact-info/address-line-2 != &quot;&quot;)">
                                       <bench:address_line_2>
                                          <xsl:value-of select="contact-info/address-line-2"/>
                                       </bench:address_line_2>
                                    </xsl:if>
                                    <bench:location_city_name>
                                       <xsl:value-of select="contact-info/city"/>
                                    </bench:location_city_name>
                                    <bench:location_state_code>
                                       <xsl:value-of select="contact-info/state"/>
                                    </bench:location_state_code>
                                    <bench:postal_code>
                                       <xsl:value-of select="substring(contact-info/zip,1.0,5.0)"/>
                                    </bench:postal_code>
                                 </bench:address>
                              </bench:addresses>
                           </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="contact-info/email">
                              <bench:emails>
                                 <bench:email>
                                    <bench:type>
                                       <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:email_type#home</xsl:text>
                                    </bench:type>
                                    <bench:email_address>
                                       <xsl:value-of select="contact-info/email"/>
                                    </bench:email_address>
                                 </bench:email>
                              </bench:emails>
                           </xsl:when>
                        </xsl:choose>
                        <bench:created_at>
                           <xsl:value-of select="xp20:current-dateTime()"/>
                        </bench:created_at>
                     </bench:person>
                     <bench:person_relationships>
                        <bench:person_relationship>
                           <bench:subject_individual>
                              <bench:id>
                                 <xsl:value-of select="person-id"/>
                              </bench:id>
                           </bench:subject_individual>
                           <bench:relationship_uri>
                              <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:individual_relationship#self</xsl:text>
                           </bench:relationship_uri>
                           <bench:object_individual>
                              <bench:id>
                                 <xsl:value-of select="person-id"/>
                              </bench:id>
                           </bench:object_individual>
                        </bench:person_relationship>
                     </bench:person_relationships>
                     <bench:person_demographics>
                        <xsl:if test="ssn != &quot;&quot;">
                           <bench:ssn>
                              <xsl:value-of select="ssn"/>
                           </bench:ssn>
                        </xsl:if>
                        <xsl:choose>
                           <xsl:when test="xp20:lower-case(gender) = &quot;f&quot;">
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#female</xsl:text>
                              </bench:sex>
                           </xsl:when>
                           <xsl:when test="xp20:lower-case(gender) = &quot;m&quot;">
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#male</xsl:text>
                              </bench:sex>
                           </xsl:when>
                           <xsl:otherwise>
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#unknown</xsl:text>
                              </bench:sex>
                           </xsl:otherwise>
                        </xsl:choose>
                        <bench:birth_date>
                           <xsl:value-of select="xp20:format-dateTime(substring(birth-date,&quot;1&quot;,&quot;10&quot;),&quot;[Y0001][M01][D01]&quot;)"/>
                        </bench:birth_date>
                        <bench:created_at>
                           <xsl:value-of select="xp20:current-dateTime()"/>
                        </bench:created_at>
                     </bench:person_demographics>
                     <bench:created_at>
                        <xsl:value-of select="xp20:current-dateTime()"/>
                     </bench:created_at>
                  </bench:member>
                  <bench:is_subscriber>
                     <xsl:text disable-output-escaping="no">true</xsl:text>
                  </bench:is_subscriber>
                  <bench:benefit>
                     <bench:premium_amount>
                        <xsl:text disable-output-escaping="no">00.00</xsl:text>
                     </bench:premium_amount>
                     <bench:begin_date>
                        <xsl:value-of select="substring(translate($inputVariable.payload/xdgdecv:get-benchmark-plan-request/xdgdecv:effective-date, '-', ''), 1, 8)"/>
                     </bench:begin_date>
                  </bench:benefit>
               </bench:enrollee>
            </xsl:for-each>
            <xsl:for-each select="$inputVariable.payload/xdgdecv:get-benchmark-plan-request/xdgdecv:applicants/spouse">
               <bench:enrollee>
                  <bench:member>
                     <bench:id>
                        <bench:id>
                           <xsl:value-of select="person-id"/>
                        </bench:id>
                     </bench:id>
                     <bench:person>
                        <bench:id>
                           <bench:id>
                              <xsl:value-of select="person-id"/>
                           </bench:id>
                        </bench:id>
                        <bench:person_name>
                           <bench:person_surname>
                              <xsl:value-of select="contact-info/last-name"/>
                           </bench:person_surname>
                           <bench:person_given_name>
                              <xsl:value-of select="contact-info/first-name"/>
                           </bench:person_given_name>
                           <xsl:if test="contact-info/middle-name">
                              <bench:person_middle_name>
                                 <xsl:value-of select="contact-info/middle-name"/>
                              </bench:person_middle_name>
                           </xsl:if>
                        </bench:person_name>
                        <xsl:choose>
                           <xsl:when test="concat(contact-info/address-line-1,contact-info/address-line-2) != &quot;&quot;">
                              <bench:addresses>
                                 <bench:address>
                                    <bench:type>
                                       <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:address_type#home</xsl:text>
                                    </bench:type>
                                    <xsl:choose>
                                       <xsl:when test="contact-info/address-line-1 != &quot;&quot;">
                                          <bench:address_line_1>
                                             <xsl:value-of select="contact-info/address-line-1"/>
                                          </bench:address_line_1>
                                       </xsl:when>
                                       <xsl:when test="(contact-info/address-line-1 = &quot;&quot;) and (contact-info/address-line-2 != &quot;&quot;)">
                                          <bench:address_line_1>
                                             <xsl:value-of select="contact-info/address-line-2"/>
                                          </bench:address_line_1>
                                       </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="(contact-info/address-line-1 != &quot;&quot;) and (contact-info/address-line-2 != &quot;&quot;)">
                                       <bench:address_line_2>
                                          <xsl:value-of select="contact-info/address-line-2"/>
                                       </bench:address_line_2>
                                    </xsl:if>
                                    <bench:location_city_name>
                                       <xsl:value-of select="contact-info/city"/>
                                    </bench:location_city_name>
                                    <bench:location_state_code>
                                       <xsl:value-of select="contact-info/state"/>
                                    </bench:location_state_code>
                                    <bench:postal_code>
                                       <xsl:value-of select="substring(contact-info/zip,1.0,5.0)"/>
                                    </bench:postal_code>
                                 </bench:address>
                              </bench:addresses>
                           </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="contact-info/email">
                              <bench:emails>
                                 <bench:email>
                                    <bench:type>
                                       <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:email_type#home</xsl:text>
                                    </bench:type>
                                    <bench:email_address>
                                       <xsl:value-of select="contact-info/email"/>
                                    </bench:email_address>
                                 </bench:email>
                              </bench:emails>
                           </xsl:when>
                        </xsl:choose>
                        <bench:created_at>
                           <xsl:value-of select="xp20:current-dateTime()"/>
                        </bench:created_at>
                     </bench:person>
                     <bench:person_relationships>
                        <bench:person_relationship>
                           <bench:subject_individual>
                              <bench:id>
                                 <xsl:value-of select="person-id"/>
                              </bench:id>
                           </bench:subject_individual>
                           <bench:relationship_uri>
                              <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:individual_relationship#spouse</xsl:text>
                           </bench:relationship_uri>
                           <bench:object_individual>
                              <bench:id>
                                 <xsl:value-of select="../primary/person-id"/>
                              </bench:id>
                           </bench:object_individual>
                        </bench:person_relationship>
                     </bench:person_relationships>
                     <bench:person_demographics>
                        <xsl:if test="ssn != &quot;&quot;">
                           <bench:ssn>
                              <xsl:value-of select="ssn"/>
                           </bench:ssn>
                        </xsl:if>
                        <xsl:choose>
                           <xsl:when test="xp20:lower-case(gender) = &quot;f&quot;">
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#female</xsl:text>
                              </bench:sex>
                           </xsl:when>
                           <xsl:when test="xp20:lower-case(gender) = &quot;m&quot;">
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#male</xsl:text>
                              </bench:sex>
                           </xsl:when>
                           <xsl:otherwise>
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#unknown</xsl:text>
                              </bench:sex>
                           </xsl:otherwise>
                        </xsl:choose>
                        <bench:birth_date>
                           <xsl:value-of select="xp20:format-dateTime(substring(birth-date,&quot;1&quot;,&quot;10&quot;),&quot;[Y0001][M01][D01]&quot;)"/>
                        </bench:birth_date>
                        <bench:created_at>
                           <xsl:value-of select="xp20:current-dateTime()"/>
                        </bench:created_at>
                     </bench:person_demographics>
                     <bench:created_at>
                        <xsl:value-of select="xp20:current-dateTime()"/>
                     </bench:created_at>
                  </bench:member>
                  <bench:is_subscriber>
                     <xsl:text disable-output-escaping="no">false</xsl:text>
                  </bench:is_subscriber>
                  <bench:benefit>
                     <bench:premium_amount>
                        <xsl:text disable-output-escaping="no">00.00</xsl:text>
                     </bench:premium_amount>
                     <bench:begin_date>
                        <xsl:text disable-output-escaping="no">20160101</xsl:text>
                     </bench:begin_date>
                  </bench:benefit>
               </bench:enrollee>
            </xsl:for-each>
            <xsl:for-each select="$inputVariable.payload/xdgdecv:get-benchmark-plan-request/xdgdecv:applicants/child">
               <bench:enrollee>
                  <bench:member>
                     <bench:id>
                        <bench:id>
                           <xsl:value-of select="person-id"/>
                        </bench:id>
                     </bench:id>
                     <bench:person>
                        <bench:id>
                           <bench:id>
                              <xsl:value-of select="person-id"/>
                           </bench:id>
                        </bench:id>
                        <bench:person_name>
                           <bench:person_surname>
                              <xsl:value-of select="contact-info/last-name"/>
                           </bench:person_surname>
                           <bench:person_given_name>
                              <xsl:value-of select="contact-info/first-name"/>
                           </bench:person_given_name>
                           <xsl:if test="contact-info/middle-name">
                              <bench:person_middle_name>
                                 <xsl:value-of select="contact-info/middle-name"/>
                              </bench:person_middle_name>
                           </xsl:if>
                        </bench:person_name>
                        <xsl:choose>
                           <xsl:when test="concat(contact-info/address-line-1,contact-info/address-line-2) != &quot;&quot;">
                              <bench:addresses>
                                 <bench:address>
                                    <bench:type>
                                       <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:address_type#home</xsl:text>
                                    </bench:type>
                                    <xsl:choose>
                                       <xsl:when test="contact-info/address-line-1 != &quot;&quot;">
                                          <bench:address_line_1>
                                             <xsl:value-of select="contact-info/address-line-1"/>
                                          </bench:address_line_1>
                                       </xsl:when>
                                       <xsl:when test="(contact-info/address-line-1 = &quot;&quot;) and (contact-info/address-line-2 != &quot;&quot;)">
                                          <bench:address_line_1>
                                             <xsl:value-of select="contact-info/address-line-2"/>
                                          </bench:address_line_1>
                                       </xsl:when>
                                    </xsl:choose>
                                    <xsl:if test="(contact-info/address-line-1 != &quot;&quot;) and (contact-info/address-line-2 != &quot;&quot;)">
                                       <bench:address_line_2>
                                          <xsl:value-of select="contact-info/address-line-2"/>
                                       </bench:address_line_2>
                                    </xsl:if>
                                    <bench:location_city_name>
                                       <xsl:value-of select="contact-info/city"/>
                                    </bench:location_city_name>
                                    <bench:location_state_code>
                                       <xsl:value-of select="contact-info/state"/>
                                    </bench:location_state_code>
                                    <bench:postal_code>
                                       <xsl:value-of select="substring(contact-info/zip,1.0,5.0)"/>
                                    </bench:postal_code>
                                 </bench:address>
                              </bench:addresses>
                           </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                           <xsl:when test="contact-info/email">
                              <bench:emails>
                                 <bench:email>
                                    <bench:type>
                                       <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:email_type#home</xsl:text>
                                    </bench:type>
                                    <bench:email_address>
                                       <xsl:value-of select="contact-info/email"/>
                                    </bench:email_address>
                                 </bench:email>
                              </bench:emails>
                           </xsl:when>
                        </xsl:choose>
                        <bench:created_at>
                           <xsl:value-of select="xp20:current-dateTime()"/>
                        </bench:created_at>
                     </bench:person>
                     <bench:person_relationships>
                        <bench:person_relationship>
                           <bench:subject_individual>
                              <bench:id>
                                 <xsl:value-of select="person-id"/>
                              </bench:id>
                           </bench:subject_individual>
                           <bench:relationship_uri>
                              <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:individual_relationship#child</xsl:text>
                           </bench:relationship_uri>
                           <bench:object_individual>
                              <bench:id>
                                 <xsl:value-of select="../primary/person-id"/>
                              </bench:id>
                           </bench:object_individual>
                        </bench:person_relationship>
                     </bench:person_relationships>
                     <bench:person_demographics>
                        <xsl:if test="ssn != &quot;&quot;">
                           <bench:ssn>
                              <xsl:value-of select="ssn"/>
                           </bench:ssn>
                        </xsl:if>
                        <xsl:choose>
                           <xsl:when test="xp20:lower-case(gender) = &quot;f&quot;">
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#female</xsl:text>
                              </bench:sex>
                           </xsl:when>
                           <xsl:when test="xp20:lower-case(gender) = &quot;m&quot;">
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#male</xsl:text>
                              </bench:sex>
                           </xsl:when>
                           <xsl:otherwise>
                              <bench:sex>
                                 <xsl:text disable-output-escaping="no">urn:openhbx:terms:v1:gender#unknown</xsl:text>
                              </bench:sex>
                           </xsl:otherwise>
                        </xsl:choose>
                        <bench:birth_date>
                           <xsl:value-of select="xp20:format-dateTime(substring(birth-date,&quot;1&quot;,&quot;10&quot;),&quot;[Y0001][M01][D01]&quot;)"/>
                        </bench:birth_date>
                        <bench:created_at>
                           <xsl:value-of select="xp20:current-dateTime()"/>
                        </bench:created_at>
                     </bench:person_demographics>
                     <bench:created_at>
                        <xsl:value-of select="xp20:current-dateTime()"/>
                     </bench:created_at>
                  </bench:member>
                  <bench:is_subscriber>
                     <xsl:text disable-output-escaping="no">false</xsl:text>
                  </bench:is_subscriber>
                  <bench:benefit>
                     <bench:premium_amount>
                        <xsl:text disable-output-escaping="no">00.00</xsl:text>
                     </bench:premium_amount>
                     <bench:begin_date>
                        <xsl:text disable-output-escaping="no">20160101</xsl:text>
                     </bench:begin_date>
                  </bench:benefit>
               </bench:enrollee>
            </xsl:for-each>
         </bench:enrollees>
         <bench:enrollment>
            <bench:plan>
               <bench:id>
                  <bench:id>
                     <xsl:value-of select="/bench:benchmark_plan/bench:id/bench:id"/>
                  </bench:id>
                  <xsl:if test="/bench:benchmark_plan/bench:id/bench:is_authoritative != &quot;&quot;">
                     <bench:is_authoritative>
                        <xsl:value-of select="/bench:benchmark_plan/bench:id/bench:is_authoritative"/>
                     </bench:is_authoritative>
                  </xsl:if>
                  <xsl:if test="/bench:benchmark_plan/bench:id/bench:alias_ids != &quot;&quot;">
                     <bench:alias_ids>
                        <xsl:for-each select="/bench:benchmark_plan/bench:id/bench:alias_ids/bench:alias_id">
                           <bench:alias_id>
                              <bench:id>
                                 <xsl:value-of select="bench:id"/>
                              </bench:id>
                              <xsl:if test="bench:is_authoritative != &quot;&quot;">
                                 <bench:is_authoritative>
                                    <xsl:value-of select="bench:is_authoritative"/>
                                 </bench:is_authoritative>
                              </xsl:if>
                           </bench:alias_id>
                        </xsl:for-each>
                     </bench:alias_ids>
                  </xsl:if>
               </bench:id>
               <bench:name>
                  <xsl:value-of select="/bench:benchmark_plan/bench:name"/>
               </bench:name>
               <bench:active_year>
                  <xsl:value-of select="/bench:benchmark_plan/bench:active_year"/>
               </bench:active_year>
               <bench:is_dental_only>
                  <xsl:value-of select="/bench:benchmark_plan/bench:is_dental_only"/>
               </bench:is_dental_only>
               <bench:carrier>
                  <bench:id>
                     <bench:id>
                        <xsl:value-of select="/bench:benchmark_plan/bench:carrier/bench:id/bench:id"/>
                     </bench:id>
                     <xsl:if test="/bench:benchmark_plan/bench:carrier/bench:id/bench:is_authoritative != &quot;&quot;">
                        <bench:is_authoritative>
                           <xsl:value-of select="/bench:benchmark_plan/bench:carrier/bench:id/bench:is_authoritative"/>
                        </bench:is_authoritative>
                     </xsl:if>
                     <xsl:if test="/bench:benchmark_plan/bench:carrier/bench:id/bench:alias_ids != &quot;&quot;">
                        <bench:alias_ids>
                           <xsl:for-each select="/bench:benchmark_plan/bench:carrier/bench:id/bench:alias_ids/bench:alias_id">
                              <bench:alias_id>
                                 <bench:id>
                                    <xsl:value-of select="bench:id"/>
                                 </bench:id>
                                 <xsl:if test="bench:is_authoritative != &quot;&quot;">
                                    <bench:is_authoritative>
                                       <xsl:value-of select="bench:is_authoritative"/>
                                    </bench:is_authoritative>
                                 </xsl:if>
                              </bench:alias_id>
                           </xsl:for-each>
                        </bench:alias_ids>
                     </xsl:if>
                  </bench:id>
                  <bench:name>
                     <xsl:value-of select="/bench:benchmark_plan/bench:carrier/bench:name"/>
                  </bench:name>
                  <xsl:if test="/bench:benchmark_plan/bench:carrier/bench:display_name != &quot;&quot;">
                     <bench:display_name>
                        <xsl:value-of select="/bench:benchmark_plan/bench:carrier/bench:display_name"/>
                     </bench:display_name>
                  </xsl:if>
                  <xsl:if test="/bench:benchmark_plan/bench:carrier/bench:is_active != &quot;&quot;">
                     <bench:is_active>
                        <xsl:value-of select="/bench:benchmark_plan/bench:carrier/bench:is_active"/>
                     </bench:is_active>
                  </xsl:if>
               </bench:carrier>
               <bench:metal_level>
                  <xsl:value-of select="/bench:benchmark_plan/bench:metal_level"/>
               </bench:metal_level>
               <bench:coverage_type>
                  <xsl:value-of select="/bench:benchmark_plan/bench:coverage_type"/>
               </bench:coverage_type>
               <bench:ehb_percent>
                  <xsl:attribute name="xsi:type">
                     <xsl:text disable-output-escaping="no">xsd:string</xsl:text>
                  </xsl:attribute>
                  <xsl:value-of select="/bench:benchmark_plan/bench:ehb_percent"/>
               </bench:ehb_percent>
            </bench:plan>
         </bench:enrollment>
      </bench:coverage_quote_request>
   </xsl:template>
</xsl:stylesheet>
