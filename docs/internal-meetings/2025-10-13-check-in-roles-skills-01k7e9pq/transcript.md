# Check in Roles & Skills

**Carlos | matchicalcom** [01:26 - 01:37]: Hello, you are still muted, OK?
**Carlos | matchicalcom** [01:38 - 01:39]: No, you're not.
**Carlos | matchicalcom** [01:40 - 01:41]: Okay, no.
**Konsti | matchicalcom** [01:44 - 01:45]: Oh sound.
**Konsti | matchicalcom** [01:46 - 01:49]: I'm not so much into tech, right?
**Carlos | matchicalcom** [01:49 - 01:50]: You need help.
**Carlos | matchicalcom** [01:57 - 02:02]: This muting thing is just checking here.
**Carlos | matchicalcom** [02:02 - 02:15]: So before we start with the roles, I would just like to ask you in terms of duplicates from the query that we did, so the existing version of the roles were, you were able to delete all the duplicates.
**Konsti | matchicalcom** [02:17 - 02:24]: Negative I did not not yet I just did provide the I did sent you a screenshot of the query that you see.
**Carlos | matchicalcom** [02:24 - 02:26]: Yeah, you sent, you sent it, yeah.
**Carlos | matchicalcom** [02:26 - 02:28]: So it was not executed yet.
**Konsti | matchicalcom** [02:29 - 02:30]: It was not executed, right?
**Konsti | matchicalcom** [02:30 - 02:31]: I need to.
**Konsti | matchicalcom** [02:31 - 02:58]: But good point, thanks, I will do this today, But either way, like obviously they need to be remain deleted, but either way the duplication check should not check against roles that have a duplicate flag right?
**Konsti | matchicalcom** [02:58 - 03:02]: Or a deletion flag or a duplicate status.
**Carlos | matchicalcom** [03:03 - 03:11]: I think we are doing the on the depth duplication just the last couple of days.
**Carlos | matchicalcom** [03:11 - 03:12]: I think it was.
**Carlos | matchicalcom** [03:12 - 03:14]: I can remove that in that part.
**Carlos | matchicalcom** [03:14 - 03:16]: That's easy.
**Carlos | matchicalcom** [03:16 - 03:37]: Let me just check duplicate rules, so only find it only finds it as a duplicate or counts it at a duplicate.
**Carlos | matchicalcom** [03:37 - 03:41]: If the deletion flag is null or the nineteen hundred.
**Konsti | matchicalcom** [03:44 - 03:51]: Yes, and the status is not set to deleted or whatever.
**Carlos | matchicalcom** [03:53 - 03:55]: There is also a status I didn't.
**Konsti | matchicalcom** [03:55 - 03:58]: Check for that, yeah, there is a status.
**Carlos | matchicalcom** [03:59 - 04:00]: But let me see.
**Konsti | matchicalcom** [04:02 - 04:05]: Let me check what is the status or what should the status not be?
**Konsti | matchicalcom** [04:06 - 04:11]: The status should not be duplicate or deleted.
**Konsti | matchicalcom** [04:11 - 04:16]: So not be forty six and not be sixty one, actually six.
**Konsti | matchicalcom** [04:16 - 04:20]: Both should be already catched actually doesn't matter.
**Konsti | matchicalcom** [04:20 - 04:26]: Those statuses they only have, they also have a deletion flag, so they should.
**Carlos | matchicalcom** [04:26 - 04:28]: Be deleted afterwards, right?
**Konsti | matchicalcom** [04:28 - 04:31]: Yeah, So it should work already.
**Carlos | matchicalcom** [04:34 - 04:38]: The issue right now is the duplicates, they have a deletion flag and they were.
**Carlos | matchicalcom** [04:38 - 04:38]: Not deleted.
**Carlos | matchicalcom** [04:38 - 04:54]: So the system does not consider them the way that the validation is built is not considering them as duplicates, because they have that deletion flag or data date, that's what's preventing this?
**Carlos | matchicalcom** [04:57 - 05:05]: I would say, let's delete the duplicates first and then see if the query just works or if there is something else that needs to be done.
**Konsti | matchicalcom** [05:07 - 05:09]: Did you check the compute usage today?
**Carlos | matchicalcom** [05:10 - 05:11]: Yes, it's still high.
**Carlos | matchicalcom** [05:12 - 05:26]: So it has right now what we have is it slows down on weekends and off hours, but then when people are working just jumps to close to one hundred ninety something sometimes when people.
**Konsti | matchicalcom** [05:26 - 05:31]: Are working so it's it's usage, it's the usage.
**Konsti | matchicalcom** [05:31 - 05:37]: So but on the weekend when we have the cleanup jobs running, still it's too high.
**Carlos | matchicalcom** [05:37 - 05:59]: So as you've stated multiple times, this chart is not something great, so it doesn't really give me an overall idea of what is happening at each hour, but let me just share my screen so and see the same thing today at nine am.
**Carlos | matchicalcom** [06:00 - 06:16]: I would expect this so it's just close to high or just one hundred has been like this during, so this was midnight, so in here no one uses, but then this was the weekend, but still during the weekend.
**Carlos | matchicalcom** [06:16 - 06:27]: Yeah, still during the weekend, this is forty twenty four hours, it's it's high, But there were some people logging in during the weekend.
**Carlos | matchicalcom** [06:27 - 06:31]: I was checking the users and the last login date just to see.
**Carlos | matchicalcom** [06:31 - 06:35]: When people were logging in and not really sure why.
**Carlos | matchicalcom** [06:35 - 06:40]: But this is sorted by last login date when I get to this page.
**Konsti | matchicalcom** [06:42 - 06:43]: How wide?
**Carlos | matchicalcom** [06:44 - 06:53]: Not here it was Nicholas, but yeah, this is also Nick, yeah, this was Nikki also, but you see here, this is not.
**Carlos | matchicalcom** [06:53 - 06:56]: Nikki was on the tenth, but this.
**Konsti | matchicalcom** [06:56 - 06:59]: Is the tenth of October, it was.
**Carlos | matchicalcom** [06:59 - 07:13]: It was Friday, okay, yeah, so was just Nikki, but you see here, if we exclude even forty eight hours, we are about fifty users already people logging in so, ah, yeah, yeah, yeah.
**Konsti | matchicalcom** [07:13 - 07:22]: But today, like, like in one hour ago or in the last hour, like Tommy and Chico had to show the onboarding for forty.
**Carlos | matchicalcom** [07:23 - 07:29]: That's why they right if they log in frequently or not, let's see.
**Konsti | matchicalcom** [07:31 - 07:31]: Interesting.
**Carlos | matchicalcom** [07:33 - 07:40]: Oh, we should be able to, at least at least for for a few months constantly.
**Carlos | matchicalcom** [07:40 - 07:42]: We should be able to live with the hundred users.
**Konsti | matchicalcom** [07:43 - 07:47]: Yeah, we will need to buy like at least one package, because one package.
**Carlos | matchicalcom** [07:47 - 07:51]: Will be good for a very long time.
**Carlos | matchicalcom** [07:52 - 07:54]: But you said, I didn't understood.
**Carlos | matchicalcom** [07:54 - 07:59]: I'm not sure If I understood the credit you see at fifty-five, zero or five.
**Carlos | matchicalcom** [08:00 - 08:03]: Thousand per year, the one thousand users.
**Konsti | matchicalcom** [08:05 - 08:09]: The external ones is five thousand, yes.
**Carlos | matchicalcom** [08:09 - 08:11]: The external one is five thousand per year.
**Konsti | matchicalcom** [08:13 - 08:15]: And the internal ones as far.
**Carlos | matchicalcom** [08:15 - 08:18]: As I know, yeah, but yeah.
**Carlos | matchicalcom** [08:18 - 08:21]: But don't worry about internal ones, the internal ones, yeah, we don't, we don't.
**Konsti | matchicalcom** [08:21 - 08:25]: We, yeah, we will not buy internal ones, I know, but like because we.
**Carlos | matchicalcom** [08:25 - 08:35]: Are just no, no, no, for internal, don't worry about it, because when once magical as one thousand employees, I think it would be safe paying fifty thousand.
**Carlos | matchicalcom** [08:37 - 08:38]: It's a tech company.
**Carlos | matchicalcom** [08:38 - 08:40]: You don't want those many headcounts.
**Konsti | matchicalcom** [08:41 - 08:45]: No, we will never, of course.
**Carlos | matchicalcom** [08:45 - 09:00]: Maybe It's more AI, LLMs or something, not people, but so with a package of a thousand, we should be fine for a long time, but let's see if we can delay that as much as possible.
**Konsti | matchicalcom** [09:01 - 09:07]: Yeah, maybe at least a few, like I think probably until until the start of next year.
**Konsti | matchicalcom** [09:08 - 09:08]: Let's see.
**Carlos | matchicalcom** [09:08 - 09:16]: It depends, really depends, how many new clients you onboard and per client, how many people will be working in the system.
**Konsti | matchicalcom** [09:17 - 09:23]: We will get to know lovely this on Wednesday.
**Konsti | matchicalcom** [09:24 - 09:29]: Okay, so let's, let's see, okay, let's.
**Carlos | matchicalcom** [09:29 - 09:31]: Move on, okay, do you need an app?
**Carlos | matchicalcom** [09:32 - 09:33]: No, are you?
**Konsti | matchicalcom** [09:33 - 09:37]: Okay, I need you mean no, thank you.
**Konsti | matchicalcom** [09:37 - 09:38]: I'm fine.
**Carlos | matchicalcom** [09:38 - 09:41]: I look, I look tired, Yeah, you look tired.
**Carlos | matchicalcom** [09:41 - 09:45]: I don't know missing that energy that you normally bring, but it's Monday so.
**Konsti | matchicalcom** [09:47 - 09:54]: Yeah, yeah, I'm not, I'm not at full, full, full health today, like it's it's it's okay, but not not one hundred.
**Carlos | matchicalcom** [09:55 - 10:06]: Okay, can tell so, okay, resolution map and yes, let me show you something.
**Carlos | matchicalcom** [10:07 - 10:08]: Okay, you should.
**Konsti | matchicalcom** [10:10 - 10:13]: Here, do you hear the bird?
**Carlos | matchicalcom** [10:13 - 10:15]: Yes, I can hear a bird.
**Konsti | matchicalcom** [10:16 - 10:19]: Okay, that's nasty this categories, which location.
**Carlos | matchicalcom** [10:24 - 10:26]: Don'T worry, It's a bird.
**Carlos | matchicalcom** [10:26 - 10:29]: So like you are in a forest or something?
**Konsti | matchicalcom** [10:38 - 10:48]: Let's say, can you hear me?
**Carlos | matchicalcom** [10:48 - 10:50]: Yes, I can, It's good.
**Konsti | matchicalcom** [11:12 - 11:13]: Can you hear me?
**Carlos | matchicalcom** [11:14 - 11:15]: Yes, I can, all good.
**Carlos | matchicalcom** [11:16 - 11:19]: Okay, you are sharing teams right now.
**Konsti | matchicalcom** [11:20 - 11:22]: Yeah, because I plugged in the other monitor.
**Konsti | matchicalcom** [11:29 - 11:44]: So regarding the Resolution Map in general.
**Konsti | matchicalcom** [11:47 - 11:50]: Imagine the following scenario, that's actually not a made up scenario.
**Konsti | matchicalcom** [11:50 - 11:53]: There will be something quite frequent, basically.
**Konsti | matchicalcom** [11:56 - 11:58]: The scenario is the following.
**Konsti | matchicalcom** [12:01 - 12:10]: We are pathing a CV and then we pass for example ten engagements, or in general, we are parding multiple CV's in parallel and there are multiple engagements.
**Konsti | matchicalcom** [12:10 - 12:11]: Long story short.
**Konsti | matchicalcom** [12:11 - 12:18]: Imagine the use case, or not even with the pending thing, but imagine the following.
**Konsti | matchicalcom** [12:19 - 12:30]: Imagine in a skill or an engagement there is a skill requested like HTML, CSS, right.
**Konsti | matchicalcom** [12:32 - 12:35]: So what is the issue?
**Konsti | matchicalcom** [12:36 - 12:49]: We already kind of decided or opted in for doing a resolution map, but I realize that it's a little bit more complex, but just a little bit.
**Konsti | matchicalcom** [12:50 - 12:51]: The issue is the following.
**Konsti | matchicalcom** [12:52 - 12:59]: When we know, okay, this is the engagement first, we create the engagement obviously, then we will first classify the roles.
**Konsti | matchicalcom** [12:59 - 13:03]: When we have classified the roles, we create the engagement role right?
**Konsti | matchicalcom** [13:04 - 13:08]: And then we have basically everything to create the engagement role skill.
**Konsti | matchicalcom** [13:09 - 13:29]: What we could do is basically create this engagement role skill for the new skill that gets requested, in this case HTML, CSS, and leave this skill ID blank and put this engagement role skill ID into the resolution.
**Konsti | matchicalcom** [13:29 - 13:29]: Map.
**Konsti | matchicalcom** [13:29 - 13:38]: So basically, Aria, when you're done with this workflow, go to this entry and populate the skills to it.
**Konsti | matchicalcom** [13:38 - 13:40]: But this has two issues.
**Konsti | matchicalcom** [13:41 - 13:48]: The one issue is that it might be that we reject that skill because it's not relevant.
**Konsti | matchicalcom** [13:48 - 13:51]: Then we need, okay, then we just need to delete this one.
**Konsti | matchicalcom** [13:51 - 13:57]: The other issue is, imagine it was HTML, JavaScript or CSS.
**Konsti | matchicalcom** [13:57 - 14:05]: Doesn't matter, then it's not just one thing that we need to create, but we need actually to populate one item with HTML and then duplicate this.
**Carlos | matchicalcom** [14:06 - 14:07]: You need to duplicate the row.
**Konsti | matchicalcom** [14:09 - 14:13]: And create the other one with JavaScript, for example.
**Konsti | matchicalcom** [14:15 - 14:22]: But this works for engagement role skill, but it's actually, yeah.
**Konsti | matchicalcom** [14:23 - 14:27]: But my idea was what we could do now we have two options.
**Konsti | matchicalcom** [14:27 - 14:35]: We could say, okay, we don't want kind of duplicates and maybe deleting something, if we don't know if it will be classified at all.
**Konsti | matchicalcom** [14:35 - 14:43]: So we could either say, OK, in our resolution map we have the column for what will be the engagement role ID?
**Konsti | matchicalcom** [14:43 - 14:52]: Because if we know the engagement role and we know for example the tenant, then we would automatically know how to create this entry by ourselves, right?
**Konsti | matchicalcom** [14:52 - 14:54]: But this would not work.
**Carlos | matchicalcom** [14:55 - 15:06]: Just a question here to see if I understand when you subscribe to the resolution map, we would probably not create a row on the top table, right?
**Carlos | matchicalcom** [15:07 - 15:13]: Would be the engagement roles that would subscribe to the resolution map?
**Konsti | matchicalcom** [15:15 - 15:19]: Ah, no, this does not work, you know why?
**Konsti | matchicalcom** [15:20 - 15:23]: Because here it kind of would work because here we would have all the information.
**Konsti | matchicalcom** [15:23 - 15:28]: Ah, yeah, we know the tenant ID, we know the engagement role ID.
**Konsti | matchicalcom** [15:28 - 15:30]: So we can create multiple of these, right?
**Carlos | matchicalcom** [15:31 - 15:33]: One, multiple or zero.
**Carlos | matchicalcom** [15:33 - 15:34]: If it was rejected, that outcome would.
**Konsti | matchicalcom** [15:34 - 15:36]: Be or zero if it was rejected.
**Konsti | matchicalcom** [15:36 - 15:44]: But now imagine we are requesting a role a new role, also engagement, then the engagement would basically subscribe, right?
**Carlos | matchicalcom** [15:46 - 15:47]: Correct.
**Konsti | matchicalcom** [15:47 - 15:59]: But the issue is that the role has some extra fields that the prompt is telling us like here is a role front end developer and it was a forty percent engagement and solution architect was a sixty percent.
**Carlos | matchicalcom** [15:59 - 16:09]: So you could still create the engagement role to fill those fields just to be more to easier, but with a different category, right?
**Carlos | matchicalcom** [16:09 - 16:15]: You are in this case subscribing as an engagement role and not as a skill.
**Konsti | matchicalcom** [16:18 - 16:19]: For the engagement role.
**Konsti | matchicalcom** [16:19 - 16:30]: We need to have one more information and the information is the weight we already get from the LLM back the information back end developer forty percent, solution architect sixty percent.
**Konsti | matchicalcom** [16:31 - 16:43]: So we need to already have information stored R for that one entry that we are currently refresh requesting the weight will be forty percent and for that other entry it will be sixty percent.
**Konsti | matchicalcom** [16:48 - 17:03]: And with the demand requirement down here the issue is even bigger because here it's not just about the skill it would also be about is this nice to have or must have skill?
**Konsti | matchicalcom** [17:03 - 17:04]: What about the score?
**Konsti | matchicalcom** [17:04 - 17:07]: Is this a score of one, two, three, four, five That is needed?
**Konsti | matchicalcom** [17:09 - 17:13]: So there are some fields that are basically that we need to attach.
**Carlos | matchicalcom** [17:16 - 17:20]: I saw that it's created not sure if it's to solve this adjacent field on the resolution.
**Konsti | matchicalcom** [17:20 - 17:37]: That was my idea and I wanted to ask you how you think this that we pass instead of the record ID we just pass the record template JSON to the skill review and when we create the resolution map, we create this with just a record template JSON.
**Konsti | matchicalcom** [17:37 - 17:39]: This won't be a too big JSON.
**Konsti | matchicalcom** [17:39 - 17:53]: I just kept it to nineteen hundred characters for now and we are below the two thousand, but it will be probably maximum around like two hundred characters or so, because it's kind of three or four id's or so that we need to store there.
**Konsti | matchicalcom** [17:54 - 18:17]: And then the idea is when we do the resolve skill resolution, we basically loop through all the resolved skills because there could be multiple subscribed to a skill resolution of a skill registry ID and then we basically check like is it a skill or not?
**Konsti | matchicalcom** [18:17 - 18:21]: Like if it's no skill because it's not relevant, then we don't need to do anything.
**Konsti | matchicalcom** [18:21 - 18:25]: It's just set it to resolve true and done so.
**Konsti | matchicalcom** [18:25 - 18:35]: No, need to create an entry because we realize it's not relevant, but if it's relevant, we need to check okay, which ID is it and which category.
**Konsti | matchicalcom** [18:35 - 18:44]: And based on the category we just deserialize the template to a specific template with our straight ID identifier and then create the.
**Carlos | matchicalcom** [18:47 - 18:49]: Strictly for performance reasons Consti I.
**Carlos | matchicalcom** [18:49 - 18:52]: Would advise to create a structure for each type.
**Konsti | matchicalcom** [18:53 - 18:54]: Yeah, yeah.
**Carlos | matchicalcom** [18:54 - 19:01]: In this case you are sterilizing the old record, the old table record and that has a lot of fields that will be blank.
**Konsti | matchicalcom** [19:02 - 19:03]: Ah, no, no, no.
**Konsti | matchicalcom** [19:03 - 19:06]: We can set serialized default values to false.
**Carlos | matchicalcom** [19:07 - 19:11]: Okay, And you are only filling in those the ones that you need to.
**Carlos | matchicalcom** [19:11 - 19:12]: Okay, so that should work.
**Carlos | matchicalcom** [19:12 - 19:19]: I know, I know that you can do that, but don't you have any default values on the table?
**Carlos | matchicalcom** [19:19 - 19:22]: No, probably not OK, even though default.
**Konsti | matchicalcom** [19:22 - 19:23]: Values won't be serialized.
**Carlos | matchicalcom** [19:24 - 19:32]: Okay, okay, I need to see the value itself, but okay, yeah, just trying to minimize as much as possible that JSON.
**Carlos | matchicalcom** [19:32 - 19:41]: But okay, I think this will work if you know what to do afterwards, because in this case you'll be creating the records, right?
**Carlos | matchicalcom** [19:41 - 19:44]: So if it's we create the record.
**Konsti | matchicalcom** [19:44 - 19:49]: Only here when we do the final resolution that's when we create the record otherwise create any record.
**Konsti | matchicalcom** [19:49 - 19:55]: And it is not important for us, if we need to create one or two or four records because we have all information available.
**Konsti | matchicalcom** [19:58 - 20:02]: The only two things that come to my mind are the following.
**Konsti | matchicalcom** [20:02 - 20:17]: First we need to kind of check if the, for example in the meantime, for some reason the engagement got deleted then this will throw an error, because the engagement that we want to link is not there anymore.
**Konsti | matchicalcom** [20:17 - 20:19]: So we need to handle this one.
**Konsti | matchicalcom** [20:22 - 20:25]: Maybe you need to I can write this here.
**Konsti | matchicalcom** [20:26 - 20:29]: I was thinking not error.
**Carlos | matchicalcom** [20:33 - 20:37]: And in this case you just want to discard the record.
**Konsti | matchicalcom** [20:37 - 20:38]: No, why not?
**Konsti | matchicalcom** [20:38 - 20:39]: We classified it.
**Konsti | matchicalcom** [20:40 - 20:42]: Everything that we classified is valid for us.
**Konsti | matchicalcom** [20:42 - 20:43]: It's just like we don't need to.
**Carlos | matchicalcom** [20:45 - 20:49]: Attach, yeah, but the skill is already introduced.
**Konsti | matchicalcom** [20:53 - 20:54]: In general.
**Konsti | matchicalcom** [20:54 - 21:00]: I would suggest that we don't delete the resolution map right away.
**Konsti | matchicalcom** [21:00 - 21:17]: We just set it to resolved and when it's set to resolved and we set the last update basically, then we know the last time of resolution as soon then we check like okay, every resolution map entry that is resolved longer than four hours ago can be deleted.
**Carlos | matchicalcom** [21:17 - 21:18]: A few hours, right?
**Konsti | matchicalcom** [21:19 - 21:19]: Yeah.
**Carlos | matchicalcom** [21:22 - 21:30]: But I was talking about the engagement or any imagine the role or something else that got deleted meanwhile.
**Carlos | matchicalcom** [21:30 - 21:36]: So it will throw an error In this case, since you are doing the updates at the same time there we.
**Konsti | matchicalcom** [21:36 - 21:46]: Need to do this here inside of an handler action in this case and there we catch the error and just proceed the normal way right, right, right.
**Carlos | matchicalcom** [21:46 - 21:48]: So you need to encapsulate that.
**Carlos | matchicalcom** [21:48 - 21:50]: Yes, yes.
**Konsti | matchicalcom** [21:50 - 21:57]: And the second thing that came to my mind is that an issue is.
**Konsti | matchicalcom** [21:58 - 22:06]: In this case we lose the information about Where are things pending?
**Konsti | matchicalcom** [22:06 - 22:31]: We can only see it from the resolution map, like if we look at the resolution map, but imagine like now you as a user are seeing the engagement, you don't know that there are four skills still in queue, because in this case we just pass the template here and don't provide any information about, like so we don't create the engagement role skills if we.
**Konsti | matchicalcom** [22:31 - 22:34]: Would create them blank and just store the information.
**Konsti | matchicalcom** [22:34 - 22:35]: Ah, yeah.
**Konsti | matchicalcom** [22:35 - 22:38]: Here will be something populated later then we would have the information.
**Konsti | matchicalcom** [22:38 - 22:42]: Ah, here's something still waiting for classification.
**Konsti | matchicalcom** [22:42 - 22:44]: But if we don't create these, but.
**Carlos | matchicalcom** [22:44 - 22:51]: Just store the way, the way that you have it, would you be querying the resolution map.
**Konsti | matchicalcom** [22:51 - 22:58]: Yeah, But probably it's even not necessary because this happens so fast that we.
**Carlos | matchicalcom** [22:58 - 23:17]: Don'T need to Let's make sure that we don't need that, because for that I would say that you would have to probably take the ID out of the JSON, so it gets index in the table as a column and we would join pretty much almost do a joining between engagement.
**Carlos | matchicalcom** [23:17 - 23:19]: Roles and resolution map.
**Carlos | matchicalcom** [23:19 - 23:21]: But that table resolution map we need.
**Carlos | matchicalcom** [23:21 - 23:22]: To be very careful with it.
**Carlos | matchicalcom** [23:22 - 23:29]: So if we could live without that information I think would be better probably, yeah.
**Carlos | matchicalcom** [23:29 - 23:38]: So you can do one thing you could on the engagement role that you created everyone, or I'm waiting, right?
**Carlos | matchicalcom** [23:38 - 23:46]: So you don't provide additional information, but at least not sure if that's helpful or not, but you could do something like that to show the user.
**Carlos | matchicalcom** [23:46 - 23:48]: If you need to user, I know.
**Konsti | matchicalcom** [23:48 - 23:51]: Because it could be multiple ones.
**Konsti | matchicalcom** [23:51 - 24:03]: But what we could do is we could attach one more ID to the resolution map and this ID could basically be not the record ID, but the parent record ID.
**Konsti | matchicalcom** [24:05 - 24:16]: So in this case, for engagement role skills is the engagement role, for engagement role is the engagement and for demand requirements it's the demand and so we are this query to.
**Carlos | matchicalcom** [24:16 - 24:21]: But I was going to ask you the parent, but that will be the only ID that we have.
**Carlos | matchicalcom** [24:21 - 24:23]: That's the ID, right?
**Carlos | matchicalcom** [24:23 - 24:30]: Because when you are introducing skills, the only thing that you have would be the engagement role ID.
**Konsti | matchicalcom** [24:31 - 24:32]: Yeah.
**Konsti | matchicalcom** [24:32 - 24:42]: And with the engagement role basically, when I'm in the engagement for the consultant, I could filter then the registry record and then show you higher.
**Konsti | matchicalcom** [24:42 - 24:43]: Here are these things pending.
**Carlos | matchicalcom** [24:45 - 24:47]: So just have a REC.
**Carlos | matchicalcom** [24:47 - 24:51]: You have a category ID, just have again the object ID or record ID.
**Konsti | matchicalcom** [24:51 - 24:59]: Or something probably, yeah, kind of a record ID or not really the record, but the parent record ID or so, yeah, I don't know.
**Konsti | matchicalcom** [24:59 - 25:04]: Could be a case We can do this, we do not necessarily, but probably makes sense, right?
**Carlos | matchicalcom** [25:05 - 25:06]: Just add it.
**Carlos | matchicalcom** [25:06 - 25:14]: And I would say that in terms of interface, if we would not use it, would be better to be honest, because that would be a hard one to if you are.
**Carlos | matchicalcom** [25:14 - 25:19]: Always requesting that, it's probably a lot, but at least you have it.
**Konsti | matchicalcom** [25:20 - 25:23]: If we are always requesting what do you mean?
**Carlos | matchicalcom** [25:23 - 25:30]: Oh, it would be a lot of queries against the same table that while you are trying to doing the resolution itself.
**Konsti | matchicalcom** [25:33 - 25:34]: True, right?
**Carlos | matchicalcom** [25:34 - 25:43]: Yeah, I would probably the category parent record id that combination should.
**Carlos | matchicalcom** [25:43 - 25:43]: Be index.
**Konsti | matchicalcom** [25:47 - 25:50]: So we should combine index, yeah.
**Konsti | matchicalcom** [25:51 - 25:56]: But when I do, I still need to do a parent index.
**Carlos | matchicalcom** [25:58 - 25:58]: No.
**Carlos | matchicalcom** [25:58 - 26:14]: So just do both indexes on the same, on the same first, but dory it is the most common and then the ID just it has a little bit of impact on the way you made the JSON just careful.
**Carlos | matchicalcom** [26:15 - 26:16]: It's not JSON, it's the.
**Konsti | matchicalcom** [26:16 - 26:20]: Oh, thank you.
**Carlos | matchicalcom** [26:21 - 26:23]: Okay, I think that's cool.
**Konsti | matchicalcom** [26:24 - 26:37]: OK, another thing is okay in this case, when we have this one, we also need to pass it to the scale review, right?
**Konsti | matchicalcom** [26:43 - 26:46]: Because it needs to be created here.
**Carlos | matchicalcom** [26:50 - 26:52]: And you have one on the left.
**Carlos | matchicalcom** [26:52 - 26:54]: You have another visual skill resolution map.
**Konsti | matchicalcom** [26:54 - 26:57]: There on the left, Yeah, thank you.
**Konsti | matchicalcom** [27:01 - 27:09]: Another question I'm having is I moved a little bit around here with folders because it always.
**Konsti | matchicalcom** [27:13 - 27:29]: OK, another thing that came to my mind was, ah yeah, this is also a thing that we need to consider.
**Konsti | matchicalcom** [27:29 - 27:31]: It's basically like.
**Konsti | matchicalcom** [27:31 - 27:50]: Imagine here the roles, example, right when an engagement for example, has two roles, One role is role is front-end developer and the other.
**Konsti | matchicalcom** [27:50 - 27:52]: Role is cook for example.
**Konsti | matchicalcom** [27:55 - 27:57]: And the LLM would return those two roles.
**Konsti | matchicalcom** [27:57 - 28:07]: Ah yeah, it's the front end developer and the front end developer has a weight of forty percent and the cook has a weight of sixty percent, because he was a front end developer in the kitchen, I don't know.
**Konsti | matchicalcom** [28:07 - 28:20]: Yeah, whatever, yeah, Like then we would have this weight and now this weight information would be stored because we put it in our template for the front end developer, the fourteen percent, the cook the sixty percent.
**Konsti | matchicalcom** [28:20 - 28:31]: When we now come to the decision that we reject the cook then, basically, because it's not relevant for us.
**Konsti | matchicalcom** [28:31 - 28:35]: Basically we would end up with just having the front end developer role with.
**Carlos | matchicalcom** [28:35 - 28:36]: Forty percent, forty percent.
**Konsti | matchicalcom** [28:39 - 28:49]: Same would happen if we have for example the front end developer was fifty percent, but it would be front end developer, full stack developer and we would divide it into two roles.
**Konsti | matchicalcom** [28:50 - 29:05]: And what do we do then, if we have a template and we have multiple roles for the same kind of thing, because it was a composite request, We kind of need to divide do the amount of.
**Carlos | matchicalcom** [29:06 - 29:09]: Okay, yeah, I see, but you probably don't want to do it.
**Carlos | matchicalcom** [29:09 - 29:12]: You need to know when all the.
**Konsti | matchicalcom** [29:13 - 29:14]: Things are done.
**Carlos | matchicalcom** [29:16 - 29:32]: When was the last one of all the ones that were waiting, so you need to know, I think I know the way to get there would be that engagement role as nothing else on the Resolution Map at that Point.
**Carlos | matchicalcom** [29:32 - 29:36]: You need to balance the weights or.
**Konsti | matchicalcom** [29:36 - 29:41]: Apply some business rules that engagement has no other role on the resolution map, then we can.
**Konsti | matchicalcom** [29:41 - 30:04]: That's a good idea so we could use the resolution map as a trigger for checks.
**Carlos | matchicalcom** [30:21 - 30:24]: These comments are not easy to resize.
**Carlos | matchicalcom** [30:26 - 30:36]: Yeah, yeah, just weird, but yeah, so yeah, in this case, for everything I will have to think about sometimes even.
**Konsti | matchicalcom** [30:36 - 30:37]: Easy to move right.
**Carlos | matchicalcom** [30:38 - 30:40]: Yeah, yeah, yeah, yeah, just, but it.
**Konsti | matchicalcom** [30:40 - 30:43]: Helps, it helps true.
**Konsti | matchicalcom** [30:45 - 30:46]: Give me a second.
**Konsti | matchicalcom** [30:46 - 30:48]: I need to do some more cosmetics.
**Konsti | matchicalcom** [31:10 - 31:20]: I think in general what we should do, because for example, there's a little bit similar scenario for the demand requirements.
**Konsti | matchicalcom** [31:21 - 31:27]: Basically like when you see what I did to implement this, you will say like, oh god, lucky.
**Konsti | matchicalcom** [31:27 - 31:33]: I said, we don't have so many demands, because there's so much overhead on calculating demand weights.
**Konsti | matchicalcom** [31:36 - 31:44]: But yeah, long story short, for each of the demand requirements I'm calculating based on a certain algorithm dynamic weight.
**Konsti | matchicalcom** [31:45 - 32:07]: This action can definitely also be heavily optimized probably and I'm doing it over and over again until I'm kind of sure, okay, I think now every skill is finally approved or verified, so what we definitely should do is in our workflow where we do the demand parsing or the CV parsing.
**Konsti | matchicalcom** [32:07 - 32:22]: In the end we should not even wait for all skills or roles to be finally improved, because sometimes one skill or so could kind of take longer for some reason.
**Konsti | matchicalcom** [32:22 - 32:38]: AI randomness, so we should set a fixed kind of time, okay, after we started classification of all skills and roles and they are running in parallel either way let's wait, let's say like one minute and then we can assume that ninety-five percent of those.
**Konsti | matchicalcom** [32:38 - 32:44]: Things are let's see, let's see, don't.
**Carlos | matchicalcom** [32:44 - 32:55]: Like that looks like too random, but I see with the AI LLM that sometimes it.
**Carlos | matchicalcom** [32:55 - 33:02]: Might get funky, but can we have to retry it and it will take longer.
**Konsti | matchicalcom** [33:02 - 33:09]: That's the problem right there Let's work on this when we are there, when we have a stable setup with the other things.
**Konsti | matchicalcom** [33:11 - 33:18]: So what did I do like it really like until I had the idea how to resolve what?
**Konsti | matchicalcom** [33:20 - 33:44]: And basically also coming to the point that we need to resolve it by working with a template like, really, it was Friday morning and it was like I had three hours of dedicated focus thinking things through and was like what the hell in my head?
**Konsti | matchicalcom** [33:44 - 33:49]: Because it was, there are so many weird scenarios that can happen, basically.
**Konsti | matchicalcom** [33:52 - 34:01]: For example when you like, imagine you have a skill And for that skill you have a resolution map, right?
**Konsti | matchicalcom** [34:03 - 34:12]: And this resolution map can has multiple entries, because like three other things already subscribed to that resolution map, sure.
**Konsti | matchicalcom** [34:12 - 34:24]: And now after the first decomposition you realize it's a composite skill it's a composite, so it's HTML, CSS and JavaScript.
**Konsti | matchicalcom** [34:24 - 34:42]: So what you need to do is basically for each of the composites you need to spin up a new review run, but you cannot just pass, ah yeah, this is for the review we usually pass the record template, right?
**Konsti | matchicalcom** [34:42 - 34:46]: And the category that's what we usually did, right?
**Konsti | matchicalcom** [34:47 - 34:50]: But I Cannot pass the record template and the category.
**Konsti | matchicalcom** [34:50 - 34:57]: Because I have at that point potentially eventually multiple entries already assigned to this one, right?
**Konsti | matchicalcom** [34:58 - 35:03]: So I either need to fetch all them and Change.
**Konsti | matchicalcom** [35:03 - 35:05]: The Skill Review.
**Konsti | matchicalcom** [35:05 - 35:08]: Action to Kind of Bulk Attach.
**Konsti | matchicalcom** [35:08 - 35:11]: Skill Resolution Maps or what I.
**Konsti | matchicalcom** [35:11 - 35:33]: Did I did build basically a wrapper for like OK, if you do a skill review with having an existing registry, so not coming with a category ID and a fixed template JSON, but having a registry where multiple things are in basically for each of these I need to do the skill review.
**Konsti | matchicalcom** [35:34 - 35:46]: If we are already finding a skill, because maybe for HTML we can already find something, so we don't need to spin up resolution, we can just do a resolution based on this new skill that we did find right now.
**Konsti | matchicalcom** [35:47 - 35:57]: And if we cannot do a resolution, we basically need to append like all the current registry items to the new registry, right?
**Konsti | matchicalcom** [35:58 - 36:00]: And then create those registry entries in the end.
**Carlos | matchicalcom** [36:02 - 36:05]: Trying to follow, yeah, it's.
**Konsti | matchicalcom** [36:05 - 36:06]: Pretty fucked up, right?
**Konsti | matchicalcom** [36:06 - 36:24]: Because the idea is OK, someone requested HTML, CSS and JavaScript, and you realize it's a composite and we are decomposing it into three things, and the first thing, the HTML, we do a review and we can resolve it right away.
**Konsti | matchicalcom** [36:24 - 36:59]: So what we need to do is everything that subscribed to HTML, CSS, JavaScript needs to get handled with the resolution that we currently have, but then for JavaScript, for example, the second one, we have something that's currently pending, so what we need to do is yeah, okay, all those things that Subscribe to HTML, JavaScript and CSS, those now we need to create new registry entries to subscribe to the JavaScript branch, you know, OK, yeah.
**Konsti | matchicalcom** [37:00 - 37:06]: In this way we spin up new resolution map entries, because for the composite.
**Carlos | matchicalcom** [37:06 - 37:09]: Ones, yeah, for the composite, for the.
**Konsti | matchicalcom** [37:09 - 37:21]: Split ones in this case, and the term itself that gets that did get decomposed here we can basically say, okay, we add it to the normalization table and then resolve.
**Carlos | matchicalcom** [37:21 - 37:22]: It.
**Konsti | matchicalcom** [37:22 - 37:26]: And when we resolve it and don't pass the skill, leave empty.
**Konsti | matchicalcom** [37:27 - 37:33]: If not relevant or in case of decomposition, then we just resolve it with we don't have a skill.
**Konsti | matchicalcom** [37:33 - 37:43]: So we resolved this, because these initial entries that we created for the composite term are now resolved because we know how we did spin up new entries.
**Carlos | matchicalcom** [37:44 - 37:47]: It will be resolved right here and.
**Konsti | matchicalcom** [37:47 - 37:48]: Those are resolved true.
**Konsti | matchicalcom** [37:48 - 38:04]: That's why we cannot delete the resolution map right away, Because if we would delete the resolution map entries right away, why we are looping through this one here as soon as we are done with the first one, we would delete the entries.
**Carlos | matchicalcom** [38:07 - 38:09]: But leaving them like twenty four hours.
**Carlos | matchicalcom** [38:09 - 38:11]: I don't think that's a bad thing.
**Carlos | matchicalcom** [38:11 - 38:20]: And because we need it even depends on what's the size of this table.
**Konsti | matchicalcom** [38:21 - 38:39]: Probably it won't be too big, because at some point we have eighty percent of the skills and it will be just a small amount of news once, yeah, But okay, what I wanted to do, but then my brain was basically and I got disturbed by meetings.
**Konsti | matchicalcom** [38:39 - 38:45]: I am currently creating the front end real quick for the registry.
**Konsti | matchicalcom** [38:45 - 38:50]: As well and I basically want to test the logic that I implemented here.
**Konsti | matchicalcom** [38:51 - 39:03]: If everything is working well with this resolution, when this is working correctly, then I can finally move on to my actually second step, the classification itself, right?
**Carlos | matchicalcom** [39:04 - 39:06]: But I think we are going the right direction.
**Konsti | matchicalcom** [39:07 - 39:08]: Yeah, yeah, yeah.
**Konsti | matchicalcom** [39:08 - 39:11]: And it's like, it's it's it's it's it's a little bit.
**Konsti | matchicalcom** [39:11 - 39:16]: It's tough because there are so many things to consider, but those cases basically have happened.
**Konsti | matchicalcom** [39:16 - 39:17]: If you just increase the numbers.
**Carlos | matchicalcom** [39:19 - 39:24]: I think in this case you know these scenarios because you've been there, right?
**Carlos | matchicalcom** [39:24 - 39:28]: You've been through a few of these things.
**Carlos | matchicalcom** [39:29 - 39:33]: Okay, Looks like you have this under control at this point, That's not bad.
**Carlos | matchicalcom** [39:36 - 39:39]: Do you have specific things for me to tackle in this part?
**Konsti | matchicalcom** [39:40 - 39:41]: In this part?
**Konsti | matchicalcom** [39:41 - 39:46]: No, because I'm already deep down in it and it probably makes no sense if you appreciate that.
**Carlos | matchicalcom** [39:49 - 39:53]: Because you have this in your mind, so it's more difficult.
**Konsti | matchicalcom** [39:54 - 39:55]: It would be just not efficient.
**Konsti | matchicalcom** [39:55 - 39:57]: It would be so much friction, because like.
**Carlos | matchicalcom** [39:59 - 40:02]: I still at least have a few things that I would like to tackle.
**Carlos | matchicalcom** [40:02 - 40:12]: But if you have others more priority, just let me know I would love to enforce some rules against the graph things like all the skill concepts need to have.
**Carlos | matchicalcom** [40:12 - 40:20]: A category, All the skills need to have one skill concept, only one primary in each concept.
**Carlos | matchicalcom** [40:20 - 40:42]: So at least something that runs, I would say once per day or something like that to make sure that we enforce those rules, so it doesn't really get out of control from the from the beginning and maybe even not doing a lot of changes and just like emailing us or doing something if these things are found because we need to fix them.
**Carlos | matchicalcom** [40:42 - 40:44]: We need to understand how they are.
**Konsti | matchicalcom** [40:44 - 40:46]: Happening one hundred percent.
**Konsti | matchicalcom** [40:47 - 40:58]: That's also what I did like here for example, here's a case where I realized this one should actually not have happened that we are not in a composite and do a review for skill.
**Konsti | matchicalcom** [40:58 - 41:05]: It doesn't matter, but yeah, that's what I also learned for scenarios where we think they should not happen.
**Konsti | matchicalcom** [41:07 - 41:10]: WE should include error handling if AI is.
**Konsti | matchicalcom** [41:10 - 41:42]: Involved and they could happen if the AI is doing some errors, because we need to know cool no like what is the like when I'm done here and tested this, then we can actually move on to the second step and from there on it's mostly on me, because it's more about prompting an AI and so on so what you could tackle next after you worked on the graph thing is really the AI stuff, right?
**Konsti | matchicalcom** [41:42 - 42:01]: Because my issue that I'm still having in my head is again when imagine, even if we do it via workflows, right and within the workflow, we do one node per AI call, so we always have an action that basically is a wrapper for gather the data that we need.
**Konsti | matchicalcom** [42:01 - 42:12]: Call the AI, save it and then done action done and we go to the next route within a workflow we cannot really pass along a lot of.
**Konsti | matchicalcom** [42:12 - 42:15]: We can pass along parameters, but no structures.
**Konsti | matchicalcom** [42:17 - 42:23]: So in workflows I already realized in workflows, when you have output of your service action, you cannot output structures.
**Konsti | matchicalcom** [42:23 - 42:24]: You can only.
**Carlos | matchicalcom** [42:26 - 42:30]: Simple permit, you can do always serialize it, yeah.
**Konsti | matchicalcom** [42:30 - 42:37]: But when you cannot output structures, you can already tell that it is limited to a certain amount of characters, It has a limit.
**Carlos | matchicalcom** [42:37 - 42:40]: Yeah, you don't want to grow with that too much.
**Carlos | matchicalcom** [42:40 - 42:46]: But okay, you have meeting with lovely Wednesday, right.
**Konsti | matchicalcom** [42:48 - 42:49]: Until then?
**Konsti | matchicalcom** [42:49 - 42:51]: We can wait until then, but what.
**Carlos | matchicalcom** [42:55 - 42:56]: Go ahead?
**Konsti | matchicalcom** [42:57 - 42:58]: I'm sorry.
**Konsti | matchicalcom** [42:58 - 43:14]: My big question is, as I already said it once, no matter what we do when we do it async and for async I mean basically it's not happening within one action flow.
**Konsti | matchicalcom** [43:15 - 43:20]: We will always have the issue that I'm preparing some data to do one call.
**Konsti | matchicalcom** [43:22 - 43:37]: And when this call is done, I need to store the information or even if it's a Webhook doesn't matter, but basically I'm preparing this data for the first step and when I start in the second step, the second step cannot be aware about the state of the first step.
**Konsti | matchicalcom** [43:37 - 43:39]: So I need to re prepare the data.
**Konsti | matchicalcom** [43:39 - 43:43]: And sometimes this data preparation is like fetching a lot of things.
**Carlos | matchicalcom** [43:44 - 43:47]: I do have access to Zero eleven environment.
**Carlos | matchicalcom** [43:49 - 43:58]: I will use it to try to create an example that you would question and let's build that together.
**Carlos | matchicalcom** [43:58 - 44:05]: So let me prepare a first approach on this other environment that I have as a partner in dev.
**Carlos | matchicalcom** [44:05 - 44:15]: So just would not worry too much about security, but I will build like a rest endpoint that will give you magical environment connection.
**Carlos | matchicalcom** [44:16 - 44:22]: And we can start building that approach at least what I have in my head and let's see what's missing.
**Carlos | matchicalcom** [44:23 - 44:25]: So we don't have to wait.
**Konsti | matchicalcom** [44:25 - 44:28]: It would be a Webhook like approach, right?
**Carlos | matchicalcom** [44:28 - 44:31]: Yes, yes, some kind of restaurant.
**Konsti | matchicalcom** [44:35 - 44:39]: This would be basically the same as we would do it within workflows, right?
**Carlos | matchicalcom** [44:40 - 44:46]: No, Because just moving out, there's advantage of no timeouts or much longer timeouts.
**Carlos | matchicalcom** [44:48 - 44:55]: The question here that you have, I think is, how can you continue a workflow from a certain point with new data?
**Carlos | matchicalcom** [44:56 - 45:00]: Because I don't want to start another workflow to recreate the data.
**Carlos | matchicalcom** [45:00 - 45:09]: I want to have access to the previous one that was there and I think with the wide steps and just relaunching the activity or do a few things.
**Carlos | matchicalcom** [45:09 - 45:10]: I think it's possible.
**Carlos | matchicalcom** [45:11 - 45:14]: Never done it between ODC and Zero eleven, to be honest.
**Carlos | matchicalcom** [45:14 - 45:17]: But I think a lot of limitations.
**Konsti | matchicalcom** [45:17 - 45:28]: I don't get how it can be possible, because when I'm fetching the data here in ODC inside an action, this action cannot last longer than one hundred twenty seconds.
**Carlos | matchicalcom** [45:28 - 45:29]: Correct.
**Carlos | matchicalcom** [45:29 - 45:37]: But you have the outputs available in ODC in the workflow.
**Konsti | matchicalcom** [45:42 - 45:47]: No, the outputs, yeah, but just the outputs, just keys.
**Konsti | matchicalcom** [45:47 - 45:48]: I cannot use structures.
**Konsti | matchicalcom** [45:49 - 45:52]: I cannot tell you this structure I fetched.
**Carlos | matchicalcom** [45:55 - 45:56]: I need to answer these calls.
**Carlos | matchicalcom** [45:56 - 45:57]: Sorry, give me just a second.
**Konsti | matchicalcom** [45:57 - 45:59]: Okay, no worries.
**Konsti | matchicalcom** [49:06 - 49:08]: I'm back, sorry, easy, no worries.
**Konsti | matchicalcom** [49:08 - 49:10]: Yeah, yeah, let's let's not.
**Konsti | matchicalcom** [49:10 - 49:16]: Sorry, I'm so much thinking about something that's not there yet, but yeah, yeah.
**Carlos | matchicalcom** [49:16 - 49:17]: Let me give me.
**Carlos | matchicalcom** [49:17 - 49:18]: I think you.
**Konsti | matchicalcom** [49:20 - 49:32]: What I can tell you, Carlos, I can tell you the two minutes is not so much our bottleneck anymore, because models are getting faster.
**Konsti | matchicalcom** [49:32 - 49:38]: There are like ten percent of our calls where we probably need something really long lasting.
**Konsti | matchicalcom** [49:38 - 49:44]: But there we can maybe even use from the API the back end option that they provide.
**Konsti | matchicalcom** [49:44 - 49:49]: So it's not about that we achieved something that holds for longer than five minutes.
**Konsti | matchicalcom** [49:50 - 50:07]: But the issue that I'm seeing is also regarding performance, because what I did read is like, okay, while a threat that is calling an LLM within, for example our ODC flow or in Lambda or whatever, while this one is waiting for the response, it's basically kind of idle, right?
**Konsti | matchicalcom** [50:07 - 50:21]: It's waiting so it's waiting much CPU, but your amount of workers is limited, so slows down the system in this way and that's an issue that we will have, because they will always take.
**Carlos | matchicalcom** [50:23 - 50:30]: Thirty seconds after I've seen your system working, I would say that everything that is CV parsing related should happen in.
**Carlos | matchicalcom** [50:30 - 50:31]: Another environment.
**Carlos | matchicalcom** [50:32 - 50:44]: Would be awesome to have another machine just running these things, because you want to offload it from the main server that is serving the application or else like A batch of one hundred or two hundred will always be.
**Carlos | matchicalcom** [50:44 - 50:45]: A problem.
**Carlos | matchicalcom** [50:46 - 50:54]: So would be awesome to be able to run these things on a side environment in a replica machine something.
**Carlos | matchicalcom** [50:55 - 50:58]: I've done some of these things, for example sometimes even on prem, right?
**Carlos | matchicalcom** [50:58 - 51:13]: When we have the machines or there was one project in the test environment, we would do some production stuff to the test environment running there and just provide the outputs again to production just to load it a little bit.
**Carlos | matchicalcom** [51:13 - 51:18]: Okay, The limitations that we have and we work with them, But in this.
**Konsti | matchicalcom** [51:18 - 51:24]: Case, the workflows are running on a dedicated computer instance, right?
**Carlos | matchicalcom** [51:24 - 51:25]: Yes.
**Carlos | matchicalcom** [51:25 - 51:31]: For that specific, when they are running that activity, it's just separate as timers, So the moment that they are running.
**Carlos | matchicalcom** [51:31 - 51:40]: They are in an additional way, but it still would already help and don't forget the computer is different.
**Carlos | matchicalcom** [51:40 - 51:41]: Yes.
**Carlos | matchicalcom** [51:41 - 51:45]: But on the database it's always fetching and querying and updating and the database.
**Konsti | matchicalcom** [51:45 - 51:48]: Is always the same shit.
**Konsti | matchicalcom** [51:48 - 51:56]: Yeah, The workflow itself is on another machine, but the workflow is calling and these are on our machine, right?
**Carlos | matchicalcom** [51:56 - 51:57]: No.
**Carlos | matchicalcom** [51:57 - 52:00]: But when they say that they are running a different computer, I don't know.
**Carlos | matchicalcom** [52:01 - 52:03]: When they say that they are running.
**Konsti | matchicalcom** [52:03 - 52:06]: Your microphone is empty or your headphones?
**Konsti | matchicalcom** [52:06 - 52:06]: I don't know.
**Konsti | matchicalcom** [52:08 - 52:09]: Or is it my sound?
**Konsti | matchicalcom** [52:09 - 52:10]: Say something?
**Carlos | matchicalcom** [52:10 - 52:11]: Can't you hear me?
**Konsti | matchicalcom** [52:11 - 52:12]: I don't hear you anymore.
**Carlos | matchicalcom** [52:13 - 52:13]: No.
**Konsti | matchicalcom** [52:16 - 52:17]: Give me a second.
**Carlos | matchicalcom** [52:18 - 52:21]: I haven't changed anything on my side, but you never know.
**Konsti | matchicalcom** [52:21 - 52:24]: No, no, my headphones connected.
**Carlos | matchicalcom** [52:25 - 52:26]: Can you hear me?
**Konsti | matchicalcom** [52:26 - 52:27]: Yeah, I hear you.
**Carlos | matchicalcom** [52:28 - 52:29]: Okay, okay, okay.
**Carlos | matchicalcom** [52:29 - 52:33]: I was saying that let me just share my screen so you can.
**Konsti | matchicalcom** [52:39 - 52:39]: So.
**Carlos | matchicalcom** [52:40 - 52:43]: I will say you have multiple things right?
**Carlos | matchicalcom** [52:43 - 53:05]: So when you go to custom code so some things will run on these ones, but the database compute even if you have a different compute distance to run a timer or to run the workflow, the code part, so the call of LLM would be here so you see apps, workflows and timers.
**Carlos | matchicalcom** [53:05 - 53:10]: The bigger button like that we have right now is that it's compute so.
**Konsti | matchicalcom** [53:10 - 53:18]: It'S the time this one we will get rid of When we have the everything moved away from and all these.
**Carlos | matchicalcom** [53:18 - 53:26]: Processing time or pendings in processing resolution, all that would happen, the different server and on ODC environment you would be.
**Carlos | matchicalcom** [53:26 - 53:30]: Focused on servicing the app itself that you have.
**Konsti | matchicalcom** [53:30 - 53:37]: But it's okay, if we still build everything here now and test it, because moving into Zero Eleven or so is just copy paste, right?
**Konsti | matchicalcom** [53:37 - 53:40]: I also did it a few times you did it.
**Carlos | matchicalcom** [53:40 - 53:51]: I'm not sure if there are some licensing sometimes between the environments there are licensing issues, I'm assuming that they will not complicate because it will be both environments and their magical.
**Carlos | matchicalcom** [53:51 - 53:56]: So I don't see a problem, but I will have to have the O-Eleven Environment first running and.
**Carlos | matchicalcom** [53:56 - 53:57]: Testing to be sure.
**Konsti | matchicalcom** [53:57 - 53:58]: Yeah, yeah, yeah.
**Konsti | matchicalcom** [53:58 - 54:12]: Sure when I moved something from one Zero Eleven instance to another one, I had this licensing issue where I needed this report, but from Zero Eleven to ODC there was no licensing issue by the way now there's one more thing.
**Konsti | matchicalcom** [54:12 - 54:33]: But just like if you're working on the graph thing, what you and maybe the API to our systems, what you could also consider is still one open question that's directly related to this one is how do we store and query basically the language supported names and descriptions?
**Konsti | matchicalcom** [54:35 - 54:52]: Do we put it in a graph in a property that just has adjacent so where we have an array in the property for each language or do we do it in a mirrored outsystems entity that we then need to sync?
**Konsti | matchicalcom** [54:55 - 54:57]: That's definitely an issue that's related to.
**Konsti | matchicalcom** [54:57 - 54:59]: Okay, what can we do best here?
**Konsti | matchicalcom** [54:59 - 55:00]: So when you work on the interface?
**Konsti | matchicalcom** [55:00 - 55:02]: I think that's right.
**Carlos | matchicalcom** [55:04 - 55:13]: I think on that at some point we will need a mirror table in our systems because of joins mainly.
**Carlos | matchicalcom** [55:14 - 55:18]: I think we will need to join against skills someday.
**Carlos | matchicalcom** [55:19 - 55:21]: I would prefer not to worry about it right now.
**Carlos | matchicalcom** [55:21 - 55:26]: Let's just making sure that we are introducing things correctly and let's see if we really need.
**Konsti | matchicalcom** [55:26 - 55:34]: It's not like something is connecting to a skill and the skill connecting is then to something different.
**Konsti | matchicalcom** [55:38 - 55:44]: Basically we only need the name for displaying and therefore we could build a component.
**Konsti | matchicalcom** [55:44 - 55:50]: But this would mean, if you see one hundred skill text on a screen, this component needs to be triggered and fetched one hundred times, right?
**Konsti | matchicalcom** [55:50 - 55:51]: That's the only issue.
**Carlos | matchicalcom** [55:52 - 55:58]: Yeah, Unless it's to be very performant, could be a JavaScript array or something that.
**Carlos | matchicalcom** [55:58 - 56:03]: We get just name so could stay like a resource file.
**Konsti | matchicalcom** [56:04 - 56:05]: Okay, Oh.
**Carlos | matchicalcom** [56:09 - 56:21]: If you just context and you have keys, just build a big array that is always available or that is part of the domain of the application.
**Carlos | matchicalcom** [56:21 - 56:21]: Something like that.
**Carlos | matchicalcom** [56:21 - 56:23]: So would be a web lock that was always.
**Carlos | matchicalcom** [56:23 - 56:31]: There that has the We just need to make sure that it's always persistent, so it doesn't get destroyed and is part of the application.
**Carlos | matchicalcom** [56:31 - 56:42]: Or we can even do some client stored information on the browser just for the translation.
**Konsti | matchicalcom** [56:42 - 56:47]: But there are some creative, even kind of a CDN solution.
**Carlos | matchicalcom** [56:49 - 56:55]: Just to do the name resolving so calling.
**Konsti | matchicalcom** [56:55 - 56:59]: Our system, but it's just calling a CDM and the CDM is even like.
**Carlos | matchicalcom** [56:59 - 57:13]: On edge for example, for example, because it's just text and you have keys so that shouldn't be a very hard problem to solve, but for now we can call it the graph for now.
**Carlos | matchicalcom** [57:13 - 57:21]: Even if we have to add a property in the graph, just to have the multi language, just to make it work without additional complexity.
**Carlos | matchicalcom** [57:21 - 57:33]: We know that would be some technical debt maybe that we need to solve in the near future, but would prefer not to bring additional components at this moment, so it doesn't really get out of there.
**Konsti | matchicalcom** [57:35 - 57:35]: Easy, cool.
**Konsti | matchicalcom** [57:36 - 57:37]: All right, perfect, Carlos.
**Konsti | matchicalcom** [57:37 - 57:46]: So a lot of things you always need to tell me if I go too deep down on the thing, because sometimes it just makes sense.
**Konsti | matchicalcom** [57:46 - 57:48]: Okay, this is our next thing.
**Konsti | matchicalcom** [57:48 - 57:49]: Let's move on.
**Carlos | matchicalcom** [57:49 - 57:50]: No, don't worry.
**Carlos | matchicalcom** [57:50 - 57:59]: But when you start talking and you are deep down on this resolution map and all things, but it's in your mind so yeah, let's implement it, let's test it and make it work.
**Carlos | matchicalcom** [58:00 - 58:07]: I will enforce some rules on the graph for now and we can talk later today or tomorrow?
**Konsti | matchicalcom** [58:07 - 58:08]: No, worries.
**Konsti | matchicalcom** [58:08 - 58:16]: Yeah, probably tomorrow Mix like, because I will go deep down now, but then I will go deep down and then.
**Carlos | matchicalcom** [58:16 - 58:19]: Okay, if you need some time here.
**Konsti | matchicalcom** [58:19 - 58:21]: See you and yeah, hit me up.
**Konsti | matchicalcom** [58:21 - 58:26]: If you have any questions, I have one more little thing really not related to these things.
**Konsti | matchicalcom** [58:26 - 58:39]: It's more like related to our users, because we are running on the test instance one app, It's this one here, Doctor LIV Clinic.
**Konsti | matchicalcom** [58:39 - 58:43]: It's of a former colleague of Tommy and me.
**Carlos | matchicalcom** [58:44 - 58:44]: Whatever.
**Konsti | matchicalcom** [58:46 - 58:52]: Doesn'T matter, Long story short, this is a critical app in the test stage, so never, never break this one.
**Konsti | matchicalcom** [58:53 - 58:59]: It's not super critical, but in a small clinic they are doing their point of sale stuff there.
**Konsti | matchicalcom** [59:00 - 59:03]: What is basically important is, they have three users.
**Carlos | matchicalcom** [59:04 - 59:10]: Just one thing I would suggest Let's move the login action that we have.
**Carlos | matchicalcom** [59:10 - 59:13]: The new one also to that application.
**Carlos | matchicalcom** [59:14 - 59:18]: So if the user gets disabled, they can reactivate it the same way the others work.
**Konsti | matchicalcom** [59:21 - 59:24]: How much Like is it just a copy paste?
**Carlos | matchicalcom** [59:25 - 59:28]: It takes me one minute, maybe?
**Carlos | matchicalcom** [59:28 - 59:30]: Maybe one minute and a half.
**Konsti | matchicalcom** [59:31 - 59:34]: Yeah, Because like I don't like now.
**Carlos | matchicalcom** [59:34 - 59:38]: The way that this is built and if you want to know how to do it, I can show you.
**Carlos | matchicalcom** [59:38 - 59:39]: It's just Texas.
**Konsti | matchicalcom** [59:39 - 59:41]: No, no, in this case it would be if you.
**Konsti | matchicalcom** [59:41 - 59:49]: If you want to do it, because for you it's it's it's I would need to look into it and probably I would not take one minute but five, but yeah, no.
**Carlos | matchicalcom** [59:49 - 59:54]: But it's called Clinic Dr.
**Carlos | matchicalcom** [59:54 - 59:56]: LIV, Doctor.
**Konsti | matchicalcom** [59:57 - 01:00:04]: LIV, Clinic Lef Li for Clinic I'm.
**Carlos | matchicalcom** [01:00:04 - 01:00:06]: Taking a minute of your time.
**Carlos | matchicalcom** [01:00:06 - 01:00:13]: Let's counter you just because we build.
**Konsti | matchicalcom** [01:00:13 - 01:00:15]: It was basically the first app that I did build.
**Carlos | matchicalcom** [01:00:16 - 01:00:25]: Okay, you see here this login one, so you come here, you go to user.
**Carlos | matchicalcom** [01:00:27 - 01:00:36]: Oh, here I just took user management library and you have this.
**Carlos | matchicalcom** [01:00:40 - 01:00:42]: Try login and.
**Konsti | matchicalcom** [01:00:44 - 01:00:45]: Switch these things.
**Carlos | matchicalcom** [01:00:45 - 01:00:48]: Yep, and it's not perfect.
**Carlos | matchicalcom** [01:00:50 - 01:01:01]: Try login and see it adjusted all the times publish can move it to stage auto test perfect.
**Konsti | matchicalcom** [01:01:01 - 01:01:02]: Thank you very much.
**Carlos | matchicalcom** [01:01:02 - 01:01:06]: And we need to do this if you have more applications like this.
**Carlos | matchicalcom** [01:01:06 - 01:01:07]: Okay, if you have this kind of.
**Konsti | matchicalcom** [01:01:07 - 01:01:13]: User, just this one of other users, they did get this morning that the app is not running.
**Konsti | matchicalcom** [01:01:13 - 01:01:15]: It's like, oh, I know what, why?
**Carlos | matchicalcom** [01:01:15 - 01:01:18]: Okay, I'm going to move it to testing.
**Konsti | matchicalcom** [01:01:18 - 01:01:19]: Okay, ah, perfect.
**Konsti | matchicalcom** [01:01:19 - 01:01:21]: I can also do it if you but.
**Carlos | matchicalcom** [01:01:21 - 01:01:25]: Yeah, easy code, yeah, I'm opening it right now.
**Carlos | matchicalcom** [01:01:25 - 01:01:25]: So don't worry.
**Konsti | matchicalcom** [01:01:26 - 01:01:27]: Thank you as always.
**Konsti | matchicalcom** [01:01:27 - 01:01:28]: What a pleasure.
**Konsti | matchicalcom** [01:01:28 - 01:01:32]: And hit me up, if there's anything that comes to your mind.
**Carlos | matchicalcom** [01:01:32 - 01:01:33]: Okay, no, worries.
**Konsti | matchicalcom** [01:01:34 - 01:01:34]: Bye bye.
**Konsti | matchicalcom** [01:01:34 - 01:01:35]: See you.
