#!/bin/bash

#Function to notify approvers via email

notify_approvers() {

    python3 - <<END

import smtplib

from email.mime.text import MIMEText

 

def send_email(subject, body):

    sender_email = "mohanbrenda@gmail.com"  # Replace with your email address

    sender_password = "brey0naephron"  # Replace with your email password

    receiver_emails = ["mohanbrenda@gmail.com"]

 

    msg = MIMEText(body)

    msg['Subject'] = subject

    msg['From'] = sender_email

    msg['To'] = ", ".join(receiver_emails)

 

    try:

        server = smtplib.SMTP_SSL('smtp.gmail.com', 465)

        server.login(sender_email, sender_password)

        server.sendmail(sender_email, receiver_emails, msg.as_string())

        server.quit()

        print("Email notification sent successfully.")

    except Exception as e:

        print("Error sending email notification:", str(e))

 

if __name__ == "__main__":

    subject = "Pull Request Approval Required"

    body = "Dear Approvers,\n\nA new pull request requires your approval.\n\nPlease review the changes and approve the pull request.\n\nBest Regards,\nAutomated GitHub Bot"

    send_email(subject, body)

END

}

notify_approvers
