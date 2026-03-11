# Daily

**Tommy | matchicalcom** [00:02 - 00:04]: Good morning, hi, how are you?
**Carlos | matchicalcom** [00:05 - 00:10]: Good morning, I'm still driving, so just a little.
**Tommy | matchicalcom** [00:10 - 00:11]: Oh, you're still driving.
**Carlos | matchicalcom** [00:11 - 00:19]: Oh, okay, okay, okay, everything is okay, but we had like a storm during the night a little bit.
**Carlos | matchicalcom** [00:19 - 00:21]: Oh, traffic.
**Carlos | matchicalcom** [00:21 - 00:37]: No, everything is okay, but just traffic was completely crazy this morning, or is morning accidentally everywhere took, normally took like twice the time that I normally take to drive my kid to school.
**Niklas | matchicalcom** [00:37 - 00:41]: So crazy because of the weather, Yes.
**Carlos | matchicalcom** [00:42 - 00:47]: So traffic, jams and accidents everywhere just crazy.
**Carlos | matchicalcom** [00:47 - 00:49]: Lisbon is completely crazy today.
**Niklas | matchicalcom** [00:50 - 00:58]: Completely crazy, yeah, so good day to not travel too fast, too far, but you needed to get to bring your kids to school, right?
**Carlos | matchicalcom** [00:58 - 01:01]: Yeah, yes, still need to do that.
**Carlos | matchicalcom** [01:01 - 01:03]: So almost home.
**Tommy | matchicalcom** [01:05 - 01:11]: Fingers crossed that nothing happens and everything goes the right way.
**Carlos | matchicalcom** [01:13 - 01:19]: So it was like four thirty in the morning, like thunderstorms and lightning and so just.
**Niklas | matchicalcom** [01:21 - 01:25]: Really, yeah, yeah, today was like thunderstorms the whole night, it was.
**Tommy | matchicalcom** [01:25 - 01:35]: A lot crazy and so, but but you are, okay, Carlos and Chico, you are, also OK, everything's fine.
**Carlos | matchicalcom** [01:35 - 01:46]: Definitely my dog got a little bit scared, so it was funny, but yeah, everything dogs don't like thunderstorms, OK.
**Tommy | matchicalcom** [01:49 - 01:50]: Me neither.
**Niklas | matchicalcom** [01:51 - 01:54]: Oh, I though find it relatively calm, actually, it's very cool.
**Niklas | matchicalcom** [01:55 - 01:58]: I can't when there's a thunderstorm, really?
**Konsti | matchicalcom** [02:00 - 02:06]: I usually, I usually agree, but I'm not sure if I would agree if I'm like in the eighth floor of.
**Niklas | matchicalcom** [02:06 - 02:08]: Yeah, I was thinking that today, also.
**Tommy | matchicalcom** [02:08 - 02:17]: Tonight a little bit, only the eighth floor I think that can be, yeah.
**Konsti | matchicalcom** [02:17 - 02:19]: But it's still a decent height, right?
**Konsti | matchicalcom** [02:19 - 02:21]: It's not like, oh, it's like twenty meters.
**Tommy | matchicalcom** [02:24 - 02:26]: That'S true, yeah, but there are.
**Niklas | matchicalcom** [02:26 - 02:28]: Higher buildings near me, though.
**Konsti | matchicalcom** [02:32 - 02:35]: Ladies and Gentlemen, let me start, please.
**Konsti | matchicalcom** [02:35 - 02:36]: What did I do?
**Konsti | matchicalcom** [02:36 - 02:37]: Promise, what did I do?
**Konsti | matchicalcom** [02:37 - 02:50]: Blah, blah, blah, no strong long story short, like I realized already, as I'm procrastinating way too much I cannot work on this the whole day so yesterday already.
**Konsti | matchicalcom** [02:50 - 03:01]: And this morning again a little bit in terms of procrastination started with getting more clear on what will our new kind of let's say infrastructure setup be like?
**Konsti | matchicalcom** [03:01 - 03:09]: What is the intersectional play between how Do we call LLMs, how do we use workflows and so on.
**Konsti | matchicalcom** [03:09 - 03:27]: So I'm like working on the prompts mainly currently, but whenever I realize I need a break, I work on the other thing, Chico, just for you as a catch up, I talked a little bit about it with Tommy and a little bit about it with Carlos and we are pretty bullish on.
**Konsti | matchicalcom** [03:28 - 03:33]: We will just set up one general lambda function that is doing our LLM calling and this one.
**Konsti | matchicalcom** [03:33 - 03:48]: We can call asynchronous and synchronous and bigger flows like scale classification, role classification, CV parser, demand parser will be done in workflows.
**Konsti | matchicalcom** [03:48 - 03:53]: Minor things like generate me, DCB, export data or so will be done in events still.
**Konsti | matchicalcom** [03:54 - 04:07]: But all these things that are using LLMs will call either synchronously or asynchronously lambda and this will be the new setup and we will, yeah, like sounds good.
**Niklas | matchicalcom** [04:07 - 04:08]: Lambda can scale by random.
**Konsti | matchicalcom** [04:11 - 04:11]: Tommy Research.
**Konsti | matchicalcom** [04:11 - 04:13]: There are limits, but there are just limits.
**Konsti | matchicalcom** [04:13 - 04:16]: Like at a certain point you need to talk to sales.
**Konsti | matchicalcom** [04:17 - 04:18]: Let's say it like this.
**Tommy | matchicalcom** [04:19 - 04:20]: There are limits.
**Niklas | matchicalcom** [04:20 - 04:24]: There are limits, performance limits or rate.
**Konsti | matchicalcom** [04:24 - 04:26]: Limits like I think one thousand think.
**Tommy | matchicalcom** [04:27 - 04:34]: Parallel concurrences per one lambda function in.
**Konsti | matchicalcom** [04:34 - 04:37]: One lambda function in one region, but.
**Niklas | matchicalcom** [04:37 - 04:40]: It'S still super less actually for AWS.
**Konsti | matchicalcom** [04:41 - 04:48]: No, you can easily go up to five thousand and ten thousand and even more, but you just need to kind of apply for it.
**Konsti | matchicalcom** [04:48 - 04:48]: Basically.
**Konsti | matchicalcom** [04:48 - 04:55]: I think it's just like if you need more than ten thousand things running in parallel or more than one thousand things running in parallel.
**Konsti | matchicalcom** [04:55 - 05:03]: I think it's just a guard to like you know those things in fireship like I left an ect instance on and now.
**Konsti | matchicalcom** [05:03 - 05:10]: I'm broke stuff like that it's just for preventing like wasting compute in AWS.
**Carlos | matchicalcom** [05:10 - 05:18]: I've done several times submit to have higher limits for sending emails for example, and they are just very quick.
**Carlos | matchicalcom** [05:18 - 05:23]: You need to just explain why you need it what it's your use case and they normally.
**Carlos | matchicalcom** [05:23 - 05:24]: Just approve it.
**Carlos | matchicalcom** [05:24 - 05:25]: It's very simple.
**Konsti | matchicalcom** [05:27 - 05:38]: If you request something like that in the Google Cloud, it takes like at least two weeks, like at least like getting higher rate limits for our AI calls it took some.
**Konsti | matchicalcom** [05:38 - 05:39]: Time to get there.
**Carlos | matchicalcom** [05:40 - 05:45]: My experience with AWS normally takes like one day or two no more than that at least.
**Konsti | matchicalcom** [05:48 - 05:52]: Yeah, but a concurrency of one thousand in parallel is either way decent.
**Konsti | matchicalcom** [05:52 - 05:54]: I don't think we will get there.
**Tommy | matchicalcom** [05:54 - 06:01]: Anytime soon and I did a proposal on Microsoft and I never get an answer.
**Konsti | matchicalcom** [06:02 - 06:05]: Yeah, this was really.
**Tommy | matchicalcom** [06:06 - 06:08]: Microsoft is so bad in their support.
**Konsti | matchicalcom** [06:08 - 06:31]: The only thing that came to my mind Carlos the way that we set up the skill classification workflow currently, it's like, it's calling the service action that is calling it synchronously currently and based like this would mean currently when we have one hundred skills getting classified in the same time our workflow queue would already be.
**Niklas | matchicalcom** [06:31 - 06:31]: Full.
**Konsti | matchicalcom** [06:34 - 06:40]: So we need to like maybe we need to call this asynchronously.
**Niklas | matchicalcom** [06:40 - 06:41]: Yeah, then we can see.
**Tommy | matchicalcom** [06:43 - 06:44]: Yeah, that's it, that's right.
**Tommy | matchicalcom** [06:47 - 06:51]: The workflows are only one hundred workflows in parallel.
**Tommy | matchicalcom** [06:51 - 06:56]: I don't think it's so I was thinking about in the night on this topic.
**Konsti | matchicalcom** [06:57 - 06:58]: Me too.
**Tommy | matchicalcom** [06:58 - 07:00]: If we, that's not so much or.
**Konsti | matchicalcom** [07:00 - 07:02]: One hundred, it's not an issue.
**Konsti | matchicalcom** [07:02 - 07:05]: If you're talking about milliseconds, it's an issue.
**Konsti | matchicalcom** [07:05 - 07:07]: As soon as we start talking about.
**Tommy | matchicalcom** [07:07 - 07:11]: Seconds, yeah, and we are talking about minutes.
**Konsti | matchicalcom** [07:11 - 07:13]: Or if we are, if we are.
**Tommy | matchicalcom** [07:13 - 07:16]: Doing the CV parser, you won't go.
**Konsti | matchicalcom** [07:17 - 07:24]: Ah, OK, As soon as a workflow hits a wait node because we fired.
**Konsti | matchicalcom** [07:24 - 07:29]: An asynchronous action, like asynchronous call to Lambda and then we wait for the event.
**Konsti | matchicalcom** [07:30 - 07:44]: During that wait, the workflow it shows running, but what actually is happening under the hood is it gets terminated and when the trigger comes it restarts, so it does not count as running workflow.
**Tommy | matchicalcom** [07:46 - 07:52]: Ah, OK, one hundred active active workflows.
**Konsti | matchicalcom** [07:52 - 08:00]: Actively current process orchestrator flows so and those orchestrations always just milliseconds, because like.
**Konsti | matchicalcom** [08:00 - 08:06]: Ah, okay, now this, this, this, this, ah, here's the next thing to the thing do this terminate, done.
**Niklas | matchicalcom** [08:08 - 08:08]: I think.
**Carlos | matchicalcom** [08:08 - 08:17]: In the skills you only have troubled on the initial boat load then after that, after that we should be more than fine with the parallel.
**Carlos | matchicalcom** [08:17 - 08:24]: But for we will hit one hundred, it will have to wait a little bit longer.
**Tommy | matchicalcom** [08:25 - 08:30]: And what about, if we're doing CV parsing and demand parsing, also with workflows.
**Konsti | matchicalcom** [08:31 - 08:39]: Same like, as long as we do all the AI calls or everything that takes, let's say longer than five seconds or so.
**Konsti | matchicalcom** [08:39 - 08:43]: Async, it's not an issue, It won't get an issue.
**Tommy | matchicalcom** [08:45 - 08:50]: Or even if we then can raise to two hundred, I don't know.
**Tommy | matchicalcom** [08:50 - 08:53]: Then everything should be solved or so.
**Tommy | matchicalcom** [08:53 - 08:57]: Okay, okay, it should be robust setup, or?
**Tommy | matchicalcom** [08:57 - 09:06]: Yeah, okay, okay, okay, OK, what I did yesterday, so I will proceed.
**Tommy | matchicalcom** [09:06 - 09:12]: What I did yesterday was, I prepared this user stories I walked through.
**Tommy | matchicalcom** [09:12 - 09:22]: With you guys, then I had a meeting with a freelancer map.
**Tommy | matchicalcom** [09:22 - 09:30]: I already told you and yeah, and I think I had to do invoices.
**Tommy | matchicalcom** [09:31 - 09:33]: Yeah, I will do that today.
**Tommy | matchicalcom** [09:37 - 09:41]: Okay, actually like I'm letting you, but.
**Konsti | matchicalcom** [09:41 - 09:42]: I didn't do it by myself.
**Tommy | matchicalcom** [09:43 - 09:56]: What I will do, what I will do today is, we have so I have to do Minor thing for Wavestone regarding this reporting.
**Tommy | matchicalcom** [09:56 - 09:58]: On the internal search.
**Tommy | matchicalcom** [10:00 - 10:08]: After that I will prepare the other user story for the demand upload as well.
**Tommy | matchicalcom** [10:08 - 10:23]: And constantly have to think about that we will talk about in our backlog management meeting today regarding the timeline for bridging, because they want to have one.
**Tommy | matchicalcom** [10:23 - 10:26]: So we should think about and use this meeting.
**Tommy | matchicalcom** [10:26 - 10:32]: And then we have two meetings surefix with wavestone and management board, but there are no wheels.
**Konsti | matchicalcom** [10:32 - 10:37]: Okay, Geofix actually I can join because it's in the middle of two meetings, right?
**Tommy | matchicalcom** [10:37 - 10:47]: Yeah, I think yeah, I should join, yeah, but I think that's that's what I want to do today.
**Tommy | matchicalcom** [10:48 - 11:01]: Easy and consty, just one quick thing could you follow up to as so Saynor doesn't give you feedback, so let's.
**Konsti | matchicalcom** [11:01 - 11:02]: Talk about this later.
**Tommy | matchicalcom** [11:02 - 11:07]: Okay, okay, later, Okay, okay, because it wasn't on your agenda, so I was.
**Konsti | matchicalcom** [11:10 - 11:13]: Need to check in regarding, like where we need to check in.
**Konsti | matchicalcom** [11:14 - 11:16]: Okay.
**Tommy | matchicalcom** [11:18 - 11:19]: That'S it from my side to.
**Niklas | matchicalcom** [11:19 - 11:23]: Form easy and then I can just continue.
**Niklas | matchicalcom** [11:23 - 11:28]: So basically yesterday we finished up skills and roles.
**Niklas | matchicalcom** [11:28 - 11:38]: Admin interface and now I think now just copy to clipboard and the link is missing some very minor things.
**Niklas | matchicalcom** [11:40 - 11:47]: Then I also investigated the registration flow, so now I added that there's another kind of security mechanism and logging.
**Niklas | matchicalcom** [11:47 - 12:06]: In addition that if the user really gets an error, they get another mail sent to there and we will get a logging so we can see because there is a specific use case where outsystems is returning no.
**Niklas | matchicalcom** [12:06 - 12:09]: Error message, nothing but the registration also doesn't work.
**Niklas | matchicalcom** [12:09 - 12:14]: I think it has to do with timing or I don't know under the hood, but we need to investigate.
**Niklas | matchicalcom** [12:14 - 12:42]: And then today Carlos right, we will work on the new notification hub for CV uploads and also I realized I need to today take some time for preparing and testing EverythingEverything for the BA templates, because we will have a meeting with segication where we want to onboard them on how to use it.
**Niklas | matchicalcom** [12:42 - 12:52]: So they can already set up their things so probably I will need some hours for that in the afternoon then so yes, that's my plan.
**Carlos | matchicalcom** [12:55 - 13:02]: Okay, so on my side mainly the normalization dictionary implemented a.
**Carlos | matchicalcom** [13:02 - 13:14]: Few functionalities there, like add new and edit the fields, also fix on the admin and I think at this point the admin pages are ready for prime time because we.
**Carlos | matchicalcom** [13:14 - 13:20]: Just fixed a couple of bugs related to the updated date and we reviewed.
**Carlos | matchicalcom** [13:20 - 13:21]: The New User Story.
**Carlos | matchicalcom** [13:21 - 13:22]: So Ready.
**Carlos | matchicalcom** [13:22 - 13:24]: To start on that today.
**Niklas | matchicalcom** [13:26 - 13:30]: Carlos A quick question because I'm currently going through the notion ticket.
**Niklas | matchicalcom** [13:30 - 13:36]: When the text in the registry for an ambiguous case gets updated, do you also do that?
**Niklas | matchicalcom** [13:36 - 13:39]: It gets lowercased and updates the text.
**Carlos | matchicalcom** [13:39 - 13:39]: At C.
**Carlos | matchicalcom** [13:40 - 13:45]: Yes, the API handles all the lower cases, even on the normalization.
**Carlos | matchicalcom** [13:45 - 13:46]: There was a change that I did.
**Carlos | matchicalcom** [13:47 - 13:55]: You can only edit the lower tax or the text field, then the array gets calculated by the system.
**Carlos | matchicalcom** [13:56 - 13:57]: Just easier to avoid.
**Konsti | matchicalcom** [13:57 - 13:58]: Thanks, sure.
**Tommy | matchicalcom** [13:58 - 14:02]: Oh, guys, guys, guys, guys, what happened with the ID of the demands?
**Tommy | matchicalcom** [14:02 - 14:04]: They are gone on abroad.
**Tommy | matchicalcom** [14:04 - 14:06]: Guys, with the what?
**Niklas | matchicalcom** [14:06 - 14:10]: Sorry, what happened with what?
**Tommy | matchicalcom** [14:14 - 14:15]: They are gone.
**Tommy | matchicalcom** [14:15 - 14:19]: So you aren't able to go to the demand.
**Niklas | matchicalcom** [14:19 - 14:21]: No, I tested it yesterday.
**Niklas | matchicalcom** [14:21 - 14:22]: It worked.
**Konsti | matchicalcom** [14:22 - 14:25]: Guys, guys, guys, guys.
**Tommy | matchicalcom** [14:27 - 14:29]: Where are you at Ziga?
**Tommy | matchicalcom** [14:30 - 14:31]: So the idea.
**Konsti | matchicalcom** [14:36 - 14:38]: But maybe it's new demands that don't work.
**Niklas | matchicalcom** [14:40 - 14:44]: Yeah, because old demands have an idea tested that yesterday.
**Tommy | matchicalcom** [14:44 - 14:46]: New demands don't have it.
**Konsti | matchicalcom** [14:46 - 14:49]: No shit, not good.
**Niklas | matchicalcom** [14:49 - 14:51]: Why do new demands don't have.
**Niklas | matchicalcom** [14:52 - 14:55]: I mean, I can fix it right now, because we have a fix on.
**Niklas | matchicalcom** [14:55 - 14:59]: We can just run, but it's definitely for me.
**Konsti | matchicalcom** [14:59 - 15:00]: The fix is empty.
**Konsti | matchicalcom** [15:00 - 15:01]: Are you serious?
**Niklas | matchicalcom** [15:02 - 15:11]: Yeah, the fix is on prod, but I put it in wherever we create a demand I put in generate medid, so I don't know why.
**Niklas | matchicalcom** [15:11 - 15:12]: It's not taking it.
**Tommy | matchicalcom** [15:14 - 15:15]: The new ones are not there.
**Niklas | matchicalcom** [15:15 - 15:17]: The new ones are.
**Konsti | matchicalcom** [15:17 - 15:18]: What was the logic before?
**Konsti | matchicalcom** [15:18 - 15:20]: How did you get into the.
**Niklas | matchicalcom** [15:23 - 15:23]: Was.
**Konsti | matchicalcom** [15:23 - 15:25]: There always a med id or how do.
**Konsti | matchicalcom** [15:25 - 15:25]: You get?
**Niklas | matchicalcom** [15:25 - 15:27]: No, no, I created that mad ID.
**Konsti | matchicalcom** [15:27 - 15:29]: Yesterday before the demand was linked right?
**Niklas | matchicalcom** [15:31 - 15:36]: I created it in any action where we call create demand.
**Konsti | matchicalcom** [15:36 - 15:38]: Did you set it to mandatory?
**Niklas | matchicalcom** [15:41 - 15:43]: I searched everywhere for it.
**Niklas | matchicalcom** [15:43 - 15:44]: No, I didn't set it to mandatory.
**Konsti | matchicalcom** [15:44 - 15:46]: Maybe you know that we need it.
**Konsti | matchicalcom** [15:46 - 15:47]: Then just set it to mandatory.
**Niklas | matchicalcom** [15:48 - 15:49]: That's a true point.
**Konsti | matchicalcom** [15:51 - 15:55]: And then you will see already automatically the error and I can tell you where it is.
**Niklas | matchicalcom** [15:58 - 16:02]: Demand and update demand I will put it in.
**Niklas | matchicalcom** [16:04 - 16:09]: But I did that I did it at two places seems like there.
**Niklas | matchicalcom** [16:09 - 16:11]: No, thank you.
**Niklas | matchicalcom** [16:11 - 16:12]: Thanks, Tommy.
**Niklas | matchicalcom** [16:13 - 16:19]: I was super worried about this yesterday, so I really checked it three times, because I was like Fuck it that is not working.
**Niklas | matchicalcom** [16:19 - 16:21]: No one can access their demand.
**Tommy | matchicalcom** [16:22 - 16:24]: No, actually no one, no.
**Konsti | matchicalcom** [16:25 - 16:26]: So I.
**Tommy | matchicalcom** [16:26 - 16:27]: But I can tell you there are.
**Niklas | matchicalcom** [16:28 - 16:34]: No, you can I just generated all of them for the current ones, just one second.
**Tommy | matchicalcom** [16:36 - 16:39]: It's only about three demands today.
**Niklas | matchicalcom** [16:40 - 16:43]: And now they have also a metad because I just triggered the six.
**Konsti | matchicalcom** [16:43 - 16:50]: There there's in the update action That's like bad design from my side.
**Konsti | matchicalcom** [16:50 - 16:50]: What I did.
**Konsti | matchicalcom** [16:50 - 16:52]: That's why you messed it up here.
**Niklas | matchicalcom** [16:54 - 16:55]: That's crazy.
**Niklas | matchicalcom** [16:55 - 16:56]: I switched it everywhere.
**Konsti | matchicalcom** [16:57 - 16:59]: Yeah, but it's in the update action.
**Konsti | matchicalcom** [16:59 - 17:01]: If you set it to mandatory, you receive it right away.
**Niklas | matchicalcom** [17:01 - 17:03]: It's in the update action.
**Konsti | matchicalcom** [17:06 - 17:09]: Set it to mandatory and you receive right away.
**Niklas | matchicalcom** [17:09 - 17:14]: Okay, But update demand shouldn't create a demand right?
**Konsti | matchicalcom** [17:14 - 17:20]: No, but it's overriding the demand completely, because at that point nothing is in the demand.
**Konsti | matchicalcom** [17:20 - 17:22]: So I'm just updating it with the new stuff.
**Konsti | matchicalcom** [17:23 - 17:25]: Yeah, bad design from my side.
**Konsti | matchicalcom** [17:25 - 17:26]: That's what I mentioned.
**Konsti | matchicalcom** [17:28 - 17:32]: But you can just generate a new MED ID there I did.
**Konsti | matchicalcom** [17:32 - 17:35]: Yeah, okay, send it to me.
**Niklas | matchicalcom** [17:35 - 17:37]: Sorry for the interruption I will then deploy.
**Konsti | matchicalcom** [17:37 - 17:41]: But now one question, Carlos, or at both of you.
**Konsti | matchicalcom** [17:41 - 17:48]: Like when I'm in the primary skill in the registry, or not in the registry, but in the skills.
**Konsti | matchicalcom** [17:48 - 17:59]: When I'm opening a primary skill, like Angular for example, even though it's primary, I can select the filter type and I can.
**Konsti | matchicalcom** [17:59 - 18:00]: Select the redirect.
**Konsti | matchicalcom** [18:00 - 18:01]: It doesn't work right?
**Konsti | matchicalcom** [18:01 - 18:02]: It doesn't forbid.
**Konsti | matchicalcom** [18:04 - 18:06]: Would be even better if you remove the options if it's primary.
**Konsti | matchicalcom** [18:07 - 18:11]: A skill that is primary, Cannot have a filter type and cannot be.
**Konsti | matchicalcom** [18:11 - 18:11]: Redirected.
**Konsti | matchicalcom** [18:12 - 18:12]: That's the only.
**Niklas | matchicalcom** [18:12 - 18:13]: But it's not possible.
**Niklas | matchicalcom** [18:13 - 18:15]: Is it it isn't?
**Konsti | matchicalcom** [18:15 - 18:17]: I did not test give me a second?
**Niklas | matchicalcom** [18:18 - 18:19]: No, of course, it's not.
**Niklas | matchicalcom** [18:19 - 18:21]: I mean, you don't even see the edit button.
**Konsti | matchicalcom** [18:24 - 18:28]: There is now I added a filter type.
**Konsti | matchicalcom** [18:28 - 18:30]: Is it autosafe the filter type?
**Niklas | matchicalcom** [18:31 - 18:31]: Yes.
**Konsti | matchicalcom** [18:32 - 18:33]: Yeah, it worked.
**Niklas | matchicalcom** [18:33 - 18:37]: I could, but you can set a filter type.
**Niklas | matchicalcom** [18:37 - 18:38]: What's the problem?
**Konsti | matchicalcom** [18:39 - 18:46]: No, not If something is primary, if something's primary, you cannot set a redirect and you cannot set a.
**Niklas | matchicalcom** [18:48 - 18:50]: Why can you not set a redirect?
**Niklas | matchicalcom** [18:50 - 18:50]: Of course?
**Niklas | matchicalcom** [18:50 - 18:51]: Why shouldn't you?
**Konsti | matchicalcom** [18:52 - 18:53]: Because it's primary.
**Konsti | matchicalcom** [18:53 - 18:56]: You cannot say this primary is redirected to something different.
**Niklas | matchicalcom** [18:57 - 18:59]: There is always the same concept.
**Konsti | matchicalcom** [19:01 - 19:02]: There is.
**Konsti | matchicalcom** [19:02 - 19:05]: Imagine you redirect the thing, then the primary is a redirect.
**Niklas | matchicalcom** [19:05 - 19:08]: No, but that is disallowed that I checked.
**Niklas | matchicalcom** [19:08 - 19:13]: We have that logic in that was logic.
**Niklas | matchicalcom** [19:13 - 19:14]: What I was saying There's a guide.
**Konsti | matchicalcom** [19:15 - 19:19]: Type is a very specific logic that cannot work for primaries.
**Konsti | matchicalcom** [19:20 - 19:21]: In this case I wasn't.
**Niklas | matchicalcom** [19:22 - 19:23]: But the redirect works.
**Niklas | matchicalcom** [19:23 - 19:24]: I'm confused.
**Konsti | matchicalcom** [19:25 - 19:26]: It's not allowed.
**Konsti | matchicalcom** [19:26 - 19:29]: Both are not allowed if it's primary, both are not allowed.
**Niklas | matchicalcom** [19:29 - 19:32]: But can you explain me why redirect is not allowed?
**Konsti | matchicalcom** [19:34 - 19:37]: OK, for sure, I mean, guys, we.
**Niklas | matchicalcom** [19:37 - 19:40]: Can also finish the daily and second.
**Konsti | matchicalcom** [19:40 - 19:49]: Like imagine you know what a redirect looks like, Right So where do we have it?
**Konsti | matchicalcom** [19:49 - 19:49]: Here?
**Niklas | matchicalcom** [19:52 - 19:53]: Driver's not connected.
**Niklas | matchicalcom** [19:53 - 19:53]: What?
**Niklas | matchicalcom** [20:02 - 20:03]: OK.
**Konsti | matchicalcom** [20:09 - 20:11]: Here, where's a redirect case?
**Konsti | matchicalcom** [20:12 - 20:16]: I'm scared to scare This one is a primary.
**Niklas | matchicalcom** [20:17 - 20:17]: Yes.
**Konsti | matchicalcom** [20:17 - 20:21]: And now it will become a redirect here doesn't it work.
**Konsti | matchicalcom** [20:22 - 20:27]: Each concept always needs to have one primary alias and this primary cannot be.
**Niklas | matchicalcom** [20:27 - 20:33]: A redirect, cannot be a redirect, cannot be a redirect.
**Konsti | matchicalcom** [20:33 - 20:34]: Yes.
**Konsti | matchicalcom** [20:34 - 20:41]: Imagine like you would say this one is now a redirect, then the primary would sit here and always redirect to epic.
**Niklas | matchicalcom** [20:41 - 20:41]: Yeah.
**Niklas | matchicalcom** [20:41 - 20:44]: But what is the problem of that that?
**Konsti | matchicalcom** [20:44 - 20:45]: It's unlogical and makes no sense.
**Niklas | matchicalcom** [20:47 - 20:48]: I don't know if it makes no.
**Konsti | matchicalcom** [20:48 - 20:53]: Sense, like how can it be that we say okay, they say it was apex.
**Niklas | matchicalcom** [20:53 - 20:57]: No, Of course, I was just thinking maybe the use case exists.
**Niklas | matchicalcom** [20:57 - 20:59]: But if you say no, then if.
**Konsti | matchicalcom** [20:59 - 21:06]: The use case would exist, what you would need if we redirect the primary, you would need to set this one to primary true where we redirect the two.
**Konsti | matchicalcom** [21:07 - 21:09]: This use case could exist, but we don't want to do.
**Konsti | matchicalcom** [21:10 - 21:11]: We do this and this and this.
**Konsti | matchicalcom** [21:11 - 21:13]: In this case you need to do it manually.
**Konsti | matchicalcom** [21:13 - 21:17]: First remove the redirect and the primary and then do the redirect.
**Niklas | matchicalcom** [21:18 - 21:21]: Okay, that we talked about.
**Konsti | matchicalcom** [21:23 - 21:26]: But the rest looks really good.
**Konsti | matchicalcom** [21:26 - 21:26]: Awesome.
**Niklas | matchicalcom** [21:27 - 21:30]: But that means redirect and filter type on primary is not.
**Niklas | matchicalcom** [21:30 - 21:31]: Allowed.
**Konsti | matchicalcom** [21:32 - 21:33]: Yes.
**Niklas | matchicalcom** [21:37 - 21:37]: Cool.
**Niklas | matchicalcom** [21:38 - 21:42]: And Carlos, did you check if the primary is changed?
**Niklas | matchicalcom** [21:42 - 21:45]: If it triggers now the updated AD, did you investigate that?
**Niklas | matchicalcom** [21:45 - 21:45]: Or?
**Konsti | matchicalcom** [21:47 - 21:47]: Yes.
**Carlos | matchicalcom** [21:48 - 21:49]: So yes.
**Carlos | matchicalcom** [21:49 - 21:55]: The problem yesterday it was on the query that was retrieving the data that we've talked about.
**Carlos | matchicalcom** [21:55 - 21:56]: That's the problem.
**Carlos | matchicalcom** [21:56 - 22:01]: So the graph was getting updated with the break and rate to look right.
**Carlos | matchicalcom** [22:02 - 22:06]: But the retrieval to the list it had the bug that I fixed yesterday.
**Niklas | matchicalcom** [22:07 - 22:08]: Okay.
**Konsti | matchicalcom** [22:10 - 22:14]: I would within the like today or tomorrow or the day after tomorrow.
**Konsti | matchicalcom** [22:14 - 22:25]: But definitely in this week I would clear once more the whole graph and registering and everything so that we can check with the new prompt sounds good.
**Konsti | matchicalcom** [22:25 - 22:27]: Just FYI hope this works for you.
**Niklas | matchicalcom** [22:30 - 22:30]: Good.
**Carlos | matchicalcom** [22:31 - 22:41]: At this point I think you can reset it and do whatever, because we are not planning to do additional developments right now on the admin, except some.
**Konsti | matchicalcom** [22:41 - 22:46]: Good, fixing, easy, cool, perfect, all right.
**Konsti | matchicalcom** [22:47 - 22:51]: Okay, then are we through Carlos Sorry, I think we interrupted you right?
**Carlos | matchicalcom** [22:51 - 22:53]: I just have one quick thing.
**Carlos | matchicalcom** [22:54 - 23:03]: I will be probably today trying to upload some files to AWS and I do not have access to AWS accounts.
**Carlos | matchicalcom** [23:03 - 23:07]: So if someone could create It would be nice so I can confirm that.
**Konsti | matchicalcom** [23:07 - 23:10]: The files are there one hundred percent.
**Carlos | matchicalcom** [23:13 - 23:15]: I think that's the busy piece right.
**Niklas | matchicalcom** [23:15 - 23:18]: Now for me and Chico.
**Carlos | matchicalcom** [23:18 - 23:19]: When do you have.
**Carlos | matchicalcom** [23:19 - 23:21]: I just got to the office.
**Carlos | matchicalcom** [23:21 - 23:24]: So when you have like five minutes, let's talk about the requirements.
**Carlos | matchicalcom** [23:25 - 23:28]: I have a couple of ideas, mainly terms of performance.
**Carlos | matchicalcom** [23:28 - 23:31]: I think there is an improvement that we can do, but I would like.
**Tommy | matchicalcom** [23:31 - 23:32]: To test it first.
**Carlos | matchicalcom** [23:32 - 23:34]: So let's talk first.
**Carlos | matchicalcom** [23:35 - 23:37]: And when we have a little bit.
**Niklas | matchicalcom** [23:37 - 24:04]: And for sure my plan today would be to use the whole morning until lunchtime really to also work on that whole notification, on that user story, right that we yesterday discussed and then the afternoon I would work on the other thing, because I don't know how much time it will take and then maybe I switch afterwards again so I'm available.
**Niklas | matchicalcom** [24:05 - 24:06]: We can totally focus on that.
**Carlos | matchicalcom** [24:08 - 24:11]: Just after this finishes.
**Carlos | matchicalcom** [24:11 - 24:15]: Okay, sorry, I'm saying that I will.
**Niklas | matchicalcom** [24:15 - 24:19]: Call you in a few minutes just anytime I'm available.
**Niklas | matchicalcom** [24:20 - 24:23]: I try to not until then.
**Niklas | matchicalcom** [24:23 - 24:24]: See you.
**Tommy | matchicalcom** [24:24 - 24:25]: Everything's working now.
**Tommy | matchicalcom** [24:25 - 24:29]: So the new, the new, also Chico, or is it deployed now?
**Konsti | matchicalcom** [24:31 - 24:33]: Stay in the call for a second.
**Niklas | matchicalcom** [24:34 - 24:36]: Okay, then guys we speak.
**Niklas | matchicalcom** [24:36 - 24:38]: Have a great day, have a great day.
**Tommy | matchicalcom** [24:38 - 24:39]: See you later.
**Konsti | matchicalcom** [24:39 - 24:40]: Bye bye.
**Konsti | matchicalcom** [24:43 - 24:44]: Okay, can you share the screen for a second?
**Konsti | matchicalcom** [24:44 - 24:45]: Please.
**Niklas | matchicalcom** [24:46 - 24:46]: Yes.
**Niklas | matchicalcom** [25:04 - 25:05]: Was soll ich dir zeigen?
**Konsti | matchicalcom** [25:06 - 25:08]: Achso, einfach nur kurz, was du angepasst.
**Niklas | matchicalcom** [25:08 - 25:13]: Hast, einfach nur die Mat ID hinzugefügt, da wo der Fehler aufgetreten ist, einfach.
**Konsti | matchicalcom** [25:13 - 25:15]: Noch mal eine neue generiert, oder?
**Niklas | matchicalcom** [25:15 - 25:16]: Ja, genau.
**Konsti | matchicalcom** [25:16 - 25:17]: Easy.
**Konsti | matchicalcom** [25:17 - 25:19]: Ja, dann ist halt theoretisch, wenn du dir die.
**Konsti | matchicalcom** [25:20 - 25:22]: Und dann wird später nochmal eine neue generiert.
**Niklas | matchicalcom** [25:23 - 25:26]: Ist ein bisschen paid, aber ist egal.
**Niklas | matchicalcom** [25:26 - 25:27]: Just to be sure.
**Niklas | matchicalcom** [25:27 - 25:32]: Vielleicht kostet mal Create update demand, ohne dass es über den Flow kommt.
**Niklas | matchicalcom** [25:37 - 25:38]: Vielleicht erstellst du ja mal.
**Niklas | matchicalcom** [25:39 - 25:41]: Nimm die mal, ohne dass es so über den Flow kommt.
**Niklas | matchicalcom** [25:41 - 25:43]: Wenn wir später vergiss das.
**Konsti | matchicalcom** [25:43 - 25:45]: Wenn ich das auf Workflows umziehe, werde ich einige Floors beseitigen.
**Niklas | matchicalcom** [25:45 - 25:50]: Ja, ja, aber deswegen macht schon Sinn, da einfach nochmal doppelt eine zu generieren.
**Niklas | matchicalcom** [25:50 - 26:09]: Die Frage ist, ob wir hier den Failsafe hinmachen sollen, dass wenn du, wenn du jetzt was Primary setzen willst, dann darfst du das ja nur machen, wenn es da müssen wir eigentlich dort den Filtertype und das Redirect clearen.
**Konsti | matchicalcom** [26:12 - 26:18]: In der Liste, in der du Primary setzen kannst, dürften gar keine Redirect drin sein aktuell, oder?
**Niklas | matchicalcom** [26:20 - 26:24]: Das stimmt, aber es dürften Sachen mit Filtertype drin sein.
**Konsti | matchicalcom** [26:24 - 26:28]: Sachen mit Filtertype ist natürlich nicht optimal, die müsste man.
**Niklas | matchicalcom** [26:30 - 26:31]: Da müssen wir halt einfach machen.
**Niklas | matchicalcom** [26:31 - 26:33]: Hey, wenn wir den.
**Niklas | matchicalcom** [26:34 - 26:35]: Es macht ja Sinn, oder?
**Niklas | matchicalcom** [26:35 - 26:35]: Wenn du da.
**Konsti | matchicalcom** [26:36 - 26:41]: Also einfach nur, du musst nicht mal clearen, mach einfach, verbiet die Action und gib eine Fehlermeldung zurück.
**Konsti | matchicalcom** [26:41 - 26:43]: Das ist ein filtertype.
**Niklas | matchicalcom** [26:43 - 26:44]: Warum clearen wir es nicht einfach?
**Niklas | matchicalcom** [26:44 - 26:47]: Wir haben die Logik schon da, Es ist super einfach das zu klären.
**Niklas | matchicalcom** [26:49 - 26:52]: Machen hier einfach change filtertype und der ist leer.
**Konsti | matchicalcom** [26:52 - 26:55]: Okay, dann passiert.
**Niklas | matchicalcom** [26:55 - 26:57]: Okay, da mache ich das rein.
**Niklas | matchicalcom** [26:57 - 26:58]: Aber was machen wir nur kurz?
**Niklas | matchicalcom** [26:58 - 26:59]: Ich muss mal kurz gucken.
**Niklas | matchicalcom** [26:59 - 27:03]: Wir holen uns den Skill, die Connection mit alias off.
**Niklas | matchicalcom** [27:03 - 27:04]: Ah, OK.
**Niklas | matchicalcom** [27:04 - 27:04]: Schau mal.
**Niklas | matchicalcom** [27:04 - 27:11]: Also um was Primal zu machen, muss sie die Connection alias off haben, sonst funktioniert es gar nicht.
**Niklas | matchicalcom** [27:13 - 27:14]: Konsti.
**Niklas | matchicalcom** [27:17 - 27:25]: Wir haben momentan schon die Logik drin, dass du was in Primary setzen kannst, Wenn, wenn es eine alias off Beziehung dazu hat.
**Konsti | matchicalcom** [27:29 - 27:29]: Richtig.
**Konsti | matchicalcom** [27:29 - 27:31]: Das heißt redirect passiert schon mal nicht.
**Niklas | matchicalcom** [27:32 - 27:32]: Genau.
**Konsti | matchicalcom** [27:33 - 27:35]: Das heißt, es geht nur um den filtertype.
**Niklas | matchicalcom** [27:35 - 27:37]: Perfekt, perfekt.
**Niklas | matchicalcom** [27:40 - 27:48]: Dann mache ich hier change Filter Type Filter Typen und Identifier.
**Konsti | matchicalcom** [27:54 - 27:55]: Okay, ich mach auch weiter, gell?
**Niklas | matchicalcom** [27:56 - 27:58]: Ja, was wolltest du denn mit mir reden?
**Konsti | matchicalcom** [27:58 - 27:59]: Nur das.
**Konsti | matchicalcom** [28:03 - 28:05]: OK, sonst alles gut bei dir.
**Niklas | matchicalcom** [28:09 - 28:13]: Alles bestens, ne?
**Niklas | matchicalcom** [28:14 - 28:16]: Bei mir ist sonst alles bestens.
**Niklas | matchicalcom** [28:16 - 28:20]: Ich bin richtig hype, das neue Feature da jetzt anzugehen, weil das ist mal ein neues Feature.
**Niklas | matchicalcom** [28:20 - 28:25]: Also das Admin K ist auch ein neues Feature, aber trotzdem auch ein neues Feature eben.
**Konsti | matchicalcom** [28:25 - 28:27]: Aber das habt ihr gut gemacht, ging schnell.
**Niklas | matchicalcom** [28:27 - 28:31]: Ja, aber jetzt geht es mal hier richtig auch ans Frontend und zwar ans coole Frontend.
**Niklas | matchicalcom** [28:31 - 28:33]: Deswegen wird spannend.
**Niklas | matchicalcom** [28:34 - 28:35]: Muss jetzt nur dann gleich mal mit Carlos reden.
**Niklas | matchicalcom** [28:35 - 28:45]: Wir müssen mal schauen, wie das gut aufsplitten, weil so wie es mir rüberkommt, ist irgendwie die Story zu 90 Prozent eigentlich Visuals, also Frontend Zeug.
**Niklas | matchicalcom** [28:46 - 28:48]: Also was war mein Gedankengang?
**Niklas | matchicalcom** [28:48 - 28:52]: Wir fügen einen Status, wir fügen viele neue Statusse hinzu für jeden Consultant.
**Niklas | matchicalcom** [28:52 - 28:55]: Also zum Beispiel, Hey, dein Parsing hat gestartet.
**Niklas | matchicalcom** [28:55 - 29:01]: Hey, der Duplicate Check, Possible Duplicate, oder?
**Niklas | matchicalcom** [29:01 - 29:02]: Das machen wir alles mit Status.
**Konsti | matchicalcom** [29:02 - 29:03]: Ja, richtig.
**Konsti | matchicalcom** [29:03 - 29:05]: Aber die sollten wir zusammen besprechen.
**Niklas | matchicalcom** [29:08 - 29:15]: Ich wollte wieder erst eine Liste generieren und dann die mal kurz zurückhauen zu dir, aber wir können es gerne noch.
**Konsti | matchicalcom** [29:15 - 29:18]: Mal zusammen besprechen, oder Lass mal so machen.
**Konsti | matchicalcom** [29:19 - 29:28]: Wir müssen die Status mal alle gegeneinander checken, weißt du, Das heißt, und das kriegen wir jetzt nicht auf die Schnelle hin.
**Konsti | matchicalcom** [29:28 - 29:30]: Wir wollen ja nicht, dass du dein Bottleneck hast.
**Konsti | matchicalcom** [29:31 - 29:34]: Erstell den Status, aber stell ihn auf CV Parser Level.
**Niklas | matchicalcom** [29:39 - 29:39]: Warum?
**Konsti | matchicalcom** [29:41 - 29:47]: Damit du nicht irgendwie nochmal einen weiteren Status beim Consultant hast, der mit irgendwas reinmixt, was wir nicht haben wollen.
**Konsti | matchicalcom** [29:48 - 29:54]: Weil beim Consultant gibt es schon Status, die Konsequenzen darauf haben, wo man was sieht und so weiter und so fort.
**Niklas | matchicalcom** [29:56 - 29:59]: Also macht es aber dann sollten wir.
**Niklas | matchicalcom** [29:59 - 30:02]: Aber macht es generell Sinn, das beim Consultant rein zu machen?
**Konsti | matchicalcom** [30:04 - 30:07]: Es macht mehr Sinn, es beim Consultant zu haben als beim CV Parser.
**Konsti | matchicalcom** [30:07 - 30:11]: Bin ich auch bei dir, aber for now machst du einfach zum CV Parser.
**Niklas | matchicalcom** [30:12 - 30:12]: Okay.
**Niklas | matchicalcom** [30:12 - 30:16]: Ja, aber dann denken wir sie schon mal generell, wie sie beim Consultant heißen würden.
**Niklas | matchicalcom** [30:20 - 30:21]: Ne, macht Sinn.
**Konsti | matchicalcom** [30:23 - 30:27]: Wir können es auf jeden Fall machen und dann können wir sie ja danach vom CV Pass einfach zum Consultant rüberziehen.
**Niklas | matchicalcom** [30:27 - 30:35]: Genau, unser Plan ist eh mit diesem Feature, weil das wird ja schon ein paar Tage in Anspruch nehmen und bestimmte Zeit viel mit Feature Toggle zu arbeiten.
**Niklas | matchicalcom** [30:35 - 30:37]: Also wir machen alles mit Feature Toggle.
**Konsti | matchicalcom** [30:37 - 30:43]: Könnt ihr euch da gut aufteilen, Weil wenn du sagst, das ist ein Feature, da kann man sich nicht gut aufteilen, dann arbeitet halt nur einer dran.
**Niklas | matchicalcom** [30:44 - 30:46]: Ja, aber deswegen, das müssen wir mal besprechen.
**Niklas | matchicalcom** [30:46 - 30:49]: Aber wahrscheinlich kann man schon irgendwo aufteilen, weil ich mein.
**Niklas | matchicalcom** [30:49 - 30:51]: Aber was hat man von der Logik?
**Niklas | matchicalcom** [30:51 - 31:00]: Man hat halt die ganze Logik mit, hey, wir haben die verschiedenen Statusse und je nachdem, was für einen Status hast, zeigst du im Frontend halt was anderes an und das triggert im Frontend einen anderen.
**Niklas | matchicalcom** [31:01 - 31:03]: Das ist aber eigentlich alles Frontend technisch.
**Niklas | matchicalcom** [31:03 - 31:06]: Was wir auch noch haben, ist der Document Check.
**Niklas | matchicalcom** [31:06 - 31:09]: Den kann Carlos auf jeden Fall machen mit diesem MD Phishing.
**Niklas | matchicalcom** [31:09 - 31:11]: Davon hat er eh schon mal geredet.
**Niklas | matchicalcom** [31:12 - 31:20]: Und dann gibt es halt so gesehen noch die Dinge, dass man halt aufsplittet, hey, wir machen erst den Flow, bis die Metadaten ausgelesen ist.
**Niklas | matchicalcom** [31:20 - 31:23]: Da kommt dann als Result halt ein Status, wird gesetzt.
**Niklas | matchicalcom** [31:23 - 31:33]: Entweder hey, Parsing geht weiter und das triggert dann den Parsing Flow oder du setzt einen Status und wenn den Status setzt, können wir es ja dann im Frontend fetchen.
**Niklas | matchicalcom** [31:34 - 31:39]: Die Logik muss rein und das war es eigentlich relativ.
**Niklas | matchicalcom** [31:43 - 31:44]: Oder vertue ich mich?
**Niklas | matchicalcom** [31:44 - 31:45]: Also so ist es ja effektiv.
**Niklas | matchicalcom** [31:50 - 31:51]: Es ist gerade auch noch ein bisschen.
**Konsti | matchicalcom** [31:51 - 32:05]: Irgendwie macht es schon mehr Sinn, dass der Status beim Consultant ist, weil wie gesagt, vom Status, der beim Consultant ist, hängt ab, ob wenn du mal, geh mal in Autist oder ich zeige es mal hier kurz.
**Niklas | matchicalcom** [32:06 - 32:10]: Ja, wir können ja mehrere Statusse dann einführen und sagen halt dann einfach ist active.
**Konsti | matchicalcom** [32:11 - 32:12]: Das macht Sinn, dass es nur ein Status ist.
**Niklas | matchicalcom** [32:12 - 32:16]: Ja, und ist active, machen wir den Consultant.
**Konsti | matchicalcom** [32:16 - 32:18]: Wir haben hier den Status ID.
**Konsti | matchicalcom** [32:19 - 32:30]: Beim Consultant ist es und für diesen Consultant, da musst du halt gucken, wo ich diesen Status überall einsetze, benutze, aber ich benutze diesen Status an mehreren Standardeffekte.
**Niklas | matchicalcom** [32:30 - 32:33]: Ja, vor allem beim Querien und so verwenden wir es.
**Konsti | matchicalcom** [32:33 - 32:35]: Consultant active.
**Niklas | matchicalcom** [32:37 - 32:38]: Not available.
**Niklas | matchicalcom** [32:38 - 32:39]: Pending merge.
**Niklas | matchicalcom** [32:41 - 32:42]: Pending merge tun wir gerade.
**Niklas | matchicalcom** [32:42 - 32:45]: Ach, pending merge ist, wenn es gerade im Merging Prozess ist.
**Konsti | matchicalcom** [32:45 - 32:47]: Wichtig ist, dass du auf dieses Ding hier achtest.
**Konsti | matchicalcom** [32:47 - 32:48]: Active oder nicht active.
**Konsti | matchicalcom** [32:48 - 32:53]: Wenn du einen Status einführst, der active false ist, wird er nicht in der ListView angezeigt.
**Konsti | matchicalcom** [32:53 - 32:54]: Und das ist ja das, was du eigentlich möchtest.
**Niklas | matchicalcom** [32:58 - 33:00]: Aber nicht nur das, sondern wir müssen dann auch prüfen.
**Niklas | matchicalcom** [33:00 - 33:06]: Beim Mergen darfst du, weil da siehst du auch glaube ich welche, die, ne, da dürftest du eigentlich nur welche sein.
**Konsti | matchicalcom** [33:06 - 33:09]: Die stattdessen diesen Status und das ist ein Fail.
**Konsti | matchicalcom** [33:09 - 33:10]: So, was müssen wir beheben?
**Konsti | matchicalcom** [33:10 - 33:13]: Es gibt noch einen isActive und is ready.
**Niklas | matchicalcom** [33:15 - 33:16]: Das ist ein mega Fail und das.
**Konsti | matchicalcom** [33:16 - 33:32]: Ist ein Riesenfail, weil isActive ist sozusagen, isActive heißt sozusagen, das ist, wenn es ein Consultancy User ist, kann es sein, dass dein Consultant gar nicht active ist, dass du einfach, du bist ein Consultancy User ohne Consultant.
**Niklas | matchicalcom** [33:34 - 33:38]: Ja, das brauchen wir aber, ja, also das ist so gesehen, der ist immer.
**Konsti | matchicalcom** [33:38 - 33:39]: Noch einfach in den Status ziehen.
**Niklas | matchicalcom** [33:42 - 33:42]: Das.
**Konsti | matchicalcom** [33:42 - 33:47]: Muss nicht extra ein extra Boolean sein, nur speziell für das und ist ready ist basically der CV Parser ist ready oder nicht.
**Konsti | matchicalcom** [33:48 - 33:51]: Könnte man auch, sollte man auch in den Status ziehen und sollte auf der.
**Niklas | matchicalcom** [33:51 - 33:56]: Basis kann man das in den Status.
**Konsti | matchicalcom** [33:56 - 34:01]: Ziehen, ja, weil dann ist der Status einfach CV Parser processing und der ist auf active false.
**Niklas | matchicalcom** [34:04 - 34:07]: Ja, aber wenn der CV Parser ready ist, zu was wird er dann gemacht?
**Niklas | matchicalcom** [34:10 - 34:10]: CV pass.
**Niklas | matchicalcom** [34:11 - 34:17]: Aber wir brauchen ja auch einfach einen Status mit hey, der CV ist, ich weiß nicht, ob wir mit einem, der.
**Konsti | matchicalcom** [34:17 - 34:24]: Muss nicht auf CV pass sein, der kann dann auch einfach auf consultant new sein zum Beispiel oder wie auch immer du den Status nennen willst.
**Niklas | matchicalcom** [34:26 - 34:28]: OK, Glaubst du echt, wir kommen mit.
**Konsti | matchicalcom** [34:28 - 34:31]: Einem Feld hin, es geht über einen Status.
**Konsti | matchicalcom** [34:31 - 34:33]: Du kannst ja, du hast ja.
**Niklas | matchicalcom** [34:35 - 34:40]: Umso komplexer, weil sie halt immer zwei Szenarien manchmal vielleicht belegen, weißt du, aber dafür.
**Konsti | matchicalcom** [34:40 - 34:42]: Können ja Status auch noch verschiedene Dings hier haben.
**Konsti | matchicalcom** [34:42 - 34:43]: Ist active.
**Konsti | matchicalcom** [34:44 - 34:46]: Du hast sozusagen auf Statuslevel nochmal ein Boolean.
**Konsti | matchicalcom** [34:46 - 34:48]: Wenn du nochmal zusätzlich ein Boolean brauchst.
**Konsti | matchicalcom** [34:48 - 34:53]: Ich habe ja human approved reingepackt den können wir in Zukunft bald mal weghauen, der braucht es gar nicht mehr, habe ich falsch gedacht.
**Konsti | matchicalcom** [34:54 - 34:58]: IsResolve brauch zum Beispiel, weil IsResolved benutze ich, um zu schauen.
**Konsti | matchicalcom** [34:59 - 35:04]: Theoretisch könnte ich auch für ISResolved einfach IS Active nehmen, also sozusagen statt IS Resolved hier.
**Konsti | matchicalcom** [35:04 - 35:05]: Was habe ich bei den Skills?
**Konsti | matchicalcom** [35:06 - 35:10]: Ich habe halt iResolve genommen, weil es für mich sinniger war.
**Konsti | matchicalcom** [35:10 - 35:12]: Aber theoretisch könnte ich auch statt iResolve.
**Konsti | matchicalcom** [35:15 - 35:19]: Aber meistens brauchst du nur einen einzigen Boolean zusätzlich noch zu deinem Status.
**Konsti | matchicalcom** [35:19 - 35:22]: Ist das jetzt ein aktiver Status oder ein nicht aktiver Status?
**Konsti | matchicalcom** [35:22 - 35:26]: Wenn es wirklich mal einen Case gibt, wo du sagst, ich brauche noch einen zweiten Boolean, dann sag mir auf jeden Fall Bescheid, dann sollten wir das besprechen.
**Niklas | matchicalcom** [35:29 - 35:29]: Passt.
**Niklas | matchicalcom** [35:29 - 35:39]: Ich mache auch Overhaul Check Current Consultant Status Logic.
**Konsti | matchicalcom** [35:41 - 35:45]: Ja, mit iReady und iSactive, aber das musst du dann überall anschauen.
**Konsti | matchicalcom** [35:47 - 35:49]: Also nimm dir da ein bisschen Zeit für.
**Niklas | matchicalcom** [35:49 - 35:50]: Ja, auf jeden Fall.
**Niklas | matchicalcom** [35:51 - 35:57]: Und dann overall, also is ready und is, was ist das andere?
**Konsti | matchicalcom** [35:58 - 36:01]: Können wir beides, kann alles in die.
**Niklas | matchicalcom** [36:01 - 36:01]: Status.
**Konsti | matchicalcom** [36:03 - 36:04]: Brauchen wir.
**Niklas | matchicalcom** [36:06 - 36:09]: Isactive brauchen wir ja.
**Konsti | matchicalcom** [36:09 - 36:11]: Der Status, Da gibt es einfach einen Status.
**Konsti | matchicalcom** [36:11 - 36:15]: Inactive consultancy user oder inactive consultant.
**Niklas | matchicalcom** [36:16 - 36:18]: Deswegen die beiden brauchen wir nicht, wir.
**Konsti | matchicalcom** [36:18 - 36:21]: Brauchen die Booleans nicht, aber wir brauchen dafür den Status.
**Niklas | matchicalcom** [36:21 - 36:22]: Ja, ja, aber wir brauchen die Bodenliegen.
**Konsti | matchicalcom** [36:23 - 36:30]: Also für active brauchen wir einen extra Status und zwar einfach inactive consultant, dann ist active false abgedeckt.
**Konsti | matchicalcom** [36:30 - 36:32]: Ansonsten ist es ja immer active true.
**Konsti | matchicalcom** [36:33 - 36:35]: Das heißt für active brauchen wir einen eigenen Status.
**Konsti | matchicalcom** [36:35 - 36:39]: Für iReady brauchen wir keinen Status, weil iReady lösen wir über.
**Konsti | matchicalcom** [36:39 - 36:44]: Es gibt gewisse Status, die sagen, ab da ist er ready und andere Status sagen, ab da ist er nicht ready.
**Niklas | matchicalcom** [36:49 - 36:53]: Active und die andere ist ready.
**Niklas | matchicalcom** [36:56 - 37:10]: Okay, Ist active, Ist dieser Ding oder dieser Boolean?
**Niklas | matchicalcom** [37:10 - 37:10]: Wie heißt der?
**Konsti | matchicalcom** [37:11 - 37:12]: Ist active und is ready?
**Niklas | matchicalcom** [37:12 - 37:15]: It's active, ne?
**Niklas | matchicalcom** [37:15 - 37:18]: Genau, Aber das ist unser Ding, deswegen wir gehen das jetzt mal an.
**Niklas | matchicalcom** [37:18 - 37:19]: Wir klammern das mal auf.
**Konsti | matchicalcom** [37:20 - 37:28]: Es macht schon Sinn, auch wenn es nicht so viel aufzuteilen gibt, nimmt Carlos schon mit, weil der einige Sachen noch nicht versteht, die auf jeden Fall.
**Niklas | matchicalcom** [37:28 - 37:30]: Deswegen auf keinen Fall.
**Niklas | matchicalcom** [37:30 - 37:34]: Ich will es auch nicht sagen, dass hey, lass verschiedene machen, weil das ist effizienter, sondern ich glaube, das ist eine gute Sache.
**Niklas | matchicalcom** [37:34 - 37:40]: Wir müssen halt einfach nur schauen, was Macht Sinn, Was macht Sinn?
**Niklas | matchicalcom** [37:40 - 37:44]: Wie aufzusplitten, aber wir finden es schon.
**Niklas | matchicalcom** [37:44 - 37:47]: Also genau, Carlos kann ja auch Frontend machen, das kriegt er auch.
**Niklas | matchicalcom** [37:47 - 37:51]: Ja eben, wir kriegen das hin.
**Niklas | matchicalcom** [37:51 - 37:51]: Wird cool.
**Niklas | matchicalcom** [37:51 - 37:53]: Der callt mich jetzt sicher jede Sekunde.
**Niklas | matchicalcom** [37:53 - 37:54]: Deswegen.
**Niklas | matchicalcom** [37:54 - 37:55]: Dann gehen wir.
**Konsti | matchicalcom** [37:58 - 38:08]: Das CV Parser Entity, die werde ich, wenn ich den neuen CV Parser Flow aufsetze auf Workflows und Co.
**Konsti | matchicalcom** [38:11 - 38:15]: Dann werde ich eine neue Entity erstellen, die heißt dann CV Parser New.
**Niklas | matchicalcom** [38:17 - 38:17]: O.
**Konsti | matchicalcom** [38:20 - 38:27]: Einfach damit ich da rumspielen kann, ohne dass ich mit dem alten Messe passt.
**Niklas | matchicalcom** [38:27 - 38:31]: Aber du wirst diesen CV Parser, glaube ich, nie mehr renamen können Zu CV.
**Konsti | matchicalcom** [38:31 - 38:35]: Parser oder Objects kannst du immer hier kannst du immer sofort rename.
**Niklas | matchicalcom** [38:36 - 38:40]: Okay, wir werden zu einem Namen, den man früher schon hatte.
**Konsti | matchicalcom** [38:41 - 38:42]: Doch, das geht auch.
**Konsti | matchicalcom** [38:42 - 38:44]: Das geht nur mit Attributes nicht.
**Konsti | matchicalcom** [38:47 - 38:50]: Wir werden auch den CV Par so ein bisschen gucken, wie wir das machen.
**Konsti | matchicalcom** [38:50 - 38:52]: Der ist ja dann irgendwann ist der deprecated.
**Konsti | matchicalcom** [38:52 - 38:54]: Wir müssen nur schauen, dass wir Files rüberschieben oder so.
**Niklas | matchicalcom** [38:59 - 39:00]: Machen wir Step by Step.
**Niklas | matchicalcom** [39:00 - 39:05]: Du mal dann an deine Prompts und an die anderen Sachen Gruppe wirklich zu schauen.
**Konsti | matchicalcom** [39:06 - 39:16]: Ich bin irgendwie gerade ein bisschen so overwhelmed, weil ich das Gefühl habe, dass alles, was ich jetzt anzugehen habe, einfach riesig aufwendig ist und paar Wochen Fokus braucht und ich habe das Gefühl, ich kriege den Fokus nicht.
**Niklas | matchicalcom** [39:17 - 39:21]: Mach Doch mal kurz 10 Minuten Pause, spiel deinem Kopf durch, da musst du.
**Konsti | matchicalcom** [39:21 - 39:22]: Gerade keine Sorgen machen.
**Konsti | matchicalcom** [39:24 - 39:26]: Ich mach mehr als genug Pause, da musst du dir gerade keine Sorgen machen.
**Niklas | matchicalcom** [39:27 - 39:28]: Easy.
**Niklas | matchicalcom** [39:28 - 39:30]: Ja, sag, wenn man dich irgendwie unterstützen kann.
**Konsti | matchicalcom** [39:30 - 39:30]: Alles gut.
**Konsti | matchicalcom** [39:30 - 39:31]: Danke, danke.
**Niklas | matchicalcom** [39:32 - 39:32]: Gut.
**Niklas | matchicalcom** [39:32 - 39:35]: Ich schaue mir das auf jeden Fall nach mit dem Morgen.
**Niklas | matchicalcom** [39:35 - 39:37]: Haben wir das dann das Meeting oder haben die geantwortet?
**Konsti | matchicalcom** [39:39 - 39:41]: Wer noch niemand hat geantwortet?
**Niklas | matchicalcom** [39:44 - 39:45]: Okay, noch niemand.
**Niklas | matchicalcom** [39:50 - 39:53]: Ich hatte einen unserer Kollegen, Magical noch.
**Konsti | matchicalcom** [39:53 - 39:56]: Mal kurz gezeigt, wie sie Top.
**Konsti | matchicalcom** [39:56 - 39:58]: Gut, dann sprechen wir uns, gell?
**Niklas | matchicalcom** [39:58 - 40:00]: Okay, Kon, ich wünsche dir einen ganz schönen Tag.
**Niklas | matchicalcom** [40:01 - 40:05]: Wird cool und du haust rein, gell?
**Niklas | matchicalcom** [40:05 - 40:09]: Sprechen uns dann am Nachmittag.
