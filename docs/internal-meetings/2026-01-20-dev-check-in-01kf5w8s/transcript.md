# Dev check in

**Konsti | matchicalcom** [00:00 - 00:02]: Morning we need A small IQ.
**Konsti | matchicalcom** [00:02 - 00:02]: Good morning.
**Konsti | matchicalcom** [00:06 - 00:11]: Like I have some throttling implemented, right?
**Konsti | matchicalcom** [00:11 - 00:33]: That no more than twelve CV's get parsed in the same time, because if you do too much, it kind of is too much, but twelve is already way too high and I did not check this thing, but long story short, I just had the showcase with NTT and another consultancy did upload like more than fifty fucking consultants while I.
**Konsti | matchicalcom** [00:33 - 00:37]: Was doing Everything was slow due to this, like the AI things and everything.
**Pedro | matchicalcom** [00:39 - 00:45]: But you didn't have any control there in terms of CV's that can be.
**Pedro | matchicalcom** [00:45 - 00:46]: Uploaded.
**Konsti | matchicalcom** [00:48 - 00:52]: The current architecture is not so performant, especially when it comes to the skills and everything.
**Konsti | matchicalcom** [00:52 - 01:08]: And this there was it was you could really feel the impact that's bad And also like when things do not work as you are used to then it's also distracting you heavily what's also quite nasty.
**Pedro | matchicalcom** [01:08 - 01:11]: Do you talking those limits on clothes?
**Konsti | matchicalcom** [01:11 - 01:14]: Yeah, I know I did send a limit.
**Konsti | matchicalcom** [01:20 - 01:21]: Very nasty.
**Pedro | matchicalcom** [01:23 - 01:26]: Okay, But that is not in production, right?
**Pedro | matchicalcom** [01:26 - 01:28]: That limitation where you have a setting.
**Konsti | matchicalcom** [01:28 - 01:31]: On it was a production, but you.
**Pedro | matchicalcom** [01:31 - 01:41]: Have the settings is currently available in production, so you can control directly or you have to publish in production the change to control the number of CVS that can be.
**Pedro | matchicalcom** [01:41 - 01:41]: Parsed.
**Konsti | matchicalcom** [01:41 - 01:44]: I can do it in production, I can change the number.
**Pedro | matchicalcom** [01:44 - 01:45]: Yeah, it's a setting, right?
**Konsti | matchicalcom** [01:47 - 01:49]: It's not even a system setting.
**Konsti | matchicalcom** [01:49 - 01:55]: It's even like a setting that I store in a table that I can do it directly in the front end, okay?
**Konsti | matchicalcom** [01:55 - 01:58]: But still was super nasty, like ah.
**Pedro | matchicalcom** [02:01 - 02:12]: But how the system is be adding information now it's Already settling, that peso is still trying to process All those CV's that the competency up to the.
**Konsti | matchicalcom** [02:15 - 02:18]: Sorry, sorry, no worries, no worries.
**Pedro | matchicalcom** [02:22 - 02:25]: It's still occurring in production.
**Pedro | matchicalcom** [02:26 - 02:35]: If that process of the CV's, all those CVs already were ended and you already control the number of uploads or.
**Konsti | matchicalcom** [02:35 - 02:38]: Still in processing those already in production.
**Konsti | matchicalcom** [02:38 - 02:42]: But I forgot to to like reduce the amount.
**Konsti | matchicalcom** [02:42 - 02:45]: Like what I now learned is like before I do a showcase.
**Konsti | matchicalcom** [02:45 - 02:53]: I will drastically reduce the amount of parsings that you can run, because that we don't have bad performance during showcases, that's so bad.
**Konsti | matchicalcom** [02:58 - 02:59]: Give me one second to get.
**Pedro | matchicalcom** [03:02 - 03:03]: Do your stuff.
**Konsti | matchicalcom** [03:04 - 03:07]: The Chinese super nasty.
**Konsti | matchicalcom** [03:28 - 03:32]: Yeah, It's like almost sixty CV's.
**Konsti | matchicalcom** [03:33 - 03:34]: She uploaded today.
**Pedro | matchicalcom** [03:37 - 03:46]: A lot of CD sources, but that was I was asking you but already done those first parses already completed.
**Konsti | matchicalcom** [03:46 - 03:52]: Yeah, They are completed because I did not put down the queue size, right?
**Pedro | matchicalcom** [03:52 - 04:00]: Yeah, But since they already finished, maybe the production system is stable, it does not be slow.
**Konsti | matchicalcom** [04:00 - 04:15]: No, no, no, yeah, everything's fine right now, But it's still like, like in the last hour like, yeah, my bad, but doesn't matter, but yeah, it's like also my first, my first demo this this year and it was a little bit, but doesn't matter.
**Konsti | matchicalcom** [04:15 - 04:16]: Like we will have a follow-up and I will.
**Konsti | matchicalcom** [04:16 - 04:17]: Close it.
**Konsti | matchicalcom** [04:17 - 04:19]: Anyways, they need exactly what we have.
**Pedro | matchicalcom** [04:19 - 04:22]: So no worries, it's a new, it's a new customer.
**Konsti | matchicalcom** [04:23 - 04:25]: Yeah, it was like first meeting, right?
**Konsti | matchicalcom** [04:25 - 04:29]: There's always super, super painful if this.
**Pedro | matchicalcom** [04:29 - 04:41]: Happens, yeah, always nervous to see if everything flows the way that you want, since it's the first time you want to show the application.
**Pedro | matchicalcom** [04:42 - 04:52]: Yeah, it's important, everything goes well, but they did like they did like, even though the system gets a little bit slower with all those.
**Konsti | matchicalcom** [04:53 - 04:57]: But obviously it was kind of obvious that a few things were a little bit weird.
**Konsti | matchicalcom** [05:05 - 05:11]: That was bad, but doesn't matter, Doesn't matter.
**Konsti | matchicalcom** [05:12 - 05:17]: Okay, so, okay, so on my side.
**Pedro | matchicalcom** [05:17 - 05:24]: Since we had conversation afternoon, right yesterday, I don't have many questions.
**Pedro | matchicalcom** [05:24 - 05:42]: What I'm doing is just trying to connect all these functions, these methods that I built on backend with the front end that already completed in terms of consent page and I have.
**Pedro | matchicalcom** [05:42 - 05:56]: A question for you is that when we have a loan that is on the forward mode, the consultancy request sends a send sends a consent.
**Pedro | matchicalcom** [05:57 - 06:10]: We keep the notification ID on the consents that are associated and when the consent is, when it goes to the consent page, put there the contact email and click submit.
**Pedro | matchicalcom** [06:11 - 06:35]: We will not recreate the new ones that they already they are in the systems for the should we, since there will be a new notification idol, because now a notification ID will be created for the final consultant, should we override the notification id with this new.
**Pedro | matchicalcom** [06:35 - 06:39]: One that was created previously?
**Konsti | matchicalcom** [06:47 - 06:49]: So, what do we have for options?
**Konsti | matchicalcom** [06:49 - 06:54]: One option is we don't do anything and then we don't have this notification this one I like the least.
**Konsti | matchicalcom** [06:55 - 07:04]: Second option is we override it and third option is like OK, even the request for just adding the contact information is another consent request that you.
**Konsti | matchicalcom** [07:04 - 07:10]: Really cannot accept The only positive status would be email address forwarded or provided or.
**Konsti | matchicalcom** [07:10 - 07:10]: So.
**Konsti | matchicalcom** [07:10 - 07:16]: Right, like my tendency is between the second and the third option.
**Pedro | matchicalcom** [07:16 - 07:25]: But maybe I have in a system or just give you that information we kept on the consent page I can.
**Pedro | matchicalcom** [07:25 - 07:26]: Share the screen for you.
**Pedro | matchicalcom** [07:31 - 07:48]: Sorry, the entity is keeping that information that the consultancy user, the consultancy user is putting there in terms of forward email and when it happens, let me show you.
**Pedro | matchicalcom** [07:51 - 07:52]: So I created this.
**Pedro | matchicalcom** [07:52 - 07:56]: So I know that that consent was forward.
**Pedro | matchicalcom** [07:56 - 08:03]: Okay, I know that consent was for two D-mile and I know.
**Pedro | matchicalcom** [08:03 - 08:05]: That was forward on.
**Pedro | matchicalcom** [08:05 - 08:08]: Okay, That is kept on the consent level.
**Pedro | matchicalcom** [08:09 - 08:14]: Okay, the question so some of the, some of, some of the information is.
**Konsti | matchicalcom** [08:14 - 08:18]: Kept on, but in this case, in this case, in this case I would say just replace the notification ID.
**Pedro | matchicalcom** [08:18 - 08:20]: Yeah, that was my opinion.
**Pedro | matchicalcom** [08:20 - 08:28]: But I think you want to keep track of notification that is sent to the final user, not this intermediate consultancy user, right?
**Konsti | matchicalcom** [08:40 - 08:46]: So, yes, I agree, okay, okay, So.
**Pedro | matchicalcom** [08:47 - 08:50]: Next steps in terms of flows.
**Pedro | matchicalcom** [08:50 - 09:08]: I don't have anything for you today in terms of discussion and because now, because yesterday we talked about a little bit some of the functionalities of the parole of this all the retention parole and exactly.
**Pedro | matchicalcom** [09:08 - 09:09]: Parole.
**Pedro | matchicalcom** [09:09 - 09:20]: So in your opinion, you said that it should be better to talk with Tommy and I want to talk to Tommy today just to clear these rules.
**Pedro | matchicalcom** [09:20 - 09:29]: So I can create or not those fields on a database and manage them and see the flows on that flow.
**Pedro | matchicalcom** [09:29 - 09:35]: I think we should see only the retention for the consultants or the active for the consultants.
**Pedro | matchicalcom** [09:35 - 09:44]: Well, that are questions that I need to put to Tommy in terms of functionality the front end, okay?
**Pedro | matchicalcom** [09:44 - 09:49]: And okay, I think I don't have anything to discuss with you.
**Pedro | matchicalcom** [09:49 - 09:51]: I don't know if you want to.
**Konsti | matchicalcom** [09:52 - 10:04]: The only question is like when we like when you like your, because the steps you're currently working on, maybe there's like, do you already have some.
**Konsti | matchicalcom** [10:04 - 10:06]: No, do you don't have upcoming question yet?
**Konsti | matchicalcom** [10:06 - 10:07]: Right?
**Konsti | matchicalcom** [10:07 - 10:10]: You're just in the process and analyzing next things?
**Konsti | matchicalcom** [10:10 - 10:22]: And whenever something is, you'll hit me up because the idea is, if we think already in the future and you can lay out the plan that you plan to do next, I can already maybe tell you, ah yeah, be aware.
**Pedro | matchicalcom** [10:22 - 10:31]: Of XYZ, because data privacy is something new, even though you already implemented some of the parts and reuse them.
**Pedro | matchicalcom** [10:32 - 10:41]: For example, I see that all these contests that we are implementing, they are almost done, so there are no new things.
**Pedro | matchicalcom** [10:41 - 10:42]: In terms of my mind.
**Pedro | matchicalcom** [10:42 - 10:54]: I think maybe when starting seeing on the application, we can see a flow that we didn't remember, but on that, if that happens, I'll talk with you, of course.
**Pedro | matchicalcom** [10:54 - 11:20]: But for example, I have the information notice, we didn't implement that so in terms of information notice I don't know, We don't know, we don't have any mockup, we didn't discuss this that information notice process, even though we already have the template plating in adaptive privacy, so a section, so you already have the possibility to manage the information, but what.
**Konsti | matchicalcom** [11:20 - 11:26]: You should consider is like we could already like now quickly just brainstorm together where do we store it?
**Pedro | matchicalcom** [11:27 - 11:28]: So what is this?
**Pedro | matchicalcom** [11:29 - 11:33]: It's already stored, so you, I'll show you see my screen.
**Pedro | matchicalcom** [11:34 - 11:49]: What I did was just grab here the consultants, the document templates, okay, that we are, this was created for the consult consent versions and just.
**Pedro | matchicalcom** [11:49 - 12:03]: Add the unit have a category, so now there are a new category, the information notice is RV and this, even though this rules for concept, this is just ignore all is false for.
**Pedro | matchicalcom** [12:03 - 12:04]: The information notice.
**Konsti | matchicalcom** [12:05 - 12:14]: And by the way just a small thing, we always, it's really just a minor detail in terms of convention, but we always put the tenant id at the very.
**Konsti | matchicalcom** [12:14 - 12:23]: Bottom that like whenever I look at an entity, I can always verify by seeing the tenant ID at the very bottom that we have done, okay, all.
**Pedro | matchicalcom** [12:23 - 13:00]: Right, okay, So I use this flag so what it's missing in terms of the notification notice afterwards is I need to put a flag on the internal user saying that he's already seen or not the information noticed just one time and what page I think was when it first, when he logins the first time, the first time when he logins if that flag is not set goes is redirected to an information notice page and see.
**Pedro | matchicalcom** [13:00 - 13:01]: The content.
**Konsti | matchicalcom** [13:01 - 13:02]: Do you know?
**Konsti | matchicalcom** [13:02 - 13:12]: We could instead of this boolean flag we could put a foreign key and link to the document template, then we automatically also know to which version he consented.
**Pedro | matchicalcom** [13:13 - 13:16]: Okay, it's a good idea Instead of.
**Konsti | matchicalcom** [13:16 - 13:29]: Just, yeah, okay, Because in this way we don't need an extra table and we still have the version tracking and when the consultancy is updating for example the internal version and says like, okay, always a previous version need to reconsent.
**Konsti | matchicalcom** [13:31 - 13:43]: Okay, okay, okay, that's a minus, but this logic we do don't need, but if you just instead of a boolean flag just put a foreign key for internal content, there would be.
**Pedro | matchicalcom** [13:52 - 13:52]: Templates.
**Konsti | matchicalcom** [13:56 - 13:58]: Okay, cool.
**Pedro | matchicalcom** [13:59 - 14:02]: All right, Okay, so thank you.
**Konsti | matchicalcom** [14:02 - 14:15]: Okay, also during the day when you, when you are hitting kind of, an, ah, I need some more information, but otherwise we are easy speaking daily, so everything's fine.
**Pedro | matchicalcom** [14:15 - 14:17]: Okay, thank you for your time.
**Konsti | matchicalcom** [14:17 - 14:20]: Okay, see you have a good day, you too.
**Konsti | matchicalcom** [14:20 - 14:21]: Bye bye, goodbye.
