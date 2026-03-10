# Dev check in

**Konsti | matchicalcom** [01:44 - 01:46]: Based on the new insight that I've provided you.
**Konsti | matchicalcom** [01:46 - 02:11]: I want you to ultra think once more about your propositions and whether you still would stick to them or see further adjustments or improvements that can be achieved or like indexes that need to be adjusted and so on one action item is definitely right, including the tenant ID to the indexes, but I want you to confirm this once more.
**Konsti | matchicalcom** [02:11 - 02:16]: So in your new plan provide me the full what's the job to be done?
**Konsti | matchicalcom** [02:17 - 02:33]: The elasticsearch open search thing good to know the hybrid one, but that's for now just focus on making the actual setup working even more properly.
**Konsti | matchicalcom** [03:09 - 03:19]: And the pre computed thing doesn't work, therefore the data is too dynamic and filters and so on are too flexible as it would make sense to pre-compute all the time.
**Carlos | matchicalcom** [04:23 - 04:24]: I caused it.
**Konsti | matchicalcom** [04:26 - 04:34]: Hello there, hello, you definitely don't need to sorry, like because, oh, I always.
**Carlos | matchicalcom** [04:34 - 04:37]: Do that, sorry for me start on point.
**Carlos | matchicalcom** [04:38 - 04:40]: I'm just very keen on schedules.
**Konsti | matchicalcom** [04:41 - 04:46]: Sure me too I'm as well, except for Intel meetings, right?
**Konsti | matchicalcom** [04:46 - 04:48]: But that's also correct.
**Carlos | matchicalcom** [04:48 - 05:02]: You deserve the same respect as external people, yeah, yeah, one hundred percent, but okay, just a quick update here, so the recalculation we have like two thousand something to recalculate.
**Carlos | matchicalcom** [05:02 - 05:14]: Most of them are done, five hundred are missing, but I've identified the data issue It stopped on January twelfth, so there was a deployed so something on the code was fixed at the time.
**Carlos | matchicalcom** [05:16 - 05:28]: No more records from the twelve until now for recalculation I'm missing five, five hundred so in the next couple of hours, so I'm doing like the DB cleanup does one hundred.
**Carlos | matchicalcom** [05:28 - 05:34]: At a time every time that it runs, I flag them with the need recalculation flag and so it's.
**Carlos | matchicalcom** [05:34 - 05:37]: It's processing, it's not affecting too much production.
**Konsti | matchicalcom** [05:37 - 05:40]: So we're almost there from the last information.
**Konsti | matchicalcom** [05:40 - 05:49]: Cristiano provided basically our now biggest tank is experience calculation right now.
**Carlos | matchicalcom** [05:49 - 06:00]: Yes, because of the skills, because of the skills those queries I've reviewed them so yeah, it's skills every time you join against the skill alliances and all that, that's a problem.
**Konsti | matchicalcom** [06:00 - 06:02]: Sure, sure, sure, sure, cool.
**Konsti | matchicalcom** [06:03 - 06:11]: But that's like so like we're a step further, because when we get rid of skills, we can get rid of most of the cleanup shit and we can.
**Konsti | matchicalcom** [06:11 - 06:14]: Get rid of the other thing.
**Konsti | matchicalcom** [06:14 - 06:15]: So that's very nice.
**Carlos | matchicalcom** [06:16 - 06:19]: I think we are closer to be on the steady space.
**Carlos | matchicalcom** [06:19 - 06:29]: The AI usage was not archived Because the play happened this morning before the time the timber, so the timer that was executed, it was with yesterday's code, not the plated one.
**Carlos | matchicalcom** [06:29 - 06:33]: So I will be watching it tomorrow in the morning to see if the.
**Konsti | matchicalcom** [06:33 - 06:34]: Ball moved really at the time.
**Konsti | matchicalcom** [06:34 - 06:35]: All right.
**Carlos | matchicalcom** [06:35 - 06:37]: No, no, don't do it, don't do it.
**Carlos | matchicalcom** [06:37 - 06:39]: Please it's production hours.
**Carlos | matchicalcom** [06:39 - 06:41]: We don't start.
**Carlos | matchicalcom** [06:41 - 06:43]: Please don't start Bulk I won't do it.
**Konsti | matchicalcom** [06:43 - 06:44]: Like I won't do it.
**Carlos | matchicalcom** [06:45 - 06:48]: No, no, but see I will explain why.
**Carlos | matchicalcom** [06:48 - 06:54]: Because that bulk will move gigabytes of data from one table to the other, right?
**Carlos | matchicalcom** [06:54 - 06:55]: And you don't want that.
**Carlos | matchicalcom** [06:56 - 07:01]: And for example the existing processes writing in the AI Usage Table and Everything.
**Carlos | matchicalcom** [07:01 - 07:01]: At the same time.
**Carlos | matchicalcom** [07:05 - 07:05]: That's right.
**Carlos | matchicalcom** [07:05 - 07:11]: So and I moved the AI usage to a daily, so it was once per week, now it's daily.
**Carlos | matchicalcom** [07:13 - 07:15]: We need to be more careful.
**Carlos | matchicalcom** [07:15 - 07:20]: I'm assuming that on the AI usage the use case.
**Carlos | matchicalcom** [07:20 - 07:22]: I think is the name of the column.
**Carlos | matchicalcom** [07:22 - 07:26]: It was increased to one hundred, but on the archive it was not so.
**Konsti | matchicalcom** [07:26 - 07:30]: Like that we need to be really careful every time that we.
**Carlos | matchicalcom** [07:30 - 07:33]: And I found what was it?
**Carlos | matchicalcom** [07:33 - 07:36]: The S three key for example was not on the archive.
**Konsti | matchicalcom** [07:36 - 07:38]: Ah, true, true.
**Konsti | matchicalcom** [07:38 - 07:43]: Okay, So you upset it there and put it in the migration table as well.
**Konsti | matchicalcom** [07:43 - 07:45]: Yes, we lost a few, right?
**Carlos | matchicalcom** [07:47 - 07:50]: Not really, because the archive process was not running.
**Carlos | matchicalcom** [07:50 - 07:53]: It was failing every time, so I don't think it.
**Carlos | matchicalcom** [07:54 - 07:59]: But I think now I realize what's going on with the AI users.
**Carlos | matchicalcom** [07:59 - 08:08]: So the archive table, as long the archive process has not ran for a few days or weeks, so the AI user to got bigger and bigger and bigger.
**Carlos | matchicalcom** [08:08 - 08:10]: That's why we started to have issues.
**Konsti | matchicalcom** [08:10 - 08:18]: Writing on that tab and in the admin I can now filter also against archive.
**Carlos | matchicalcom** [08:19 - 08:21]: Yes, yes, now the filter does.
**Carlos | matchicalcom** [08:21 - 08:30]: I'm curious, the intensity because of performance, the size of the tables are much, much different from dev to production in production was very fast.
**Carlos | matchicalcom** [08:30 - 08:35]: I'm assuming that it will take some time in production, but so.
**Konsti | matchicalcom** [08:35 - 08:44]: But also like the cost if I want to check the the the spend for the last seven days, it will took take the first day from today and the other ones from the last six days.
**Carlos | matchicalcom** [08:44 - 08:47]: Yes, yes, that's very decent.
**Carlos | matchicalcom** [08:47 - 08:51]: Oh, sorry, sorry, you said the cost, the sum, the one that sums everything.
**Konsti | matchicalcom** [08:51 - 08:52]: Yeah, yeah, the sum is no I haven't.
**Carlos | matchicalcom** [08:53 - 08:55]: It's on my to do list, but I have not reviewed the other one.
**Konsti | matchicalcom** [08:55 - 08:56]: Yeah, this one different one.
**Konsti | matchicalcom** [08:56 - 09:01]: Because currently we are really monitoring like our AI spent because like it's like already.
**Konsti | matchicalcom** [09:01 - 09:04]: Like one point five k over the last.
**Konsti | matchicalcom** [09:04 - 09:05]: Week.
**Konsti | matchicalcom** [09:05 - 09:06]: It's like.
**Carlos | matchicalcom** [09:07 - 09:10]: But you know that we had the migration, right?
**Konsti | matchicalcom** [09:10 - 09:12]: Yeah, yeah, sure, sure, sure, sure, sure.
**Konsti | matchicalcom** [09:12 - 09:15]: And like people get crazy, but it doesn't matter.
**Konsti | matchicalcom** [09:15 - 09:21]: Like our leverage on AI is so high, but we maybe need to start selling tokens.
**Carlos | matchicalcom** [09:22 - 09:31]: No, But I think one thing that you probably should after skills, okay, I don't think that you should put anything on your plate before ending the skill and roles and all that.
**Carlos | matchicalcom** [09:31 - 09:40]: But after that I think one thing and I don't want to give you tests, but you should probably review all the AI flows to see.
**Carlos | matchicalcom** [09:40 - 09:41]: If things can be done better.
**Carlos | matchicalcom** [09:41 - 09:45]: So starting optimizing the AI processes with number.
**Carlos | matchicalcom** [09:45 - 09:54]: Of tokens and even the so tokens and the models, because sometimes we probably can use better models at this the.
**Konsti | matchicalcom** [09:54 - 09:58]: Models I'm monitoring all the time, like these these are, I'm switching all the time.
**Carlos | matchicalcom** [10:01 - 10:06]: But maybe the process can be then slightly different in a more optimized way.
**Carlos | matchicalcom** [10:06 - 10:06]: I don't know.
**Konsti | matchicalcom** [10:07 - 10:08]: Yeah, sure, sure, sure.
**Konsti | matchicalcom** [10:08 - 10:20]: There's always everywhere is room for improvement one hundred percent like, okay, there's one other thing that I now need to approach first, because everyone wants to have these fucking project descriptions.
**Konsti | matchicalcom** [10:23 - 10:25]: My question would be.
**Konsti | matchicalcom** [10:29 - 10:35]: So in terms of performance, I think we are so far in good shape because we still have this three x.
**Konsti | matchicalcom** [10:35 - 10:40]: I will also record another loom to Cristiano to tell them like that we please need this extension.
**Konsti | matchicalcom** [10:40 - 10:42]: We are already in talk to sales and I will talk to Tommy.
**Konsti | matchicalcom** [10:42 - 10:52]: Like I think we should double just even if it's an extra expense after we cleaned up the skills, then we are good to go for the next five big migrations, right?
**Konsti | matchicalcom** [10:53 - 10:59]: But the extra value that we get from this one k more of compute per.
**Konsti | matchicalcom** [10:59 - 11:02]: Month is too high to not use it.
**Carlos | matchicalcom** [11:06 - 11:09]: I would only do that decision after we fix skills and roles.
**Konsti | matchicalcom** [11:09 - 11:15]: If we think that the issue is, we won't fix roles and skills before we lose the high database tier.
**Carlos | matchicalcom** [11:15 - 11:17]: Yeah, but the system was running before.
**Carlos | matchicalcom** [11:17 - 11:20]: I don't think that it would be a huge problem.
**Carlos | matchicalcom** [11:22 - 11:28]: So if in early January the system was running with only sixteen nodes and everything.
**Carlos | matchicalcom** [11:28 - 11:33]: That we had in place, I'm not sure if we increase the amount of CV's that we parse.
**Carlos | matchicalcom** [11:33 - 11:37]: Or the uses of the application that high that will block everything.
**Konsti | matchicalcom** [11:37 - 11:38]: Yeah, yeah, yeah.
**Konsti | matchicalcom** [11:38 - 11:42]: Like the amount of usage, like the usage is now like two eight higher.
**Konsti | matchicalcom** [11:42 - 11:45]: I think if we look at the amount of CV's that get parsed.
**Konsti | matchicalcom** [11:45 - 11:58]: On a daily basis these were like our average day is now a peak day from a few weeks ago, okay, yeah, But let's see, let's see you're right.
**Konsti | matchicalcom** [11:58 - 11:59]: Okay, let's, let's.
**Konsti | matchicalcom** [11:59 - 12:10]: But on the other hand, it's like we're spending on so many things, like really saving nine hundred bucks to and everyone has like painful, like I even realize that when I'm in the ODC portal, right?
**Konsti | matchicalcom** [12:11 - 12:13]: Just the clicks are faster and everything.
**Konsti | matchicalcom** [12:13 - 12:16]: It's like much more of a breeze, right?
**Carlos | matchicalcom** [12:16 - 12:18]: Oh, okay, yeah, right?
**Carlos | matchicalcom** [12:18 - 12:22]: You have more more resources, I love more resources.
**Carlos | matchicalcom** [12:22 - 12:27]: I just like to be very efficient with what we have, because if we.
**Konsti | matchicalcom** [12:27 - 12:32]: Don'T fix, we should not save on the wrong end, like I know.
**Konsti | matchicalcom** [12:32 - 12:36]: But I get your point, I get your point, I get your point.
**Konsti | matchicalcom** [12:36 - 12:48]: We can basically monitor if we monitor the chart and see that we are always close to the twenty five and always need the room between twenty five and fifty, then it will be stupid to cap it to fifty right to twenty five.
**Carlos | matchicalcom** [12:49 - 12:58]: Right now I think we still have some hiccups or some spikes and it's mainly you were the one.
**Carlos | matchicalcom** [12:58 - 13:02]: I'm assuming that you just slow down the cleanup process to once per.
**Carlos | matchicalcom** [13:02 - 13:03]: Hour, right?
**Carlos | matchicalcom** [13:03 - 13:04]: I saw that this morning.
**Konsti | matchicalcom** [13:05 - 13:08]: No, I did not really do it.
**Konsti | matchicalcom** [13:08 - 13:11]: I think once per hour, really?
**Carlos | matchicalcom** [13:12 - 13:13]: I think I was reviewing this.
**Carlos | matchicalcom** [13:14 - 13:18]: Maybe, maybe I saw it in the wrong environment.
**Carlos | matchicalcom** [13:18 - 13:22]: Let me just hopefully because I was checking this this morning, Because another in.
**Konsti | matchicalcom** [13:22 - 13:25]: The production environment it should run every twenty minutes.
**Carlos | matchicalcom** [13:26 - 13:28]: Correct, I was, I was in there, sorry.
**Carlos | matchicalcom** [13:28 - 13:30]: Yeah, I was thinking definitely slow it.
**Konsti | matchicalcom** [13:30 - 13:39]: Down, because like what's not worth it, Yeah, yeah, okay, okay, okay, Production even runs only every thirty minutes, Yeah, right.
**Carlos | matchicalcom** [13:39 - 13:40]: Now it's thirty minutes.
**Carlos | matchicalcom** [13:40 - 13:41]: Yes.
**Konsti | matchicalcom** [13:43 - 13:44]: All time.
**Carlos | matchicalcom** [13:44 - 13:56]: Let me just check the database usage right now twenty three, yeah, but we had a spike that was over fifty at this point.
**Carlos | matchicalcom** [14:02 - 14:11]: Yep, I think the upgrade to I would say we normally were sixteen, the upgrade to thirty two something that we will need.
**Carlos | matchicalcom** [14:11 - 14:21]: Okay, it's just a matter of we need to keep the skills and roles as the priority, or else thirty two won't be enough and even sixty four one day, so we really need to.
**Konsti | matchicalcom** [14:22 - 14:24]: So that's not the point.
**Konsti | matchicalcom** [14:24 - 14:25]: Like do you have any.
**Konsti | matchicalcom** [14:30 - 14:38]: Tasks that are not performance and infrastructure related, Because I think here we know we're the biggest leverage right now, right.
**Carlos | matchicalcom** [14:38 - 14:40]: Now, no, the plan for today is just.
**Carlos | matchicalcom** [14:41 - 14:46]: I just added the the same on the AI usage and is going.
**Carlos | matchicalcom** [14:46 - 15:05]: Through that I need to start to move the archive to have a s three key also so I can clean all that data so those are the tests for to digest AI usage mainly to see if we can by this weaken reduce the uses of database a lot.
**Konsti | matchicalcom** [15:05 - 15:10]: Okay, Because there's one thing where you can really help me out, okay?
**Konsti | matchicalcom** [15:11 - 15:28]: Because this is the only last item that stands in the way between me and approaching road skills and then there's obviously the issue that you have to move houses.
**Konsti | matchicalcom** [15:29 - 15:31]: Yeah, I have to move houses, right?
**Konsti | matchicalcom** [15:31 - 15:32]: So.
**Konsti | matchicalcom** [15:37 - 16:32]: Oh, it's a little bit super messy, Okay, it's here this one, it's the project and engagement story.
**Carlos | matchicalcom** [16:33 - 16:34]: So.
**Konsti | matchicalcom** [16:37 - 16:44]: Here we have a few things like this like stuff that we want to do, but these are like not in scope right now.
**Konsti | matchicalcom** [16:52 - 16:53]: Maybe let's do here a heading three.
**Konsti | matchicalcom** [16:57 - 16:58]: What the fuck.
**Konsti | matchicalcom** [17:10 - 17:11]: This used to work.
**Konsti | matchicalcom** [17:16 - 17:17]: A three.
**Konsti | matchicalcom** [17:21 - 17:26]: I don't know if it's my machine or notion or the Internet.
**Carlos | matchicalcom** [17:27 - 17:29]: Everything looks very slow at this point, right?
**Carlos | matchicalcom** [17:29 - 17:30]: Just refreshing.
**Carlos | matchicalcom** [17:30 - 17:31]: That's not good.
**Konsti | matchicalcom** [17:34 - 17:35]: Okay, first scope.
**Konsti | matchicalcom** [17:36 - 17:50]: The first scope is the first scope is the description field and here we need.
**Konsti | matchicalcom** [17:59 - 18:01]: So we need this one.
**Konsti | matchicalcom** [18:05 - 18:17]: We need all these actually, but not this one descriptions.
**Konsti | matchicalcom** [18:36 - 18:46]: So what is the idea or what do we need the first thing like because, like what is the business logic?
**Konsti | matchicalcom** [18:46 - 18:47]: The business logic is the following.
**Konsti | matchicalcom** [18:47 - 18:54]: We do have an engagement here, okay?
**Konsti | matchicalcom** [18:54 - 18:57]: And we have usually local dicts everywhere, right?
**Konsti | matchicalcom** [18:58 - 19:01]: Like usually for example this one here is a local dict right.
**Konsti | matchicalcom** [19:05 - 19:09]: For descriptions for engagement descriptions, we have it a little bit differently.
**Konsti | matchicalcom** [19:10 - 19:15]: We are using this one here where you have like actually that's called description dict.
**Konsti | matchicalcom** [19:15 - 19:17]: The description dictates similar logic.
**Carlos | matchicalcom** [19:18 - 19:22]: I've worked with that because of the once I do some changes.
**Carlos | matchicalcom** [19:23 - 19:25]: Yes, I've seen it, yes, we need.
**Konsti | matchicalcom** [19:25 - 19:36]: The same kind of logic as it is implemented for the engagements for the actual like each engagement is linked to a project and here within the project we just have this one here this is outdated.
**Konsti | matchicalcom** [19:36 - 19:45]: We don't need like just in description field here Instead what we will need is if we look at the projects.
**Carlos | matchicalcom** [19:45 - 19:45]: Here.
**Konsti | matchicalcom** [19:48 - 19:49]: That'S the project, right?
**Konsti | matchicalcom** [19:50 - 19:53]: Currently there is already the description key.
**Konsti | matchicalcom** [19:53 - 20:00]: It's already there, but what we are currently using I think I'm not sure you need to test.
**Konsti | matchicalcom** [20:00 - 20:03]: Maybe we are even already using the description.
**Carlos | matchicalcom** [20:04 - 20:07]: The component look a little bit different, but it has that.
**Carlos | matchicalcom** [20:08 - 20:10]: Can you share the screen?
**Carlos | matchicalcom** [20:10 - 20:11]: The browser?
**Carlos | matchicalcom** [20:11 - 20:17]: Because when you so use also have those three things text bullets and up there.
**Carlos | matchicalcom** [20:17 - 20:19]: Isn't the same thing.
**Carlos | matchicalcom** [20:21 - 20:25]: Ah, true, it's there, but it's not implemented correctly.
**Konsti | matchicalcom** [20:25 - 20:26]: It's not implemented, right?
**Konsti | matchicalcom** [20:26 - 20:28]: But it's already there that's good.
**Konsti | matchicalcom** [20:29 - 20:32]: So, okay, so we have already some progress in this direction.
**Konsti | matchicalcom** [20:33 - 20:39]: So what needs to be done is obviously for these description keys, where are they?
**Konsti | matchicalcom** [20:39 - 20:41]: Description key.
**Konsti | matchicalcom** [20:42 - 20:53]: For these description bits like here's the description key and therefore, when we look at the category, we will have the description.
**Konsti | matchicalcom** [20:53 - 20:54]: Where is it?
**Carlos | matchicalcom** [20:57 - 20:58]: Description engage.
**Konsti | matchicalcom** [20:59 - 21:03]: Yeah, So here it's already description.
**Konsti | matchicalcom** [21:03 - 21:07]: Project description long, description mixed description short.
**Konsti | matchicalcom** [21:07 - 21:08]: Chico already created this.
**Konsti | matchicalcom** [21:08 - 21:17]: You need to check in with Chico to ask like what he was, if he's currently working on it, He is actually not working on, because he's completely breed beneath like template work.
**Carlos | matchicalcom** [21:18 - 21:21]: Yes, I know, you see, we have.
**Konsti | matchicalcom** [21:21 - 21:30]: In the project already this description key and it's in this case already linked that we have these different versions here.
**Konsti | matchicalcom** [21:31 - 21:45]: So that's the toggle for actually for engagements that we have had open here, like within engagements, we have three different versions, like the bullet version, the text version and the freestyle.
**Konsti | matchicalcom** [21:45 - 21:55]: Like original mix of bullet syntax and for projects we will have a short version, a long version, a bullet version and a mixed version.
**Konsti | matchicalcom** [21:55 - 21:59]: I think that's what Chico already created here looks like bullet version.
**Konsti | matchicalcom** [22:00 - 22:05]: No, that's engaged and bullet list perfect.
**Konsti | matchicalcom** [22:05 - 22:06]: Chico already created all these.
**Konsti | matchicalcom** [22:07 - 22:09]: So these are already there, that's good.
**Carlos | matchicalcom** [22:09 - 22:13]: But we should have four icons and in this case we just have three.
**Konsti | matchicalcom** [22:13 - 22:15]: Yeah, yeah, we need to have four icons, that's another thing.
**Konsti | matchicalcom** [22:15 - 22:18]: And we need to ask Lina what kind of icons to take here.
**Konsti | matchicalcom** [22:21 - 22:25]: But it needs to be properly implemented that the update and so on does work.
**Konsti | matchicalcom** [22:25 - 22:31]: We need to implement it in a way that either We do a migration script or for.
**Konsti | matchicalcom** [22:31 - 22:36]: Old engagements where we don't have it yet it will be populated then right?
**Konsti | matchicalcom** [22:37 - 22:38]: For old projects, I don't know.
**Konsti | matchicalcom** [22:38 - 22:41]: You need to check if old projects already have this logic here.
**Konsti | matchicalcom** [22:44 - 22:48]: Project, okay, like existing project is a database, I mean.
**Carlos | matchicalcom** [22:48 - 22:54]: Oh, okay, because, Okay, because you might have the key there but not being.
**Konsti | matchicalcom** [22:54 - 22:56]: Used or the key is not even there.
**Konsti | matchicalcom** [22:56 - 22:57]: I'm not sure.
**Konsti | matchicalcom** [22:58 - 23:00]: Okay, is it mandatory?
**Konsti | matchicalcom** [23:00 - 23:01]: No, it's not mandatory.
**Konsti | matchicalcom** [23:01 - 23:04]: It might be that there's a lot of legacy projects where the key is not there.
**Konsti | matchicalcom** [23:07 - 23:08]: That's one thing.
**Konsti | matchicalcom** [23:09 - 23:27]: So we need to have this logic working that it's important when you see creation done create or it's parse engagement in parse engagement.
**Konsti | matchicalcom** [23:27 - 23:43]: Currently engagements can only be created via the engagement pathing right in the CV parser or if you pass an additional engagement And what we basically do is we create here a new project and we are create local name.
**Konsti | matchicalcom** [23:44 - 23:45]: What is this?
**Konsti | matchicalcom** [23:45 - 23:46]: This is local dicts.
**Carlos | matchicalcom** [23:46 - 23:49]: This is local dicts for the project name, not the.
**Konsti | matchicalcom** [23:50 - 23:53]: Yeah, currently we are not creating a description key ID.
**Konsti | matchicalcom** [23:53 - 23:55]: We are not doing it currently.
**Konsti | matchicalcom** [23:55 - 24:02]: So they are nowhere currently, but you can already flag that in the parse engagement action, but you can also look for it.
**Konsti | matchicalcom** [24:02 - 24:06]: That's the only way we're pro where projects get created.
**Konsti | matchicalcom** [24:06 - 24:08]: Currently, but it probably makes sense.
**Konsti | matchicalcom** [24:09 - 24:12]: If we start doing, let's start doing it, right?
**Konsti | matchicalcom** [24:12 - 24:17]: Like build a project wrapper for like project.
**Konsti | matchicalcom** [24:17 - 24:26]: Create or update CRUD or whatever a wrapper action, because projects in the future will also be able to be created just from the front end.
**Konsti | matchicalcom** [24:26 - 24:31]: I can just click in the front end on like here on project and then create new project.
**Konsti | matchicalcom** [24:31 - 24:47]: Okay, so it will make sense that we cannot just create projects by pathing, but also by just by just as a plus sign, right OK, yeah, yep.
**Konsti | matchicalcom** [24:48 - 24:56]: Okay, then the other things is just like a few extra fields that we need, but if you provide these field already, because what is my job to be done?
**Konsti | matchicalcom** [24:57 - 25:10]: My job to be done is to build like the parser for this that is basically extracting the engagements on converting and populating this information into the project fields.
**Carlos | matchicalcom** [25:11 - 25:18]: So the other fields, the descriptions is a more complex one, the other are just additional fields to this one is.
**Konsti | matchicalcom** [25:19 - 25:22]: Text, so this one is a text area for example.
**Carlos | matchicalcom** [25:23 - 25:28]: Yeah, that should be with this local dict also yeah, that's because of multilanguage.
**Konsti | matchicalcom** [25:28 - 25:30]: All are local digs, okay?
**Konsti | matchicalcom** [25:30 - 25:36]: So yeah, like all are local digs, all texts are always local digs in.
**Carlos | matchicalcom** [25:36 - 25:43]: This case, But the difference is, these are normal local leagues that only have one translation and don't they only have.
**Konsti | matchicalcom** [25:43 - 25:46]: One kind of the other ones have multiple formats.
**Konsti | matchicalcom** [25:46 - 25:46]: Yeah.
**Konsti | matchicalcom** [25:46 - 25:53]: So here as you can see the method approach is one text field, but it also has options.
**Konsti | matchicalcom** [25:53 - 25:55]: So it's actually two things we need to create a new.
**Konsti | matchicalcom** [25:57 - 25:58]: Let's postpone this for a second.
**Konsti | matchicalcom** [25:58 - 26:05]: So this one quite easy can be a text area, or like, maybe let's call it, I don't know.
**Konsti | matchicalcom** [26:05 - 26:12]: We need to have a name because we cannot rename it in the keys, right?
**Konsti | matchicalcom** [26:12 - 26:13]: So let's call it.
**Konsti | matchicalcom** [26:16 - 26:18]: Is it goals or outcome?
**Konsti | matchicalcom** [26:18 - 26:20]: Or we even need both.
**Konsti | matchicalcom** [26:31 - 26:33]: Let's take like I don't know.
**Konsti | matchicalcom** [26:33 - 26:41]: Maybe, if we don't like the name, we can switch it later and just duplicate the thing, right?
**Konsti | matchicalcom** [26:41 - 26:47]: But maybe let's name it not goals outcome.
**Konsti | matchicalcom** [26:49 - 26:52]: Maybe let's name it outcome, it might be that we need another one.
**Konsti | matchicalcom** [26:55 - 26:57]: So let's unbolt this.
**Konsti | matchicalcom** [26:59 - 27:05]: Yeah, you see, outcome and problem statement is obvious, then category and that's important.
**Konsti | matchicalcom** [27:05 - 27:13]: Here we have two kinds of dropdowns and here we also will need a new logic.
**Konsti | matchicalcom** [27:13 - 27:19]: You can maybe already think about it how we can do this, because we will have this in the future at several places.
**Konsti | matchicalcom** [27:19 - 27:22]: So let's think about the correct extraction layer.
**Carlos | matchicalcom** [27:22 - 27:26]: It's basically like multi option or just one.
**Konsti | matchicalcom** [27:28 - 27:33]: Single option, single I would say yeah, definitely single options and on the.
**Carlos | matchicalcom** [27:33 - 27:36]: Method and approach also single options.
**Konsti | matchicalcom** [27:36 - 27:45]: Okay, But the issue is, the issue is that these options are customizeable.
**Carlos | matchicalcom** [27:46 - 27:51]: You guys are crazy Just to make it more complex, right?
**Konsti | matchicalcom** [27:52 - 27:54]: Yeah, yeah.
**Konsti | matchicalcom** [27:54 - 28:03]: Because like people will start, they want to start filter for it and so on like that's the fuck up here.
**Carlos | matchicalcom** [28:04 - 28:09]: Yeah, you need to have as you have the static entity for status.
**Carlos | matchicalcom** [28:09 - 28:17]: For example we need something like a lookup table, but is a regular table that people can add things there and.
**Konsti | matchicalcom** [28:17 - 28:19]: It would be maybe decent.
**Konsti | matchicalcom** [28:20 - 28:29]: If you could update in the like we will need also components for this and everything, but if on the backend.
**Carlos | matchicalcom** [28:29 - 28:36]: You need on the general settings or somewhere you need a place to configure this right per tenant.
**Konsti | matchicalcom** [28:38 - 28:44]: No, it's actually I would say the user can, users can maybe that's a good idea.
**Konsti | matchicalcom** [28:44 - 28:50]: Let's do it in the beginning that only we admins can configure it and they need to ask for it, because.
**Carlos | matchicalcom** [28:51 - 28:57]: But on the general settings people have access or it's only for admins we can just filter some tabs for us, right?
**Konsti | matchicalcom** [28:58 - 29:14]: Just that's maybe, yeah, in the future it will be definitely customizable by the admins of the tenant, but for the beginning to make things more easily and to not build like create a category or remove it.
**Konsti | matchicalcom** [29:14 - 29:21]: Let's just create it in a way that only we can set this up for the tenant, you know?
**Carlos | matchicalcom** [29:22 - 29:23]: Okay, yeah.
**Carlos | matchicalcom** [29:23 - 29:25]: But you still need a page to do it, right?
**Carlos | matchicalcom** [29:28 - 29:31]: Probably close to custom roles or something, Yeah, yeah.
**Konsti | matchicalcom** [29:31 - 29:36]: But this one really, maybe in the beginning just don't focus at all on the front end implementation.
**Konsti | matchicalcom** [29:36 - 29:43]: We first need Linux to work on this and then like things so in the beginning you can put it purely in the like.
**Konsti | matchicalcom** [29:43 - 30:22]: Really put it purely here in the admin, that here under the consultancy, Like we have an extra section or whatever to configure these options, Like, keep it simple, because this will be redone either way and that's not the focus or keep it super simple, Keep it super simple, But one extra thing is like that you should populate each tenant with these default values that we have here or like we need to challenge the defaults, but that's the thing.
**Konsti | matchicalcom** [30:22 - 30:33]: And I think these categories, These categories are also local dicts.
**Konsti | matchicalcom** [30:35 - 30:36]: They need to be language supported.
**Carlos | matchicalcom** [30:38 - 30:41]: Sure and these are the options right?
**Konsti | matchicalcom** [30:41 - 30:56]: Yeah, the options are local dates here, The options are local dict because they are language supported.
**Konsti | matchicalcom** [30:59 - 31:00]: Okay, that's what we need.
**Carlos | matchicalcom** [31:02 - 31:06]: Okay, and you will get it perfect.
**Carlos | matchicalcom** [31:07 - 31:09]: I can start working on this sure?
**Konsti | matchicalcom** [31:09 - 31:16]: Yeah, sure, sure in terms of priorities, really in terms of priority, maybe Let's talk about this one.
**Carlos | matchicalcom** [31:17 - 31:22]: I would like just to make sure that I finish the AI usage that I was.
**Carlos | matchicalcom** [31:22 - 31:28]: Doing, even if I don't implement the cleanup, at least the changes in the screens before starting this.
**Konsti | matchicalcom** [31:29 - 31:43]: Yes, OK, The first thing is that we need the backend implementation.
**Konsti | matchicalcom** [31:48 - 31:59]: That's what we need first, because as soon as we have this as you have set up the keys and we have everything I can start building the flows for parting these values out right.
**Carlos | matchicalcom** [32:01 - 32:06]: We can go in parallel right You can start building the flowers.
**Carlos | matchicalcom** [32:06 - 32:09]: I'll give you the actions today or tomorrow.
**Konsti | matchicalcom** [32:30 - 32:30]: How do you?
**Konsti | matchicalcom** [32:30 - 32:32]: Type available, avail.
**Carlos | matchicalcom** [32:34 - 32:35]: Available.
**Konsti | matchicalcom** [33:03 - 33:08]: So the categories is the least important one like.
**Konsti | matchicalcom** [33:12 - 33:14]: In general like.
**Carlos | matchicalcom** [33:15 - 33:25]: Yeah, I can do the descriptions for example and the outcome and the problem statement and leave the method and category.
**Konsti | matchicalcom** [33:25 - 33:37]: For blast is that like this one, this one, this method approach you can also provide us free text, but not the not the category, because this has two fields first, like three text and second right.
**Carlos | matchicalcom** [33:38 - 33:38]: Okay.
**Konsti | matchicalcom** [33:43 - 33:58]: Cool, perfect, okay, do you do the AI usage thing first, But in terms of like business like I kind of like no pressure?
**Carlos | matchicalcom** [33:58 - 34:01]: No, of course you need that by lunchtime or something?
**Konsti | matchicalcom** [34:02 - 34:04]: No, today, no, no.
**Konsti | matchicalcom** [34:04 - 34:20]: But like I want to build and finish the parsings and extractions during the weekend, so until the weekend I kind of need at least that I can populate these things that I can populate these keys with the actions I just.
**Carlos | matchicalcom** [34:20 - 34:25]: Want I need a couple of hours today just to finalize that screen.
**Carlos | matchicalcom** [34:25 - 34:31]: Then I will leave probably the cleanups and everything just for next week.
**Carlos | matchicalcom** [34:31 - 34:33]: That doesn't need to happen right now.
**Konsti | matchicalcom** [34:33 - 34:40]: That makes sense because this one is super urgent maybe What's our focus in general?
**Konsti | matchicalcom** [34:40 - 35:07]: Currently our focus is obviously making the experience for bridging as decent as possible, because bridging is like, bridging is in some way kind of a special client for us or customer, because they are the first kind of big consultancy like I think like seven hundred consultants or so, that really wants to use magical not just for like we are stuffing a few externals and like one external stuffing department is running.
**Konsti | matchicalcom** [35:07 - 35:13]: On it, but they want to use it completely as their internal consulting knowledge based solution, right?
**Carlos | matchicalcom** [35:13 - 35:16]: Okay, okay, yeah, that's important and that's.
**Konsti | matchicalcom** [35:16 - 35:17]: A super important reference case.
**Konsti | matchicalcom** [35:17 - 35:29]: For us to have, because Bridging is one of the biggest pure German players in terms of consulting and big name there and also it's the first client who really wants to go all in on the consulting.
**Konsti | matchicalcom** [35:29 - 35:29]: Branch.
**Konsti | matchicalcom** [35:32 - 35:33]: Cool, thank you.
**Carlos | matchicalcom** [35:33 - 35:34]: And they need projects, right?
**Carlos | matchicalcom** [35:35 - 35:39]: Just do me a quick favor and assign me the card.
**Carlos | matchicalcom** [35:39 - 35:40]: I will put it in this.
**Carlos | matchicalcom** [35:41 - 35:49]: I probably would separate what we just reviewed to a separate car and put it in the sprint and just go through the regular process.
**Carlos | matchicalcom** [35:49 - 35:50]: Okay.
**Konsti | matchicalcom** [35:52 - 35:52]: One more.
**Carlos | matchicalcom** [35:53 - 36:04]: I was saying that I'm going to grab this card, that you separate this part, that you mentioned first priority and just implement it as a separate card as part of the spring.
**Konsti | matchicalcom** [36:04 - 36:07]: Ah, sure, sure, sure, Good idea, good idea.
**Konsti | matchicalcom** [36:07 - 36:13]: I can do that the way you can do that here you create a subtask, right?
**Carlos | matchicalcom** [36:18 - 36:23]: Yep, that they can assign to the sprint and just keep track of it.
**Konsti | matchicalcom** [36:25 - 36:27]: Project V one.
**Konsti | matchicalcom** [36:29 - 36:33]: Yeah, here, why is it not shown like this now?
**Konsti | matchicalcom** [36:33 - 36:34]: That's stupid.
**Carlos | matchicalcom** [36:34 - 36:37]: You are not sharing your screen right now?
**Konsti | matchicalcom** [36:37 - 36:40]: Sorry, no, worries, It should not look like this.
**Konsti | matchicalcom** [36:42 - 36:44]: It should look differently.
**Konsti | matchicalcom** [36:45 - 36:46]: How do we do this?
**Konsti | matchicalcom** [36:53 - 36:55]: How did we do it with Data Privacy?
**Konsti | matchicalcom** [37:01 - 37:04]: Project open projects?
**Konsti | matchicalcom** [37:06 - 37:21]: It's parent, It's probably just not shown not started operand task.
**Konsti | matchicalcom** [37:21 - 37:24]: Okay, is it in the current sprint?
**Konsti | matchicalcom** [37:25 - 37:27]: Ah, here we do no, but I.
**Carlos | matchicalcom** [37:27 - 37:35]: See in Data Privacy all the others were created as subtests, and then when we click, it's insparent.
**Carlos | matchicalcom** [37:35 - 37:37]: Yeah, that's correct.
**Konsti | matchicalcom** [37:38 - 37:43]: That's how it's done, but I just don't know why, because, where's the Data Privacy?
**Konsti | matchicalcom** [37:43 - 37:47]: Sorry, there, ah, here, general settings, Data Privacy.
**Konsti | matchicalcom** [37:47 - 37:47]: Ah, perfect.
**Konsti | matchicalcom** [37:47 - 37:49]: It works the same way, perfect.
**Konsti | matchicalcom** [37:50 - 37:53]: So, yeah, now we can move all these things to.
**Konsti | matchicalcom** [37:57 - 38:02]: But you can also briefly scan like just what's stated in here in the current notes.
**Konsti | matchicalcom** [38:02 - 38:08]: Like not the stuff from below here, but what's in the current notes that you have an idea like what will be?
**Konsti | matchicalcom** [38:08 - 38:09]: Also entry points and so.
**Konsti | matchicalcom** [38:09 - 38:10]: So reading this will.
**Konsti | matchicalcom** [38:10 - 38:12]: Okay, also like just.
**Konsti | matchicalcom** [38:12 - 38:15]: Yeah, might be helpful.
**Konsti | matchicalcom** [38:20 - 38:25]: Okay, perfect, Very nice, Okay, thank you.
**Carlos | matchicalcom** [38:25 - 38:29]: And yes, just got the notification.
**Konsti | matchicalcom** [38:30 - 38:38]: Definitely check in with Chico, because he already obviously started a little Bit on this, but he don't have any time anymore.
**Konsti | matchicalcom** [38:39 - 38:41]: Today is his last day before his vacation.
**Carlos | matchicalcom** [38:41 - 38:53]: Yes, I need to check in because if some things are already, then I just need to see where he is or what is left, where he left it.
**Carlos | matchicalcom** [38:53 - 38:54]: Okay, cool.
**Carlos | matchicalcom** [38:56 - 38:57]: No worries.
**Konsti | matchicalcom** [38:58 - 38:59]: See ya.
**Carlos | matchicalcom** [38:59 - 39:00]: See you, Kosi, We'll see.
**Konsti | matchicalcom** [39:00 - 39:02]: Captain, give me an update as you have on cheers.
**Carlos | matchicalcom** [39:03 - 39:04]: Okay, don't worry.
**Carlos | matchicalcom** [39:05 - 39:06]: No, no.
**Carlos | matchicalcom** [39:06 - 39:07]: Of course.
**Carlos | matchicalcom** [39:07 - 39:07]: Of course.
**Carlos | matchicalcom** [39:07 - 39:12]: One of these died doesn't need to be too classy.
