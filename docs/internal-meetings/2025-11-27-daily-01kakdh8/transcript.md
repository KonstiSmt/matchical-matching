# Daily

**Konsti | matchicalcom** [00:00 - 00:01]: Up so bad.
**Carlos | matchicalcom** [00:04 - 00:06]: What happened?
**Konsti | matchicalcom** [00:06 - 00:07]: Okay, what happened?
**Konsti | matchicalcom** [00:07 - 00:19]: Like a user reported us the following, like basically a user reported us this thing here and like, ah, did you release a new feature?
**Konsti | matchicalcom** [00:19 - 00:21]: Looks not really ready?
**Konsti | matchicalcom** [00:21 - 00:22]: Like what's going on?
**Carlos | matchicalcom** [00:22 - 00:24]: No, yeah, that wasn't.
**Carlos | matchicalcom** [00:24 - 00:27]: Whoa, that was fluke just for me wasn't it?
**Konsti | matchicalcom** [00:28 - 00:30]: No, it's something different.
**Konsti | matchicalcom** [00:30 - 00:39]: Long story short, this is hidden by a feature together, yeah, okay, and then we started like why is he seeing the feature target?
**Konsti | matchicalcom** [00:40 - 00:47]: And then we dig deeper and then we realized, where is it here?
**Konsti | matchicalcom** [00:47 - 00:52]: In your get user email, you cache this action, right right?
**Konsti | matchicalcom** [00:53 - 00:59]: This action had no input we added this input currently because it was cached for everyone.
**Carlos | matchicalcom** [01:02 - 01:22]: Okay, yeah, yes, because you shouldn't should never have get user ID as an input, because for security reasons should always be calculated, but yes, in terms of cache, yep, makes sense, yeah, yeah.
**Konsti | matchicalcom** [01:22 - 01:26]: So yeah, I know that we only can use this action in the back end in this case.
**Konsti | matchicalcom** [01:26 - 01:28]: When we do like get to be.
**Carlos | matchicalcom** [01:28 - 01:29]: Careful exposing that one.
**Konsti | matchicalcom** [01:30 - 01:34]: Yeah, what we basically did is like exactly this get userbyid here as an input.
**Carlos | matchicalcom** [01:36 - 01:57]: But yeah, OK, I thought it was what I was doing yesterday because it's protected just for me and something, but so that it was like yesterday on Mondays, on Sundays, Sunday's deploy, right?
**Konsti | matchicalcom** [01:57 - 02:06]: Yeah, this kind of cost that for example I went in when there was nothing cached, I was like admin user have a lot of feature targets always my email.
**Konsti | matchicalcom** [02:06 - 02:10]: And then other ones were seeing these as well for the next ten minutes not too.
**Konsti | matchicalcom** [02:10 - 02:14]: Bad because we don't have too many feature targets, especially not breaking ones.
**Konsti | matchicalcom** [02:15 - 02:18]: Luckily we catch it quite fast, but it was like so what the.
**Carlos | matchicalcom** [02:22 - 02:24]: When we build code, we make mistakes.
**Konsti | matchicalcom** [02:24 - 02:32]: Yeah, yeah, so no worries, but no, it could have gone very bad, but.
**Carlos | matchicalcom** [02:32 - 02:44]: If it was some, yeah, some critical functionality or something it would be would be available to to everyone, yep, yeah.
**Konsti | matchicalcom** [02:44 - 02:46]: But no worries, no worries and every.
**Carlos | matchicalcom** [02:46 - 02:47]: Ten minutes the system.
**Carlos | matchicalcom** [02:47 - 02:49]: Would behave differently that would be fun.
**Konsti | matchicalcom** [02:51 - 02:55]: Oh wow, let's roll the dice, right, right?
**Carlos | matchicalcom** [02:55 - 02:57]: Just a fun feature.
**Konsti | matchicalcom** [03:01 - 03:02]: Okay, cool.
**Konsti | matchicalcom** [03:03 - 03:04]: Tommy, what's up?
**Konsti | matchicalcom** [03:08 - 03:11]: Okay, I think Tommy is still working on a thing that he needs to fix.
**Tommy | matchicalcom** [03:14 - 03:15]: And then I will go.
**Tommy | matchicalcom** [03:16 - 03:19]: Okay, I think actually can you hear me?
**Tommy | matchicalcom** [03:19 - 03:20]: Good morning, Carlos.
**Carlos | matchicalcom** [03:20 - 03:22]: Yes, good morning, Tommy.
**Konsti | matchicalcom** [03:22 - 03:23]: Who's the first one?
**Konsti | matchicalcom** [03:23 - 03:24]: I think you are the first one.
**Konsti | matchicalcom** [03:24 - 03:28]: Let's push this with you, because we really need to be done in ten minutes.
**Tommy | matchicalcom** [03:29 - 03:30]: In six minutes.
**Konsti | matchicalcom** [03:33 - 03:34]: Thanks for you have.
**Tommy | matchicalcom** [03:34 - 03:47]: One point five minutes left, yeah, so we had yesterday I start, I have to start off, yeah, yesterday we had two potential client meetings and we fixed.
**Tommy | matchicalcom** [03:47 - 03:54]: One onboarding for day, for the day it's in twenty five minutes, so we will onboard them as well.
**Tommy | matchicalcom** [03:54 - 04:30]: The other ones are, yeah, just we had a meeting, but now they do have some requests on it, but but after that I also provided some changes in the template for them and yeah, and that was actually my day yesterday crazy, and some minor stuff, so what it's going on today, So we actually do have a bug on the Wavestone side and that must.
**Tommy | matchicalcom** [04:30 - 04:32]: Be fixed soon.
**Tommy | matchicalcom** [04:32 - 04:55]: Then I have to set up the tenant for the guys in twenty five minutes, Then we do have this onboarding, then I have to prepare the meeting with bridging it we have in the afternoon, because there we have a two hours workshop on the interfaces and after that we will see what will happen and what will stay on the road.
**Tommy | matchicalcom** [04:55 - 05:06]: Until the time Carsten Schindler, he's one of our contact person at British.
**Niklas | matchicalcom** [05:06 - 05:09]: Okay, time's up, How is bridging the interface meeting?
**Konsti | matchicalcom** [05:10 - 05:12]: Okay, what did I do yesterday?
**Konsti | matchicalcom** [05:12 - 05:41]: Pretty similar to Tommy, like the meetings we shared was quite good, I would say and then I worked on the pipeline like a new setup for increasing quality and yeah did work in the end almost, but just minor bugs, but then I fix them tomorrow already at this morning already, we have a very nasty back bug regarding, like certain features, like and like.
**Konsti | matchicalcom** [05:41 - 05:59]: It was first time in my life that I was looking, like in my life, first time in my out systems career, that I was looking for something for over one hour and still had zero clue where it's coming from, yeah, but it's a little bit due to the spaghetti code I produced in the demand parser.
**Konsti | matchicalcom** [05:59 - 06:18]: If we would have this in a good orchestration layer, so with workflows for example, would be super straightforward, but yeah, now we just need to fix that shit and don't touch it again until I migrated to workflow and what will do today?
**Konsti | matchicalcom** [06:18 - 06:37]: Yeah, whenever I have time, I will work on the skill thing, but other than that a little bit blocked, like onboarding meeting, then the other meeting with bridging it, that we also need to prepare a little bit nasty, but yeah needs to be done and that's it.
**Carlos | matchicalcom** [06:41 - 06:43]: Okay, so let's not waste any time.
**Carlos | matchicalcom** [06:44 - 06:58]: Yesterday my day was focused on the consultant detail, so one change that I did it went live with the sortfix that was the engagement roles now just loads.
**Carlos | matchicalcom** [06:58 - 07:05]: On demand, so only when the person clicks on that specific tab, we do the query to the database and just do that part.
**Carlos | matchicalcom** [07:06 - 07:09]: Spend the rest of the day working on the overview.
**Carlos | matchicalcom** [07:09 - 07:14]: It's much faster, but I'm still working on the pop-ups because that data.
**Carlos | matchicalcom** [07:14 - 07:19]: Was all preloaded or loaded when the page open.
**Carlos | matchicalcom** [07:20 - 07:28]: And now I'm just doing fetching the skills, for example when you click on the skill to get the skill details mainly that today.
**Carlos | matchicalcom** [07:28 - 07:39]: It will be finished and pretty much sure maybe I will have some time to get the other function the get full engagement or not Not sure, but let's see how the day goes.
**Niklas | matchicalcom** [07:40 - 07:46]: One question here, Carlos, one thought How is it with wait?
**Konsti | matchicalcom** [07:48 - 07:48]: Oh, sorry.
**Niklas | matchicalcom** [07:51 - 07:54]: Mute myself, you hear me double Carlos, or?
**Niklas | matchicalcom** [07:54 - 07:55]: It's fine.
**Carlos | matchicalcom** [07:55 - 07:58]: No, no, it's better now the thought.
**Niklas | matchicalcom** [07:58 - 08:06]: Is just maybe optimizing the pop-up we need to think if it makes sense because once we have the skills in the graph, right?
**Niklas | matchicalcom** [08:06 - 08:12]: We would just do a cipher query to get all the children and all connections down or how is it?
**Niklas | matchicalcom** [08:12 - 08:13]: Or am I seeing something wrong?
**Niklas | matchicalcom** [08:13 - 08:14]: Or no?
**Niklas | matchicalcom** [08:14 - 08:17]: Or is what we are showing there the experiences?
**Niklas | matchicalcom** [08:17 - 08:18]: It's not.
**Niklas | matchicalcom** [08:18 - 08:21]: I just mean if you are in the skill detail where you see.
**Niklas | matchicalcom** [08:21 - 08:26]: Like, ah, this is your parent and these are all your children, this would happen in the graph, right?
**Carlos | matchicalcom** [08:27 - 08:28]: Yes.
**Carlos | matchicalcom** [08:28 - 08:54]: But since we currently have I have to change it to the existing simple because the page will go live I think this week and it needs to run, but yes, this needs to be updated once we have the graph, but not most of it not really to be honest, because this comes from experiences and we are showing for a specific engagement role and we.
**Carlos | matchicalcom** [08:54 - 08:56]: Have the names in the sequel.
**Carlos | matchicalcom** [08:56 - 08:58]: So I think only the parent-child relation.
**Carlos | matchicalcom** [08:58 - 08:59]: We will have.
**Niklas | matchicalcom** [08:59 - 09:13]: To exactly just I was just meaning because when you said you tackling the pop up, I was just thinking like maybe we should think about if the role skill pop up where you see the role details and the parent and blah blah blah.
**Niklas | matchicalcom** [09:13 - 09:19]: If that really is something, we should also tackle in that thing or we wait until the graph is ready.
**Carlos | matchicalcom** [09:20 - 09:22]: I think we'll need to wait on that one.
**Carlos | matchicalcom** [09:22 - 09:24]: Okay, no.
**Niklas | matchicalcom** [09:26 - 09:46]: Perfect then to me, yesterday I was working on many many small things that also now all went to production, but they're all working and yes, today I'm finishing one thing with the agency and then I'm actually I mean there are many things to do.
**Niklas | matchicalcom** [09:46 - 10:01]: I just don't know what exactly to tackle next, so I think would be good if we then quickly talk to have a specific task what I can do, because otherwise I think I can easily lose myself in another task.
**Niklas | matchicalcom** [10:01 - 10:04]: But the question is, is it really the highest priority now?
**Niklas | matchicalcom** [10:04 - 10:07]: So we need to quickly maybe discuss that then.
**Carlos | matchicalcom** [10:10 - 10:12]: So far to me.
**Niklas | matchicalcom** [10:15 - 10:17]: Tommy Consti, do you, but you have a meeting now, right?
**Niklas | matchicalcom** [10:17 - 10:19]: So we talk afterwards about it.
**Konsti | matchicalcom** [10:21 - 10:31]: Yes, you use get current locally in your thing in the backend and when it's triggered by an event, there is no get current local, you need to use entities English.
**Niklas | matchicalcom** [10:32 - 10:34]: Okay, let's talk about this afterwards.
**Konsti | matchicalcom** [10:34 - 10:37]: That's why our language ID was empty and that's why it crashed.
**Niklas | matchicalcom** [10:37 - 10:39]: Okay, let's talk about this afterwards.
**Niklas | matchicalcom** [10:40 - 10:40]: Yeah.
**Konsti | matchicalcom** [10:42 - 10:43]: Then see you then.
**Konsti | matchicalcom** [10:43 - 10:47]: Carlos, I would really like to have a session with you today, just to check in.
**Carlos | matchicalcom** [10:49 - 10:50]: Let me know when you.
**Konsti | matchicalcom** [10:50 - 10:59]: Can talk And what do you think about having a session on Friday Afternoon altogether, that we can give you a little, a few updates regarding the week.
**Carlos | matchicalcom** [11:00 - 11:02]: I'm available today.
**Carlos | matchicalcom** [11:02 - 11:20]: I'm going to do a slightly bigger lunch hour, because I need to go to the bank to solve some paperwork, but I'll be here just free this optimization thinks it's something that I can interrupt, so it is enough I put instead of a feature tool.
**Carlos | matchicalcom** [11:20 - 11:27]: In this case I just made it available just for me, while I'm just working on it and afterwards I will just share it with everyone.
**Konsti | matchicalcom** [11:27 - 11:30]: Tommy, do you have an information when you get your car?
**Niklas | matchicalcom** [11:31 - 11:31]: No.
**Tommy | matchicalcom** [11:33 - 11:36]: He will call me today?
**Konsti | matchicalcom** [11:37 - 11:41]: Yeah, then like we are, then we don't know about the schedule on Friday Afternoon, because.
**Konsti | matchicalcom** [11:41 - 11:42]: Tommy yeah, but I will be in.
**Tommy | matchicalcom** [11:42 - 11:44]: The car, I will be in the.
**Konsti | matchicalcom** [11:44 - 11:47]: Car, so you think you will get it in the morning.
**Konsti | matchicalcom** [11:50 - 11:53]: Pardon, you think you will get your car in the morning?
**Niklas | matchicalcom** [11:55 - 11:56]: Yeah, we can see then.
**Tommy | matchicalcom** [11:56 - 11:57]: No, no, no, no, no, no.
**Konsti | matchicalcom** [11:58 - 12:02]: You can be in the car, you meant, pardon, he will be.
**Konsti | matchicalcom** [12:03 - 12:05]: You said, you can be in the car or what?
**Tommy | matchicalcom** [12:06 - 12:08]: I will be in the car in the afternoon?
**Tommy | matchicalcom** [12:08 - 12:11]: I will be driving home so that.
**Konsti | matchicalcom** [12:11 - 12:16]: Except you can fetch your car in the afternoon, so that's that's clear that.
**Tommy | matchicalcom** [12:16 - 12:20]: I can fetch my car in worst case it's not polished.
**Tommy | matchicalcom** [12:20 - 12:20]: So that's the.
**Tommy | matchicalcom** [12:21 - 12:24]: Okay, so everything is fine, everything fine.
**Tommy | matchicalcom** [12:26 - 12:27]: Yeah.
**Konsti | matchicalcom** [12:29 - 12:33]: After your lunch or so on Friday, no worries.
**Carlos | matchicalcom** [12:35 - 12:36]: Then see you guys good day and.
**Niklas | matchicalcom** [12:36 - 12:38]: We speak later later.
**Konsti | matchicalcom** [12:38 - 12:39]: Bye.
