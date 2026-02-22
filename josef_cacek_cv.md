# Josef Cacek

[linkedin.com/in/josefcacek](https://www.linkedin.com/in/josefcacek/) | [github.com/kwart](https://github.com/kwart) | [github.com/intoolswetrust](https://github.com/intoolswetrust) | [javlog.cacek.cz](https://javlog.cacek.cz)

**Security Researcher & Java Engineer** | Open Source Author | Vulnerability Intelligence

Security researcher and Java engineer specializing in vulnerability intelligence systems, JVM security, and open source tooling. Builds systems that detect and classify Java vulnerabilities at bytecode level - from CVE data pipelines processing thousands of artifacts to microservice architectures serving enterprise customers. Author of open source security and developer tools on GitHub. Contributor to Hazelcast, WildFly, and Apache projects.

## Experience

### Azul

*Security Researcher (October 2024 - present)*

Member of the Knowledge Base team within Azul Intelligence Cloud - a SaaS product connecting millions of JVM runtimes to detect vulnerabilities and provide code inventory.

- Built a bytecode-diff pipeline that identifies which specific Java classes are affected by a CVE - information absent from standard vulnerability databases.
- Helped to design and implement a microservice architecture (7+ services) replacing a legacy monolithic pipeline. The new system focuses on components observed in customer JVMs and delivers more precise vulnerability data with faster turnaround.
- Developed the Maven Query service from scratch - a fast search service for Maven artifacts across multiple repositories, built on regularly updated Nexus Index data. Designed, implemented, deployed, and released.
- Developed a service mapping vulnerability IDs to vulnerable Maven components, enabling automated correlation between CVEs and affected libraries.
- Designed an AI-assisted pipeline for triaging unrecognized Java components from customer JVMs - automatically categorizing them against software configurations and NVD CPE entries using LLM.
- Owned data quality for the KB team - responsible for recognition accuracy of software configurations, vulnerability mappings, and CVE coverage across production systems.
- Resolved customer-facing vulnerability detection issues (false positives/negatives) reported by enterprise customers.
- Defined team processes and workflows.

Technologies: Java, Kotlin, Python, Bash, GitLab CI, Jenkins, Docker, Kubernetes, AWS (S3), MongoDB, NVD/CVE/CPE, Maven ecosystem

### Hazelcast

*Security Architect (2021 - 2024)*

- Provided security guidance across engineering teams; owned security architecture decisions for the Hazelcast Platform.
- Drove third-party penetration testing engagements and evaluated findings to resolution.
- Implemented security features: properties encryption in configuration, untrusted deserialization protection, LDAP and Kerberos authentication, X.509 certificate-based identity.
- Managed CVE lifecycle for the Hazelcast Platform - identification, evaluation, fix coordination, and disclosure.
- Performed security-focused code reviews across the codebase.
- Managed security-related engineering infrastructure: Greenbone vulnerability scanner, GitHub Advanced Security, Snyk, BlackDuck, OWASP dependency check.

*Security Engineer / Java Developer (2018 - 2021)*

- Developed new security features and maintained existing ones in the Hazelcast Platform core.
- Performed in-house penetration testing and evaluated third-party pentest results.
- Improved the Hazelcast I/O subsystem; contributed to Java modules (JPMS) support.
- Created the [attribution-maven-plugin](https://github.com/hazelcast/attribution-maven-plugin) for automated open source code attribution in Maven builds.

*Quality Engineer (2017 - 2018)*

- Helped establish the QE team at Hazelcast - defined processes, wrote test plans, built automated test suites for new features.
- Maintained CI environment (Jenkins).

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

### ANF Data / Siemens / LFRZ / Atos

*Senior Java Developer (2004 - 2012)*

- Developed Identity and Access Management software (DirX Access) - back-end security and authorization logic.
- Built business logic for a GPS/GSM-based tolling system for commercial vehicles.
- Designed and developed Java web applications for Austrian public sector customers (Agrarmarkt Austria, Federal Ministry).

### USU Software

*Programmer and Tester (2000 - 2004)*

- Developed an IT asset management product (Valuemation); created automated tests in JUnit.

## Open Source

Active on GitHub: [@intoolswetrust](https://github.com/intoolswetrust) and [@kwart](https://github.com/kwart). Arctic Code Vault Contributor.

### Author

- [jd-cli](https://github.com/intoolswetrust/jd-cli) - Command-line Java Decompiler (638+ stars)
- [JSignPdf](https://github.com/intoolswetrust/jsignpdf) - PDF digital signing software (385+ stars)
- [ldap-server](https://github.com/kwart/ldap-server) - Simple in-memory LDAP server for testing (175+ stars)
- [simple-syslog-server](https://github.com/kwart/simple-syslog-server) - RFC-5424 Syslog server implementation (61+ stars)
- [kerberos-server](https://github.com/kwart/kerberos-server) - Kerberos server and keytab generator for testing (38+ stars)
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
