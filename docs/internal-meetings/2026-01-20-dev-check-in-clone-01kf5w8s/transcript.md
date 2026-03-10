# Dev Check in (Clone)

**Carlos | matchicalcom** [00:08 - 00:11]: Hello there, hello, consti, how are you?
**Carlos | matchicalcom** [00:15 - 00:20]: A little bit pissed, Okay, so let's talk later.
**Carlos | matchicalcom** [00:20 - 00:20]: Then.
**Konsti | matchicalcom** [00:24 - 00:27]: I had, like today I had the showcase with NTT, right?
**Konsti | matchicalcom** [00:27 - 00:47]: And while I was having the showcase, one of our clients decided, ah, let's upload sixty CV's in exactly like these twenty minutes and the whole system was way too slow and it was like really bringing me out of my concept and like deserving it was not too bad.
**Konsti | matchicalcom** [00:47 - 01:00]: Still they like everything they are perfect fit for our solution basically, so I just need to get them into a follow up, that should be quite easy and then I will convert them for sure one hundred percent, but it's do.
**Carlos | matchicalcom** [01:00 - 01:02]: You normally do this from production directly.
**Konsti | matchicalcom** [01:02 - 01:07]: Yeah, all this production, but my idea is the following.
**Konsti | matchicalcom** [01:07 - 01:22]: Like in the future maybe I can show you for a second here, like I have here in the settings, like how big is the queue size?
**Konsti | matchicalcom** [01:22 - 01:28]: So in this case I had it before by twelve and twelve is like, yeah, it works.
**Konsti | matchicalcom** [01:28 - 01:35]: But if it's all the time twelve, then it's really like grilling the system a little bit.
**Konsti | matchicalcom** [01:35 - 01:46]: So what I will do in the future, when I do a showcase, I just remove it, size it down to four, so that only in maximum four CV's run in parallel, the other ones are cute until the four are ready.
**Carlos | matchicalcom** [01:47 - 01:50]: And that's what per tenant, right?
**Konsti | matchicalcom** [01:51 - 01:59]: No, that's all in overall twenty, okay, that's a little bit, because when I'm passing sixty, other ones have to wait until my sixty are done.
**Konsti | matchicalcom** [01:59 - 02:04]: But we need to implement a smarter queue like that there's an overall cap.
**Konsti | matchicalcom** [02:05 - 02:09]: And when this overall cap is reached, you can only have one per tenant.
**Carlos | matchicalcom** [02:10 - 02:19]: Justifying a priority and max priority to your CVs, at least for demos, Yeah.
**Konsti | matchicalcom** [02:19 - 02:36]: Yeah, Even like I can do the queue size very low and what we can always do, we can always go in here, check the queue and when there's something cute, say okay, start it right away, we can override the queue as administers, but that's just my lesson learned.
**Konsti | matchicalcom** [02:36 - 02:40]: Like in the future, before I do the showcase, I really drill this down to four.
**Carlos | matchicalcom** [02:44 - 02:49]: But the system processed the sixty without any major issues.
**Carlos | matchicalcom** [02:49 - 02:55]: So they were able to upload it just slow down everything a few, a few.
**Konsti | matchicalcom** [02:55 - 03:04]: Now it was like the process, the whole front end was a little bit slowed down, because there were so many things running and like for example, when I was opening in demand or.
**Konsti | matchicalcom** [03:04 - 03:16]: So, it was just slower, because like twelve in parallel all the time is too much, especially like with our current skill system like I'm not.
**Konsti | matchicalcom** [03:16 - 03:18]: Making any progress there, but ah.
**Carlos | matchicalcom** [03:20 - 03:21]: That doesn't help.
**Konsti | matchicalcom** [03:21 - 03:27]: Yeah, like I told Tommy, like the we know exactly what to do.
**Konsti | matchicalcom** [03:28 - 03:32]: We know also quite well how to do it.
**Konsti | matchicalcom** [03:32 - 03:45]: The only question is like when to do it and with the when it's like the answer to the when is like just priority we need to prioritize well, and then we can make it work, but okay, so let's be laser focused.
**Konsti | matchicalcom** [03:49 - 03:50]: What are your current.
**Carlos | matchicalcom** [03:52 - 04:03]: Yes, I'm currently developing the duplicate check process as part of the review that we did in the morning with Tommy.
**Carlos | matchicalcom** [04:04 - 04:11]: Not a lot of little model in this case, the way that the process was thought is mainly interface so not too bad.
**Carlos | matchicalcom** [04:11 - 04:14]: Just CSS trouble in the future.
**Carlos | matchicalcom** [04:14 - 04:19]: I do have a question, but I think it's mainly for Tommy, because he was the one doing the requirements.
**Konsti | matchicalcom** [04:20 - 04:25]: I can tell you already we decided that we only check external against external and internal against internal.
**Carlos | matchicalcom** [04:26 - 04:50]: Right, right, right, it talked about it today now in this case it's just an implementation question, but you see here you know the screens so this is the you just add the information and then when there are duplicates, you come to this screen and in this case suppose this represents the user that we just introduced.
**Carlos | matchicalcom** [04:50 - 04:54]: Yes, okay, we don't have a photo.
**Konsti | matchicalcom** [04:54 - 04:55]: Yeah, yeah, we don't have a photo.
**Carlos | matchicalcom** [04:55 - 05:03]: Doesn'T matter right because so I can just put the name in the organization there up there just, or?
**Carlos | matchicalcom** [05:03 - 05:07]: Okay, especially was mainly related to the photo.
**Carlos | matchicalcom** [05:07 - 05:14]: You don't upload the photo, We don't have it so I Cannot Just Be Pixel Perfect With the Design.
**Konsti | matchicalcom** [05:14 - 05:16]: In this one and what we obviously need is.
**Konsti | matchicalcom** [05:16 - 05:21]: Yeah, no matters, we don't have the photo yet so you can just no need to.
**Konsti | matchicalcom** [05:23 - 05:35]: But there can be a photo so you can just use the photo placeholder like where it's just like in this case not, but in other cases for contact duplicate check.
**Carlos | matchicalcom** [05:38 - 05:42]: Maybe in this case since we are adding it just on.
**Konsti | matchicalcom** [05:42 - 05:49]: The previous and another question that I'm having is like that's that's just a minor UX thing.
**Konsti | matchicalcom** [05:50 - 06:03]: But if we know like after you entered the thing and when you click on the on save on the left right this one here on add what we could do.
**Konsti | matchicalcom** [06:03 - 06:13]: Maybe we could first run the query of the next screen there check if it's empty and if it's empty.
**Konsti | matchicalcom** [06:13 - 06:15]: Like we immediately add it, because there.
**Carlos | matchicalcom** [06:15 - 06:17]: Are I'm doing that.
**Carlos | matchicalcom** [06:19 - 06:27]: Okay, so if you do, I'm pretty sure this doesn't exist.
**Carlos | matchicalcom** [06:30 - 06:34]: You just get feedback message directly if we.
**Carlos | matchicalcom** [06:36 - 06:41]: Go to this one and this is what I was currently working on this.
**Carlos | matchicalcom** [06:43 - 06:53]: You get to this screen with the list of in this case this is there so we have a lot of duplicates, but this is where I'm working.
**Carlos | matchicalcom** [06:53 - 07:00]: This list doesn't really look as the other one yet, but it was just easier to implement.
**Konsti | matchicalcom** [07:00 - 07:01]: Just to make sure you enter like.
**Konsti | matchicalcom** [07:01 - 07:05]: Why is AABB shown the email address?
**Carlos | matchicalcom** [07:08 - 07:10]: I know that is the email address.
**Carlos | matchicalcom** [07:10 - 07:17]: So need to make these two buttons dynamic so there are things still to do and then the layout of the.
**Konsti | matchicalcom** [07:17 - 07:20]: List itself and maybe a back button is also missing.
**Konsti | matchicalcom** [07:22 - 07:30]: OK I have one more question or not a question because I saw your feedback message.
**Konsti | matchicalcom** [07:30 - 07:34]: There's one client action in the front and that's called like show toast.
**Carlos | matchicalcom** [07:35 - 07:37]: Yeah, I just use the default out systems.
**Konsti | matchicalcom** [07:38 - 07:39]: Yeah, no worries.
**Konsti | matchicalcom** [07:39 - 07:45]: Pedro will work, Philippe will probably like fix this bright or show toast.
**Carlos | matchicalcom** [07:45 - 07:45]: I've seen.
**Carlos | matchicalcom** [07:45 - 07:46]: I've seen it.
**Carlos | matchicalcom** [07:46 - 07:47]: Yes, showcased.
**Konsti | matchicalcom** [07:47 - 07:49]: Yeah, yeah, cool.
**Konsti | matchicalcom** [07:50 - 07:50]: All right.
**Konsti | matchicalcom** [07:51 - 07:59]: Yeah, that's it Then you need to look obviously for yeah, just for external users and it's either the consultant or.
**Carlos | matchicalcom** [08:01 - 08:02]: Yeah, I just reuse.
**Carlos | matchicalcom** [08:03 - 08:10]: We used to have a or we do have a query for consultants and I adapted it just to be almost.
**Konsti | matchicalcom** [08:10 - 08:12]: One thing that just came to my mind.
**Konsti | matchicalcom** [08:12 - 08:15]: Imagine like we already know the company, right?
**Konsti | matchicalcom** [08:15 - 08:19]: Should we do a duplicate check for other companies?
**Carlos | matchicalcom** [08:22 - 08:28]: I didn't include the company as a filter, but that's I'll say business rule that is easy.
**Carlos | matchicalcom** [08:28 - 08:30]: So just to compare only in that company.
**Konsti | matchicalcom** [08:30 - 08:34]: Let's not do it right now, because you will see that it's something different.
**Konsti | matchicalcom** [08:34 - 08:35]: Okay, easy, cool.
**Konsti | matchicalcom** [08:36 - 08:38]: So no open questions from your side.
**Carlos | matchicalcom** [08:38 - 08:41]: No, at this point not a lot of questions.
**Carlos | matchicalcom** [08:41 - 08:48]: Just need the time to keep working on the interface in the next sprint.
**Konsti | matchicalcom** [08:49 - 09:00]: In this sprint, I don't know why this sprint I had basically almost like so little time for developing, but for some reason that I cannot explain you why it should be like this.
**Konsti | matchicalcom** [09:00 - 09:07]: But for some reason I'm super optimistic that I will have much more development.
**Carlos | matchicalcom** [09:07 - 09:10]: Time in the next have you seen your calendar?
**Carlos | matchicalcom** [09:10 - 09:11]: I don't know.
**Carlos | matchicalcom** [09:11 - 09:19]: I didn't look it through, but I think you need to see how many meetings you have in terms of sales and all the rest of the stuff.
**Carlos | matchicalcom** [09:20 - 09:24]: If you can block some like afternoons or morning periods.
**Carlos | matchicalcom** [09:24 - 09:29]: Like for it needs to be several hours in a row or it's not really helpful.
**Konsti | matchicalcom** [09:32 - 10:00]: Actually from the ten days in the next sprint one, two, three, four, like four days are already gone like in two of them I'm on vacation because I'm doing like we are moving right into another from an apartment to a house and the other ones and then two more days I have meetings and there will be more meetings for sure.
**Konsti | matchicalcom** [10:00 - 10:05]: So I don't know, let's see, let's see we'll work.
**Konsti | matchicalcom** [10:05 - 10:20]: But what I wanted to say is, when I have time to work on the skills and the roles, I will need you within several things, so we need to plan this accordingly that you have less capacity for the other stuff in the next sprint most likely yeah.
**Carlos | matchicalcom** [10:20 - 10:35]: It'S just a matter of priorities, but would be good to see It looks like it will not come on the next one with between the days that you are off and the meetings already trying to be realistic here.
**Carlos | matchicalcom** [10:35 - 10:40]: But you tell me, you tell me it's not difficult to organize.
**Konsti | matchicalcom** [10:45 - 10:51]: OK yeah, we will get there like I have three things on my list.
**Konsti | matchicalcom** [10:54 - 11:07]: The one thing is we need to prioritize well that we don't waste time on features that are important and helpful and cool, but don't add immediate business value or are not like the most important ones for our current clients.
**Konsti | matchicalcom** [11:07 - 11:08]: That's one thing prioritization.
**Konsti | matchicalcom** [11:10 - 11:18]: The second thing is we need to obviously manage our cash flow, but here I'm already pretty optimistic.
**Konsti | matchicalcom** [11:20 - 11:23]: Pretty pretty optimistic, looks good so far.
**Konsti | matchicalcom** [11:23 - 11:38]: And the third one is we will get trouble in terms of load because a few sprints from now, but definitely within Q one we will implement the connection to job boards, right?
**Konsti | matchicalcom** [11:38 - 11:41]: Something like you know LinkedIn jobs or so.
**Konsti | matchicalcom** [11:41 - 11:45]: There's some German portals, freelancer, mapreelance, it doesn't matter.
**Konsti | matchicalcom** [11:46 - 12:00]: And when we connect those, we will get these applications automatically to our tenants and this will mean we will get if we sum up all tenants kind of one thousand CV's every day, like at least five hundred.
**Carlos | matchicalcom** [12:04 - 12:18]: Does those applications bring some kind of structure that we can use or it just like a way of submitting files files, okay, so we need like we need the skills, we need the skills, we need the.
**Konsti | matchicalcom** [12:18 - 12:26]: Skills and we need to we need to move our pipeline away from events to these workflows for CV parsings.
**Konsti | matchicalcom** [12:29 - 12:37]: That's the three things that bother me Honestly speaking, let's see, we refix the things when we run into them right?
**Carlos | matchicalcom** [12:38 - 12:42]: No, you can always use the Q concept right?
**Carlos | matchicalcom** [12:42 - 12:50]: So just so for example, those processed after eight pm or they.
**Carlos | matchicalcom** [12:50 - 12:57]: Have a lower priority in the queue, so they only are added just at the slower pace.
**Carlos | matchicalcom** [12:57 - 13:03]: So there are techniques to take advantage of the Twenty-Four Hour of the Day.
**Carlos | matchicalcom** [13:03 - 13:09]: To make sure that we use the off peaks moments so we don't slow down the application too much.
**Konsti | matchicalcom** [13:10 - 13:10]: That's true.
**Konsti | matchicalcom** [13:10 - 13:11]: That's true.
**Konsti | matchicalcom** [13:11 - 13:23]: How long do you think will it take you to do the experience calculation with the roles and skills coming from the graph as soon as I'm done.
**Carlos | matchicalcom** [13:23 - 13:26]: With close to be done if I remember.
**Carlos | matchicalcom** [13:27 - 13:43]: So I left it prepared on the query to inject a list of skills in the list of roles so never tested right because we just dummy data, but it probably like a day or two just to confirm everything because we should be there already.
**Konsti | matchicalcom** [13:44 - 13:46]: Okay, cool, Perfect.
**Konsti | matchicalcom** [13:47 - 14:17]: Because probably, when I have everything done with the system, we will really need to work closely together to make all the things required like the changes to the experience calculation you can do yourself, but then the demand calculation where you implemented the custom role stuff this one, we need to work on this together to basically clean up the mess.
**Konsti | matchicalcom** [14:17 - 14:30]: We need to come to a new setup that's better, like this is what I did there it can be done better and then third one the matching and fourth one the CV export is easy.
**Konsti | matchicalcom** [14:30 - 14:31]: Okay, cool.
**Konsti | matchicalcom** [14:31 - 14:33]: Last but not least, last question, yeah.
**Carlos | matchicalcom** [14:34 - 14:41]: No, I was gonna say, even with custom roles, I think we need to review everything before really going live with it and you really using them.
**Konsti | matchicalcom** [14:41 - 14:50]: But overall they are implemented on Wednesday, not on Wednesday, on Friday, on Friday.
**Konsti | matchicalcom** [14:50 - 14:58]: There's like a first softgo live with our two contacts from that client that is using the custom road.
**Konsti | matchicalcom** [14:58 - 14:59]: Did you test the matching?
**Konsti | matchicalcom** [14:59 - 15:00]: Did it work?
**Carlos | matchicalcom** [15:02 - 15:07]: Yes, I did the second query by manually adding the roles?
**Carlos | matchicalcom** [15:07 - 15:10]: But yes, roles and skills.
**Carlos | matchicalcom** [15:10 - 15:16]: I just use the interface and the manual and the matching just returns percentages.
**Carlos | matchicalcom** [15:16 - 15:17]: Okay, so it's just.
**Carlos | matchicalcom** [15:23 - 15:24]: On the demand.
**Carlos | matchicalcom** [15:25 - 15:38]: Yeah, I was saying that so on the experience calculation both are calculated so custom, so roles and skills were there in the custom version of the roles on the demand itself.
**Carlos | matchicalcom** [15:39 - 15:46]: You just use the manually added on the application, so I parse the demand and then just manually added a few.
**Konsti | matchicalcom** [15:46 - 15:51]: Roles by our already created that the custom role is also parse when you pass a demand.
**Carlos | matchicalcom** [15:53 - 15:56]: Yeah, But at least I didn't found good examples.
**Carlos | matchicalcom** [15:56 - 16:06]: So just to make it easier, I think it will just to make sure that I know what should be matching against, since we didn't have a huge database of data to test.
**Carlos | matchicalcom** [16:07 - 16:14]: And then they started, consultant started to appear with different percentages, so it looks like it's perfect.
**Konsti | matchicalcom** [16:14 - 16:16]: Very cool, very nice, thank you.
**Konsti | matchicalcom** [16:16 - 16:21]: All right, I will check this out either way, like tomorrow and then I can let you know if there's something.
**Carlos | matchicalcom** [16:21 - 16:26]: Yeah, please run a couple of examples before showing it to the client, just playing safe.
**Konsti | matchicalcom** [16:27 - 16:31]: You never know right one hour before I will let you know.
**Konsti | matchicalcom** [16:31 - 16:39]: By the way, we need, like we mentioned this on Wednesday, on Thursday, on Friday, on Monday, but today we definitely need to deploy.
**Carlos | matchicalcom** [16:39 - 16:46]: So please I added feature toggles everywhere so even what?
**Carlos | matchicalcom** [16:46 - 16:46]: I'm the pop up.
**Carlos | matchicalcom** [16:46 - 16:54]: The pop up that I'm doing right now is the same, but if you, if you click add and the feature is not active, it just saves on the database.
**Carlos | matchicalcom** [16:54 - 16:58]: No duplicate check, because I'm in the middle of the duplicate check.
**Carlos | matchicalcom** [16:58 - 17:10]: So unless I got something wrong, I think no, this was the, yeah, I think this needs to be the pattern pretty much everywhere in the sprint, because always mentioned that we might go live.
**Konsti | matchicalcom** [17:10 - 17:15]: So yeah, all right, Cool, Carlos, thank you very much.
**Konsti | matchicalcom** [17:16 - 17:18]: How are you feeling personally?
**Konsti | matchicalcom** [17:18 - 17:19]: Everything's fine.
**Carlos | matchicalcom** [17:19 - 17:21]: Yeah, yeah, just fine.
**Carlos | matchicalcom** [17:21 - 17:26]: A little bit cold, but cold for our standards, but but everything's fine.
**Konsti | matchicalcom** [17:26 - 17:31]: It is warm like it's twenty four degrees in the flat right, yeah, inside.
**Carlos | matchicalcom** [17:31 - 17:38]: And here inside is not bad, also, but outside activities are a little bit complicated at this point, so a lot of staying at home.
**Konsti | matchicalcom** [17:39 - 17:41]: What a pleasure, Let me know if you have any questions, right?
**Carlos | matchicalcom** [17:42 - 17:43]: Okay, no worries, no worries.
**Carlos | matchicalcom** [17:43 - 17:44]: I'm good for.
**Konsti | matchicalcom** [17:45 - 17:45]: Cheers.
**Carlos | matchicalcom** [17:46 - 17:46]: Bye.
