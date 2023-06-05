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

-- Currently, privately, a subscriber can be onboarded, added to a list, then receive welcome email from list.  How about a drip campaign now? Set the purpose:

The purpose is to have a better way to communicate with my audience, and keep them up to date.

Welcome email: What's this all about
Subject: Hey, Chad! It's Deric. Got a minute?

(Note, preheader is 85-100 characters)


Preheader: I've decided I need to make a better effort at keeping up with my friends.

Body text: Hey, Chad! Hope all is well!

A while ago I started facing an issue logging into Facebook due to an issue surrounding two-factor authentication when logging in. I'm no longer able to access my account. To be honest, part of it was a relief. However, over time, I can say I miss perusing the Facbooke Marketplace and I have noticed it has also caused me to lose "touch" with people I called friends. 

I am on other social networks, but personally I've felt what I was sharing was not all too valuable when it came to fostering real connections. I feel like here's something to be said for someone sitting down and writing someone else a letter. That's gotta be better than social media posts, right? Well, I'll guess we'll find out.

I would love if you could help me keep my contacts correct and up to date. All you need to do is click below and verify I've got a good contact for you. It'll just take a few seconds, and if you have another email you'd rather me contact you at, you can update your address there, too. Thanks!

Gravity form enters onboards into list
List autosponder sends "welcome" email. Asks user to verify their email. Is this what needs to happen?
User lands on gravity form with fields prefilled. They can edit then submit, or submit if no changes are needed. This should add the user to a new list and an additioncal "welcome" email should be sent as an autoresponder.

The first list is global contact list, the second is specific enrollment in updates

We enter the data into the newsletter page/form
We reveive the correct email, however the link is incorrect
As identified above, user needs to land on gravity form with fields prefilled. This has not been done.
They can edit then submit, or submit if no changes are needed. This should add the user to a new list and an additioncal "welcome" email should be sent as an autoresponder.

Newsletter forms top of funnel, 
but gravity forms has to be used after to pass parameters. If Mailster can do this, then we can use Mailster to handle all of the operation