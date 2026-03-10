# Alignment freelancermap.de interface (Clone)

**Tommy | matchicalcom** [00:05 - 00:06]: Good morning, guys.
**Tommy | matchicalcom** [00:06 - 00:11]: So first surprise, well, good morning.
**Tommy | matchicalcom** [00:12 - 00:17]: Is it okay that so I brought Carlos to the meeting.
**Tommy | matchicalcom** [00:17 - 00:23]: Is it okay to proceed in English for everyone or otherwise?
**Tommy | matchicalcom** [00:23 - 00:26]: I can also translate to colors.
**Tommy | matchicalcom** [00:26 - 00:31]: So otherwise we can try to speak in Portuguese Magnus and Michi.
**Tommy | matchicalcom** [00:31 - 00:37]: But I think it's I can only say palm dia boish boys Dubai.
**Tommy | matchicalcom** [00:38 - 00:41]: That's my whole Portuguese so far.
**Magnus Gernlein** [00:41 - 00:42]: Let's continue.
**Carlos | matchicalcom** [00:43 - 00:45]: My Germany is not buried, Tommy.
**Carlos | matchicalcom** [00:45 - 00:46]: So it is what it is.
**Tommy | matchicalcom** [00:46 - 00:50]: I think I think you can say guten Morgen.
**Carlos | matchicalcom** [00:52 - 00:56]: I know a lot of football players, okay?
**Carlos | matchicalcom** [00:56 - 01:00]: For example for the German national team or something like that.
**Carlos | matchicalcom** [01:00 - 01:05]: So yeah, that would be easier easy way to know some words in Germany.
**Tommy | matchicalcom** [01:09 - 01:14]: So yeah, so I invited, so I have to start over Michi.
**Tommy | matchicalcom** [01:16 - 01:19]: Why who is why where in the meeting?
**Tommy | matchicalcom** [01:19 - 02:02]: So we decided from our side just to bring Carlos also in into this topic, because we realized that I'm a little bit the bottleneck as always and colors brings a lot of experience in the whole world of application development and I would really say our query fa regarding architecture and all this stuff and he will care about that integration as well, but I will bring in my expertise at the beginning that we have a smooth integration, but if it's once running, it will run.
**Tommy | matchicalcom** [02:02 - 02:16]: I think there is not so much we have to see and that's why I brought Carlos in the meeting that he can also see what we are going to plan in the end and he has the whole Carlos.
**Tommy | matchicalcom** [02:16 - 02:21]: You have the background information you need so far or what we'd like to do.
**Carlos | matchicalcom** [02:22 - 02:24]: Correct, correct, yeah, I'm good.
**Carlos | matchicalcom** [02:25 - 02:40]: We did that small onboarding the other day and I think I understand the process curious to see where we are at and when we start implementation, because just talking about these things is good, but we want to see code and just make the systems work.
**Carlos | matchicalcom** [02:40 - 02:42]: So let's go.
**Michael Fossler** [02:45 - 02:50]: I think I will share my screen and show you the requests that would be great.
**Tommy | matchicalcom** [02:52 - 02:55]: So only one difference Colors.
**Tommy | matchicalcom** [02:56 - 03:00]: We have on the posting site an XML feed in the end.
**Tommy | matchicalcom** [03:00 - 03:10]: We have to create and provide only a page where we exactly where we okay, but now it's okay.
**Tommy | matchicalcom** [03:11 - 03:12]: Yeah, nice.
**Michael Fossler** [03:12 - 03:13]: Can you see my screen?
**Michael Fossler** [03:13 - 03:19]: Yeah, for sure, okay, so these are my example requests.
**Michael Fossler** [03:19 - 03:48]: So status request would look like this tenant ID, your ID, your project ID, our project ID and this that was created, operated, deleted and if an error occurred there, I error message and an application request looked like this Our QID tenant ID, user ID, first name, last name and phone number, some profile data.
**Michael Fossler** [03:49 - 03:58]: I Don't know what data do you need profile ID, title, hourly rate, daily rate, currency.
**Tommy | matchicalcom** [04:00 - 04:07]: The most important thing is so does the user overhand?
**Tommy | matchicalcom** [04:07 - 04:13]: Yeah, they overhand some documents as well or they're interesting for us.
**Tommy | matchicalcom** [04:13 - 04:16]: Is this this profile URL or is it ah, here are the files.
**Tommy | matchicalcom** [04:16 - 04:18]: Pardon, I was too far, I was too far.
**Michael Fossler** [04:20 - 04:26]: There was a message and the user should put it and files so the User can attach profile, attachments or upload.
**Michael Fossler** [04:26 - 04:30]: New files so I will send you file name, data and the MIME type.
**Tommy | matchicalcom** [04:32 - 04:37]: And the data will be sent via base sixty four or what we'd like.
**Michael Fossler** [04:37 - 04:40]: To Yes, base sixty four I called it.
**Tommy | matchicalcom** [04:41 - 04:49]: OK OK I think easy R okay.
**Michael Fossler** [04:50 - 04:53]: That'S easy to do, we can talk about it.
**Michael Fossler** [04:53 - 04:54]: It's easy to extend.
**Carlos | matchicalcom** [04:58 - 05:00]: Depending on the size of the files.
**Carlos | matchicalcom** [05:00 - 05:11]: We might have some limitations on our site in terms of no because of the total web request cannot go over four megabytes.
**Carlos | matchicalcom** [05:11 - 05:13]: I think on the current platform.
**Carlos | matchicalcom** [05:14 - 05:22]: So probably if you could send a link and we could fetch the file afterwards, would probably be EAS in terms of integration.
**Carlos | matchicalcom** [05:22 - 05:25]: If that's okay for you guys file.
**Michael Fossler** [05:25 - 05:26]: Name and.
**Tommy | matchicalcom** [05:28 - 05:29]: Yep.
**Michael Fossler** [05:34 - 05:36]: Yes, that would be.
**Carlos | matchicalcom** [05:36 - 05:39]: Possible, okay, that's safer If you have.
**Tommy | matchicalcom** [05:39 - 05:44]: Something like that, otherwise you can also so I did it with Constikalos the last few days.
**Tommy | matchicalcom** [05:46 - 05:49]: He provided me a pre-send URL from our AWS.
**Tommy | matchicalcom** [05:49 - 05:52]: And then we upload it there.
**Tommy | matchicalcom** [05:52 - 05:53]: So it would also be possible.
**Tommy | matchicalcom** [05:53 - 05:54]: Michi.
**Tommy | matchicalcom** [05:54 - 06:01]: But if you can provide download path for us, it's easier for us.
**Tommy | matchicalcom** [06:01 - 06:08]: If it's complicated for you just tell us then you can request only a present URL and we can tell you.
**Tommy | matchicalcom** [06:08 - 06:13]: Okay, please upload the files to that path and we catch it from there.
**Tommy | matchicalcom** [06:13 - 06:27]: But if you can provide, yeah, that would provide, okay, okay, okay, so okay, seems does that request?
**Tommy | matchicalcom** [06:27 - 06:30]: Yeah, pardon, yeah, just small questions.
**Michael Fossler** [06:31 - 06:40]: Our update system is very simple though we have two types We can update our project, but we do not check if there are changes.
**Michael Fossler** [06:42 - 06:48]: So do you need the updated status request or is this?
**Michael Fossler** [06:48 - 07:01]: OK, if we send you only the created because if we configure us updated every hour, every project will be updated regarding changes.
**Tommy | matchicalcom** [07:01 - 07:11]: So now we are talking on the just to be clear We are talking about the we are talking about the.
**Michael Fossler** [07:11 - 07:16]: Projects are yes, the status request If you import our update a project.
**Tommy | matchicalcom** [07:19 - 07:22]: What we get back from your okay, okay.
**Michael Fossler** [07:22 - 07:33]: Okay, Don't think that's updated is useful for you because we do not track any changes if we set update We will update it and yes, but we.
**Tommy | matchicalcom** [07:33 - 07:44]: Don'T track what's going to be updated, but you will update or if we, if we, if we, so we have create, update, delete or this free flags.
**Tommy | matchicalcom** [07:44 - 07:46]: What we will overhand in the XMLR.
**Michael Fossler** [07:48 - 07:55]: But if we run every hour the importer, you will receive every hour for all project the updated notification.
**Tommy | matchicalcom** [07:56 - 07:58]: Okay, okay, okay, okay.
**Michael Fossler** [08:00 - 08:01]: I don't think.
**Michael Fossler** [08:01 - 08:02]: If you need it, we can send it.
**Tommy | matchicalcom** [08:02 - 08:06]: It's no problem, but yes, do we need that?
**Tommy | matchicalcom** [08:06 - 08:19]: So Carlos, the thing is, we have the application, we have the demands or the jobs we want to post or create or even delete.
**Tommy | matchicalcom** [08:19 - 08:27]: Then we save it at our system and once an hour, or?
**Tommy | matchicalcom** [08:27 - 08:31]: Yeah, I think we will do it every hour.
**Tommy | matchicalcom** [08:32 - 08:38]: Michi will grab the XML proceed the XML error in the end.
**Tommy | matchicalcom** [08:38 - 08:44]: And will post back everything in the status app that like.
**Tommy | matchicalcom** [08:44 - 08:50]: A webhook in the end for every job what he's stating is.
**Tommy | matchicalcom** [08:51 - 08:55]: Every job will be updated and has this updated flag.
**Tommy | matchicalcom** [08:55 - 09:04]: So we should only know or if it's new created or if it's deleted, the other things aren't.
**Tommy | matchicalcom** [09:06 - 09:13]: Can we get back if it's created or deleted or do you have only the flag updated in your system?
**Michael Fossler** [09:13 - 09:17]: Michi, I can send you create it or delete it.
**Michael Fossler** [09:17 - 09:18]: That's no problem.
**Tommy | matchicalcom** [09:20 - 09:22]: I think that's important.
**Tommy | matchicalcom** [09:22 - 09:26]: The other thing is or you can send everything.
**Tommy | matchicalcom** [09:26 - 09:30]: No, it's easier for you send every hour everything.
**Michael Fossler** [09:31 - 09:32]: How do you like it?
**Carlos | matchicalcom** [09:34 - 09:35]: How many are we talking about?
**Carlos | matchicalcom** [09:35 - 09:39]: So are we going to have some load issue with the size.
**Carlos | matchicalcom** [09:39 - 09:42]: Of the number of projects or don't.
**Tommy | matchicalcom** [09:42 - 09:45]: We expect to have a lot on per tenant?
**Tommy | matchicalcom** [09:45 - 09:46]: I would say that.
**Tommy | matchicalcom** [09:46 - 09:49]: Can Magnus say better, But I would say at.
**Tommy | matchicalcom** [09:49 - 09:53]: Maximum per tenant fifty to at.
**Tommy | matchicalcom** [09:53 - 09:54]: Maximum at.
**Tommy | matchicalcom** [09:54 - 09:58]: Maximum one hundred in barrel at.
**Tommy | matchicalcom** [09:58 - 09:58]: Maximum.
**Magnus Gernlein** [10:01 - 10:02]: Probably fewer.
**Michael Fossler** [10:03 - 10:06]: Probably you will receive fifty requests every hour.
**Michael Fossler** [10:07 - 10:07]: Per.
**Carlos | matchicalcom** [10:09 - 10:11]: Yeah, I think that's perfectly.
**Carlos | matchicalcom** [10:11 - 10:19]: Okay, And on our side we would double check if everything.
**Carlos | matchicalcom** [10:19 - 10:23]: So if the fields really change or not and we will update on our.
**Tommy | matchicalcom** [10:23 - 10:27]: Side, yeah, we will say, yeah, we have to handle that.
**Tommy | matchicalcom** [10:27 - 10:29]: We say what is.
**Tommy | matchicalcom** [10:29 - 10:38]: If Michi calls the URL on the get we decide what we will send.
**Tommy | matchicalcom** [10:39 - 10:42]: That's our logic stuff in the end, in the end of the day.
**Michael Fossler** [10:44 - 10:45]: For the response I will expect to say.
**Michael Fossler** [10:45 - 10:51]: Jason, the status, okay, if you send, okay, I will do not retry it.
**Michael Fossler** [10:51 - 10:53]: But if you do not send OK, I will retry the request.
**Tommy | matchicalcom** [10:54 - 11:00]: Okay, response will be two hundred, two hundred, okay.
**Michael Fossler** [11:02 - 11:07]: Do we need a max retry or is real system stable enough.
**Tommy | matchicalcom** [11:09 - 11:10]: Actually.
**Michael Fossler** [11:13 - 11:13]: Everything.
**Carlos | matchicalcom** [11:13 - 11:18]: Can possible, everything can break someday, right?
**Carlos | matchicalcom** [11:18 - 11:27]: But yeah, we should be okay to receive these requests, yes, because we don't have the load is pretty much stable during business hours, so.
**Michael Fossler** [11:29 - 11:34]: If an error occur, I will retry it, should I try the infinity or.
**Carlos | matchicalcom** [11:38 - 11:50]: If we are going to sync every hour, I would maybe try once again, but the next hour we'll get information anyway, so I wouldn't see as a big problem to have to be to do in constant.
**Michael Fossler** [11:50 - 11:58]: Retries and for the applications application request.
**Tommy | matchicalcom** [11:58 - 12:26]: Yeah, they're important, yeah, so the applications will be, the applications will be a live web, so speak webhook in the end, because colors, if someone applies on the freelancer map side, we provide integrations API and Michi will directly send us this application, but that would be per application, right?
**Carlos | matchicalcom** [12:26 - 12:32]: So in the moment that you receive the application a couple seconds afterward we'll call our site on that one.
**Carlos | matchicalcom** [12:32 - 12:46]: I would do at least, if we have some error several retries because we need that information and it won't get on the on some kind of bulk, so I'll probably retry two three times and if.
**Carlos | matchicalcom** [12:46 - 12:54]: It fails, I would say send the email or we need to know somehow to understand what's going on, OK yeah.
**Tommy | matchicalcom** [12:54 - 13:01]: And will we, Carlos, we have to talk, but will we put this applications also in a queue?
**Tommy | matchicalcom** [13:01 - 13:11]: But if from our side, but if it's only one application, so the there can only be one application sent in the application request, you know what I mean?
**Tommy | matchicalcom** [13:11 - 13:26]: I don't know if we really have to do it in a queue, because we have only what we have to do is see if we can store this application and if the base sixty four is not broken, then in the end.
**Tommy | matchicalcom** [13:27 - 13:29]: So yeah, that's the only thing what really could happen.
**Tommy | matchicalcom** [13:29 - 13:45]: Or if the download doesn't work from our side, I think that's I think that's the most common issue I see at the moment, because first name, last name, what should happen email, but we have to see how to handle this.
**Tommy | matchicalcom** [13:45 - 13:48]: If it fails do, we have some.
**Michael Fossler** [13:48 - 13:53]: Validation on the phone number or email, that's some classic error.
**Michael Fossler** [13:54 - 14:03]: We are free, we don't have any validation so the user can enter free text, so if you have such things.
**Carlos | matchicalcom** [14:04 - 14:17]: But I don't think that we would fail all the integration, because even if the email comes blank or something, we'll save it, whatever you guys say and have some process on our side to try to clean it up afterwards.
**Carlos | matchicalcom** [14:17 - 14:21]: But we wouldn't interrupt the integration just because of that at least.
**Tommy | matchicalcom** [14:22 - 14:22]: Okay, exactly.
**Tommy | matchicalcom** [14:22 - 14:29]: I would also suggest that in that way, because otherwise things are getting complicated because then we are telling you, oh there is.
**Tommy | matchicalcom** [14:29 - 14:39]: And I'm also a big fan of don't restrict too much so, but yeah, we should be, we should be safe regarding injections and something like that.
**Tommy | matchicalcom** [14:39 - 14:44]: But if someone EnterS a false email address, yeah, so yeah, okay, it's false.
**Tommy | matchicalcom** [14:44 - 14:46]: What should we do in the end?
**Tommy | matchicalcom** [14:46 - 14:53]: So I think it's yeah, we will get them out of the document in the CV.
**Tommy | matchicalcom** [14:53 - 14:54]: And that's important.
**Tommy | matchicalcom** [14:55 - 15:01]: Can there be more documents or is there only one document per application?
**Tommy | matchicalcom** [15:01 - 15:03]: Magnus, do you know that?
**Tommy | matchicalcom** [15:03 - 15:04]: Or Michi?
**Magnus Gernlein** [15:04 - 15:06]: There can be more Michi.
**Tommy | matchicalcom** [15:08 - 15:10]: Okay, there can be more.
**Tommy | matchicalcom** [15:10 - 15:17]: But has the user to say which kind of document he is uploading on.
**Magnus Gernlein** [15:17 - 15:19]: The file type or Michi?
**Michael Fossler** [15:20 - 15:20]: Yes.
**Tommy | matchicalcom** [15:22 - 15:29]: This is my CV, this is my cover letter, this is so there's no.
**Magnus Gernlein** [15:29 - 15:33]: Okay, usually they only send a CV.
**Magnus Gernlein** [15:33 - 15:38]: That's the, that's the usual type of application.
**Magnus Gernlein** [15:39 - 15:41]: Could be more documents.
**Magnus Gernlein** [15:41 - 15:45]: It's rather rare, but it occurs.
**Tommy | matchicalcom** [15:49 - 15:50]: Tell us.
**Tommy | matchicalcom** [15:50 - 16:03]: Because then we have to think about how we put these things together from our side, because we only know we actually we only know one document per consultant in the end.
**Carlos | matchicalcom** [16:06 - 16:10]: I'm guessing that the bigger one with more pages will always be the CV.
**Carlos | matchicalcom** [16:11 - 16:13]: Maybe they have the presentation letter or something like.
**Tommy | matchicalcom** [16:13 - 16:14]: That.
**Carlos | matchicalcom** [16:14 - 16:22]: Should be simple, but we'll save so Tommy, Whatever they send us, we'll save it on the database and we need to figure out how to handle it.
**Carlos | matchicalcom** [16:24 - 16:27]: Probably most of the cases, what I'm hearing is only the CV.
**Carlos | matchicalcom** [16:28 - 16:28]: So would be.
**Carlos | matchicalcom** [16:28 - 16:33]: OK, if it comes with one more file, we can try to understand what.
**Tommy | matchicalcom** [16:33 - 16:34]: We do with it.
**Tommy | matchicalcom** [16:37 - 16:45]: We have to find it, we have to find it out and we have to talk to coms, because he can also do a pre check and say this is a CV, this is a cover letter.
**Tommy | matchicalcom** [16:45 - 16:54]: So what is usual cover letter, CV and a project list or something like that or more things.
**Tommy | matchicalcom** [16:56 - 16:58]: What's more in the end?
**Tommy | matchicalcom** [16:59 - 17:00]: In this things I don't know.
**Tommy | matchicalcom** [17:00 - 17:03]: Do you have idea Magnus on this side?
**Magnus Gernlein** [17:05 - 17:10]: I guess normally it's only the CV, but frankly speaking, I would have to check.
**Magnus Gernlein** [17:10 - 17:11]: I don't really know that.
**Tommy | matchicalcom** [17:12 - 17:21]: Yeah, it would be, I would also say ninety nine percent sent severe.
**Tommy | matchicalcom** [17:21 - 17:27]: They are normal people or even more than ninety percent.
**Magnus Gernlein** [17:27 - 17:33]: Or I would say there should also be no cover letter or something like.
**Magnus Gernlein** [17:33 - 17:37]: That, because the application is typed in directly and sent to you.
**Magnus Gernlein** [17:37 - 17:43]: There is no kind of written document attached like in a classic application.
**Tommy | matchicalcom** [17:46 - 17:55]: We can do that because we will check if only one if only one attachment we will see, okay, that must be the CV otherwise, yeah, it's strange.
**Tommy | matchicalcom** [17:55 - 18:01]: If R two just categorize them and see what's in there and get rid of this application letter.
**Tommy | matchicalcom** [18:01 - 18:14]: For example, if someone because no one will read that, no one will take care of that stuff, especially in the field of IIT freelancing, no one is reading that stuff.
**Tommy | matchicalcom** [18:14 - 18:21]: So I'm happy to apply because I'm the perfect back and deaf your four position no one really read it.
**Tommy | matchicalcom** [18:21 - 18:22]: Have you done that?
**Tommy | matchicalcom** [18:22 - 18:23]: How much?
**Tommy | matchicalcom** [18:23 - 18:25]: How often did you do that?
**Tommy | matchicalcom** [18:25 - 18:39]: Okay, but Michi, can you just quickly switch back to the JSON because I think that's the queue, the tenant, the user, the queue ID.
**Tommy | matchicalcom** [18:39 - 18:47]: Do we have what We will need just the queue ID?
**Tommy | matchicalcom** [18:48 - 18:57]: No, yeah, Because what we should try to Is the project ID or your project ID?
**Tommy | matchicalcom** [18:57 - 19:06]: Yeah, both would be great to have and do you have a freelancer?
**Tommy | matchicalcom** [19:07 - 19:09]: Is this your user ID?
**Tommy | matchicalcom** [19:09 - 19:11]: Is your user ID or in your system?
**Tommy | matchicalcom** [19:11 - 19:13]: Or what is this is your?
**Tommy | matchicalcom** [19:17 - 19:27]: Because what we'd like to achieve is if someone applies so we know, okay, this user d eight is applying from freelancer.
**Tommy | matchicalcom** [19:27 - 19:30]: We know that user that must be from freelancer map and this is.
**Tommy | matchicalcom** [19:30 - 19:42]: Your user in the end and we can really see and know, okay, this freelancer map user is really the same user, because we have the user ID and that must come from this account in the end.
**Tommy | matchicalcom** [19:42 - 19:43]: You know what I mean?
**Tommy | matchicalcom** [19:43 - 19:48]: Because otherwise they are trying to have same email addresses over.
**Tommy | matchicalcom** [19:48 - 19:51]: I know now you restricted it.
**Tommy | matchicalcom** [19:51 - 20:00]: But in the past it was possible to have it was it was possible to have multiple email addresses in your system.
**Magnus Gernlein** [20:02 - 20:03]: Emails weren't unique.
**Tommy | matchicalcom** [20:04 - 20:05]: Yeah, yeah, yeah, yeah, yeah.
**Tommy | matchicalcom** [20:05 - 20:09]: But you change, but now they are yeah, yeah, I read it.
**Tommy | matchicalcom** [20:09 - 20:16]: Magnus Manuel Manu Fisher from Do I understand the right way?
**Tommy | matchicalcom** [20:16 - 20:33]: And I was, yeah, yeah, I will talk to Magnus if we meet again and and tell him that everything's fine, okay, But I think Carlos do you see anything we need more I think that if we get that that will be.
**Carlos | matchicalcom** [20:39 - 20:40]: The only topic that I had here.
**Carlos | matchicalcom** [20:40 - 20:41]: It was security not sure.
**Carlos | matchicalcom** [20:41 - 20:44]: If you guys cover that already.
**Carlos | matchicalcom** [20:45 - 20:48]: What are you going to do in terms of securing both systems?
**Michael Fossler** [20:50 - 20:54]: Yes, this is part of my question.
**Michael Fossler** [20:54 - 20:58]: So what do you send me for authentication?
**Michael Fossler** [20:58 - 21:02]: Some bearer tokens or bearer tokens?
**Carlos | matchicalcom** [21:02 - 21:05]: Yeah, bearer tokens would be I think most common.
**Tommy | matchicalcom** [21:05 - 21:05]: Easy.
**Carlos | matchicalcom** [21:06 - 21:10]: We agree on the tokens to exchange HTTPs of course.
**Michael Fossler** [21:10 - 21:14]: And I think that's good this one RP for all tenants.
**Michael Fossler** [21:14 - 21:19]: Or is there a different API call for our different tenants?
**Carlos | matchicalcom** [21:20 - 21:24]: Would be one API centralized API for.
**Michael Fossler** [21:24 - 21:33]: All tenants, So we need per tenant one ID and one global bureau token, right?
**Tommy | matchicalcom** [21:34 - 21:43]: I think that's the easiest way and question Michi on the get from your site on the XML feedback.
**Tommy | matchicalcom** [21:45 - 21:52]: Because at this moment it's not secured, so at the wavestone side it's not secured.
**Tommy | matchicalcom** [21:52 - 21:53]: Everyone can call this.
**Tommy | matchicalcom** [21:53 - 21:56]: Should we secure this from our side as well?
**Tommy | matchicalcom** [21:56 - 21:57]: Should we do that?
**Michael Fossler** [21:59 - 22:00]: How do we like it?
**Michael Fossler** [22:00 - 22:05]: We can work with authentication If you prefer authentication, It's no problem.
**Tommy | matchicalcom** [22:05 - 22:06]: I don't know.
**Tommy | matchicalcom** [22:06 - 22:17]: I'm just asking because if we now set up a new, a new system, I think we should secure that in a way, or?
**Tommy | matchicalcom** [22:19 - 22:34]: Because otherwise everyone can see what the tenants sent you regarding open positions and if they delete something, so the applications should be secured anyway.
**Tommy | matchicalcom** [22:34 - 22:40]: But I think it's a good idea if we are at this point to secure this get endpoint.
**Tommy | matchicalcom** [22:40 - 22:50]: Also we can use only how we'd like to set up the URL.
**Tommy | matchicalcom** [22:50 - 22:53]: We should make one URL and only give you.
**Tommy | matchicalcom** [22:53 - 22:57]: The dennet id as a query parameter or then you.
**Tommy | matchicalcom** [22:57 - 23:05]: Can use only just one URL and only switch the tenant id to to work.
**Tommy | matchicalcom** [23:05 - 23:05]: With us, or?
**Tommy | matchicalcom** [23:05 - 23:08]: That's also the easiest way You can work with everything.
**Michael Fossler** [23:08 - 23:13]: You can send me a documentation example endpoint.
**Michael Fossler** [23:14 - 23:15]: Do you have a test system?
**Tommy | matchicalcom** [23:17 - 23:21]: Yeah, we have a test system for sure we can test.
**Michael Fossler** [23:23 - 23:28]: If we can have access, I can test some requests and send you some.
**Michael Fossler** [23:29 - 23:30]: And if you send me.
**Michael Fossler** [23:30 - 23:31]: The Documentation I.
**Tommy | matchicalcom** [23:34 - 23:35]: Michi Last Thing I.
**Tommy | matchicalcom** [23:35 - 23:39]: Think and then we are really good to go to start testing.
**Tommy | matchicalcom** [23:41 - 23:43]: I only want.
**Tommy | matchicalcom** [23:43 - 23:45]: Can you please just send me?
**Tommy | matchicalcom** [23:46 - 23:52]: You sent an example, but Or I can use the Wavestone XML example as well.
**Tommy | matchicalcom** [23:53 - 24:00]: I don't know what's your preferred way at this moment, Because I saw we sending from Wavestone actually a little.
**Tommy | matchicalcom** [24:00 - 24:03]: Bit different version than you suggested.
**Tommy | matchicalcom** [24:04 - 24:06]: It's no problem to adjust.
**Tommy | matchicalcom** [24:06 - 24:10]: Just tell us what you'd like to have what's for you best fitting?
**Tommy | matchicalcom** [24:12 - 24:14]: And then we can set up this XML.
**Tommy | matchicalcom** [24:14 - 24:20]: We can tell you the authorization, the endpoint on the get and tell you.
**Tommy | matchicalcom** [24:20 - 24:22]: If there is an application.
**Tommy | matchicalcom** [24:22 - 24:25]: What are our web hooks in the end?
**Tommy | matchicalcom** [24:25 - 24:43]: Because we need to do and also one for the status for the projects and one for the for the applications in the end or o perfect so far if you.
**Tommy | matchicalcom** [24:43 - 25:03]: Could only have these two informations in the end, the XML and what you what you wrote so far here, then it's dusted and done, then we can start and set up everything and get back to you as soon as possible that we can try to start our.
**Michael Fossler** [25:03 - 25:06]: Tests Sounds good for me.
**Tommy | matchicalcom** [25:06 - 25:19]: Yep OK, then just I would say as always I'm used if I talk to Carlos it's a tommy, don't bore.
**Carlos | matchicalcom** [25:19 - 25:29]: Me, This is a technical call so we just figured things, decided what you need to decide and let's implement it.
**Carlos | matchicalcom** [25:32 - 25:37]: It's more a matter of having an example and we can just make X.
**Tommy | matchicalcom** [25:37 - 25:41]: Work not rocket science, no, no, no.
**Tommy | matchicalcom** [25:41 - 25:57]: But Carlos, as I already stated for a lot of agencies out there, that's rocket science because they are now starting to doing that things actually so that's, that's kind of crazy to be honest, but it is what it is, so we can't.
**Tommy | matchicalcom** [25:59 - 26:08]: Okay, so Michi, if you could just drop a short email, we will start and get back to you Asap.
**Tommy | matchicalcom** [26:08 - 26:10]: And then we can, we can start.
**Magnus Gernlein** [26:10 - 26:14]: With one last thing from my side.
**Magnus Gernlein** [26:14 - 26:18]: Could you provide me with a list of your current customers?
**Tommy | matchicalcom** [26:19 - 26:20]: Yeah, for sure.
**Magnus Gernlein** [26:20 - 26:22]: So I can check if they already are with us.
**Tommy | matchicalcom** [26:24 - 26:25]: That would be perfect.
**Tommy | matchicalcom** [26:25 - 26:29]: Yeah, yeah, yeah, you will get for us from me.
**Tommy | matchicalcom** [26:29 - 26:36]: Yeah, okay, okay, I will respond to the email of Michi with this list.
**Tommy | matchicalcom** [26:36 - 26:40]: Yeah, perfect, easy, thank you so much.
**Tommy | matchicalcom** [26:41 - 26:45]: Thank you have a nice, have a nice day guys.
**Tommy | matchicalcom** [26:46 - 26:49]: Nice weekend, Bye bye, thanks.
