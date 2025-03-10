Postmortem: Apache Server Outage
🚨 Issue Summary
Duration of the Outage: March 10, 2025, from 12:53 PM to 1:20 PM (SAST).

Impact: The primary web application was down, and users were unable to access the site. Approximately 70% of users experienced service disruptions.

Root Cause: A syntax error in the wp-settings.php file caused by a mistyped file extension .phpp instead of .php, leading to a 500 Internal Server Error on the Apache server.

📅 Timeline
12:53 PM: Issue detected by an automated monitoring alert indicating a spike in 500 Internal Server Errors.

12:54 PM: Engineer on call received the alert and began investigating the issue.

12:56 PM: Initial inspection of Apache error logs did not reveal immediate issues, leading to further investigation.

12:58 PM: strace tool used to trace system calls, identifying missing file errors due to the mistyped extension.

1:00 PM: Misleading debugging paths explored, including potential permission issues and missing dependencies.

1:05 PM: Incident escalated to the web development team for deeper analysis.

1:10 PM: Root cause identified as the syntax error in wp-settings.php.

1:12 PM: Puppet manifest created to correct the mistyped file extension and applied to the server.

1:15 PM: Apache server restarted to apply changes.

1:20 PM: Service restored, and monitoring confirmed the issue was resolved.

🔍 Root Cause and Resolution
Root Cause: The root cause of the outage was a syntax error in the wp-settings.php file where .phpp was incorrectly used instead of .php. This error caused the Apache server to fail in loading the required PHP files, resulting in a 500 Internal Server Error.

Resolution: The issue was resolved by creating and applying a Puppet manifest to correct the file extension mistake. The Puppet manifest executed a sed command to replace .phpp with .php in the wp-settings.php file. After applying the manifest, the Apache server was restarted, and the service was restored to normal operation.

🛠️ Corrective and Preventative Measures
Improvements/Fixes:

Implement additional code reviews and automated syntax checks to catch similar errors before deployment.

Enhance monitoring to detect specific error patterns and provide more detailed alerts.

Conduct regular training sessions for developers to reinforce best practices for error handling and debugging.

Tasks to Address the Issue:

Patch Apache Server: Ensure all servers have the latest security and bug fixes applied.

Add Monitoring: Implement monitoring for PHP syntax errors and missing file warnings.

Automated Testing: Integrate automated testing tools to validate PHP files before deployment.

Review Process: Establish a peer review process for critical configuration files and scripts.

Documentation: Update documentation to include common issues and troubleshooting steps for rapid resolution.


By taking these corrective and preventative measures, we aim to minimize the risk of similar outages in the future and improve overall system reliability and resilience. Remember, even the best of us occasionally mix up file extensions. Keep calm and debug on! 🐞💻


