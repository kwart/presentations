# Josef Cacek

[linkedin.com/in/josefcacek](https://www.linkedin.com/in/josefcacek/) | [github.com/kwart](https://github.com/kwart) | [github.com/intoolswetrust](https://github.com/intoolswetrust) | [javlog.cacek.cz](https://javlog.cacek.cz)

**Senior Java Security Engineer** | Open Source Author | JVM Internals & Vulnerability Research

Senior Engineer with 15+ years of experience in the Java ecosystem, specialized in application security, backend services, and distributed systems, with hands-on experience delivering and operating production systems. Open Source Author (jd-cli, JSignPdf) with a track record of designing and auditing security architectures for Hazelcast and WildFly. Expert in the full security stack: from bytecode analysis and crypto protocols (JAAS, Kerberos, X.509) to AI-driven vulnerability intelligence microservices.

## Experience

### Azul

* Staff Software Engineer / Security Researcher (2024 - present)*

Member of the Knowledge Base team within Azul Intelligence Cloud - a SaaS product connecting millions of JVM runtimes to detect vulnerabilities and provide code inventory.

- Designed and implemented an AI-assisted pipeline for triaging unrecognized Java components from customer JVMs - automatically categorizing them against software configurations and NVD CPE entries using LLM.
- Built a bytecode-diff pipeline that identifies which specific Java classes are affected by a CVE - information absent from standard vulnerability databases.
- Designed a microservice architecture (7+ services) replacing a legacy monolithic pipeline. The new system focuses on components observed in customer JVMs and delivers more precise vulnerability data with faster turnaround.
- Developed the Maven Query service from scratch - a fast search service for Maven artifacts across multiple repositories, built on regularly updated Nexus Index data. Designed, implemented, deployed.
- Owned data quality for the KB team - responsible for recognition accuracy of software configurations, vulnerability mappings, and CVE coverage across production systems.
- Resolved vulnerability detection issues (false positives/negatives) reported by customers.

Technologies: Java, Kotlin, Python, Bash, Azure AI, Vertex AI, Ollama, GitLab CI, Jenkins, Docker, Kubernetes, AWS, MongoDB, NVD/CVE/CPE, Maven ecosystem

### Hazelcast

*Java Security Engineer / Security Architect (2017 – 2024)*

- Owned security architecture decisions for the Hazelcast Platform and provided security guidance across engineering teams.
- Designed and implemented platform security features including configuration encryption, untrusted deserialization protection, LDAP and Kerberos authentication, and X.509 certificate-based identity.
- Performed security-focused code reviews across the platform codebase.
- Owned vulnerability management for the Hazelcast Platform, including internal and third-party penetration testing, evaluation of security findings, and full CVE lifecycle management (identification, remediation, and disclosure).
- Contributed improvements to the Hazelcast I/O subsystem and Java modules (JPMS) support.
- Created the `attribution-maven-plugin` for automated open-source attribution in Maven builds.
- Helped establish the QE team, defining testing processes, building automated test suites, and maintaining CI infrastructure (Jenkins).

Technologies: JAAS, JSSE/TLS, GSS-API/Kerberos, JNDI/LDAP, netty-tcnative, JUnit, Testcontainers, Docker, Kubernetes, GitHub Actions, Jenkins, Maven, AWS, Azure, GCP

### ICT Pro

*External Lecturer (2017 - 2021)*

- Delivered administration courses for WildFly Application Server and JBoss Enterprise Application Platform.

### Red Hat

*Principal Quality Assurance Engineer (2015 - 2017)* | *Senior Quality Assurance Engineer (2012 - 2015)*

- Owned security component testing for JBoss EAP, focusing on the WildFly Elytron security subsystem and its integration into the application server.
- Contributed to the Common Criteria Certification of JBoss EAP - developed and executed the required test procedures.
- Developed test suites for JBoss EAP running in containers and cloud environments (Azure, AWS).

Technologies: SASL, JAAS, PKI, TLS, Kerberos, FIPS, Common Criteria, JASPIC, JACC, XACML, JUnit, Arquillian, Docker, Jenkins

Certifications: JBoss Application Administrator, Red Hat Certified JBoss Developer (RHCJD), Red Hat Certified Engineer - RHEL 7 (RHCSA+RHCE)

### Siemens

*Senior Java Developer (2004 - 2012)*

- Developed Identity and Access Management software (DirX Access) - back-end security and authorization logic.

## Open Source

Active on GitHub: [@intoolswetrust](https://github.com/intoolswetrust) and [@kwart](https://github.com/kwart). Arctic Code Vault Contributor.

### Author

- [jd-cli](https://github.com/intoolswetrust/jd-cli) - Command-line Java Decompiler (640+ stars)
- [JSignPdf](https://github.com/intoolswetrust/jsignpdf) - PDF digital signing software (385+ stars)
- [ldap-server](https://github.com/kwart/ldap-server) - Simple in-memory LDAP server for testing (175+ stars)
- [simple-syslog-server](https://github.com/kwart/simple-syslog-server) - RFC-5424 Syslog server implementation
- [kerberos-server](https://github.com/kwart/kerberos-server) - Kerberos server and keytab generator for testing
- [totp-me](http://totpme.sourceforge.net/) - TOTP authenticator for Java ME (RFC 6238)
- [Sunstone](https://github.com/wildfly-extras/sunstone/) - Java library for controlling VMs in cloud environments
- [attribution-maven-plugin](https://github.com/hazelcast/attribution-maven-plugin) - Code attribution plugin for Maven

### Contributor

- [Hazelcast](https://hazelcast.com/) - Real-Time Data Platform ([commits](https://github.com/hazelcast/hazelcast/commits?author=kwart))
- [WildFly](http://wildfly.org/) - Application Server ([wildfly-core](https://github.com/wildfly/wildfly-core/commits?author=kwart), [wildfly](https://github.com/wildfly/wildfly/commits?author=kwart))
- [Apache jclouds](http://jclouds.apache.org/) - Cloud abstraction library ([commits](https://github.com/jclouds/jclouds/commits?author=kwart))
- [pro-grade](http://pro-grade.sourceforge.net/) - Java Security Manager
- [OpenPDF](https://github.com/LibrePDF/OpenPDF/) - PDF manipulation library

## Education

Master's degree in Informatics - Masaryk University, Faculty of Informatics, Brno, Czech Republic
