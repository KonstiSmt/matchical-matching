# Dev Check in (Clone)

**Konsti | matchicalcom** [00:35 - 00:42]: Hello there, No.
**Pedro | matchicalcom** [00:43 - 00:44]: More.
**Konsti | matchicalcom** [00:52 - 00:53]: Not weirdly.
**Konsti | matchicalcom** [00:55 - 00:57]: I just don't know me or you.
**Konsti | matchicalcom** [01:17 - 01:17]: Colors?
**Konsti | matchicalcom** [01:19 - 01:19]: Yes, I'm here.
**Konsti | matchicalcom** [01:21 - 01:23]: Okay, Can you hear Pedro the same way as either.
**Konsti | matchicalcom** [01:30 - 01:31]: He's an alien?
**Carlos | matchicalcom** [01:31 - 01:35]: No, you seem like Alvin the Chipman.
**Konsti | matchicalcom** [01:37 - 01:40]: Ah, true, it's a filter, he's a.
**Carlos | matchicalcom** [01:40 - 01:47]: Filter he's also training for his TikTok account so we are the person online persona.
**Carlos | matchicalcom** [01:48 - 01:51]: I'm kidding so just very weird, I.
**Konsti | matchicalcom** [01:51 - 01:54]: Don'T know Peter It's a filter.
**Konsti | matchicalcom** [01:55 - 01:57]: It's not a bucket to feature, right?
**Carlos | matchicalcom** [01:59 - 02:02]: Yep, much sounds much nicer.
**Konsti | matchicalcom** [02:03 - 02:20]: I did, I did like so what like fifty just crazy, yeah, I just like Sometimes you ask ChatGPT for like okay, just double check these kind of documents before I send them to a client or something like that, right?
**Konsti | matchicalcom** [02:21 - 02:25]: And then ChatGPT goes like wide and takes like hypid or not works.
**Konsti | matchicalcom** [02:25 - 02:30]: ChatGPT goes wide and take like fifteen minutes or so.
**Carlos | matchicalcom** [02:33 - 02:35]: That's like deep research.
**Konsti | matchicalcom** [02:35 - 02:37]: No, no, not deep research.
**Konsti | matchicalcom** [02:37 - 02:45]: Willie just try to okay, I basically told him here just maybe for one minute.
**Konsti | matchicalcom** [02:46 - 02:52]: I told him here like okay, finally, after I made all the.
**Carlos | matchicalcom** [02:57 - 03:01]: Very clear, very clear that you're sharing your screen because it's fully understandable.
**Konsti | matchicalcom** [03:04 - 03:06]: But here you see.
**Konsti | matchicalcom** [03:06 - 03:14]: I just told him like review the documents once more once last time don't write any code, just review the document and he's like running batch scripts and like what.
**Konsti | matchicalcom** [03:14 - 03:15]: The fuck are you doing?
**Konsti | matchicalcom** [03:15 - 03:18]: You should just fucking review the document.
**Pedro | matchicalcom** [03:20 - 03:21]: It's just hallucinating.
**Pedro | matchicalcom** [03:24 - 03:25]: But I want to code.
**Pedro | matchicalcom** [03:25 - 03:26]: I want to code.
**Pedro | matchicalcom** [03:26 - 03:28]: I have to don't prevent me to code.
**Konsti | matchicalcom** [03:29 - 03:31]: Yeah, they take fifteen minutes.
**Konsti | matchicalcom** [03:32 - 03:33]: What the fuck is going on?
**Konsti | matchicalcom** [03:35 - 03:38]: OK, cool, perfect.
**Konsti | matchicalcom** [03:39 - 03:42]: Let's use the time most efficiently Friday afternoon, right?
**Carlos | matchicalcom** [03:43 - 03:55]: I do have a question not sure if you were prepared to review some part of the application right now I onboarded Pedro on the go for these calls.
**Carlos | matchicalcom** [03:56 - 04:02]: And you can add whatever you need to We have a challenge right now on the master data that is parsing.
**Carlos | matchicalcom** [04:02 - 04:15]: One CV, but we already know who is the consultant or we have an external user ID and probably we'll have to create the consultant and force that CV to be that consultant.
**Carlos | matchicalcom** [04:18 - 04:30]: So the business scenario there is when you are a partner and you know this better than me, you want to create the consultant and the application will ask you to add their CV.
**Carlos | matchicalcom** [04:32 - 04:33]: What is happening right now?
**Carlos | matchicalcom** [04:33 - 04:36]: And I didn't review all the code just behind the scenes.
**Carlos | matchicalcom** [04:36 - 04:48]: But what is happening right now is, once I paste a CV, I upload the CV that's okay, but then it just creates its own new consultant, doesn't get associated to the one that I have.
**Carlos | matchicalcom** [04:48 - 04:53]: I'm sure that there are a few places that I need to change in the code, but that's a challenge right now.
**Carlos | matchicalcom** [04:54 - 04:57]: Cool, okay, so this to add.
**Carlos | matchicalcom** [04:57 - 05:01]: If you can review the CV parsing for example would.
**Carlos | matchicalcom** [05:01 - 05:02]: Be awesome.
**Carlos | matchicalcom** [05:04 - 05:08]: Or give me some guidelines where you should focus.
**Konsti | matchicalcom** [05:13 - 05:25]: I think here look at this, because I also had the use case once where imagine the following, because we have a very similar use case in terms of business perspectives, imagine the following.
**Konsti | matchicalcom** [05:27 - 05:43]: I go in here in general settings as soon as my defarts, I go in here in general settings and employees and for example invite like XYZ right?
**Konsti | matchicalcom** [05:48 - 05:55]: And then XYZ gets an invite and then XYZ comes into magical right as a consultancy user and he is.
**Konsti | matchicalcom** [05:55 - 05:58]: Maybe, what is the case?
**Konsti | matchicalcom** [05:58 - 06:00]: We already have created the consultancy user.
**Konsti | matchicalcom** [06:00 - 06:11]: We have already created the consultant and now when I would be that guy and would go into like maybe let's switch to my tenant here.
**Carlos | matchicalcom** [06:13 - 06:18]: If I were magical on magical, you have several that don't have any engagements or roles.
**Konsti | matchicalcom** [06:21 - 06:24]: Yeah, maybe even me like imagine I.
**Konsti | matchicalcom** [06:24 - 06:27]: Would not have a profile right now.
**Konsti | matchicalcom** [06:30 - 06:40]: Like basically what I have built here is like this initial pathing you can.
**Carlos | matchicalcom** [06:40 - 07:00]: Just pass on a second there on this flow I've added this middle section where I pass the external id this middle section where yeah, that if condition was because in this case we do not need to create the external user, because it already exists.
**Carlos | matchicalcom** [07:00 - 07:13]: So if I've adjusted the action to receive an external ID as perimeter, not sure, we are not sure, but this was just my first attempt to do something here.
**Carlos | matchicalcom** [07:13 - 07:15]: Not sure if that's enough.
**Konsti | matchicalcom** [07:17 - 07:24]: True, because we, also like for internal ones we always have consultants, but for external ones we don't have consultants.
**Konsti | matchicalcom** [07:24 - 07:25]: That's true.
**Konsti | matchicalcom** [07:26 - 07:30]: So you say, okay, it's not a.
**Carlos | matchicalcom** [07:30 - 07:36]: Reposing, it's similar to a reparsing, but I need to create the consultant.
**Carlos | matchicalcom** [07:36 - 07:38]: I can create the consultant before calling this.
**Carlos | matchicalcom** [07:38 - 07:40]: If we need to I can adjust.
**Konsti | matchicalcom** [07:41 - 07:47]: But you don't want to pass the just what are you doing here?
**Carlos | matchicalcom** [07:47 - 07:55]: I did the same that the create external consult external user was doing just trying to make sure that the update was accurate.
**Carlos | matchicalcom** [07:55 - 08:00]: That I didn't lose any fuel, but once again not really sure if it's the right approach.
**Konsti | matchicalcom** [08:09 - 08:17]: Perfectly copy pasting, yeah, actually like this is repassing case cannot be in this case, it's just a minor thing.
**Konsti | matchicalcom** [08:17 - 08:17]: Yes.
**Konsti | matchicalcom** [08:19 - 08:24]: And you're only passing the I was.
**Carlos | matchicalcom** [08:24 - 08:30]: The one creating that input parameter, so I'm the only one passing it, so I'm.
**Konsti | matchicalcom** [08:32 - 08:37]: Yes, like maybe let's put it up here and describe it.
**Konsti | matchicalcom** [09:01 - 09:12]: These are like, like, these are like I told Tommy like do we really need to do these things, because like I don't know who's going to click on it, but let's see.
**Konsti | matchicalcom** [09:12 - 09:19]: But that's the right way how you implemented it and that's just sure, but.
**Carlos | matchicalcom** [09:19 - 09:24]: I'm sure that I'm missing something because on the test that I did, it just created the new consultant.
**Carlos | matchicalcom** [09:24 - 09:27]: So there is someth some things.
**Konsti | matchicalcom** [09:27 - 09:30]: Yeah, because you are here creating the consultant, right?
**Carlos | matchicalcom** [09:30 - 09:35]: No new one in disguise, no, but it was with a different external.
**Carlos | matchicalcom** [09:35 - 09:39]: So it created created like I've uploaded Zenith Fisher.
**Pedro | matchicalcom** [09:41 - 09:41]: CV.
**Carlos | matchicalcom** [09:41 - 09:48]: So all the names and all the things that I did and we don't need to make all this call just related to this.
**Carlos | matchicalcom** [09:48 - 09:53]: It's just saying that I will need your help on this user one hundred.
**Konsti | matchicalcom** [09:53 - 09:58]: Percent external x.
**Konsti | matchicalcom** [09:58 - 10:06]: Ah, external, ah, okay, no, okay, got it, sorry, External external ID already existed.
**Carlos | matchicalcom** [10:07 - 10:11]: You don't need to use external user ID.
**Carlos | matchicalcom** [10:11 - 10:12]: Just make sure that.
**Konsti | matchicalcom** [10:12 - 10:24]: By the way, here's one very important thing in here, also for you, Carla, super important light we have to implement multi tenancy by ourselves, right?
**Konsti | matchicalcom** [10:25 - 10:31]: As there is no like I think Zero Eleven had a multi tenancy feature, but I tried it back then.
**Carlos | matchicalcom** [10:32 - 10:34]: It wasn't that great.
**Carlos | matchicalcom** [10:34 - 10:35]: I never liked it.
**Konsti | matchicalcom** [10:36 - 10:39]: We have implemented multi tenancy of ourselves.
**Konsti | matchicalcom** [10:39 - 10:41]: So therefore we always need to ensure.
**Konsti | matchicalcom** [10:41 - 10:55]: Peter, it's very important that we have this get tenant by user ID basically always like in all queries here, for example, because I could pass a different like I could pass as an external user ID.
**Konsti | matchicalcom** [10:56 - 11:01]: And like you know, with this way I could update a user that not belongs to my tenant.
**Konsti | matchicalcom** [11:01 - 11:05]: So in each and all aggregates we basically need to have.
**Konsti | matchicalcom** [11:05 - 11:17]: That's why I have already like this one here my shortcuts like always this here like external user ID ten external user tenant ID equals get tenant by user ID.
**Konsti | matchicalcom** [11:17 - 11:17]: Tenant ID.
**Pedro | matchicalcom** [11:18 - 11:26]: That's what I notice the uses of this application and I'm cross with it in the data privacy.
**Pedro | matchicalcom** [11:26 - 11:44]: But I also check for example that makes sense when the caller is authenticated in the application, so you have that, because that get tenant userbyid gets the getuserid and get the tenants on the user's table.
**Pedro | matchicalcom** [11:46 - 11:57]: But when the call is outside the application, for example the link of the email for the consent and you need to do some just to grab the external user.
**Pedro | matchicalcom** [11:57 - 12:03]: In that case you don't have the tenant, so you just have to get the information based on the external ID.
**Konsti | matchicalcom** [12:04 - 12:12]: Yeah, but then we have the external ID we receive with the maybe in this case we should also pass the token right and validate against the token.
**Konsti | matchicalcom** [12:12 - 12:13]: Yes.
**Pedro | matchicalcom** [12:18 - 12:24]: The aggregates associated with this The external user ID is coming from.
**Pedro | matchicalcom** [12:24 - 12:24]: Token.
**Pedro | matchicalcom** [12:24 - 12:28]: So on that case we are secure.
**Konsti | matchicalcom** [12:30 - 12:31]: Okay, cool.
**Konsti | matchicalcom** [12:31 - 12:37]: Perfect Carlos, maybe just quickly, maybe let's try to understand this real quick, but okay.
**Konsti | matchicalcom** [12:37 - 12:45]: Or maybe we need to dive into this one afterwards, but you implemented this one and it does not do what not work as expected.
**Konsti | matchicalcom** [12:45 - 12:46]: Right.
**Carlos | matchicalcom** [12:48 - 12:49]: Correct, correct.
**Carlos | matchicalcom** [12:49 - 13:02]: So it really, I'm sure that didn't create the external user, but the rest of the flow in terms of parsing didn't really associate that CV to the person that I pass it through.
**Carlos | matchicalcom** [13:02 - 13:06]: So I'm sure that there are some additional steps that need to happen.
**Konsti | matchicalcom** [13:08 - 13:12]: Looks correct, of course, it looks correct.
**Carlos | matchicalcom** [13:13 - 13:22]: No, not coffee that all so, but let's do something It's I'm not sure what additional part you wanted to cover today.
**Carlos | matchicalcom** [13:23 - 13:27]: Let's move it through and Monday let's talk about this one coffee.
**Konsti | matchicalcom** [13:27 - 13:29]: Okay, well, I will have a look right after.
**Konsti | matchicalcom** [13:29 - 13:34]: Okay, okay, what consultant did you parse here?
**Carlos | matchicalcom** [13:35 - 13:37]: Oh, I just use.
**Carlos | matchicalcom** [13:37 - 13:38]: I will have.
**Carlos | matchicalcom** [13:38 - 13:40]: It was an internal one so that's not.
**Carlos | matchicalcom** [13:40 - 13:43]: That was not the best approach.
**Konsti | matchicalcom** [13:45 - 13:47]: Wait, that's maybe important.
**Konsti | matchicalcom** [13:47 - 13:48]: Like with internal.
**Konsti | matchicalcom** [13:48 - 13:49]: What do you mean with internal?
**Carlos | matchicalcom** [13:49 - 13:50]: With internal.
**Carlos | matchicalcom** [13:50 - 13:51]: It should not happen.
**Carlos | matchicalcom** [13:51 - 13:54]: It was a mistake for my part, so I just reviewed.
**Carlos | matchicalcom** [13:54 - 13:57]: We just had a call with Tommy and he told me on internals.
**Carlos | matchicalcom** [13:57 - 13:58]: This should not happen.
**Carlos | matchicalcom** [13:58 - 14:05]: Okay, so I'm going to remove the now you have the option I have to remove it so it will be external.
**Carlos | matchicalcom** [14:05 - 14:09]: I can get you an example by the end of my working day, because.
**Konsti | matchicalcom** [14:09 - 14:13]: I'm no worries, no worries, but it's based on the code.
**Konsti | matchicalcom** [14:14 - 14:16]: The example will probably We can just kick it off, right?
**Konsti | matchicalcom** [14:16 - 14:17]: Is this one?
**Konsti | matchicalcom** [14:17 - 14:18]: Also consultant?
**Carlos | matchicalcom** [14:18 - 14:23]: No or no, you will not have those menus working right now.
**Carlos | matchicalcom** [14:25 - 14:31]: It's on layout implementation and I need to review the business rules afterwards.
**Carlos | matchicalcom** [14:31 - 14:32]: Make sure that everything is okay.
**Konsti | matchicalcom** [14:33 - 14:48]: No worries, no worries, like maybe let's do, let's let's do, let's let's get some structure and like how we can, how we can work through this best you always like, need to know, like I think this call.
**Konsti | matchicalcom** [14:49 - 15:09]: Carlos probably already as Carlos already explained to Pedro, it's really for it's on the one hand for explaining general concepts on the whole Code base and everything, but on the other hand it's also meant for that we go through what you're currently working on and your thoughts.
**Konsti | matchicalcom** [15:09 - 15:18]: And then I can basically like whenever I see, ah, there is something that is important like we are doing it like this currently in the Code base.
**Konsti | matchicalcom** [15:18 - 15:26]: It's not like these are the rules, but that's why we are the three backend architecture experts, right?
**Konsti | matchicalcom** [15:26 - 15:28]: Like you are the ones going to B and I'm B.
**Konsti | matchicalcom** [15:29 - 15:35]: I did the things right And so the idea is also to challenge certain things, but then not refactor.
**Carlos | matchicalcom** [15:38 - 15:40]: And then we have to refactor, right?
**Carlos | matchicalcom** [15:41 - 15:42]: That's cool.
**Carlos | matchicalcom** [15:42 - 15:44]: The architecture is perfect.
**Carlos | matchicalcom** [15:44 - 15:45]: It's awesome.
**Konsti | matchicalcom** [15:47 - 15:48]: It's awesome.
**Konsti | matchicalcom** [15:48 - 15:51]: Like everything is done already, right so but okay, cool.
**Konsti | matchicalcom** [15:51 - 15:56]: So what you're currently working on one thing that is definitely challenging You is this switch here, right?
**Konsti | matchicalcom** [15:57 - 15:58]: That you just mentioned Carlos.
**Konsti | matchicalcom** [15:59 - 16:03]: This I can understand and yeah, the way you implemented, it is the right manner.
**Konsti | matchicalcom** [16:03 - 16:07]: Is there any other questions related to your current, like what is your current process?
**Konsti | matchicalcom** [16:07 - 16:09]: Could you maybe help me with this?
**Konsti | matchicalcom** [16:09 - 16:12]: And I can maybe give you some insights on.
**Carlos | matchicalcom** [16:14 - 16:16]: Right now, on my side.
**Carlos | matchicalcom** [16:16 - 16:19]: That is the open question of existing functionality.
**Carlos | matchicalcom** [16:20 - 16:25]: I've reused the confirmed dialogue that we have already implemented.
**Carlos | matchicalcom** [16:25 - 16:26]: So that's okay.
**Carlos | matchicalcom** [16:26 - 16:32]: I've shown the functionalities switching and the create partner to Tommy, that was okay.
**Carlos | matchicalcom** [16:32 - 16:34]: He gave me a list of different cases.
**Carlos | matchicalcom** [16:34 - 16:36]: I think we missed like one or two.
**Carlos | matchicalcom** [16:36 - 16:41]: That's not too bad, but the pop up is the technical challenge that I have right now.
**Carlos | matchicalcom** [16:44 - 16:45]: CV parsing one.
**Carlos | matchicalcom** [16:47 - 16:53]: Oh, I do have a question, sorry, sorry, I was just going through my notes on the consultant and the consultancy user.
**Carlos | matchicalcom** [16:53 - 17:02]: We have a flag active is active, but we also have the status ID inactive active, just to make it clear.
**Carlos | matchicalcom** [17:02 - 17:03]: Of course.
**Konsti | matchicalcom** [17:05 - 17:09]: That'S a very good way, that's important for you to know.
**Konsti | matchicalcom** [17:09 - 17:11]: So what are we currently missing?
**Konsti | matchicalcom** [17:11 - 17:15]: We are currently missing a clear kind of status concept.
**Konsti | matchicalcom** [17:15 - 17:24]: That's on my list for so long already, because it's so bothering, because we have here in the consultancy user we have basically.
**Konsti | matchicalcom** [17:25 - 17:33]: This status and I cannot really exactly tell you if we go here to static and status.
**Konsti | matchicalcom** [17:34 - 17:49]: If we go here to consultancy user there, we have these kind of statuses that don't really make sense, because like merge pending, merge inactive, like they are not ideal yet.
**Konsti | matchicalcom** [17:49 - 17:53]: Let's say like this maybe what is a guest user?
**Konsti | matchicalcom** [17:53 - 18:00]: A guest user is a consultancy user that is not active.
**Konsti | matchicalcom** [18:00 - 18:10]: This is active true means that he has an active user ID so that he's not just because like there are two ways how consultancy users can get.
**Konsti | matchicalcom** [18:10 - 18:13]: Created or let's say three ways.
**Konsti | matchicalcom** [18:13 - 18:22]: One way obviously is I can go here to employees and add a new employee, then he automatically gets like a consultancy user and a consultant.
**Konsti | matchicalcom** [18:22 - 18:24]: Okay, that's one way.
**Konsti | matchicalcom** [18:25 - 18:25]: Another way.
**Konsti | matchicalcom** [18:26 - 18:43]: Because some of our clients have the use case where they say, okay, we want to have all our internal consultants in the database that we can match them, that we can find them, that We can export CV's, but we only want this for our staffing team.
**Konsti | matchicalcom** [18:43 - 18:55]: We don't want these users to have an access and therefore we have the API way where we are creating these consultancy users, but we don't set them to active, we set them just to guest users.
**Konsti | matchicalcom** [18:55 - 19:05]: They don't get a log in basically then their isactive faults and get the status active guest or like inactive guests.
**Konsti | matchicalcom** [19:05 - 19:19]: Basically, if they already canceled the they are not employed anymore like they are the exit date is due basically then it's inactive guest not so important, we need to resync this and it's just like I'm not one hundred percent sure.
**Konsti | matchicalcom** [19:19 - 19:41]: Also there's another third use case, the another third use case imagine the same like I'm running a consultancy and I have five hundred consultants and I want now my stuffing or sales team to work on this platform, but I don't want to have the consultants currently as active users and I don't want to do any kind of migration or integration via API.
**Konsti | matchicalcom** [19:42 - 19:46]: So what we did then is like here in internal I can also do the same thing.
**Konsti | matchicalcom** [19:46 - 19:50]: I can just upload, let's do a test file.
**Konsti | matchicalcom** [19:51 - 19:56]: I can just upload here ION PAC two for example do we have.
**Konsti | matchicalcom** [19:57 - 19:58]: We have it here as well right?
**Konsti | matchicalcom** [19:59 - 20:07]: So what I did right now is I created a new internal consultant like file already.
**Konsti | matchicalcom** [20:07 - 20:10]: Exists, yeah, But I don't care, I won't deposit anyway.
**Konsti | matchicalcom** [20:10 - 20:11]: So now.
**Konsti | matchicalcom** [20:11 - 20:17]: I created ion pacdo and he's not.
**Konsti | matchicalcom** [20:17 - 20:17]: Here.
**Konsti | matchicalcom** [20:18 - 20:19]: Why is not here?
**Konsti | matchicalcom** [20:19 - 20:25]: Because he has no name yet, He's one of these guys Probably processing it.
**Carlos | matchicalcom** [20:25 - 20:26]: Takes a little bit.
**Konsti | matchicalcom** [20:26 - 20:31]: Yeah, here, here you see he's an active guest, he's an active guest.
**Konsti | matchicalcom** [20:31 - 20:57]: The only way how he gets inactive guest if we say like okay, his entry date was his exit date was actually like here, like this now he's an inactive guest, because like he's already canceled, like probably we delete them at that stage, but that's these things that we have when it comes, like so maybe let's comment me, also these things that's also important like I don't know how do you like?
**Konsti | matchicalcom** [20:57 - 21:02]: Like Chico is always commenting things and he's always trash talking me for.
**Konsti | matchicalcom** [21:02 - 21:03]: Not making any comments anywhere.
**Konsti | matchicalcom** [21:03 - 21:08]: Nobody can know what your consideration here.
**Pedro | matchicalcom** [21:08 - 21:13]: Like yeah, Nicholas talking about that the other day.
**Pedro | matchicalcom** [21:13 - 21:27]: So my response to him was, I put descriptions when I feel that is needed, because the name itself or the label is not clear enough.
**Pedro | matchicalcom** [21:27 - 22:06]: So if you have there for example, let me give you an example on that static table you said inactive user, inactive guests for me maybe I don't understand why that was added on the aesthetic, because you have some reason in business that you thought about it and created that field of aesthetic, maybe that should have a comment there, so mainly on that case that I put descriptions on fields, actions, entities and so on not everything or else we didn't do anything.
**Konsti | matchicalcom** [22:09 - 22:09]: Now.
**Konsti | matchicalcom** [22:09 - 22:12]: The big question is that's the current status quo, right?
**Konsti | matchicalcom** [22:14 - 22:19]: We have like this is active, that's basically currently controlling what I've stated here.
**Konsti | matchicalcom** [22:19 - 22:37]: Whether this consultancy user has an user and can log in or is just a guest user and cannot log in guest user like guess created.
**Carlos | matchicalcom** [22:38 - 22:39]: Either.
**Konsti | matchicalcom** [22:41 - 22:52]: Via API, any kind of integration degration.
**Pedro | matchicalcom** [22:54 - 22:54]: Or.
**Konsti | matchicalcom** [23:10 - 23:15]: OK this clear so far.
**Konsti | matchicalcom** [23:17 - 23:19]: Okay, what is the issue?
**Konsti | matchicalcom** [23:19 - 23:21]: Because we have also something different here.
**Konsti | matchicalcom** [23:21 - 23:23]: We have also an employment status ID.
**Konsti | matchicalcom** [23:24 - 23:29]: This employment status ID we don't show currently or do we show it.
**Konsti | matchicalcom** [23:29 - 23:33]: I'm not one hundred percent sure employment status ID.
**Konsti | matchicalcom** [23:33 - 23:34]: No, we don't show it yet.
**Konsti | matchicalcom** [23:34 - 23:40]: This is basically this employment status ID is also a little bit related to this guest user thing.
**Konsti | matchicalcom** [23:40 - 23:42]: So it's kind of redundant here.
**Konsti | matchicalcom** [23:42 - 23:57]: It's like you're currently on board or you're already offboard or you canceled your contract and your exit data is in like two months or so or you're not there yet your entry date is just in two months or so, then you're coming soon.
**Konsti | matchicalcom** [23:58 - 24:00]: This is the employment status.
**Konsti | matchicalcom** [24:00 - 24:13]: What we need to think about is like I'm a big fan actually from putting most of these things into one kind of status and within this status there's a boolean for active, true or false, that the status is active or true or false, right?
**Konsti | matchicalcom** [24:15 - 24:27]: But sometimes we cannot do it right whether this consultancy user has a user or not is basically a boolean flag, so we cannot bake this into the status, right?
**Carlos | matchicalcom** [24:28 - 24:33]: Can you just, couldn't we just check the user ID that is in the same table?
**Konsti | matchicalcom** [24:33 - 24:34]: Yes, yes.
**Konsti | matchicalcom** [24:35 - 24:38]: But sometimes do you think this is better?
**Konsti | matchicalcom** [24:38 - 24:39]: Sometimes I think it's like.
**Pedro | matchicalcom** [24:42 - 24:46]: Less fields, because if you have that field, you have to manage it as well.
**Pedro | matchicalcom** [24:46 - 24:54]: Okay, So if one process removes the user id and it disables.
**Pedro | matchicalcom** [24:54 - 25:13]: Them from login, we have to remember to update a flag as well, so you may have contradictory information on the same entry, not database user without user ID and that flag saying that is active because someone or a process.
**Konsti | matchicalcom** [25:14 - 25:17]: Okay, yeah, I get this, I get this.
**Carlos | matchicalcom** [25:18 - 25:19]: I would have.
**Carlos | matchicalcom** [25:20 - 25:21]: Okay.
**Carlos | matchicalcom** [25:21 - 25:39]: Just if they are very business, very complex business rules to evaluate some kind of status or fields combining dates and just very complex or going to external tables, it makes sense to summarize it in a status column or a boolean.
**Carlos | matchicalcom** [25:39 - 25:40]: Completely sad.
**Carlos | matchicalcom** [25:40 - 25:45]: If it's just if the user id exists or not and the user id is a column.
**Carlos | matchicalcom** [25:45 - 25:47]: On the same table, that's not worth it.
**Carlos | matchicalcom** [25:48 - 25:49]: This is just my opinion.
**Carlos | matchicalcom** [25:50 - 25:54]: Just because that's complexity as Pedro was saying just one more thing to manage.
**Konsti | matchicalcom** [25:55 - 25:57]: I agree, I agree, I agree.
**Konsti | matchicalcom** [25:57 - 26:01]: It's like there's definitely things that we can work on to get rid of these things.
**Konsti | matchicalcom** [26:01 - 26:09]: I have one question because I was always assuming, but Chico told me he recently tested it and it's different.
**Konsti | matchicalcom** [26:09 - 26:16]: Like when I'm changing the name of the foreign key, I'm losing all the data, right?
**Konsti | matchicalcom** [26:17 - 26:20]: But what is if I'm changing the name of something else?
**Konsti | matchicalcom** [26:20 - 26:25]: What if I'm changing this for example to is users?
**Carlos | matchicalcom** [26:25 - 26:26]: No, don't change.
**Konsti | matchicalcom** [26:26 - 26:30]: Don't change columns, never change column names, right?
**Carlos | matchicalcom** [26:30 - 26:34]: Yeah, Once is it in production, don't change it.
**Carlos | matchicalcom** [26:34 - 26:37]: If you want create a new column and copy the data.
**Konsti | matchicalcom** [26:38 - 26:39]: Yeah, sure, okay, cool.
**Carlos | matchicalcom** [26:40 - 26:48]: Takes a couple of iterations to go to production, run a timer, migrate the data so takes more time or just have an advanced SQL just to migrate the data.
**Pedro | matchicalcom** [26:48 - 26:49]: It's easier.
**Carlos | matchicalcom** [26:50 - 26:51]: And this is a limitation.
**Carlos | matchicalcom** [26:51 - 26:55]: Not really out system of the database engine, database engines.
**Carlos | matchicalcom** [26:55 - 27:05]: And I'm not sure if Postgres works precisely the same way as SQL Server on these very, very deep details, but SQL Server you cannot rename columns if they have data.
**Konsti | matchicalcom** [27:06 - 27:09]: What I don't understand is like, they are not using our names.
**Konsti | matchicalcom** [27:09 - 27:16]: Either way, they are always using cryptic caches where you can kind of sometimes read what name it is, but sometimes you have no idea right?
**Konsti | matchicalcom** [27:16 - 27:18]: So I don't know why they do.
**Carlos | matchicalcom** [27:18 - 27:24]: But once again in Zero eleven they use your names on the database as the database call it.
**Carlos | matchicalcom** [27:24 - 27:29]: They don't have those ash keys or those grids just to make it complex.
**Carlos | matchicalcom** [27:29 - 27:37]: So that's something that you know this year we'd have to give it a try, but from experience we shouldn't be changing columns.
**Carlos | matchicalcom** [27:37 - 27:43]: Or else we need to be aware that we might lose the data, so need always to migrate.
**Konsti | matchicalcom** [27:43 - 27:49]: Okay, perfect thanks for letting me know that one we need to be really careful with.
**Konsti | matchicalcom** [27:49 - 27:52]: But like as you're already aware of it, that's super.
**Konsti | matchicalcom** [27:52 - 27:59]: So maybe let's do the following as last one exercise and then Pedro, I would also ask you a little bit about where you're currently at.
**Konsti | matchicalcom** [27:59 - 28:04]: But maybe we can do this even without you Carlos, to dive into your user story.
**Konsti | matchicalcom** [28:04 - 28:22]: But I think what's good when we are already talking about this one here and by the way, let me go once deeper, Like the status, as I mentioned so currently this is active is not so really relevant, that's more like has he a user or not?
**Konsti | matchicalcom** [28:22 - 28:27]: But with the status here we are kind of controlling if we are showing this user or not.
**Konsti | matchicalcom** [28:27 - 28:34]: Because currently, for example, if you are merging a consultancy user or if.
**Konsti | matchicalcom** [28:34 - 28:40]: You're merging an internal consultant into an internal consultant, then you're also merging the consultants user.
**Konsti | matchicalcom** [28:40 - 28:47]: What we actually should consider is really after the merge let's get rid of the old consultant and the old consultants user.
**Konsti | matchicalcom** [28:47 - 28:49]: Currently we are not doing this.
**Konsti | matchicalcom** [28:49 - 28:52]: We are not deleting the old consultant and old consultants user.
**Konsti | matchicalcom** [28:53 - 29:01]: We just set the consultant status as well as the consultancy user status.
**Konsti | matchicalcom** [29:01 - 29:10]: Like both have these to merge or even pending merge are going to plan a merge and these are statuses that are active fault.
**Konsti | matchicalcom** [29:10 - 29:20]: So whenever there's a list view of consultants or consultancy users, you always have to look for status that you look only for status that are active crew.
**Konsti | matchicalcom** [29:20 - 29:24]: So that you get rid of the pending merged and the merged candidates.
**Pedro | matchicalcom** [29:28 - 29:31]: For that you just saying that you want to remove those.
**Pedro | matchicalcom** [29:31 - 29:39]: So a timer can just go through those tables and with correct filters just deleted.
**Pedro | matchicalcom** [29:39 - 29:44]: I don't know if there is associated data on other tables that you didn't talk about.
**Pedro | matchicalcom** [29:44 - 29:51]: That needs to also be purged, but timer every day at night or I don't know.
**Konsti | matchicalcom** [29:52 - 30:04]: Yeah, or even or even like or we said something like a deletion flag and one day after the deletion flag has, but maybe sometimes even easier just do a timer, right?
**Konsti | matchicalcom** [30:04 - 30:10]: Yeah, When you delete a consultant, you need to delete several things that's important, but therefore we have this by the way.
**Konsti | matchicalcom** [30:10 - 30:30]: Also information for you, whenever you are doing deletion on objects, you really need to see like for most of the objects we already have deletion actions, but these deletion actions are oftentimes not full in full depth, Like we are just deleting half of these things, we are forgetting all the time local dicts and so on.
**Konsti | matchicalcom** [30:30 - 30:39]: So all the deletion actions, whenever you are in a deletion action, take the time to revisit the deletion action and check if really everything is deleted.
**Konsti | matchicalcom** [30:39 - 30:45]: And because we need to kind of like sometimes it makes sense for stuff that you're never doing.
**Konsti | matchicalcom** [30:46 - 30:49]: Just do it when you are there the next time that you are doing it ongoing.
**Konsti | matchicalcom** [30:51 - 31:09]: Also one thing that we should think about is what you proposed here, Carlos, this new change for making this a central table and then all other tables like this one and this one and this one just connecting via one to one, right?
**Konsti | matchicalcom** [31:12 - 31:18]: We definitely need to do this at some day and then we also have to think about the statuses, but I think we will have different.
**Konsti | matchicalcom** [31:18 - 31:57]: Like consultants can have different statuses than the consultancy users most likely, but we need to think this through Let's do maybe one last task, one last exercise and then Pedro, I will also come specifically to you, but if we could do the following, because there's definitely some confusion and it's quite confusing between like OK consultant, consultancy user, external user, partner contact and client, right?
**Konsti | matchicalcom** [31:57 - 32:00]: So maybe let's look specifically at these.
**Carlos | matchicalcom** [32:00 - 32:07]: You have contact to consultant to, sorry, can you go to the diagram?
**Carlos | matchicalcom** [32:07 - 32:08]: Consultant too.
**Konsti | matchicalcom** [32:08 - 32:11]: Yeah, wait, give me one second, okay.
**Carlos | matchicalcom** [32:11 - 32:17]: Because I've started already that model this one, this one here the consultant two.
**Konsti | matchicalcom** [32:17 - 32:21]: I think this one you read, yeah, perfect.
**Carlos | matchicalcom** [32:22 - 32:27]: This was my initial approach to try to understand that part.
**Carlos | matchicalcom** [32:28 - 32:30]: I think I missed the client and.
**Konsti | matchicalcom** [32:30 - 32:32]: The partner, but let's do the following.
**Carlos | matchicalcom** [32:33 - 32:45]: Yeah, because yeah, the other one, the full cost is just too complex, at least for me I just kept watching sure it's super busy create a smaller.
**Konsti | matchicalcom** [32:45 - 32:49]: One, so maybe let's bring in these two as these are also important.
**Konsti | matchicalcom** [32:49 - 33:00]: So maybe let me explain and then you can restate what you were understanding and I can answer any kind of questions that arise.
**Konsti | matchicalcom** [33:01 - 33:07]: So when it comes to we have two types of users basically.
**Konsti | matchicalcom** [33:07 - 33:29]: So if we also bring in the user table here, These ones here, these are our only two types of users that eventually, or I'm quite sure about that will ever exist, because we only differentiate between The concepts of like internal users these.
**Konsti | matchicalcom** [33:29 - 33:32]: Ones here and external users, OK.
**Pedro | matchicalcom** [33:35 - 33:35]: For.
**Konsti | matchicalcom** [33:35 - 33:47]: Internal users like we make it a little bit, so they're basically, for example, a consultant cannot exist without one of these.
**Konsti | matchicalcom** [33:48 - 33:53]: That's why we also have like this two different relationships here.
**Konsti | matchicalcom** [33:54 - 34:08]: They are kind of one to one, let's say like this, Even though they are one to many and we definitely need to do this a little bit different, because it's so complex and we also have here this is internal boolean.
**Konsti | matchicalcom** [34:09 - 34:11]: That's what we need to control, right?
**Konsti | matchicalcom** [34:11 - 34:20]: Because otherwise we always need to check, ah, if this is null, then that, if this is null than that, so that's why we created this boolean here, but it's also a redundant boolean once more.
**Pedro | matchicalcom** [34:20 - 34:26]: But because of, sorry, because of efficiency in terms of searching or why?
**Konsti | matchicalcom** [34:26 - 34:28]: Because developer laziness.
**Pedro | matchicalcom** [34:29 - 34:36]: Okay, because if consultancy user ID is filled in, so it's internal, right?
**Pedro | matchicalcom** [34:36 - 34:37]: We can assume that.
**Pedro | matchicalcom** [34:38 - 34:40]: Okay, okay, okay, okay, There could be another reason.
**Konsti | matchicalcom** [34:41 - 34:53]: No, no, it's just lady and you're right actually like because then I was always checking for if consultancy user ID equals set to something and this one is null, but you can always just have one of these.
**Konsti | matchicalcom** [34:53 - 34:55]: You cannot have both, right?
**Pedro | matchicalcom** [34:55 - 35:10]: If you put on the API that creates consultants or the update everything that, when you apply consultant item, you should have their rule saying that only one should be there.
**Pedro | matchicalcom** [35:10 - 35:29]: Imagine that in the process in a consultant in an internal user, someone puts an external user ID on the safe, but on the save action you should validate if there is only one and return back something like that.
**Konsti | matchicalcom** [35:29 - 35:37]: Just to protect the data with a new setup that you proposed Carlos, We would probably not even need it anymore.
**Pedro | matchicalcom** [35:40 - 35:40]: Or?
**Konsti | matchicalcom** [35:41 - 35:45]: No, then we would need the boolean because we would not have these two keys here.
**Konsti | matchicalcom** [35:47 - 35:48]: But let's not talk about the future.
**Konsti | matchicalcom** [35:48 - 35:53]: Let's talk about now consultant is just like.
**Konsti | matchicalcom** [35:53 - 35:57]: That's not a person, this is the person and this is the person or the user.
**Konsti | matchicalcom** [35:57 - 35:59]: Let's say, okay, this is just like.
**Konsti | matchicalcom** [35:59 - 36:02]: Let's say, let's talk about roles, right?
**Konsti | matchicalcom** [36:03 - 36:14]: For internal users they can just be consultancy user and all consultancy users get a consultant, but not every consultant is active.
**Konsti | matchicalcom** [36:14 - 36:17]: So therefore we have here also another like.
**Carlos | matchicalcom** [36:19 - 36:22]: I think I already status ID.
**Konsti | matchicalcom** [36:23 - 36:24]: Here I already get rid of this boolean.
**Konsti | matchicalcom** [36:24 - 36:28]: It's just a status and this status can be inactive.
**Konsti | matchicalcom** [36:29 - 36:47]: And when this status is inactive, it basically means that this consultancy user imagine, I'm working at the consultancy magical and now I'm now I get promoted to CEO, so I need to run the company.
**Konsti | matchicalcom** [36:47 - 36:50]: I'm not a consultant anymore, so I save this.
**Konsti | matchicalcom** [36:52 - 37:27]: And what's basically going to happen is, I will get set to internal consultant and you cannot add to inactive and you cannot find me here anymore, because now I'm now again this happened that's so weird was I need to tell this chick like he messed something up with these images here so now, yeah, therefore it's a switch basically.
**Konsti | matchicalcom** [37:27 - 37:31]: So that's only for internal consultancy users that you.
**Konsti | matchicalcom** [37:31 - 37:34]: Can either be an active consultant or an inactive consultant.
**Konsti | matchicalcom** [37:35 - 37:40]: External Like what we could do, Carlos But I don't think that we should do it.
**Konsti | matchicalcom** [37:41 - 37:48]: We could also say, okay, whenever we create an external user, we create also the consultant right away and also set it to inactive.
**Konsti | matchicalcom** [37:48 - 37:53]: So in this case, if we need to create the consultant, we just need to set it to active, but I don't like that.
**Konsti | matchicalcom** [37:54 - 37:55]: What do you think about it?
**Carlos | matchicalcom** [37:56 - 37:59]: But that's one to one relation right?
**Carlos | matchicalcom** [37:59 - 38:06]: So you could have all those columns in the external user or the consultancy user right?
**Konsti | matchicalcom** [38:06 - 38:07]: These ones here.
**Carlos | matchicalcom** [38:07 - 38:08]: Yes, yes.
**Konsti | matchicalcom** [38:08 - 38:12]: But then they would be redundant right?
**Carlos | matchicalcom** [38:12 - 38:18]: So when you create the generic table, just put everything in the generic one less table to care about.
**Pedro | matchicalcom** [38:20 - 38:21]: No.
**Carlos | matchicalcom** [38:22 - 38:43]: Ah, if it's common between internal and external goes to the generic one, because you are doing tables just to have additional fields, not really to manage relations with multiple one to many one less AO.
**Konsti | matchicalcom** [38:45 - 38:47]: But would you recommend this?
**Carlos | matchicalcom** [38:50 - 38:52]: You can have fifty comments.
**Konsti | matchicalcom** [38:53 - 38:59]: Would you either have one big table where two concepts live in, just because they are always together.
**Carlos | matchicalcom** [39:00 - 39:01]: It's not two concepts.
**Carlos | matchicalcom** [39:01 - 39:04]: It's a consultant that can be.
**Konsti | matchicalcom** [39:05 - 39:13]: One concept is it's a consultant, the other concept it's a user and this user can be internal or external and he might need a consultant or not.
**Konsti | matchicalcom** [39:13 - 39:15]: But it's not always like it's not.
**Carlos | matchicalcom** [39:15 - 39:23]: One hundred percent, okay, one to one is always arguable if you just should join them or not.
**Konsti | matchicalcom** [39:24 - 39:32]: Yeah, yeah, I think the one to one makes more sense, because there's so much things connected to the consultant.
**Konsti | matchicalcom** [39:32 - 39:57]: And then if we connect EverythingEverything to the consultants, users, also a little bit, OK, OK, OK, OK, like consulting, then the external user, that's what I also told you both right?
**Konsti | matchicalcom** [39:57 - 40:14]: An external user always has a company, because he always needs to be associated to a company, or let's say in the beginning, he does not have a company, but as soon as you're going through these master data steps here, that.
**Carlos | matchicalcom** [40:14 - 40:16]: Is one of the problems.
**Carlos | matchicalcom** [40:16 - 40:20]: Because on the database we have a lot that don't have companies at least in dev.
**Konsti | matchicalcom** [40:21 - 40:24]: Yeah, true those that don't have companies.
**Carlos | matchicalcom** [40:25 - 40:30]: On this case we are blocking and I was discussing with Tommy.
**Carlos | matchicalcom** [40:30 - 40:37]: When we don't have a company, we block the creation of the partner or the client, because we will need a company for that.
**Carlos | matchicalcom** [40:37 - 40:38]: So I'm just removing.
**Konsti | matchicalcom** [40:38 - 40:40]: Yeah, that's a good point.
**Konsti | matchicalcom** [40:40 - 40:41]: That's a good point.
**Konsti | matchicalcom** [40:41 - 40:43]: As long as we don't have a company.
**Konsti | matchicalcom** [40:43 - 40:45]: And if it's a freelancer, we need to convert.
**Konsti | matchicalcom** [40:45 - 40:51]: Like this freelancer company name here basically means his company is just a solo company.
**Konsti | matchicalcom** [40:51 - 40:54]: Like here it's a solo company.
**Carlos | matchicalcom** [40:54 - 40:57]: It's like your one man show on the freelancer.
**Carlos | matchicalcom** [40:57 - 40:59]: I have not tested this one.
**Carlos | matchicalcom** [40:59 - 41:01]: You really create a company for them, right?
**Konsti | matchicalcom** [41:01 - 41:02]: I create a company.
**Konsti | matchicalcom** [41:02 - 41:07]: But I said, why do we have this boolean?
**Konsti | matchicalcom** [41:07 - 41:22]: We do have this boolean just because, like we want to kind of differentiate between these freelancer solo companies, that when I'm in the company search field, that I don't see the John Lanios company, you know?
**Konsti | matchicalcom** [41:22 - 41:25]: Okay, that it gets not too busy.
**Konsti | matchicalcom** [41:25 - 41:26]: That's the thing.
**Konsti | matchicalcom** [41:26 - 41:35]: And what I realized, That's the thought that I had that you just mentioned Carlos, I was playing around and first we had like partners and they.
**Konsti | matchicalcom** [41:35 - 41:47]: Had several fields and then we had clients and they had several fields and then I realized, ah shit, then we connect some things to the partners and want something to the clients and so on.
**Konsti | matchicalcom** [41:47 - 41:52]: And then I realized, ah, fuck it, there's so much in common, I put everything into the company.
**Konsti | matchicalcom** [41:53 - 42:06]: And if we go for example now to to an opportunity, what we are actually doing is, we are connecting always only the opportunity the company.
**Konsti | matchicalcom** [42:06 - 42:10]: So I call it client, but it's not the client, but the client company ID.
**Konsti | matchicalcom** [42:13 - 42:22]: And we could actually for these things we could just put here a boolean flag for is it a client or a partner?
**Konsti | matchicalcom** [42:23 - 42:23]: But.
**Carlos | matchicalcom** [42:25 - 42:28]: To remove those two tables, you need two things, right?
**Carlos | matchicalcom** [42:28 - 42:37]: You need a boolean, say it's one or the other and then the main contact ID for partner and for clients.
**Konsti | matchicalcom** [42:37 - 42:42]: Actually, no, a boolean does not fit, because it can be both can be both, okay?
**Carlos | matchicalcom** [42:42 - 42:46]: So yeah, you can, you can go to two booleans or go with the.
**Konsti | matchicalcom** [42:46 - 43:03]: Status, but yeah, but the thing is for example clients we have stuff like frame contract or it can definitely be when we think in the future that there's specific stuff only for clients and specific stuff only for partners.
**Konsti | matchicalcom** [43:03 - 43:06]: That's why I decided to kind of differentiate it in two tables.
**Konsti | matchicalcom** [43:06 - 43:07]: Or would you do this differently?
**Carlos | matchicalcom** [43:09 - 43:18]: In this case, I would make sure and I'm not sure if it's like that I'm just checking on my side, so the client ID should be the company ID always.
**Carlos | matchicalcom** [43:18 - 43:19]: Yeah, that's the problem.
**Carlos | matchicalcom** [43:20 - 43:25]: So it should, but it should, if it's one to one right, so just replicate the same keys.
**Carlos | matchicalcom** [43:26 - 43:31]: And once if you want to refactor, it's just very easy because the keys are already the same.
**Konsti | matchicalcom** [43:33 - 43:34]: That's a good point.
**Konsti | matchicalcom** [43:34 - 43:38]: That's definitely something that we can do and I think that's quite easy to refactor.
**Konsti | matchicalcom** [43:38 - 43:48]: The only reason why I did not do it, because whenever I use this one to one relationships, they were pretty bad for me.
**Konsti | matchicalcom** [43:48 - 43:52]: You know why I decided at one point to get rid of them.
**Pedro | matchicalcom** [43:55 - 43:58]: But why, why, why, why bad?
**Pedro | matchicalcom** [43:58 - 43:58]: Why?
**Konsti | matchicalcom** [43:59 - 44:07]: Yeah, like because I use them at the wrong places, that's the issue, but they are really helpful at the right places.
**Carlos | matchicalcom** [44:09 - 44:13]: There is one reason to always have one to one and that's binary.
**Carlos | matchicalcom** [44:14 - 44:36]: So where you go to blobs binary objects, you don't want to want to put those in the same table that you have the rest, OK mainly because, mainly because when you do a get to the old table, you don't want to bring binary or blobs with that go ahead.
**Pedro | matchicalcom** [44:37 - 45:00]: And I was adding also that for any extension idea that you want for any type of data, so you already have a table and you want to extend it because they are minor, You don't want to include them because they are in a particular reason for a specific use case extending the information.
**Pedro | matchicalcom** [45:01 - 45:03]: For example, that is a good example.
**Pedro | matchicalcom** [45:04 - 45:10]: And you're, yeah, that is a one to one relationship that makes sense.
**Pedro | matchicalcom** [45:10 - 45:12]: You should always use that in this.
**Konsti | matchicalcom** [45:12 - 45:18]: Case, because it's much like settings sometimes.
**Konsti | matchicalcom** [45:19 - 45:29]: Yeah, yeah, you're right here like one question that I'm having, because there are so many, like these are as well like what is your recommendation?
**Konsti | matchicalcom** [45:30 - 45:31]: What should we do?
**Konsti | matchicalcom** [45:31 - 45:34]: Should we just live with it?
**Konsti | matchicalcom** [45:34 - 45:37]: Or should we see stuff like that.
**Pedro | matchicalcom** [45:37 - 45:43]: The users for example, for example just are you referring to specifically?
**Konsti | matchicalcom** [45:43 - 46:04]: Yeah, for example, the user thing I think like refactoring, because the big refactor that I was already considering and Carlos told me how to do it even better, is that we move all the mutual data like here first name, last name, title, mobile and so on user id that we move.
**Konsti | matchicalcom** [46:04 - 46:11]: All this here, so get rid of this here, get rid of this here and then do just one to one relationships.
**Konsti | matchicalcom** [46:11 - 46:17]: This is one to one, this is one to one, this is one to one, So that these have all as a primary key.
**Konsti | matchicalcom** [46:17 - 46:19]: This one here right?
**Pedro | matchicalcom** [46:20 - 46:20]: Makes sense.
**Konsti | matchicalcom** [46:21 - 46:26]: Yeah, yeah, thank you, right?
**Pedro | matchicalcom** [46:26 - 46:39]: Because I only own those three tables that have repeated columns like email names mobile that are.
**Pedro | matchicalcom** [46:39 - 46:40]: Not necessary, right?
**Konsti | matchicalcom** [46:41 - 46:46]: The question is like doing this will eventually take quite some time, right?
**Konsti | matchicalcom** [46:46 - 47:04]: Probably, probably like I definitely need to do it because I think I would be the fastest in it, but even me it would be taking probably like two days of pure clicking and also then we need to do the migration, we need to be very careful and so on so like I don't know.
**Pedro | matchicalcom** [47:04 - 47:08]: If the system fully, but I think that is a very conservative.
**Pedro | matchicalcom** [47:09 - 47:15]: Two days to optimistic, sorry, two days you don't know.
**Carlos | matchicalcom** [47:15 - 47:18]: Kosti, you are saying four, but just two.
**Pedro | matchicalcom** [47:20 - 47:44]: That kind of change mainly affects all the applications, because this is the core information of the application, the users, information of the users doing a change like that We need to be very careful to see not to impact the business, because if anything, mess up, we'll have an application that will not work for several hours or day or so.
**Pedro | matchicalcom** [47:46 - 48:03]: This kind of migration and transformation needs to be very we have to dedicate for example in a sprint like two weeks, for example, for me, it was everyone that can handle this should be focused on that.
**Pedro | matchicalcom** [48:03 - 48:08]: Seeing all the applications that might arise doing a change like that.
**Konsti | matchicalcom** [48:09 - 48:20]: The question is like it will get worse and we need to do it either earlier or later, like I'm always when I hear this, I think okay, I will do this the whole weekend, but these things not always go, right?
**Carlos | matchicalcom** [48:22 - 48:31]: You can do it, I think you'll do just to prove me wrong, but I don't think that you can do it in a weekend without a migration without bugs.
**Carlos | matchicalcom** [48:31 - 48:42]: The problem is the bike so changing the data model, It's like three or four hours, because we just do the tables migrate the data do a timer migration.
**Carlos | matchicalcom** [48:42 - 48:43]: That's the easy part, right?
**Carlos | matchicalcom** [48:43 - 48:49]: The problem is we have a running application and we need to review every screen that touches this.
**Carlos | matchicalcom** [48:50 - 48:52]: I'm sure that it's like one hundred hundreds.
**Pedro | matchicalcom** [48:54 - 48:59]: Every screen aggregates functions, everything, everything needs to be reviewed.
**Konsti | matchicalcom** [48:59 - 49:00]: That's the thing.
**Konsti | matchicalcom** [49:00 - 49:03]: But what if we would do the following.
**Konsti | matchicalcom** [49:04 - 49:14]: What if we would do just one thing if we would just I cannot change this to primary, right?
**Konsti | matchicalcom** [49:14 - 49:17]: I cannot do the one to one relationship, right?
**Konsti | matchicalcom** [49:17 - 49:19]: Because these are ideas are already set right?
**Konsti | matchicalcom** [49:19 - 49:21]: So we would need to clone this one and then move everything.
**Carlos | matchicalcom** [49:23 - 49:25]: The safest approach would be.
**Carlos | matchicalcom** [49:25 - 49:31]: Clone these three four tables to what we consider to be the optimal data model.
**Carlos | matchicalcom** [49:31 - 49:39]: Migrate all the data to there and then go to these tables when they are used.
**Carlos | matchicalcom** [49:39 - 49:42]: Use new ones that would be my approach.
**Carlos | matchicalcom** [49:42 - 49:46]: It's pay form because we need to change ID's.
**Carlos | matchicalcom** [49:46 - 49:51]: We need to make the ID's to be easy to query, just to be simple.
**Carlos | matchicalcom** [49:51 - 49:56]: We need to make sure that we have all the identities so all the id's accurate and the same.
**Carlos | matchicalcom** [49:56 - 49:58]: So on the main table sets the ID's.
**Carlos | matchicalcom** [49:58 - 50:02]: All the other tables in one to one receive the idea of the main table.
**Konsti | matchicalcom** [50:07 - 50:10]: Entities we can rename at any time, right without any.
**Carlos | matchicalcom** [50:13 - 50:16]: I would prefer not to do it, but you can give it a try.
**Konsti | matchicalcom** [50:17 - 50:18]: No, no, I won't.
**Carlos | matchicalcom** [50:20 - 50:26]: Once again in postgres we can create a small test just to see what happens on the past.
**Carlos | matchicalcom** [50:26 - 50:38]: I had bad experiences with renaming tables or attributes same thing, because sometimes it just creates a blank table so it doesn't really fit the existing table.
**Carlos | matchicalcom** [50:38 - 50:41]: Alt just creates a new one and then we need to migrate all the.
**Pedro | matchicalcom** [50:41 - 50:44]: Data and even the data type.
**Pedro | matchicalcom** [50:44 - 51:04]: If you change a field that you don't change a name, but for example now integer to long Integer that is usually don't generate any conflict, but if you have for example a boolean and you want to change to integer or something like that internally you might be a new column in the database.
**Pedro | matchicalcom** [51:05 - 51:08]: So those kinds of changes we, my.
**Konsti | matchicalcom** [51:08 - 51:12]: Idea was, we can create these clones and call them consultancy user new.
**Konsti | matchicalcom** [51:12 - 51:22]: And when we are done, we get rid of the consultancy user and rename it from new to consultancy user, But otherwise we will always have new names for these things, right?
**Pedro | matchicalcom** [51:22 - 51:23]: Okay, okay.
**Pedro | matchicalcom** [51:23 - 51:30]: Use something like user user consultancy user external.
**Carlos | matchicalcom** [51:33 - 51:38]: The consultancy user I think would be easy just remain internal internal user.
**Carlos | matchicalcom** [51:38 - 51:40]: I think that, because we have external.
**Carlos | matchicalcom** [51:40 - 51:43]: Yeah, the external user will be the problem because for that the name.
**Pedro | matchicalcom** [51:47 - 51:48]: You already have user.
**Pedro | matchicalcom** [51:48 - 51:53]: So in terms of visualization it's easier because internal is high.
**Pedro | matchicalcom** [51:55 - 52:01]: Just user no, no can put user and have user internal user external user master data.
**Pedro | matchicalcom** [52:01 - 52:09]: When you open the application, the entities in service studio, you already have them all together.
**Pedro | matchicalcom** [52:10 - 52:11]: They are on the same.
**Pedro | matchicalcom** [52:11 - 52:11]: Yeah.
**Pedro | matchicalcom** [52:11 - 52:12]: Okay.
**Konsti | matchicalcom** [52:12 - 52:16]: But this one we can rename easily, because this one is not used currently.
**Konsti | matchicalcom** [52:17 - 52:18]: What that one?
**Konsti | matchicalcom** [52:19 - 52:20]: This one is not in use currently.
**Konsti | matchicalcom** [52:20 - 52:28]: I don't create it and nothing like I'm not working with it really so far Yeah, that's like currently not in use.
**Konsti | matchicalcom** [52:28 - 52:29]: That's the issue.
**Konsti | matchicalcom** [52:29 - 52:30]: Like we need to bring this in.
**Pedro | matchicalcom** [52:30 - 52:31]: That is a good.
**Pedro | matchicalcom** [52:32 - 52:32]: Yeah, good.
**Pedro | matchicalcom** [52:34 - 52:37]: Did you have already any information on that table?
**Konsti | matchicalcom** [52:37 - 52:39]: Probably any entries.
**Pedro | matchicalcom** [52:39 - 52:42]: Entries that was give me a second.
**Konsti | matchicalcom** [52:45 - 52:48]: No, it's not in news nowhere.
**Konsti | matchicalcom** [52:50 - 52:55]: Okay, okay, maybe like I think.
**Konsti | matchicalcom** [52:55 - 53:05]: Okay, Just to also respect your time to this concepts here, to these like this one is a refactor.
**Konsti | matchicalcom** [53:05 - 53:07]: We will definitely need at some point, right.
**Carlos | matchicalcom** [53:12 - 53:19]: In my opinion we could tackle this, but we need to wrap up skills and roles and what we have just ongoing at this point.
**Carlos | matchicalcom** [53:20 - 53:24]: I wouldn't get distracted because it's confusing for me.
**Carlos | matchicalcom** [53:25 - 53:26]: It took me a while to get.
**Carlos | matchicalcom** [53:26 - 53:33]: I'm more used to that right now I think we can make it work at least for a few sprints.
**Carlos | matchicalcom** [53:33 - 53:37]: Let's finish skills and rules first before starting just another.
**Konsti | matchicalcom** [53:40 - 53:45]: Last time right I think so to the current model.
**Konsti | matchicalcom** [53:45 - 53:52]: Do you have questions or is this kind of starting to get a little bit clearer for you?
**Pedro | matchicalcom** [53:55 - 53:59]: What you did talking about is in terms of the application.
**Pedro | matchicalcom** [53:59 - 54:04]: I tried to do this because I did want to understand a little bit more in terms of users.
**Pedro | matchicalcom** [54:04 - 54:05]: What type of users?
**Pedro | matchicalcom** [54:05 - 54:12]: And I did an analysis to try to understand this because of the data privacy and so on.
**Pedro | matchicalcom** [54:12 - 54:20]: But today with this explanation help me to understand a little bit more.
**Pedro | matchicalcom** [54:20 - 54:26]: So I start to know a little bit more about your structure in terms of database.
**Pedro | matchicalcom** [54:27 - 54:32]: And it's more easy when I have, when I have in terms of that privacy.
**Pedro | matchicalcom** [54:32 - 54:42]: For example, I want to think of the process now in this process, in this step I need to go and find the element in the database.
**Pedro | matchicalcom** [54:42 - 54:45]: So I start to know immediately where it is.
**Pedro | matchicalcom** [54:45 - 54:50]: So it's easier for me to understand now a little bit more cool.
**Konsti | matchicalcom** [54:52 - 54:55]: Let's maybe do the following for the next time.
**Konsti | matchicalcom** [54:56 - 54:58]: Because there are so many things that we can talk about.
**Konsti | matchicalcom** [55:00 - 55:02]: Let's have some kind of agenda.
**Konsti | matchicalcom** [55:02 - 55:04]: First we.
**Pedro | matchicalcom** [55:06 - 55:18]: Sorry, I have a question a question because I remember that a few minutes ago when you talk about external users and that impacts that the privacy.
**Pedro | matchicalcom** [55:18 - 55:30]: I think I have an aggregation that needs to go and fetch the consultancy associated to that external user, that association between external user consultancy.
**Pedro | matchicalcom** [55:30 - 55:37]: So I am a consultancy user and if I go to the external users list, I get a list.
**Pedro | matchicalcom** [55:37 - 55:42]: But that association to the external users to my consultancy is based on the tenant only.
**Konsti | matchicalcom** [55:43 - 55:44]: That's very important.
**Konsti | matchicalcom** [55:44 - 55:47]: The consultancy is unique per tenant.
**Konsti | matchicalcom** [55:48 - 55:52]: So tenant ID could actually be the consultancy ID.
**Konsti | matchicalcom** [55:53 - 55:55]: Another one for one relationship that was missed.
**Konsti | matchicalcom** [55:55 - 56:03]: The only way why we did not do it because we were considering like maybe we will have in The Future Like Multiple Consultancy Legal Entities Beneath One.
**Konsti | matchicalcom** [56:03 - 56:09]: Tenant, but we are not like not anywhere near about considering something like that.
**Pedro | matchicalcom** [56:09 - 56:17]: So, but if so you should in that case you should add consultancy IV on the external.
**Pedro | matchicalcom** [56:17 - 56:21]: User to associate that specific concept then in the future.
**Konsti | matchicalcom** [56:21 - 56:26]: But for now you can really and for very long time you can easily deliver.
**Konsti | matchicalcom** [56:26 - 56:34]: I also do it all the time whenever it's needed, you can always come to the consultancy wherever you are, by just joining by the tenant ID.
**Pedro | matchicalcom** [56:34 - 56:36]: So in this case it's correct.
**Pedro | matchicalcom** [56:36 - 56:39]: So I can go fetch my consultancy.
**Pedro | matchicalcom** [56:40 - 56:43]: The consultancy user can fetch this on the user based on tenant ID.
**Konsti | matchicalcom** [56:43 - 56:48]: Yeah, Or for example the consultancy settings that probably what you wanted to fetch here, right?
**Pedro | matchicalcom** [56:48 - 56:57]: Yeah, it's to get the information of the email privacy something like that.
**Pedro | matchicalcom** [56:58 - 56:59]: Right now.
**Konsti | matchicalcom** [56:59 - 57:01]: Cool, cool, maybe, maybe.
**Konsti | matchicalcom** [57:01 - 57:10]: Okay, Pedro, where you are currently like maybe like in future let's do it like this, because otherwise we can always talk all the time, right?
**Konsti | matchicalcom** [57:13 - 57:16]: We will start always with Is there like what you're currently working on?
**Konsti | matchicalcom** [57:16 - 57:31]: Is there something that's kind of like where you have some questions or let's reiterate through one of these concepts And if there are no specific things, we can just pick some of these, like always just one item out and like let's talk about these kind of concepts.
**Pedro | matchicalcom** [57:32 - 57:44]: Cool, Yes, I put there in terms of the privacy I didn't add the opportunity to talk about a little bit, but in terms of the data privacy process there are.
**Pedro | matchicalcom** [57:44 - 57:47]: Some minor questions because I implemented.
**Pedro | matchicalcom** [57:48 - 58:07]: I think all the in terms of the actions that I need to make the puzzle, the pieces of the puzzle in the right place, but on those actions there are several questions there in terms of refinements, the classification of the user.
**Pedro | matchicalcom** [58:07 - 58:16]: If he should have a partner role, client role, I think we talked about it previously, but it is implemented.
**Pedro | matchicalcom** [58:16 - 58:20]: But I think you should look at it to see if something is missing.
**Pedro | matchicalcom** [58:20 - 58:28]: And when I have a question, I put the comments on service studio and set the reminder to yes.
**Pedro | matchicalcom** [58:28 - 58:35]: So it's easy to catch them For example that is the one that I'm seeing and we can talk about it.
**Pedro | matchicalcom** [58:36 - 58:42]: Okay, I don't know he's today, but if you have time or so, you can look at it after this meeting.
**Pedro | matchicalcom** [58:42 - 58:44]: So Carlos can work.
**Konsti | matchicalcom** [58:47 - 58:48]: Maybe let's do it like this.
**Konsti | matchicalcom** [58:48 - 58:51]: Let's proceed on your things and then, Carlos, we are done here.
**Konsti | matchicalcom** [58:51 - 58:51]: Thank you.
**Konsti | matchicalcom** [58:53 - 59:17]: And yeah, goal is that we can achieve two things first like you get better understanding of the code base and we can talk specifically through business concepts and these kind of questions and how they are currently implemented and we can also align on what could be improved, like what we were just talking about.
**Konsti | matchicalcom** [59:17 - 59:20]: And most importantly is, we should always start with.
**Konsti | matchicalcom** [59:20 - 59:23]: Okay, what is the current challenge for you?
**Konsti | matchicalcom** [59:23 - 59:26]: Where are you currently at in your development process that I can?
**Konsti | matchicalcom** [59:26 - 59:27]: Maybe help you out with.
**Konsti | matchicalcom** [59:27 - 59:29]: Ah, you can do this like XYZ.
**Pedro | matchicalcom** [59:30 - 59:32]: Okay, cool.
**Konsti | matchicalcom** [59:32 - 59:42]: All right, Carlos, Then in this case I wish you a happy weekend and as soon as you converted a contact to a consultant and had some issues there, let me know.
**Konsti | matchicalcom** [59:42 - 59:44]: Then I can also check this out.
**Carlos | matchicalcom** [59:44 - 59:52]: Okay, I have a few business rules to review first, but I should leave that pop up running today.
**Carlos | matchicalcom** [59:52 - 59:53]: I will let you know the example.
**Konsti | matchicalcom** [59:53 - 59:55]: Okay, perfect.
**Konsti | matchicalcom** [59:55 - 59:57]: All right, See ya, see you.
**Konsti | matchicalcom** [59:57 - 59:58]: Thank you guys.
**Konsti | matchicalcom** [59:58 - 59:59]: Bye bye.
**Konsti | matchicalcom** [59:59 - 01:00:15]: So, Pedro, here you're by the way this we are most of the time doing in the, like this one here we are doing most of the time at the very beginning, because within the action we will need the tenant ID a few times, so we just fetch it once here to always reuse it.
**Konsti | matchicalcom** [01:00:16 - 01:00:19]: And this tenant ID passed by server.
**Konsti | matchicalcom** [01:00:19 - 01:00:23]: We don't need this always, we only need this.
**Konsti | matchicalcom** [01:00:23 - 01:00:40]: If this is an action that can be is triggered by events or timers right where we don't right, you don't have the user, yeah, so, okay, First you get these settings right just by just by joining right.
**Pedro | matchicalcom** [01:00:41 - 01:00:44]: Yeah, you're right, Yeah, we're talking about yet the client.
**Pedro | matchicalcom** [01:00:44 - 01:00:46]: I could use the tenant right.
**Konsti | matchicalcom** [01:00:47 - 01:00:48]: Yeah, you already did here, right?
**Pedro | matchicalcom** [01:00:48 - 01:00:55]: That's correct, yeah, But I use the consultancy ID, not the tenant, but I could cross with the tenant and get the same information.
**Pedro | matchicalcom** [01:01:03 - 01:01:14]: Ah, because when I built that I didn't remember the tenants and if I want to consultancy, I have the consultancy.
**Pedro | matchicalcom** [01:01:14 - 01:01:15]: I did not.
**Pedro | matchicalcom** [01:01:15 - 01:01:20]: Okay, but I think that that is.
**Pedro | matchicalcom** [01:01:20 - 01:01:29]: If you go down, I think you get the consultancy that is associated to the tenant of the user ID.
**Konsti | matchicalcom** [01:01:30 - 01:01:35]: You got the action that is getting both Yes, right, right, right, yeah, yeah.
**Konsti | matchicalcom** [01:01:37 - 01:01:40]: What you could also even do you could even join this with this one here.
**Pedro | matchicalcom** [01:01:40 - 01:01:42]: Yeah, yeah, yeah, yeah, yeah.
**Pedro | matchicalcom** [01:01:42 - 01:01:45]: Because of the C based on the tenant right.
**Pedro | matchicalcom** [01:01:45 - 01:01:46]: Yeah, I will do that.
**Pedro | matchicalcom** [01:01:46 - 01:01:51]: I'll do that, because in that case I'll just do an aggregate instead of two.
**Pedro | matchicalcom** [01:01:52 - 01:01:53]: That doesn't make sense.
**Konsti | matchicalcom** [01:01:53 - 01:01:57]: By the way, this action here is a way more efficient.
**Konsti | matchicalcom** [01:01:57 - 01:02:09]: Than this action, but it's really a minor detail, because only returning the tenant and this is also returning the consultancy and hence we need to fetch one more thing, but that's really a minor, minor thing doesn't matter.
**Konsti | matchicalcom** [01:02:11 - 01:02:13]: By the way, why do we have this admin here?
**Konsti | matchicalcom** [01:02:14 - 01:02:14]: That's what?
**Konsti | matchicalcom** [01:02:14 - 01:02:16]: Helping us to do the candidate switch?
**Pedro | matchicalcom** [01:02:16 - 01:02:22]: Yes, impersonate, right impersonation of the tenant.
**Konsti | matchicalcom** [01:02:23 - 01:02:26]: So okay, then you fetch it, then not found, OK empty.
**Konsti | matchicalcom** [01:02:27 - 01:02:29]: Then you check by partner.
**Pedro | matchicalcom** [01:02:30 - 01:02:33]: Yeah, that is the validation that you can see it.
**Pedro | matchicalcom** [01:02:33 - 01:02:39]: So what is the objective in terms of these API, these actions.
**Pedro | matchicalcom** [01:02:39 - 01:02:43]: So I need to check receiving any user external user ID.
**Pedro | matchicalcom** [01:02:43 - 01:02:57]: I need to know what type of constant rules that user can receive or are associated with The question is, is this correct?
**Pedro | matchicalcom** [01:02:57 - 01:02:57]: This is validation.
**Pedro | matchicalcom** [01:02:57 - 01:03:01]: So for partner for example, is that correct?
**Pedro | matchicalcom** [01:03:01 - 01:03:02]: Is missing something?
**Pedro | matchicalcom** [01:03:03 - 01:03:05]: I need to check anything else.
**Pedro | matchicalcom** [01:03:05 - 01:03:07]: What is that for?
**Pedro | matchicalcom** [01:03:07 - 01:03:07]: What is that or not?
**Pedro | matchicalcom** [01:03:07 - 01:03:09]: I don't know that is their most.
**Konsti | matchicalcom** [01:03:10 - 01:03:11]: These are definitely correct.
**Konsti | matchicalcom** [01:03:14 - 01:03:18]: So and here, what was your idea?
**Konsti | matchicalcom** [01:03:18 - 01:03:21]: Here so agency, company.
**Pedro | matchicalcom** [01:03:25 - 01:03:31]: So to associate a consultant you have there on let me see if.
**Pedro | matchicalcom** [01:03:31 - 01:03:32]: Can you go to application?
**Pedro | matchicalcom** [01:03:33 - 01:03:35]: It's maybe just because of those.
**Konsti | matchicalcom** [01:03:37 - 01:03:49]: If you really just want to check whether he's a consultant or not, But Pedro, you can do it much more easily.
**Konsti | matchicalcom** [01:03:49 - 01:03:52]: You can just check whether.
**Konsti | matchicalcom** [01:03:54 - 01:04:01]: Let's go here you can just check whether a consultant exists or not with this external user ID.
**Konsti | matchicalcom** [01:04:01 - 01:04:07]: So you can just join with the consultant and see if this is if this is present.
**Pedro | matchicalcom** [01:04:09 - 01:04:10]: But can you go back?
**Pedro | matchicalcom** [01:04:10 - 01:04:14]: I don't know if I have validation.
**Pedro | matchicalcom** [01:04:14 - 01:04:16]: Can you go to the consultant?
**Pedro | matchicalcom** [01:04:16 - 01:04:19]: Dave, can you expand it?
**Pedro | matchicalcom** [01:04:19 - 01:04:19]: Please?
**Pedro | matchicalcom** [01:04:22 - 01:04:39]: Okay, so I see that because I'm using those new three flags, sorry, five flags on the global settings that you can enable or disable the consent.
**Pedro | matchicalcom** [01:04:39 - 01:04:47]: Sending the consent process right the request and receiving email and receive the go to the consent page.
**Pedro | matchicalcom** [01:04:47 - 01:04:51]: So we have five based on the mockups and the request.
**Pedro | matchicalcom** [01:04:52 - 01:04:54]: Five flags to say.
**Pedro | matchicalcom** [01:04:56 - 01:05:00]: That's why I was asking you to go to the global settings.
**Pedro | matchicalcom** [01:05:00 - 01:05:01]: Can you go to application?
**Pedro | matchicalcom** [01:05:01 - 01:05:04]: And I need to check that these flags here?
**Pedro | matchicalcom** [01:05:04 - 01:05:14]: That's why they are here for each flag that associated to the agency consultants, freelancer, consultant and partner consultants.
**Pedro | matchicalcom** [01:05:14 - 01:05:17]: They always have a flag as you can.
**Pedro | matchicalcom** [01:05:17 - 01:05:17]: Check.
**Pedro | matchicalcom** [01:05:17 - 01:05:21]: Can you go to the application just for you to see what I'm talking about?
**Pedro | matchicalcom** [01:05:21 - 01:05:23]: Can you go to the global settings?
**Pedro | matchicalcom** [01:05:23 - 01:05:28]: Data privacy, Data privacy, of course.
**Konsti | matchicalcom** [01:05:29 - 01:05:29]: Again.
**Pedro | matchicalcom** [01:05:32 - 01:05:35]: What is missing is the image below?
**Pedro | matchicalcom** [01:05:35 - 01:05:41]: Yes, maybe a rendering issue.
**Pedro | matchicalcom** [01:05:41 - 01:05:44]: I don't know because the name is.
**Konsti | matchicalcom** [01:05:44 - 01:05:52]: There so no, it's because Like here.
**Pedro | matchicalcom** [01:05:53 - 01:05:54]: The rectangular yeah.
**Konsti | matchicalcom** [01:05:57 - 01:06:00]: Even though I did not change anything, that's weird.
**Konsti | matchicalcom** [01:06:00 - 01:06:01]: So what do you mean?
**Pedro | matchicalcom** [01:06:01 - 01:06:07]: You mean like those five Casey on the top that is a request.
**Pedro | matchicalcom** [01:06:07 - 01:06:13]: So I can block, I can, I can, I can block the consent.
**Pedro | matchicalcom** [01:06:13 - 01:06:16]: The consent trigger right?
**Pedro | matchicalcom** [01:06:16 - 01:06:20]: The consent activation you have that consent activation for those cases.
**Pedro | matchicalcom** [01:06:20 - 01:06:24]: Those last three are associated to the consult role.
**Pedro | matchicalcom** [01:06:25 - 01:06:29]: Those three that was we talked about this.
**Pedro | matchicalcom** [01:06:29 - 01:06:34]: So the last three are consultants, but each one of them are particular.
**Pedro | matchicalcom** [01:06:34 - 01:06:45]: So if a user I have a user, I need to send a consent and an agency is only agency consultant is on and the other two are off.
**Pedro | matchicalcom** [01:06:45 - 01:06:51]: I need to understand if he is an NGC consultant and not a freelancer or?
**Pedro | matchicalcom** [01:06:51 - 01:06:52]: So that's why.
**Pedro | matchicalcom** [01:06:53 - 01:06:55]: There are all those three there not.
**Pedro | matchicalcom** [01:06:55 - 01:06:57]: Just using the consultant table.
**Konsti | matchicalcom** [01:06:58 - 01:06:58]: OK?
**Konsti | matchicalcom** [01:06:59 - 01:07:06]: And this is freelancer is freelancer permanent is temporary.
**Konsti | matchicalcom** [01:07:06 - 01:07:08]: These ones you did not add right?
**Pedro | matchicalcom** [01:07:10 - 01:07:16]: No, no, I didn't use for freelancer analysis to see if he can receive.
**Pedro | matchicalcom** [01:07:16 - 01:07:18]: I see, okay, you are.
**Pedro | matchicalcom** [01:07:18 - 01:07:21]: Are you a freelancer and you have a freelancer activated?
**Pedro | matchicalcom** [01:07:21 - 01:07:23]: Yes, okay, you can go you.
**Konsti | matchicalcom** [01:07:24 - 01:07:33]: That's also think like I need to I need to maybe even let's get these are like, like these are outdated.
**Konsti | matchicalcom** [01:07:34 - 01:07:38]: Okay, so sorry, that's very good.
**Pedro | matchicalcom** [01:07:41 - 01:07:45]: Okay, So how can I check if it is a free lesson?
**Konsti | matchicalcom** [01:07:45 - 01:07:49]: So what you actually need to do is the following.
**Konsti | matchicalcom** [01:07:49 - 01:07:51]: Like maybe let me explain it to you.
**Konsti | matchicalcom** [01:07:51 - 01:07:53]: First it's you need to check.
**Konsti | matchicalcom** [01:07:54 - 01:07:56]: First does he have a consultant?
**Konsti | matchicalcom** [01:07:57 - 01:07:58]: Otherwise he's not a consultant at all.
**Konsti | matchicalcom** [01:07:58 - 01:08:00]: So you need to join with the consultant.
**Konsti | matchicalcom** [01:08:00 - 01:08:01]: Check for the consultant ID.
**Konsti | matchicalcom** [01:08:01 - 01:08:02]: That's the first thing.
**Konsti | matchicalcom** [01:08:03 - 01:08:16]: The second thing that you need to do is basically, if he has an agency contact or an agency company, you can even go with the company.
**Konsti | matchicalcom** [01:08:16 - 01:08:17]: It's better right this one here.
**Konsti | matchicalcom** [01:08:17 - 01:08:24]: So you just need to check for is he consultant and he has an agency company?
**Konsti | matchicalcom** [01:08:25 - 01:08:28]: Then it's an agency consultant.
**Konsti | matchicalcom** [01:08:29 - 01:08:33]: Then for partner he needs to have.
**Konsti | matchicalcom** [01:08:35 - 01:08:40]: He needs to have a company that is a partner.
**Konsti | matchicalcom** [01:08:42 - 01:08:45]: Okay, OK, then he's.
**Konsti | matchicalcom** [01:08:45 - 01:08:56]: Then he's a partner consultant, because he's coming from a company that is a partner and for freelancer basically it's like when he just has a company or no company.
**Konsti | matchicalcom** [01:08:56 - 01:08:59]: Basically you can use the flag solo.
**Konsti | matchicalcom** [01:08:59 - 01:09:00]: Right?
**Pedro | matchicalcom** [01:09:00 - 01:09:01]: Is it to a company that is.
**Konsti | matchicalcom** [01:09:01 - 01:09:04]: Solo company, a solo company?
**Konsti | matchicalcom** [01:09:04 - 01:09:09]: Or like either he has a company that is a solo company or maybe it.
**Konsti | matchicalcom** [01:09:09 - 01:09:10]: Was not even filled out.
**Konsti | matchicalcom** [01:09:10 - 01:09:24]: Then he, then he, also then when it was not filled out, then he's also freelance, or?
**Konsti | matchicalcom** [01:09:24 - 01:09:25]: No, we don't know it.
**Konsti | matchicalcom** [01:09:25 - 01:09:27]: We don't know it, sorry, we don't know it.
**Konsti | matchicalcom** [01:09:28 - 01:09:39]: Like basically as we always when we're talking about like to like When you go, you need to go through these steps here first right?
**Konsti | matchicalcom** [01:09:39 - 01:09:43]: You need to go through these steps before we even know what's up with you right?
**Konsti | matchicalcom** [01:09:45 - 01:09:50]: And what we are doing when you did went through all these like when is this action being triggered here?
**Pedro | matchicalcom** [01:09:50 - 01:09:54]: By the way is not triggered yet in the system automatically.
**Pedro | matchicalcom** [01:09:58 - 01:10:00]: That is not triggered that part.
**Pedro | matchicalcom** [01:10:01 - 01:10:09]: This action is called when you create consent, create the next one and it's working now.
**Pedro | matchicalcom** [01:10:09 - 01:10:14]: When you click on the button send request that already exists on the system.
**Pedro | matchicalcom** [01:10:15 - 01:10:19]: Okay, okay, this is just a validation.
**Pedro | matchicalcom** [01:10:19 - 01:10:19]: Okay, this is.
**Konsti | matchicalcom** [01:10:22 - 01:10:51]: Sure like okay, my only question is we need to be careful or like what say careful Like when we are going through this here what we definitely need to do is we need to first save this information before we before we send out this data privacy thing right now you can.
**Pedro | matchicalcom** [01:10:51 - 01:10:53]: Do first you can say but what?
**Pedro | matchicalcom** [01:10:56 - 01:11:04]: If it is a specific For example, if it is a specific on the action that saves this, I can put there.
**Pedro | matchicalcom** [01:11:04 - 01:11:06]: We can put always there flag because you.
**Pedro | matchicalcom** [01:11:06 - 01:11:15]: Have the option and Tommy request this on the last card of this flow of parse review.
**Pedro | matchicalcom** [01:11:17 - 01:11:18]: He wants to.
**Pedro | matchicalcom** [01:11:18 - 01:11:31]: When you click save you no longer have the flag to say if I want to trigger or not or the option that the user could bypass the trigger, the option there he wants.
**Pedro | matchicalcom** [01:11:31 - 01:11:35]: Click the save and show two different options.
**Pedro | matchicalcom** [01:11:35 - 01:11:45]: Save without trigger and save and trigger in terms of name and we can have a flag there on that action.
**Konsti | matchicalcom** [01:11:47 - 01:11:59]: Maybe this button should still remain should still name save because then we are already saving that stuff and the last screen that you're seeing like this one.
**Pedro | matchicalcom** [01:11:59 - 01:12:03]: Is just like the other one is the other one.
**Konsti | matchicalcom** [01:12:03 - 01:12:14]: Yeah, here wait, it's loading currently like this one is just like the last information, but you already saved the information before but doesn't matter like because.
**Pedro | matchicalcom** [01:12:16 - 01:12:19]: You are saving when you go to step by step you are saving.
**Pedro | matchicalcom** [01:12:19 - 01:12:20]: On the database.
**Konsti | matchicalcom** [01:12:20 - 01:12:31]: No, when we go through it step by step, we are not currently saving it, but maybe at the very last step we should here save because here you now entered all the data and this is maybe just like very specific.
**Pedro | matchicalcom** [01:12:32 - 01:12:37]: Data, but why can't we trigger.
**Konsti | matchicalcom** [01:12:38 - 01:12:39]: The.
**Pedro | matchicalcom** [01:12:39 - 01:12:44]: Call for data privacy on the action of the save itself?
**Pedro | matchicalcom** [01:12:47 - 01:13:09]: If i pass an input parameter on that action of the save button, saying OK save and also trigger in this case trigger just is to trigger for example and on the action, if it is triggered, I save all the things that I need to save and afterwards just call the action, because this is the same call to the server.
**Konsti | matchicalcom** [01:13:11 - 01:13:21]: The reason why I was just thinking about it is because maybe then a user sees, but yeah, it makes sense he needs to see this and say what's going to happen?
**Konsti | matchicalcom** [01:13:21 - 01:13:21]: So that's good.
**Konsti | matchicalcom** [01:13:21 - 01:13:27]: We can do it like this one hundred percent and then this is the trigger and then the data is already manipulated.
**Konsti | matchicalcom** [01:13:27 - 01:13:32]: So you know at the point where you're in here, we already know the information right?
**Konsti | matchicalcom** [01:13:32 - 01:13:33]: Right?
**Konsti | matchicalcom** [01:13:33 - 01:13:37]: Actually need to check for is like you need to.
**Pedro | matchicalcom** [01:13:38 - 01:13:40]: They already have there the partner here.
**Konsti | matchicalcom** [01:13:40 - 01:13:42]: Maybe let's say the following that I'm not doing it.
**Konsti | matchicalcom** [01:13:42 - 01:13:44]: Do you want to share your screen really quick?
**Pedro | matchicalcom** [01:13:45 - 01:13:46]: Yes, I can.
**Konsti | matchicalcom** [01:13:46 - 01:13:48]: Thank you with this action open.
**Pedro | matchicalcom** [01:13:54 - 01:13:54]: Just.
**Pedro | matchicalcom** [01:13:55 - 01:13:57]: Okay, let me go to the.
**Pedro | matchicalcom** [01:13:58 - 01:13:59]: I was looking at your.
**Konsti | matchicalcom** [01:14:03 - 01:14:10]: So okay, so what you need to do is like when you fetch the external user, you need to join also the consultant.
**Konsti | matchicalcom** [01:14:13 - 01:14:22]: Sorry, I didn't follow When you fetch the external user, you also need to join the consultant and because you need.
**Pedro | matchicalcom** [01:14:33 - 01:14:35]: Stickling a little time.
**Konsti | matchicalcom** [01:14:35 - 01:14:37]: Yeah, yeah, sometimes it's really slow right.
**Pedro | matchicalcom** [01:14:37 - 01:14:42]: But always this right out, yeah, with always out right.
**Konsti | matchicalcom** [01:14:42 - 01:14:44]: Because it can also be contact right.
**Pedro | matchicalcom** [01:14:47 - 01:14:52]: Do I need to add another source?
**Konsti | matchicalcom** [01:14:52 - 01:14:54]: No, no, I think we have all in this case.
**Konsti | matchicalcom** [01:14:54 - 01:14:58]: Okay, so in this case we have the partner right?
**Konsti | matchicalcom** [01:14:58 - 01:14:59]: I know everything's fine.
**Konsti | matchicalcom** [01:14:59 - 01:15:02]: We have the partner that's correct everything's right.
**Pedro | matchicalcom** [01:15:02 - 01:15:06]: Okay, okay, okay, so for partner is this correct?
**Pedro | matchicalcom** [01:15:07 - 01:15:08]: That's correct or is missing?
**Konsti | matchicalcom** [01:15:09 - 01:15:09]: That's correct.
**Pedro | matchicalcom** [01:15:11 - 01:15:14]: Let me just change so it can be concise.
**Pedro | matchicalcom** [01:15:14 - 01:15:22]: I like things in the stand in the uniform way, But now I'm writing on my laptop.
**Pedro | matchicalcom** [01:15:22 - 01:15:25]: I hate writing on my laptop.
**Konsti | matchicalcom** [01:15:27 - 01:15:30]: Where do you usually write on keyboard?
**Pedro | matchicalcom** [01:15:30 - 01:15:31]: I have a keyboard.
**Konsti | matchicalcom** [01:15:31 - 01:15:32]: Ah.
**Pedro | matchicalcom** [01:15:34 - 01:15:36]: I don't like the keys.
**Pedro | matchicalcom** [01:15:36 - 01:15:38]: Okay, so this is correct right?
**Pedro | matchicalcom** [01:15:38 - 01:15:43]: Sorry, Go back in And this is so this is yes.
**Pedro | matchicalcom** [01:15:43 - 01:15:45]: And the partner is that the partner is different.
**Pedro | matchicalcom** [01:15:45 - 01:15:46]: Okay, they.
**Pedro | matchicalcom** [01:15:46 - 01:15:47]: Okay, let's go.
**Konsti | matchicalcom** [01:15:47 - 01:15:48]: Only question like why?
**Konsti | matchicalcom** [01:15:48 - 01:15:49]: Why do you do first and if?
**Konsti | matchicalcom** [01:15:49 - 01:15:50]: And then set it to true.
**Konsti | matchicalcom** [01:15:50 - 01:15:53]: You could also set the boolean equal to the equation, right?
**Pedro | matchicalcom** [01:15:56 - 01:16:06]: Okay, instead of doing this, I could have this in terms of easy to read, I know another part, but yeah, it's the same.
**Konsti | matchicalcom** [01:16:06 - 01:16:09]: But yeah was just asking, but you're right.
**Konsti | matchicalcom** [01:16:09 - 01:16:10]: It's easier to read.
**Pedro | matchicalcom** [01:16:11 - 01:16:13]: The result is the same, but yeah, it's clear.
**Pedro | matchicalcom** [01:16:13 - 01:16:19]: You know where to go In terms of it also correct, okay, the other one.
**Pedro | matchicalcom** [01:16:19 - 01:16:20]: This is correct, right?
**Pedro | matchicalcom** [01:16:20 - 01:16:25]: Yes, yeah, okay, so I'll clean it later.
**Pedro | matchicalcom** [01:16:30 - 01:16:37]: So for consultancy, agency, consultancy, so what I have external user have an agency.
**Konsti | matchicalcom** [01:16:37 - 01:16:42]: Maybe what you can do in general, like in general it needs to be a consultant.
**Konsti | matchicalcom** [01:16:42 - 01:16:46]: So at the very top you can put like, yeah.
**Pedro | matchicalcom** [01:16:50 - 01:16:52]: Sorry, I forgot the name.
**Konsti | matchicalcom** [01:16:52 - 01:16:54]: No worries, no worries.
**Konsti | matchicalcom** [01:16:57 - 01:16:59]: I'm always clicking there below.
**Konsti | matchicalcom** [01:17:01 - 01:17:05]: Get external user, no, no, you get external by id.
**Pedro | matchicalcom** [01:17:11 - 01:17:11]: No.
**Pedro | matchicalcom** [01:17:14 - 01:17:16]: Because this is giving errors.
**Konsti | matchicalcom** [01:17:16 - 01:17:25]: It doesn't like you can do, you can do command, you can do command and is current.
**Carlos | matchicalcom** [01:17:28 - 01:17:31]: Assault ID.
**Pedro | matchicalcom** [01:17:43 - 01:17:47]: Okay, so it has to have a consultant, right?
**Pedro | matchicalcom** [01:17:48 - 01:17:54]: That is why I'm referring on the first line and then there are several o's.
**Pedro | matchicalcom** [01:17:55 - 01:17:59]: Sorry, I cannot put this right now like this needs to be change.
**Konsti | matchicalcom** [01:18:07 - 01:18:07]: Perfect.
**Konsti | matchicalcom** [01:18:08 - 01:18:16]: Okay, And then you actually only need to check for yeah, this one is already the first, one is already correct.
**Konsti | matchicalcom** [01:18:20 - 01:18:24]: It's not like there you have to check for the company and if it's a solo company.
**Pedro | matchicalcom** [01:18:31 - 01:18:33]: Sometimes my odc.
**Pedro | matchicalcom** [01:18:37 - 01:18:39]: Company, I know I don't.
**Pedro | matchicalcom** [01:18:39 - 01:18:41]: We don't have company.
**Pedro | matchicalcom** [01:18:41 - 01:18:45]: We don't didn't have company, but how.
**Konsti | matchicalcom** [01:18:45 - 01:18:46]: Sorry, how did you join the partner?
**Konsti | matchicalcom** [01:18:46 - 01:18:51]: In this case can you show me the aggregate once more?
**Pedro | matchicalcom** [01:18:51 - 01:18:57]: Yeah, yeah, yeah, of course, let me see partner with main contact contact ID.
**Pedro | matchicalcom** [01:18:58 - 01:19:00]: That, maybe this is not correct, That's.
**Konsti | matchicalcom** [01:19:00 - 01:19:01]: Not correct, no, that's not correct.
**Konsti | matchicalcom** [01:19:03 - 01:19:07]: You first need to join the company and then you need to join the.
**Pedro | matchicalcom** [01:19:07 - 01:19:09]: Like so maybe I don't need the.
**Konsti | matchicalcom** [01:19:09 - 01:19:12]: Contact, you don't need the contact at.
**Pedro | matchicalcom** [01:19:12 - 01:19:18]: All, No, yeah, I don't need the contact, I think just company.
**Konsti | matchicalcom** [01:19:23 - 01:19:26]: And now you need to ensure that it's the right company, right?
**Konsti | matchicalcom** [01:19:26 - 01:19:33]: Yes, that's the right company, I know you have to join already at the bottom it was auto created.
**Pedro | matchicalcom** [01:19:33 - 01:19:44]: Okay, In terms of partner is company, right?
**Konsti | matchicalcom** [01:19:44 - 01:19:44]: Yes.
**Pedro | matchicalcom** [01:20:01 - 01:20:22]: And clients also company, that's correct, Okay, company, company, partner, partner, external user to content, I think we have all right.
**Pedro | matchicalcom** [01:20:22 - 01:20:25]: Let me go this one, I think this makes sense.
**Konsti | matchicalcom** [01:20:27 - 01:20:27]: Yeah, perfect.
**Pedro | matchicalcom** [01:20:28 - 01:20:31]: Okay, now we have this one.
**Konsti | matchicalcom** [01:20:35 - 01:20:37]: And now you go for the current company.
**Pedro | matchicalcom** [01:20:43 - 01:20:44]: Company.
**Pedro | matchicalcom** [01:20:44 - 01:20:49]: What I need to do is, sorry, can you company?
**Pedro | matchicalcom** [01:20:49 - 01:20:50]: Okay, it's create.
**Pedro | matchicalcom** [01:20:50 - 01:21:02]: No, I need to freelance, no freelance company solo, right, Yes, company IDE.
**Konsti | matchicalcom** [01:21:04 - 01:21:06]: No, yes, that's perfect.
**Konsti | matchicalcom** [01:21:06 - 01:21:13]: Company it's solar company right, right null.
**Konsti | matchicalcom** [01:21:13 - 01:21:22]: Fire Cannot be the case that cannot be the case At that point where you're in there, he always needs to have a company.
**Pedro | matchicalcom** [01:21:23 - 01:21:30]: Is there any situation where he doesn't have a company or we assume that he always have a company.
**Konsti | matchicalcom** [01:21:31 - 01:21:37]: When you did click through all the things that you need to click, you will always have the company.
**Konsti | matchicalcom** [01:21:37 - 01:21:39]: It's mandatory, okay?
**Pedro | matchicalcom** [01:21:39 - 01:21:48]: But that will not let me for example I will have the other line and I would spend you afterwards.
**Konsti | matchicalcom** [01:21:50 - 01:21:51]: No worries, no worries.
**Konsti | matchicalcom** [01:21:51 - 01:21:53]: Yeah, no, no, please go ahead, Please go ahead.
**Pedro | matchicalcom** [01:21:53 - 01:21:54]: No, no, no, it's not.
**Pedro | matchicalcom** [01:21:54 - 01:21:58]: Okay, okay.
**Pedro | matchicalcom** [01:21:58 - 01:22:12]: So what is because of the of the relationship between those two tables, the company and the company and the users, right?
**Pedro | matchicalcom** [01:22:12 - 01:22:14]: The company user is with or without.
**Pedro | matchicalcom** [01:22:15 - 01:22:18]: Okay, If I want, it's true, right?
**Pedro | matchicalcom** [01:22:18 - 01:22:21]: We need to check if it's true, okay, In this case, yeah, that makes sense.
**Pedro | matchicalcom** [01:22:22 - 01:22:28]: We only need solo true, because if you use false it didn't work.
**Pedro | matchicalcom** [01:22:28 - 01:22:41]: We needed to check this also because by default the boolean is always false on relationship, okay?
**Pedro | matchicalcom** [01:22:41 - 01:22:48]: So if you join a company, right, so give me a false false entry on.
**Pedro | matchicalcom** [01:22:48 - 01:22:57]: The on that, but if, but since we are searching for is solo equal to true, but why don't this?
**Pedro | matchicalcom** [01:22:59 - 01:23:04]: My keyboard is, I don't know this writing on top.
**Pedro | matchicalcom** [01:23:05 - 01:23:08]: Yeah, let me just grab.
**Pedro | matchicalcom** [01:23:10 - 01:23:12]: I'll move here and use my keyboard.
**Konsti | matchicalcom** [01:23:13 - 01:23:15]: No worries, no worries.
**Konsti | matchicalcom** [01:23:15 - 01:23:17]: Pedro, whenever you need to take your time.
**Pedro | matchicalcom** [01:23:19 - 01:23:20]: No, no.
**Pedro | matchicalcom** [01:23:21 - 01:23:23]: But I think this is my computer.
**Pedro | matchicalcom** [01:23:23 - 01:23:25]: I have my computer.
**Pedro | matchicalcom** [01:23:25 - 01:23:33]: I have an issue in solo company, Okay.
**Konsti | matchicalcom** [01:23:36 - 01:23:37]: Let'S go.
**Pedro | matchicalcom** [01:23:37 - 01:23:39]: Okay, I think I have an issue with.
**Pedro | matchicalcom** [01:23:40 - 01:23:44]: I think you never heard of it is the infinite scroll in Windows.
**Pedro | matchicalcom** [01:23:45 - 01:23:50]: No, you can search Windows Ten or Windows Eleven.
**Pedro | matchicalcom** [01:23:51 - 01:23:53]: Oh my goodness, Infinite scroll and so.
**Pedro | matchicalcom** [01:23:53 - 01:23:56]: AI is a nightmare.
**Pedro | matchicalcom** [01:23:56 - 01:23:58]: I need to install some drivers.
**Pedro | matchicalcom** [01:23:58 - 01:24:06]: Sometimes I need to go and use some scripts with Windows system to do a checkup.
**Pedro | matchicalcom** [01:24:06 - 01:24:09]: But, yeah, okay, I was able to do this.
**Pedro | matchicalcom** [01:24:12 - 01:24:14]: Yeah, yeah, you can search, yeah, you can search it.
**Pedro | matchicalcom** [01:24:14 - 01:24:17]: There a lot of people would complain.
**Konsti | matchicalcom** [01:24:17 - 01:24:19]: About it and maybe like the last.
**Pedro | matchicalcom** [01:24:19 - 01:24:26]: One, the last one is, yeah, the last one is for the partner.
**Pedro | matchicalcom** [01:24:26 - 01:24:31]: So I'm checking if it is as agency company id and he's not.
**Pedro | matchicalcom** [01:24:31 - 01:24:32]: A freelancer.
**Pedro | matchicalcom** [01:24:32 - 01:24:35]: But I think this is not fully is not correct.
**Konsti | matchicalcom** [01:24:36 - 01:24:40]: You can just check whether he has a partner ID or not, okay?
**Konsti | matchicalcom** [01:24:41 - 01:24:47]: But agency still, like, because there's a case like you need to mention the following.
**Konsti | matchicalcom** [01:24:47 - 01:24:55]: Like I know that this consultant is coming from a partner, but either way an agency descended to me.
**Konsti | matchicalcom** [01:24:55 - 01:24:57]: So it's still an agency contact, right?
**Pedro | matchicalcom** [01:25:08 - 01:25:10]: I have to reboot my computer.
**Pedro | matchicalcom** [01:25:14 - 01:25:15]: I need a new one.
**Pedro | matchicalcom** [01:25:16 - 01:25:21]: Carlos already promised me one new one this is as almost eight years old.
**Konsti | matchicalcom** [01:25:21 - 01:25:22]: So oh.
**Pedro | matchicalcom** [01:25:24 - 01:25:28]: I did no.
**Konsti | matchicalcom** [01:25:32 - 01:25:34]: Worries really we don't need to do this together.
**Konsti | matchicalcom** [01:25:34 - 01:25:37]: Really like you can like really don't I.
**Konsti | matchicalcom** [01:25:37 - 01:25:41]: Don't know like I also don't like You feel always pressured, but then.
**Pedro | matchicalcom** [01:25:42 - 01:25:45]: Worry about because the keyboard is not worth.
**Konsti | matchicalcom** [01:25:45 - 01:25:51]: Okay, so, but there's one more thing that you need to that you that you need to check.
**Konsti | matchicalcom** [01:25:51 - 01:25:52]: Can you go to data?
**Konsti | matchicalcom** [01:25:52 - 01:25:52]: Please?
**Konsti | matchicalcom** [01:25:52 - 01:25:57]: And then open this consultant to data the data.
**Konsti | matchicalcom** [01:25:57 - 01:26:03]: Okay, Yes, the consultant for example the consultant to the erd at the top.
**Konsti | matchicalcom** [01:26:04 - 01:26:07]: Okay, sorry, the diagram, okay, the diagram here.
**Konsti | matchicalcom** [01:26:07 - 01:26:15]: If you look at the external user for a second on the right there you see one more thing regarding to the agency.
**Konsti | matchicalcom** [01:26:16 - 01:26:19]: There's an agency expiration date.
**Konsti | matchicalcom** [01:26:21 - 01:26:34]: Basically this agency has an agency block, but it only counts for ninety days or so and it might be that these ninety days are due So you have to check whether.
**Pedro | matchicalcom** [01:26:36 - 01:26:38]: It is expired or not in that case.
**Konsti | matchicalcom** [01:26:39 - 01:26:44]: But do you know what I don't get really currently.
**Konsti | matchicalcom** [01:26:53 - 01:26:57]: Currently you're just like in your code.
**Konsti | matchicalcom** [01:26:57 - 01:27:10]: If you go back to this code right to the action Currently you're just giving back three parameters like is active partner, client or consultant?
**Konsti | matchicalcom** [01:27:10 - 01:27:12]: Right right?
**Pedro | matchicalcom** [01:27:12 - 01:27:13]: That's what I need.
**Konsti | matchicalcom** [01:27:14 - 01:27:19]: If you just need the consultant, you don't need to check for the other things you can just check for does.
**Pedro | matchicalcom** [01:27:19 - 01:27:21]: He have no no, but you forgot.
**Pedro | matchicalcom** [01:27:21 - 01:27:25]: I have to check those general settings data privacy.
**Pedro | matchicalcom** [01:27:25 - 01:27:35]: Those flags that because they are the consultancy role on that case air three consent activation.
**Pedro | matchicalcom** [01:27:35 - 01:27:37]: We need to check for each one of them.
**Pedro | matchicalcom** [01:27:37 - 01:27:47]: That's why I'm doing these three inside the consultant, because on the first line, this one is for that flag for agency.
**Pedro | matchicalcom** [01:27:47 - 01:27:50]: This flag is for the freelancer.
**Pedro | matchicalcom** [01:27:50 - 01:27:57]: That's why I need to specify each case to cross with those settings on general settings.
**Pedro | matchicalcom** [01:27:57 - 01:27:59]: Those flags on general settings.
**Konsti | matchicalcom** [01:28:01 - 01:28:03]: At what point do you plan using this action?
**Konsti | matchicalcom** [01:28:03 - 01:28:05]: Whether you send something to them or not?
**Pedro | matchicalcom** [01:28:05 - 01:28:06]: Yes.
**Pedro | matchicalcom** [01:28:07 - 01:28:13]: So in terms of flow when for example you have the parse click save.
**Pedro | matchicalcom** [01:28:13 - 01:28:17]: We will trigger the consent.
**Pedro | matchicalcom** [01:28:17 - 01:28:27]: It will go to a function like this one the consent create goes disable if it is active.
**Pedro | matchicalcom** [01:28:27 - 01:28:33]: So we check the rules this function that we are looking at and say okay, do you have any active roles?
**Pedro | matchicalcom** [01:28:33 - 01:28:35]: So we can send roles.
**Pedro | matchicalcom** [01:28:36 - 01:28:46]: Yes, you have, because we use that application so imagine he's an agent, he's a freelancer and it has that fake.
**Pedro | matchicalcom** [01:28:47 - 01:28:50]: Select a non general settings the consultancy right.
**Pedro | matchicalcom** [01:28:50 - 01:28:56]: The consultancy user flex the freelancers can receive the consent.
**Pedro | matchicalcom** [01:28:56 - 01:29:01]: So if I'm a freelancer, go start the process starts.
**Pedro | matchicalcom** [01:29:01 - 01:29:06]: Check that I'm a freelancer and the general settings for freelancer are active.
**Pedro | matchicalcom** [01:29:06 - 01:29:12]: I have an active role and then it goes to the consents.
**Pedro | matchicalcom** [01:29:12 - 01:29:16]: Check if what consents already exist on the system.
**Pedro | matchicalcom** [01:29:17 - 01:29:20]: Okay, then goes to the templates.
**Pedro | matchicalcom** [01:29:20 - 01:29:23]: Init templates that is also a question.
**Pedro | matchicalcom** [01:29:23 - 01:29:27]: If we don't have a template for a specific role, what should we do?
**Pedro | matchicalcom** [01:29:28 - 01:29:31]: Should we on template editing management?
**Pedro | matchicalcom** [01:29:31 - 01:29:32]: Should it fly?
**Konsti | matchicalcom** [01:29:32 - 01:29:43]: It cannot be the case that you that you like when you set up, when you set up, when you set.
**Pedro | matchicalcom** [01:29:43 - 01:29:44]: Up.
**Konsti | matchicalcom** [01:29:46 - 01:30:01]: When you are in the settings and you say send it to like when you're in the settings we need to kind of and if you're toggling like maybe when you're.
**Konsti | matchicalcom** [01:30:01 - 01:30:13]: In the settings and you're toggling for example the consultant on like, then we need like to indicate you like here maybe.
**Konsti | matchicalcom** [01:30:13 - 01:30:14]: For a second.
**Konsti | matchicalcom** [01:30:15 - 01:30:31]: If you are toggling one of these, you need to have at least one consultant consultant Data Privacy Content template active.
**Konsti | matchicalcom** [01:30:32 - 01:30:41]: Otherwise show you that it's that it's deactivated as long as you don't have one of these templates also activated.
**Pedro | matchicalcom** [01:30:41 - 01:30:45]: Yeah, you can do something like that.
**Konsti | matchicalcom** [01:30:46 - 01:30:48]: Missing Yes, yes.
**Pedro | matchicalcom** [01:30:48 - 01:30:57]: The idea was that I want to put there a message saying you missing partner template, missing client and partner template.
**Konsti | matchicalcom** [01:30:58 - 01:31:04]: Send request partners and then you can just also go ahead and say like okay, this is also cool.
**Konsti | matchicalcom** [01:31:04 - 01:31:06]: You also did build all this stuff.
**Pedro | matchicalcom** [01:31:06 - 01:31:13]: Cool implemented and then if you start change that needs to be cool.
**Pedro | matchicalcom** [01:31:13 - 01:31:22]: Yeah, but yeah, they are ors not ends also the activities I don't know.
**Pedro | matchicalcom** [01:31:22 - 01:31:24]: If you already seen the in this.
**Konsti | matchicalcom** [01:31:24 - 01:31:28]: Case you can assume that we are already setting us here that they're.
**Pedro | matchicalcom** [01:31:28 - 01:31:31]: Yeah, I assume so back.
**Pedro | matchicalcom** [01:31:31 - 01:31:36]: Can I can share my screen again so assuming that you have everything in place?
**Pedro | matchicalcom** [01:31:36 - 01:31:42]: So I check OK, do you have a consent role?
**Pedro | matchicalcom** [01:31:42 - 01:31:44]: Okay, I have a consent role.
**Pedro | matchicalcom** [01:31:44 - 01:31:54]: I check if any consultant role consent, because no consents on database have a new category that is the consent type.
**Pedro | matchicalcom** [01:31:55 - 01:32:04]: So because one concernal user can have more than one rarely, but can have so we handle that in general.
**Pedro | matchicalcom** [01:32:05 - 01:32:08]: So a consent is all associated to a type.
**Pedro | matchicalcom** [01:32:08 - 01:32:11]: There are three types, the consultant, partner and clients.
**Pedro | matchicalcom** [01:32:11 - 01:32:17]: And I'm checking if there is any on the system, any consultant already created.
**Pedro | matchicalcom** [01:32:18 - 01:32:25]: Check if get the templates and if there is not there is no consent consent and there is a template.
**Pedro | matchicalcom** [01:32:25 - 01:32:32]: I create a consent that's how I can create new consent requests and I do.
**Pedro | matchicalcom** [01:32:32 - 01:32:34]: The same for the partner and from the client.
**Pedro | matchicalcom** [01:32:35 - 01:32:37]: I did the test today in the morning.
**Pedro | matchicalcom** [01:32:38 - 01:32:47]: Pick up one of the elements, Change my mail and just click send request that link that you have there on data privacy and IT.
**Pedro | matchicalcom** [01:32:47 - 01:32:52]: Sent me because I changed the email, Send me the email and i check on the database.
**Pedro | matchicalcom** [01:32:52 - 01:33:06]: It created the consent correctly and then the user has the same flow that was previously receives the email and on the email clicks email go to the new consent page.
**Pedro | matchicalcom** [01:33:07 - 01:33:09]: That is now what.
**Pedro | matchicalcom** [01:33:09 - 01:33:17]: We are almost finishing that part missing the part of the forwarding and have now the new consent.
**Pedro | matchicalcom** [01:33:17 - 01:33:24]: Data get is the next function that you see here consents get data.
**Pedro | matchicalcom** [01:33:24 - 01:33:30]: So what it does check for the.
**Konsti | matchicalcom** [01:33:30 - 01:33:38]: Only question I have is like why do you need to find consultant consent?
**Pedro | matchicalcom** [01:33:41 - 01:33:41]: Where?
**Konsti | matchicalcom** [01:33:41 - 01:33:46]: Sorry, Ah, because we mentioned we don't want to create a new cons.
**Pedro | matchicalcom** [01:33:49 - 01:33:59]: Yeah, But because previously the previous version that you have every time you click on the send link, this is more creating a new consent.
**Konsti | matchicalcom** [01:33:59 - 01:34:02]: So you don't mention that we don't want to do this anymore, right?
**Pedro | matchicalcom** [01:34:05 - 01:34:12]: I think in terms of management of data privacy, you want to have the consents that you need to authorize.
**Pedro | matchicalcom** [01:34:12 - 01:34:35]: So if I already granted for example consent, I don't want to if I have a new one or if the system just parse review again that person that external user and trigger the consent process, the system needs to check if already exists the consent maybe the system didn't Now we have the partner role and the partner role.
**Pedro | matchicalcom** [01:34:35 - 01:34:53]: Consent doesn't exist in the system it will receive an email, but if it only has the consultant role and if the role the consent already exists in the system that is saved and granted, the system will not create Anyone does it make sense the user to grant again?
**Konsti | matchicalcom** [01:34:54 - 01:34:57]: My only question is the notification ID.
**Konsti | matchicalcom** [01:34:58 - 01:34:58]: Maybe this one.
**Konsti | matchicalcom** [01:34:58 - 01:35:01]: We should then always change to the most recent one.
**Konsti | matchicalcom** [01:35:01 - 01:35:18]: Like this consent request was last sent with this notification ID, because the notification ID is helpful because then we can also indicate to the user that is logged in the email was received, the email was clicked on and so on.
**Konsti | matchicalcom** [01:35:18 - 01:35:25]: So in case that you already can find it, you should replace the notification ID the notification ID.
**Konsti | matchicalcom** [01:35:25 - 01:35:27]: You are currently not passing to that action.
**Pedro | matchicalcom** [01:35:28 - 01:35:35]: No, in this case, because not in this case, but it will be on the sending part.
**Pedro | matchicalcom** [01:35:35 - 01:35:36]: So I create.
**Pedro | matchicalcom** [01:35:37 - 01:35:37]: Okay.
**Konsti | matchicalcom** [01:35:37 - 01:35:41]: So when you send it your update you can see.
**Pedro | matchicalcom** [01:35:41 - 01:35:50]: Yeah, yeah, I created this service will be deleted, because we will not create consents on request stuff like that.
**Pedro | matchicalcom** [01:35:50 - 01:35:52]: So always on the request link.
**Pedro | matchicalcom** [01:35:52 - 01:36:00]: In this case, when you create this one, you can after the send notification it is the same.
**Pedro | matchicalcom** [01:36:00 - 01:36:06]: I didn't change anything here, just the link to the new page of the consent page.
**Pedro | matchicalcom** [01:36:06 - 01:36:10]: I can save the notification because that was not in place in the previous version.
**Pedro | matchicalcom** [01:36:13 - 01:36:17]: The system didn't get the notification ID on the consent table.
**Konsti | matchicalcom** [01:36:18 - 01:36:19]: It does not.
**Pedro | matchicalcom** [01:36:19 - 01:36:32]: I OK, yeah, you can see this is the, this is the old flow and after the consent it didn't change again, Didn't update the consent with the notification ID.
**Pedro | matchicalcom** [01:36:33 - 01:36:38]: But yes, as you said right now I can put here.
**Pedro | matchicalcom** [01:36:39 - 01:36:41]: The Notification ID on the Consent.
**Pedro | matchicalcom** [01:36:43 - 01:36:44]: And we keep track.
**Pedro | matchicalcom** [01:36:44 - 01:36:48]: You can keep track of the notification associated with the notification ID with the consent.
**Pedro | matchicalcom** [01:36:48 - 01:36:49]: That was created.
**Pedro | matchicalcom** [01:36:51 - 01:36:53]: Cool, okay, cool.
**Konsti | matchicalcom** [01:36:54 - 01:36:54]: Yeah.
**Konsti | matchicalcom** [01:36:54 - 01:36:58]: And I would say if it's a recent, we just exchange the.
**Pedro | matchicalcom** [01:36:59 - 01:37:00]: Yeah, just a token.
**Pedro | matchicalcom** [01:37:00 - 01:37:04]: Yeah, it's a token, but the content will be the same, the system will.
**Konsti | matchicalcom** [01:37:04 - 01:37:17]: Be, but if we resend the notification, we should exchange in the consent the notification ID that the content owners has to.
**Konsti | matchicalcom** [01:37:17 - 01:37:21]: Okay, okay, the content always has the most recent notification.
**Pedro | matchicalcom** [01:37:21 - 01:37:23]: Okay, okay, okay.
**Pedro | matchicalcom** [01:37:23 - 01:37:32]: So and for what following consents the ones that are requested or granted, sorry, accepted.
**Pedro | matchicalcom** [01:37:39 - 01:37:43]: I have a question because that is important.
**Pedro | matchicalcom** [01:37:44 - 01:37:53]: The notification ID, the updating the notification ID on the consent table as applications on what I'm saying right now in the next thing.
**Pedro | matchicalcom** [01:37:53 - 01:37:57]: So imagine that you have a user and that is a question that I put here.
**Pedro | matchicalcom** [01:37:57 - 01:38:26]: I don't know in another car another notes in AUDC the following example the user receives consent note consent notification clicks, accepts the user afterwards after a couple of days use the same link or use another one, request another one and it doesn't have new roles.
**Pedro | matchicalcom** [01:38:26 - 01:38:27]: Just the same.
**Pedro | matchicalcom** [01:38:27 - 01:38:28]: The consultant rule.
**Pedro | matchicalcom** [01:38:28 - 01:38:31]: The system already have the consultant rule granted.
**Pedro | matchicalcom** [01:38:31 - 01:38:36]: Okay, right you're following me.
**Pedro | matchicalcom** [01:38:36 - 01:38:42]: Okay, and okay, so imagine then next says he clicks the link again or a new one.
**Pedro | matchicalcom** [01:38:42 - 01:38:44]: He requests and receives the email.
**Pedro | matchicalcom** [01:38:44 - 01:38:46]: It goes to the consent page and the consent page.
**Pedro | matchicalcom** [01:38:46 - 01:38:56]: The consent process will not create a new consent, because it doesn't have a new one to consent and we'll reload and you'll see on the consent page the one that.
**Pedro | matchicalcom** [01:38:56 - 01:38:56]: Is granted.
**Pedro | matchicalcom** [01:38:57 - 01:38:59]: Okay, and you'll have the option to revoke.
**Pedro | matchicalcom** [01:39:02 - 01:39:05]: Imagine that he revokes and revoke and the consent is evoke.
**Pedro | matchicalcom** [01:39:05 - 01:39:15]: So if again imagine the pars CV is made again for that user and if the consultancy user finishes the process.
**Pedro | matchicalcom** [01:39:15 - 01:39:18]: Saved the process and trigger the consent.
**Pedro | matchicalcom** [01:39:18 - 01:39:28]: What should the system do should create a new consent because that one was declined, Revoked, decline or revoked is the same?
**Konsti | matchicalcom** [01:39:28 - 01:39:28]: No.
**Konsti | matchicalcom** [01:39:28 - 01:39:34]: When this, when a new CV gets parsed and a new consultant gets created, right?
**Pedro | matchicalcom** [01:39:36 - 01:39:39]: No one that is already existing so.
**Konsti | matchicalcom** [01:39:40 - 01:39:42]: Me, if there's just a new CV.
**Pedro | matchicalcom** [01:39:44 - 01:39:46]: I declined the concerns.
**Pedro | matchicalcom** [01:39:46 - 01:39:49]: Okay, and now you pass again, just.
**Konsti | matchicalcom** [01:39:49 - 01:39:51]: A new CV gets passed.
**Konsti | matchicalcom** [01:39:53 - 01:39:53]: Ah.
**Pedro | matchicalcom** [01:39:56 - 01:40:25]: My final, my objective is to know for example, when or is there any situation where a new consent consultant consent should be reissue a new one considering that you already have one on the system, because last year he declined and now, for some reason, after one year the trigger was set, was triggered for my user, but I already have a consultant Decline or revoked.
**Pedro | matchicalcom** [01:40:25 - 01:40:27]: Should the system create a new one or not?
**Pedro | matchicalcom** [01:40:28 - 01:40:31]: Or what is the rules for situations?
**Konsti | matchicalcom** [01:40:31 - 01:40:34]: Yes, yes, yes or yes, yes.
**Konsti | matchicalcom** [01:40:34 - 01:40:39]: It should should create, it should create.
**Konsti | matchicalcom** [01:40:39 - 01:40:49]: Like whenever you, when you revoked and we resend it to you, you, we should create a new one because we need to keep track of the information that we correct, correct, right, correct.
**Pedro | matchicalcom** [01:40:49 - 01:41:05]: But my concern is if this process occurs, imagine one week after decline or evoke, I can find strange why I'm receiving a new consent because last year I just revoked it.
**Pedro | matchicalcom** [01:41:07 - 01:41:08]: So you can see the issue here.
**Konsti | matchicalcom** [01:41:10 - 01:41:11]: Why should this happen?
**Konsti | matchicalcom** [01:41:11 - 01:41:14]: Why should we send you a new request if you already revoked?
**Pedro | matchicalcom** [01:41:17 - 01:41:22]: Because in some process of application the trigger was no, no, no, no, no.
**Konsti | matchicalcom** [01:41:22 - 01:41:42]: This one we need to ensure in terms of business rules that like when you revoked, we are not going to ask you again except, okay, user I as the recruiter, go into your profile and specifically click on data privacy and specifically click on resend it.
**Konsti | matchicalcom** [01:41:42 - 01:41:45]: I see that you revoke and I say, okay, maybe I talked to you you mentioned.
**Konsti | matchicalcom** [01:41:45 - 01:41:51]: Ah, yeah, okay, now I will do it, send it to me once more and then I resend and then we reissue a new concept.
**Pedro | matchicalcom** [01:41:51 - 01:41:59]: Okay, that's the only case only on that case, okay, so that is kind of manually, that is important, I need to know that.
**Pedro | matchicalcom** [01:41:59 - 01:42:03]: So I have to put an input or something like that.
**Pedro | matchicalcom** [01:42:03 - 01:42:05]: To know that is a request.
**Pedro | matchicalcom** [01:42:06 - 01:42:18]: The trigger that trigger the trigger of the consent left to have an information saying, okay, Ignore what previously on the system.
**Pedro | matchicalcom** [01:42:18 - 01:42:22]: If it has already one that is decline or evoked, you will create a new one.
**Konsti | matchicalcom** [01:42:24 - 01:42:26]: What you can also do is like where you do.
**Konsti | matchicalcom** [01:42:26 - 01:42:28]: Can you go one action back, please.
**Pedro | matchicalcom** [01:42:29 - 01:42:31]: Sorry, back.
**Konsti | matchicalcom** [01:42:33 - 01:42:35]: There where you're finding the consent.
**Konsti | matchicalcom** [01:42:37 - 01:42:55]: Yeah, there in this index where you look for the consent in this one here you could look for the condition also that the status of this consent needs to be like kind of open or whatever open?
**Pedro | matchicalcom** [01:42:56 - 01:43:00]: No, you have requested, decline, accepted, revoked.
**Konsti | matchicalcom** [01:43:00 - 01:43:16]: Or partner decline In this case, when it's requested or accepted, basically it has to be not declined If it's declined, then you need to create new one, but in the other cases you don't create a new one.
**Pedro | matchicalcom** [01:43:16 - 01:43:17]: Yeah, okay.
**Konsti | matchicalcom** [01:43:19 - 01:43:22]: Or maybe, if there's archived, I don't know.
**Pedro | matchicalcom** [01:43:25 - 01:43:43]: But even though I think it should be helpful, for example in the input of the create to know if I can do on that particular case, because the trigger where are we going to trigger this?
**Pedro | matchicalcom** [01:43:43 - 01:43:50]: Upon saving a parse review or manually the consultancy user will click on.
**Pedro | matchicalcom** [01:43:50 - 01:43:51]: That link right?
**Pedro | matchicalcom** [01:43:54 - 01:43:57]: But my CV can be parsed.
**Konsti | matchicalcom** [01:43:59 - 01:43:59]: Several.
**Pedro | matchicalcom** [01:43:59 - 01:44:03]: Times, so that trigger will be right.
**Konsti | matchicalcom** [01:44:03 - 01:44:15]: No, no, your CV is like when your CV is parsed several times, Do you mean like you just send a new CV to us for what?
**Konsti | matchicalcom** [01:44:15 - 01:44:15]: Yes, right?
**Konsti | matchicalcom** [01:44:15 - 01:44:16]: For example, yeah.
**Konsti | matchicalcom** [01:44:16 - 01:44:26]: But in this case we will show you how we have Pedro already in the database and then you merge it and then we merge it into a consultant into an excellent user where we know we have already the consent.
**Pedro | matchicalcom** [01:44:26 - 01:44:32]: Okay, doesn't go through those review process flows the parts review flows.
**Pedro | matchicalcom** [01:44:32 - 01:44:33]: No, no, okay, no, no.
**Konsti | matchicalcom** [01:44:33 - 01:44:38]: If it's a reparting and you say it's just merge it, then it's just merging these together.
**Pedro | matchicalcom** [01:44:38 - 01:44:40]: Okay, So that is easier.
**Pedro | matchicalcom** [01:44:40 - 01:44:53]: I don't need so that extra information and go with for example the idea that you were saying saying that you, if in this case, if i here on this list filter can put here.
**Pedro | matchicalcom** [01:44:53 - 01:44:54]: Okay?
**Pedro | matchicalcom** [01:44:54 - 01:45:08]: And if it is denied or revoked or something like that you can create in that case, because that was a second secondary action.
**Pedro | matchicalcom** [01:45:08 - 01:45:23]: So mainly the consultancy users just went to the data privacy user and click on resend and trigger this process and this process goes through here.
**Pedro | matchicalcom** [01:45:23 - 01:45:30]: See that the consent was denied in the past, but it will bypass it and create a new one.
**Pedro | matchicalcom** [01:45:32 - 01:45:35]: Okay, makes sense, Or we need to revisit.
**Konsti | matchicalcom** [01:45:35 - 01:45:36]: I was just considering like.
**Konsti | matchicalcom** [01:45:36 - 01:45:37]: Yeah.
**Konsti | matchicalcom** [01:45:39 - 01:45:47]: Only in the denied case, only in the denial case you need to denied or evoke.
**Konsti | matchicalcom** [01:45:48 - 01:45:56]: Only if it was revoked or denied, then you need to create a new one, otherwise you don't need to create a new one.
**Pedro | matchicalcom** [01:45:58 - 01:46:05]: Okay, And also, okay, let me just write these things to review.
**Konsti | matchicalcom** [01:46:13 - 01:46:18]: Or like what What speaks against always creating new consent.
**Pedro | matchicalcom** [01:46:20 - 01:46:21]: What?
**Konsti | matchicalcom** [01:46:21 - 01:46:25]: Sorry what speaks against always creating a new consent?
**Konsti | matchicalcom** [01:46:28 - 01:46:33]: Then we see that this was consent that was requested, but you never reply to it.
**Konsti | matchicalcom** [01:46:34 - 01:46:39]: So we have just these new contents and they are requested, but you never reply to them.
**Pedro | matchicalcom** [01:46:40 - 01:46:45]: But do you want to keep track of those every time again?
**Pedro | matchicalcom** [01:46:45 - 01:46:49]: We need to look at how the behavior would be.
**Pedro | matchicalcom** [01:46:49 - 01:47:00]: But should we have several requests allow a situation when you could have several requests for consents and would you want to track them those?
**Konsti | matchicalcom** [01:47:03 - 01:47:18]: Yes, actually, because when we also consider the reminders like we ask you three times and like he did not I as a I, as a recruiter for example, want to see ah, it was requested there, there and there and he did not respond basically never.
**Konsti | matchicalcom** [01:47:18 - 01:47:21]: Even though I had like four consent requests.
**Pedro | matchicalcom** [01:47:24 - 01:47:25]: I don't know.
**Pedro | matchicalcom** [01:47:26 - 01:47:30]: Don't you have that for that you should have the notification right?
**Pedro | matchicalcom** [01:47:30 - 01:47:32]: Because the notification is always sent.
**Pedro | matchicalcom** [01:47:33 - 01:47:33]: I don't know.
**Pedro | matchicalcom** [01:47:33 - 01:47:36]: If makes sense to fill in it.
**Konsti | matchicalcom** [01:47:36 - 01:47:37]: Makes sense, it makes sense.
**Konsti | matchicalcom** [01:47:38 - 01:47:42]: But if we do it like that, if we do it like that.
**Konsti | matchicalcom** [01:47:43 - 01:47:45]: If we say because this could change the lot.
**Konsti | matchicalcom** [01:47:45 - 01:47:53]: If we say OK, it's just like we sent the notification and the notification is from the category consent request right?
**Konsti | matchicalcom** [01:47:53 - 01:48:01]: Then we can just use this notification as our log, but we also need to store like what kind of content version we did send.
**Konsti | matchicalcom** [01:48:01 - 01:48:07]: To you so this we cannot store in the notification, this is content specific right?
**Konsti | matchicalcom** [01:48:07 - 01:48:12]: What template version was it that's in the notification that's in the content right, right, right.
**Konsti | matchicalcom** [01:48:12 - 01:48:31]: Otherwise we could also say we only created content when you are actively clicking, but I think we should use it for requested and the notification is not meant for what notifications were actually sent, but the notification is more meant for our internal logging of notifications.
**Konsti | matchicalcom** [01:48:32 - 01:48:38]: But I think you should treat this entity as the consent request makes it much.
**Konsti | matchicalcom** [01:48:38 - 01:48:40]: Easier for you and we have full traceability.
**Pedro | matchicalcom** [01:48:42 - 01:48:43]: Okay?
**Pedro | matchicalcom** [01:48:43 - 01:49:00]: So in this case, every time I enter early, if it has is associated to a partner role, sorry, as to a consultant role, and if it doesn't have the consultant role approved accepted on the table, you should create a new one.
**Pedro | matchicalcom** [01:49:00 - 01:49:14]: So if it doesn't have any, or if it is exist and it is revoked or decline, it should create a new one every time he enters on the process.
**Pedro | matchicalcom** [01:49:16 - 01:49:29]: So Mike, if you, if you say that this doesn't happen often, because I don't know imagine that for some reasons it's triggered several times.
**Pedro | matchicalcom** [01:49:29 - 01:49:32]: So if we open the, let me.
**Konsti | matchicalcom** [01:49:32 - 01:49:33]: Explain you the triggers.
**Konsti | matchicalcom** [01:49:33 - 01:49:34]: Let me explain you the triggers.
**Konsti | matchicalcom** [01:49:34 - 01:49:36]: There are just a few triggers.
**Konsti | matchicalcom** [01:49:36 - 01:49:44]: One trigger is upon your initial creation there the recruiter or the user clicks through the pop up for example.
**Konsti | matchicalcom** [01:49:44 - 01:49:50]: And then there's a trigger for okay, now it gets sent so after creation, as soon as the recruiter clicks through it.
**Konsti | matchicalcom** [01:49:50 - 01:49:51]: The person that's one trigger.
**Konsti | matchicalcom** [01:49:52 - 01:49:59]: Another trigger is if you're not responding to this one it was requested and you don't respond at any time.
**Konsti | matchicalcom** [01:50:01 - 01:50:04]: And then there's close to your deletion date and we have.
**Konsti | matchicalcom** [01:50:04 - 01:50:05]: These reminders.
**Konsti | matchicalcom** [01:50:05 - 01:50:07]: Like each of the reminders is a new trigger.
**Konsti | matchicalcom** [01:50:07 - 01:50:33]: So we have maybe three more consents and we have four requests in total the initial one and three reminders is four and the only other trigger is I as a user go into your profile and click specifically manually resended so at maximum there are like four per default, if you have all reminders activated and as many as you click the button basically.
**Pedro | matchicalcom** [01:50:35 - 01:50:44]: Okay, So that is important information as well, so that part of the check of the expiration, right?
**Pedro | matchicalcom** [01:50:44 - 01:50:46]: You're saying that we have three.
**Pedro | matchicalcom** [01:50:48 - 01:50:52]: I don't know what it's called, but that is on general settings, right?
**Pedro | matchicalcom** [01:50:54 - 01:50:59]: That will trigger process that sends a reminder, right?
**Pedro | matchicalcom** [01:50:59 - 01:51:00]: It's really reminder.
**Pedro | matchicalcom** [01:51:00 - 01:51:03]: So every reminder should also create a.
**Konsti | matchicalcom** [01:51:03 - 01:51:09]: New one that we have the traceability because it's rather like maybe even a consent.
**Konsti | matchicalcom** [01:51:09 - 01:51:19]: That's why I mentioned maybe we should rename this entity to consent request, because it's rather a request for consent and you could react to it with.
**Konsti | matchicalcom** [01:51:19 - 01:51:26]: Like not reacting at all approving the request or accepting the request or declining.
**Pedro | matchicalcom** [01:51:26 - 01:51:26]: It.
**Konsti | matchicalcom** [01:51:29 - 01:51:31]: But we can still leave it as.
**Pedro | matchicalcom** [01:51:33 - 01:51:35]: Okay, But that's just a name right.
**Konsti | matchicalcom** [01:51:35 - 01:51:36]: As a consent request.
**Pedro | matchicalcom** [01:51:37 - 01:51:42]: Yeah, just consent request and it's acceptable or not, but, okay, that's just a name, right?
**Pedro | matchicalcom** [01:51:43 - 01:51:45]: The idea is a request consent, right?
**Pedro | matchicalcom** [01:51:45 - 01:51:57]: But we keep track of just the deconsent It's just a consent, but beneath it is also a request because the person, the user has to accept it.
**Pedro | matchicalcom** [01:51:57 - 01:52:01]: Just decide whatever he wants to do with that consent, okay?
**Pedro | matchicalcom** [01:52:01 - 01:52:07]: But just try to figure out what should be we do?
**Pedro | matchicalcom** [01:52:07 - 01:52:10]: Namely do you want to create?
**Pedro | matchicalcom** [01:52:10 - 01:52:16]: Every time it is triggered, it's called create a new one and the system will collect.
**Pedro | matchicalcom** [01:52:16 - 01:52:21]: So if it grabs the link goes to the consent page, it will show only the last one.
**Pedro | matchicalcom** [01:52:21 - 01:52:23]: It doesn't make sense to yes, that's important.
**Konsti | matchicalcom** [01:52:23 - 01:52:30]: When you have the page, We only show you the ones that are relevant for you and only the most recent ones.
**Pedro | matchicalcom** [01:52:31 - 01:52:32]: Yeah.
**Pedro | matchicalcom** [01:52:33 - 01:52:35]: But for now that was what was implemented.
**Konsti | matchicalcom** [01:52:37 - 01:52:39]: Imagine the following use case.
**Konsti | matchicalcom** [01:52:40 - 01:52:42]: We are in version template version number four.
**Konsti | matchicalcom** [01:52:43 - 01:52:53]: When we create you, we send you the request, you don't accept it and then we switch the version and now we are at version seven, and when the first reminder comes, we are at version seven.
**Konsti | matchicalcom** [01:52:53 - 01:53:06]: So it's ah, we did send you version four, You said like fuck off, I don't approve this like no one is going to read it, but doesn't matter, but and then the next one is of version seven, so I think it makes sense.
**Konsti | matchicalcom** [01:53:06 - 01:53:10]: Also otherwise you need to update the versions we use in the traceability.
**Konsti | matchicalcom** [01:53:10 - 01:53:24]: We don't know what we send you and we don't want to put all this information in the notification, because the notification is something that's purely meant for notifications and not for business logic of certain things, like content requests, right?
**Konsti | matchicalcom** [01:53:25 - 01:53:34]: So as you mentioned, it's just a word consent or consent request, but just for you as your for your mental model, Treat this really as a consent request, right?
**Pedro | matchicalcom** [01:53:34 - 01:53:35]: Okay, okay.
**Pedro | matchicalcom** [01:53:37 - 01:53:44]: So what I need to do in terms a little bit workout in terms of the consent page when you sorry.
**Konsti | matchicalcom** [01:53:44 - 01:53:55]: Pedro, that's by the way, because of this, if you go to the data model once more, now to the very big one, please to the to the very big one, yes.
**Konsti | matchicalcom** [01:53:55 - 01:54:07]: And if you look to the external user, scroll down, little, yeah, you always think you're not there, but you just need to say happens to me all the time.
**Konsti | matchicalcom** [01:54:07 - 01:54:20]: And on the right, where the exon user is, stop, stop at the top, no, no, no, not so far, not so far, a little bit more left, like in the first third, yeah, a little bit more left and now a little bit top.
**Konsti | matchicalcom** [01:54:22 - 01:54:34]: Okay, there we have it at the top more above, above, above, there, there he is like if you look at the external user here, I'll scroll down again here on the left you see, yeah, yeah.
**Konsti | matchicalcom** [01:54:37 - 01:54:40]: And if you go a little bit left, that's why?
**Konsti | matchicalcom** [01:54:40 - 01:54:54]: When you look in the data privacy extension at the top, that's why I also stored here, the boolean has active consent so that we can always just look for.
**Konsti | matchicalcom** [01:54:54 - 01:54:55]: Does he have something?
**Konsti | matchicalcom** [01:54:56 - 01:55:02]: It's redundant, I know, but I was already aware that we will probably have several consents and they could be in the past.
**Konsti | matchicalcom** [01:55:02 - 01:55:04]: And now you revoked something.
**Konsti | matchicalcom** [01:55:04 - 01:55:09]: So we always need to keep track of what was the latest thing you.
**Pedro | matchicalcom** [01:55:09 - 01:55:13]: Did these flag is used for the shield right?
**Pedro | matchicalcom** [01:55:13 - 01:55:14]: If it is or not?
**Pedro | matchicalcom** [01:55:15 - 01:55:19]: Okay, and that is, but this changes for example, if it has.
**Pedro | matchicalcom** [01:55:20 - 01:55:30]: Imagine assuming that you have, but this is only true if it is a sector, the consent right, That's true.
**Pedro | matchicalcom** [01:55:30 - 01:55:32]: This is true right?
**Pedro | matchicalcom** [01:55:32 - 01:55:45]: Okay, But if the case, if it has, I know now I'm just imagining now you have several roles to consent, you can accept one and decline the other.
**Konsti | matchicalcom** [01:55:46 - 01:55:51]: Yeah, maybe then we either need to introduce three booleans for the three different roads.
**Konsti | matchicalcom** [01:55:54 - 01:55:55]: I don't know.
**Pedro | matchicalcom** [01:55:57 - 01:56:11]: But that's that the screen when you show the flag, the shield with a collar, we can have a wrapper in terms of server action that gives you.
**Pedro | matchicalcom** [01:56:11 - 01:56:13]: The caller based on what have the information?
**Pedro | matchicalcom** [01:56:13 - 01:56:19]: And you can just cross the information of what should have and what to store it there.
**Konsti | matchicalcom** [01:56:19 - 01:56:22]: We can also always query this information out from the content.
**Konsti | matchicalcom** [01:56:22 - 01:56:27]: We could look for your most recent contents for each role and just check the status.
**Pedro | matchicalcom** [01:56:27 - 01:56:29]: Yes, yes, this is a request.
**Pedro | matchicalcom** [01:56:29 - 01:56:30]: It's the same action, or.
**Konsti | matchicalcom** [01:56:34 - 01:56:40]: Just as you know like these consents are actually kind of consent requests and we.
**Konsti | matchicalcom** [01:56:40 - 01:56:41]: Can have multiple of them.
**Konsti | matchicalcom** [01:56:41 - 01:56:44]: So I think consent is really not the right name anymore.
**Konsti | matchicalcom** [01:56:44 - 01:56:47]: Now that I think about it, it should rather be the consent request.
**Pedro | matchicalcom** [01:56:48 - 01:56:49]: Yeah.
**Pedro | matchicalcom** [01:56:49 - 01:56:54]: But you need to change the name otherwise the table shouldn't do that.
**Konsti | matchicalcom** [01:56:55 - 01:56:58]: No, no, no, it's not in production use.
**Konsti | matchicalcom** [01:56:58 - 01:57:01]: We never use you don't have, Ah, right, right.
**Konsti | matchicalcom** [01:57:01 - 01:57:03]: I can easily rename it.
**Pedro | matchicalcom** [01:57:03 - 01:57:07]: Okay, I will change it so it can be more meaningful.
**Konsti | matchicalcom** [01:57:08 - 01:57:10]: Yeah, I think it's helpful in terms.
**Pedro | matchicalcom** [01:57:10 - 01:57:14]: Of mental model I will name it.
**Pedro | matchicalcom** [01:57:14 - 01:57:15]: Consent request.
**Pedro | matchicalcom** [01:57:15 - 01:57:15]: OK?
**Konsti | matchicalcom** [01:57:16 - 01:57:16]: Yes.
**Konsti | matchicalcom** [01:57:18 - 01:57:21]: Any other questions or does this have you so far?
**Pedro | matchicalcom** [01:57:22 - 01:57:25]: No, no, I don't know.
**Pedro | matchicalcom** [01:57:25 - 01:57:26]: Let me shift.
**Konsti | matchicalcom** [01:57:26 - 01:57:41]: One thing that you definitely need to write into your logs, please is that you need to check when you You don't just need to check for the agency, but you also need to check whether the agency expiration date is still in the future or not.
**Konsti | matchicalcom** [01:57:41 - 01:57:43]: If it's in the past.
**Pedro | matchicalcom** [01:57:44 - 01:57:45]: Okay, let me go.
**Pedro | matchicalcom** [01:57:45 - 01:57:47]: Just put there good.
**Konsti | matchicalcom** [01:57:48 - 01:57:50]: For the agency expiration date.
**Konsti | matchicalcom** [01:57:50 - 01:57:53]: You need also to check and do you know what's also important?
**Pedro | matchicalcom** [01:57:56 - 01:57:56]: What?
**Konsti | matchicalcom** [01:57:58 - 01:58:04]: That's also something.
**Konsti | matchicalcom** [01:58:14 - 01:58:18]: One last thing that's also important, Pedro, is the following.
**Konsti | matchicalcom** [01:58:18 - 01:58:22]: Like you have to like just that you're aware.
**Konsti | matchicalcom** [01:58:22 - 01:58:24]: They are just actually two roles.
**Konsti | matchicalcom** [01:58:25 - 01:58:29]: Yeah, they're just two roles kind of, and the agency thing is just an addition.
**Konsti | matchicalcom** [01:58:30 - 01:58:48]: So you're either a freelancer or a partner consultant Okay, and both can be sent from an agency, so you can be a freelancer that was sent from the agency or you can be a partner consultant that can be.
**Konsti | matchicalcom** [01:58:48 - 01:58:49]: Sent from the agency.
**Konsti | matchicalcom** [01:58:50 - 01:59:00]: So in the freelancer case you also need to check that there's no agency company set or if the agency company is set, it already needs to be expired.
**Pedro | matchicalcom** [01:59:01 - 01:59:04]: Okay?
**Pedro | matchicalcom** [01:59:04 - 01:59:14]: So the expiration part is for this part on the top of agency and also for the freelance right and also for the partner.
**Konsti | matchicalcom** [01:59:16 - 01:59:19]: Yeah, Like the business, the business logic is the following.
**Konsti | matchicalcom** [01:59:19 - 01:59:26]: You are like you as a as a consultant are either a consultant working for a partner or a freelancer.
**Konsti | matchicalcom** [01:59:26 - 01:59:27]: Okay?
**Konsti | matchicalcom** [01:59:28 - 01:59:35]: When I'm working at a big company, a big consultancy and then there's an agency.
**Konsti | matchicalcom** [01:59:35 - 01:59:42]: Tommy is running an agency and Tommy is sending me your profile Pedro, yeah.
**Konsti | matchicalcom** [01:59:42 - 01:59:54]: And Tommy can send me Pedro and say Pedro is coming from twenty four seven, so he's a partner, but I'm sending it so he's a partner consultant coming from an agency.
**Konsti | matchicalcom** [01:59:54 - 02:00:02]: So you have the agency case except this was like five months ago and my agency expiration date is already gone.
**Pedro | matchicalcom** [02:00:03 - 02:00:04]: Okay?
**Konsti | matchicalcom** [02:00:04 - 02:00:06]: Then you are unlocked from the agency.
**Konsti | matchicalcom** [02:00:06 - 02:00:08]: The agency is just a locked and the same.
**Konsti | matchicalcom** [02:00:08 - 02:00:16]: Thing could be that Tommy's agency is sending me Nicholas and Nicholas is a freelancer, but he also has his agency blocking.
**Konsti | matchicalcom** [02:00:16 - 02:00:18]: So you always need to check for the agency case.
**Pedro | matchicalcom** [02:00:20 - 02:00:21]: Okay?
**Pedro | matchicalcom** [02:00:21 - 02:00:34]: So in this case, if I understood correctly I have to have another option as well saying that the company not this case, it's just here I need to see the expiration.
**Pedro | matchicalcom** [02:00:36 - 02:00:38]: In this case I need to.
**Pedro | matchicalcom** [02:00:39 - 02:00:43]: In this case I need to check the expiration data as well in the part of the agency.
**Konsti | matchicalcom** [02:00:44 - 02:00:50]: I would not do three ors because I would do just one or I would first check.
**Konsti | matchicalcom** [02:00:51 - 02:00:53]: Is this in Procra coming from an agency?
**Konsti | matchicalcom** [02:00:53 - 02:00:55]: And you can check this by.
**Konsti | matchicalcom** [02:00:55 - 02:00:57]: Does it has an agency company with an active.
**Konsti | matchicalcom** [02:00:57 - 02:00:58]: Expiration?
**Konsti | matchicalcom** [02:00:58 - 02:01:03]: And if this is the case and the consultancy setting for agencies.
**Konsti | matchicalcom** [02:01:03 - 02:01:11]: Is true, then you know, okay, it's case number one and then you don't need to check the other cases anymore, because you have an active agency thing.
**Pedro | matchicalcom** [02:01:14 - 02:01:19]: But in those two last cases I have to distinguish between partner and client.
**Pedro | matchicalcom** [02:01:19 - 02:01:28]: So I should use as well the what I'm doing the solo company or I will use that.
**Pedro | matchicalcom** [02:01:28 - 02:01:31]: I use that, yeah, I use that idea, thank you.
**Konsti | matchicalcom** [02:01:31 - 02:01:37]: But even though I realized like it can be false, because just you turned off the settings.
**Pedro | matchicalcom** [02:01:41 - 02:01:43]: Settings four, sorry.
**Konsti | matchicalcom** [02:01:46 - 02:01:48]: There'S like agency settings, right?
**Konsti | matchicalcom** [02:01:49 - 02:01:52]: It will not one hundred percent work like do your best.
**Pedro | matchicalcom** [02:01:54 - 02:01:56]: From what explain?
**Pedro | matchicalcom** [02:01:56 - 02:01:57]: Let me know I will review it.
**Pedro | matchicalcom** [02:01:57 - 02:01:58]: Yeah, yeah, yeah, yeah.
**Pedro | matchicalcom** [02:01:59 - 02:02:01]: That's why my idea was.
**Pedro | matchicalcom** [02:02:01 - 02:02:07]: So I use what you explain me and put here the conditions and after I completed I just I will ping you.
**Pedro | matchicalcom** [02:02:07 - 02:02:10]: I'll send you a message for you to review it.
**Konsti | matchicalcom** [02:02:10 - 02:02:15]: All right, Okay, perfect.
**Pedro | matchicalcom** [02:02:15 - 02:02:15]: Thank you.
**Pedro | matchicalcom** [02:02:15 - 02:02:16]: Thank you.
**Pedro | matchicalcom** [02:02:16 - 02:02:25]: And Monday we'll talk about because I have, I think other questions related to the process minor things just like this.
**Pedro | matchicalcom** [02:02:25 - 02:02:31]: The refining in terms of business rules and so we talk, we talked Monday.
**Pedro | matchicalcom** [02:02:31 - 02:02:33]: Okay, have a good weekend.
**Pedro | matchicalcom** [02:02:33 - 02:02:34]: Thank you for your time, Pedro.
**Konsti | matchicalcom** [02:02:34 - 02:02:35]: Thank you for time as well.
**Pedro | matchicalcom** [02:02:36 - 02:02:36]: Thank you.
**Pedro | matchicalcom** [02:02:36 - 02:02:37]: Goodbye.
**Konsti | matchicalcom** [02:02:37 - 02:02:38]: Almost half an hour, right?
**Pedro | matchicalcom** [02:02:39 - 02:02:42]: Almost almost half an hour, no, one hour more.
**Pedro | matchicalcom** [02:02:42 - 02:02:45]: One on, I think yeah.
**Pedro | matchicalcom** [02:02:45 - 02:02:45]: Almost done.
**Pedro | matchicalcom** [02:02:46 - 02:02:47]: See you, bye.
