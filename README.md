# DevSecOps Example

This repository shows exemplary how to set up a DevSecOps build chain which detects vulnerabilities in an application upon a commit / deployment.

**DO NOT DEPLOY THE APPLICATION IN THIS REPOSITORY IF YOU DO NOT EXACTLY KNOW WHAT YOU ARE DOING**

The enclosed application contains:
- Only an index page with a reflected XSS vulnerability
- A framework which contains vulnerabilities
- A docker container with vulnerabilities in the base image

## Repository structure

The application directory contains the vulnerable application which shall be checked on commit / deployment using the DevSecOps build chain.

The infrastructure directory contains the tools and instructions to set up the build chain.

See the respective readme files for more information