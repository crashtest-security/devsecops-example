# DevSecOps Build Pipeline

This build pipeline uses the following tools to check an application for vulnerabilities in the order of their usage.

- [Python Safety Check](https://github.com/pyupio/safety) (for checking python requirements)
- [Google Cloud Repository](https://cloud.google.com/container-registry/) (for checking Docker containers)
- [Crashtest Security Suite](https://crashtest-security.com) (for a dynamic code analysis)

## Python Safety check

```bash
pip install safety
safety check --file requirements.txt --full-report
```