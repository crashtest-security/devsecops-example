# Vulnerable Application

This is a simple web application written with Django. It implements a single view which will return everything the user inputs. The templating engine disables the automatic XSS protection feature which sanitizes the input. In addition, the XSSDisableMiddleware disables the XSS protection feature implemented in modern web browser.

**DO NOT DEPLOY THE APPLICATION IN THIS REPOSITORY IF YOU DO NOT EXACTLY KNOW WHAT YOU ARE DOING**