---
layout: page
---

# Research

My research focuses on security of computer systems and networks, addressing the challenges of establishing and maintaining integrity of the systems and data being processed. Within this broad area, my interests span several domains including traditional enterprise computing and cloud computing. More detailed information about my work can be found at:

- [Vita](/vita)
- [Publications](/pubs/)

My major research thrusts include:

## Secure Data Provenance
![End-to-end data provenance](/images/prov-image.png){:class="research-pic" align="right"}

Modern computers provide little in the way of transparency for end users. Data is often processed and results generated without the user being fully aware of the inputs used to generate an output. This model leads to threats that users are powerless to defend against. Furthermore, detecting and mitigating attacks becomes increasingly challenging. This research has focused on addressing these challenges through secure collection and use of *data provenance*. Provenance-aware systems collect metadata that details the history of each data object processed by the system. The goal of this work is to build systems that can accurately detect and mitigate attacks that compromise the integrity of the data being processed.

### Recent Papers

- {% reference mg2016 %}
- {% reference mcc+2016 %}
- {% reference bbm2015 %}
- {% reference btr+2015 %}

## Trusted Computing
![Trusted Computing](/images/tc-image.png){:class="research-pic" align="left"}

Users interact with remote machines to exchange data without first understanding the state of the remote system. The *integrity state* of a machine provides a user with evidence that the system has not been compromised. Consider a web server hosting a login page that is modified by an attacker to send user credentials to an attacker-controlled server. Users currently have few, if any, options to validate that the remote web server is not compromised. This research has focused on building systems that leverage trusted hardware to provide proofs to remote users that the system is high-integrity and the content has not been modified. The systems explore the use of different cryptographic constructions to amortize the high cost of inexpensive trusted hardware (the Trusted Platform Module). This research aims to build systems that generate integrity proofs that provide strong security guarantees about the system and the data being exchanged.

### Recent Papers

- {% reference mbs+2012 %}
- {% reference mjm2012 %}
- {% reference bmm+2010 %}
- {% reference smv+2010 %}

## Secure Cloud Computing
<!--![Cloud Computing](/images/cloud-image.png){:class="research-pic" align="right"}-->

As more and more workloads are migrated to cloud computing platforms, the question of security for these platforms becomes even more important. Users of commercial cloud computing services are expected to trust the cloud service provider, but have limited visibility into the state of the systems they are entrusting with their data. This research has focused on creating the building blocks necessary to establish and maintain a secure foundation for cloud computing. Trusted hardware and software are used to create roots of trust within the cloud that users can leverage to construct secure cloud services. The goal of this work is to develop cloud architectures that support sensitive workloads by providing strong security guarantees for the users.

### Recent Papers

- {% reference scm+2016 %} *To appear*
- {% reference smj+2011 %}
- {% reference hrk+2010 %}
- {% reference sms+2009 %}
