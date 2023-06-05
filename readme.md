This is a fresh install of Wordpress 6.2.2

My intention is to initially develop [dericg.com](http://dericg.com/)
- I want to send mail from [dericg.com](http://dericg.com/)
- I want to create events calendar on [dericg.com](http://dericg.com/)

The site can send mail
Now we need to be able to enter a new user, ultimately to a specific group. The new user will then receive an email with their next steps.
- In this case, we want the user to be entered as a stakeholder, who will then receive a link to the stakeholder questionaare
- We'll use gravity forms to onboard the user,  but we will first refrain from adding them as a user in wordpress
-- first, we'll use gravity forms to intake the data on the user
-- use mailster for gravity forms plugin to add user as subscriber to list
-- send welcome email to stakeholder with link to questionnaire
-- We'll adding them as a user in wordpress after the first is accomplished

-- Currently, privately, a subscriber can be onboarded, added to a list, then receive welcome email from list.  How about a drip campaign now? Set the purpose