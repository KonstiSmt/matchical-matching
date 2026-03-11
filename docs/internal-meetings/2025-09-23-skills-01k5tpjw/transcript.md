# Skills

**Konsti | matchicalcom** [04:58 - 04:59]: Hello Carlos.
**Carlos | matchicalcom** [05:00 - 05:01]: Hello.
**Carlos | matchicalcom** [05:01 - 05:02]: Good morning.
**Konsti | matchicalcom** [05:02 - 05:03]: Good morning, Sir.
**Carlos | matchicalcom** [05:04 - 05:06]: All works lunch for you, but.
**Konsti | matchicalcom** [05:09 - 05:14]: And after our call, yeah, okay, after our call there will be lunchtime.
**Konsti | matchicalcom** [05:16 - 05:16]: All right, yeah.
**Konsti | matchicalcom** [05:16 - 05:18]: Tommy's also joining in a minute.
**Konsti | matchicalcom** [05:18 - 05:21]: We like one call was way longer.
**Konsti | matchicalcom** [05:21 - 05:22]: And did you?
**Konsti | matchicalcom** [05:22 - 05:23]: Did you see my loom?
**Konsti | matchicalcom** [05:23 - 05:24]: What do you think about it?
**Carlos | matchicalcom** [05:24 - 05:29]: I watched my loom, yes, I watched it almost twice.
**Carlos | matchicalcom** [05:29 - 05:43]: Just to make sure that got all the concepts and it is a lot of acronyms and a lot of different contexts Overall it looks like a good process, but we need to.
**Carlos | matchicalcom** [05:43 - 05:48]: I always like to run a few examples just to see how things work step by step.
**Carlos | matchicalcom** [05:48 - 05:48]: Hi Tommy.
**Tommy | matchicalcom** [05:50 - 05:52]: Carlos, nice to meet you again.
**Carlos | matchicalcom** [05:54 - 06:09]: I think the major question and this is probably a starting point, I don't really, really understood the difference between the alliance of and redirect to do.
**Carlos | matchicalcom** [06:09 - 06:16]: We need two different concepts that represent almost the same thing would be my challenge.
**Konsti | matchicalcom** [06:18 - 06:26]: The difference between allies off and redirect is basically allies is part of our active skill database and the redirect.
**Konsti | matchicalcom** [06:26 - 06:36]: Is basically kind of It's just a redirect like it was a different way of like you know these kind of what we currently have as remappings could be something like a typo could be something like.
**Konsti | matchicalcom** [06:37 - 06:38]: You did write it with a dash.
**Carlos | matchicalcom** [06:38 - 06:52]: Instead of in my opinion we should store it also and be searchable because that typo that dash might happen again in the future and we don't need to just.
**Konsti | matchicalcom** [06:53 - 07:07]: But this is just the like imagine nowadays what we often see in other solutions you type in a skill and you type in Python and you see like ten different versions of how Python can be typed with typos and so on and you think, oh, this is shit.
**Konsti | matchicalcom** [07:07 - 07:12]: So what we should do is, you can type your typo and you won't find it.
**Konsti | matchicalcom** [07:12 - 07:19]: And if you won't find it and want to request it, we just find the typo right away and have this redirect and then rerouted directly.
**Konsti | matchicalcom** [07:20 - 07:26]: You meant Python so we don't want this skill alias database for the user to look that messy.
**Carlos | matchicalcom** [07:28 - 07:28]: I was not.
**Carlos | matchicalcom** [07:29 - 07:35]: Okay, initially I was thinking that we would just basically show to the user, we would only show the skills.
**Carlos | matchicalcom** [07:35 - 07:39]: The aliases will just be another way to find the specific skill.
**Konsti | matchicalcom** [07:39 - 07:49]: So no, we also showed the skill aliases, because for users we need to show aliases, because users are sometimes like no.
**Konsti | matchicalcom** [07:49 - 07:49]: My term is different.
**Konsti | matchicalcom** [07:49 - 07:53]: I'm not a deposit from the developer, you know.
**Carlos | matchicalcom** [07:54 - 07:55]: If you want to show all the.
**Carlos | matchicalcom** [07:55 - 07:57]: Yeah, if you want to show all the aliases.
**Carlos | matchicalcom** [07:57 - 07:58]: I understand that.
**Tommy | matchicalcom** [07:58 - 08:02]: Okay, that would be at this moment.
**Tommy | matchicalcom** [08:02 - 08:07]: Carlos We are displaying skills and skill aliases in that way.
**Tommy | matchicalcom** [08:07 - 08:15]: That we, if you type for example, I don't know VPA Visual Basic for applications, VPA is the main skill.
**Tommy | matchicalcom** [08:15 - 08:18]: If it's really the skill, it's only the skill written VPA.
**Tommy | matchicalcom** [08:18 - 08:25]: And for example, if you write Visual Basic for applications, it's written Visual Basic for applications.
**Tommy | matchicalcom** [08:25 - 08:29]: Parentheses VPA parentheses.
**Tommy | matchicalcom** [08:30 - 08:34]: So no one understands it and understands what it's done at this moment.
**Konsti | matchicalcom** [08:37 - 08:37]: But.
**Tommy | matchicalcom** [08:37 - 08:39]: It'S handled in that way.
**Tommy | matchicalcom** [08:39 - 08:58]: And I like your question regarding this remapping or this redirect, but I'm on too slow currently I might come decide that it's We shouldn't mess up our.
**Konsti | matchicalcom** [08:58 - 08:59]: Database, but we should.
**Tommy | matchicalcom** [09:00 - 09:02]: Yeah, I think this remapping is.
**Tommy | matchicalcom** [09:02 - 09:04]: Yeah, here you can see it, here you can see it.
**Konsti | matchicalcom** [09:06 - 09:09]: This is the actual skill and this is the alias.
**Konsti | matchicalcom** [09:09 - 09:17]: And as you can see we have bad mappings or No so, yeah.
**Konsti | matchicalcom** [09:17 - 09:24]: But now I got your question like if you were considering aliases are just a different way of typing, then redirect is also a different way of typing.
**Carlos | matchicalcom** [09:24 - 09:28]: But it's not like that way that I was saying this would be very simple.
**Carlos | matchicalcom** [09:28 - 09:31]: But at least we need to do the redirect searchable.
**Konsti | matchicalcom** [09:31 - 09:35]: Shouldn't we searchable for the user?
**Carlos | matchicalcom** [09:37 - 09:46]: You might not show it, but it would return the the alliance that is redirected to so at least query side.
**Konsti | matchicalcom** [09:48 - 09:56]: Yeah, we could definitely this is idea that we make it kind of searchable, but what we show you is actually the correct version of it.
**Carlos | matchicalcom** [09:57 - 10:01]: Yeah, so that way you can handle the typos.
**Konsti | matchicalcom** [10:03 - 10:04]: That'S a good idea.
**Tommy | matchicalcom** [10:06 - 10:09]: But at first to start consti thanks for your considerations.
**Tommy | matchicalcom** [10:10 - 10:19]: Overall great work so far really so hard topic and really really good work.
**Konsti | matchicalcom** [10:20 - 10:24]: And Carlos what you mentioned in the beginning so maybe let's go through it together a little bit.
**Konsti | matchicalcom** [10:24 - 10:29]: But what you mentioned at the beginning, it's not like okay, Carlos, this is the final plan.
**Konsti | matchicalcom** [10:29 - 10:30]: We need to implement this.
**Konsti | matchicalcom** [10:30 - 10:33]: Obviously it's just like kind of a game plan.
**Konsti | matchicalcom** [10:33 - 10:35]: Some of these stuff are like blah blah.
**Konsti | matchicalcom** [10:35 - 10:41]: But the overall work is like there are core things that I like about it.
**Konsti | matchicalcom** [10:41 - 10:44]: So how should we approach it?
**Konsti | matchicalcom** [10:44 - 10:45]: I can show you things first.
**Tommy | matchicalcom** [10:46 - 10:48]: Yeah, yeah, I think we can go through.
**Tommy | matchicalcom** [10:48 - 10:51]: Some things are very clear or?
**Tommy | matchicalcom** [10:51 - 11:04]: And some things we should discuss or should or should I watch it also and I only have a few notes on this, but I think that.
**Konsti | matchicalcom** [11:06 - 11:26]: I have like because you have another idea, I'm way way way ahead, because I spent like a few hours this morning as well, so I have an updated version that we can, that we can go through, but I would propose, let's first go through the direct open questions that you had.
**Konsti | matchicalcom** [11:26 - 11:30]: Then we can check the updated version, also told like ChatGPT to give me.
**Konsti | matchicalcom** [11:30 - 11:45]: A visual representation, like OK, like where we have the different things, like where it starts, then like this front door managing before it goes in the pipeline, then the registry thing, the LLM pipeline itself, the graph and then QA admin.
**Tommy | matchicalcom** [11:49 - 11:57]: If it's okay, I will briefly, really briefly, I only have a few points because a few thoughts on that.
**Tommy | matchicalcom** [11:58 - 12:01]: So as I said it's not, I think it's not.
**Tommy | matchicalcom** [12:02 - 12:15]: So first of all, I think we are totally on the right way to really enhance or to really unleash the full power of our skills and roles.
**Tommy | matchicalcom** [12:15 - 12:30]: So I think that's really the right way and I totally see the potential that we really came to a point where the quality is so good that it will really last for the next one to three years.
**Tommy | matchicalcom** [12:30 - 12:31]: I don't know.
**Tommy | matchicalcom** [12:32 - 12:33]: I'm pretty sure.
**Tommy | matchicalcom** [12:33 - 12:35]: If I read this concept.
**Tommy | matchicalcom** [12:37 - 12:42]: First one alias per skill, I think that's not right.
**Konsti | matchicalcom** [12:42 - 12:49]: Yeah, it's like one person was written there, one official, one skill, but it's not one official.
**Konsti | matchicalcom** [12:49 - 12:57]: It can be more here exactly one per skill, One is primary, but there can be more aliases obviously.
**Konsti | matchicalcom** [12:57 - 13:00]: But is there really one skill.
**Tommy | matchicalcom** [13:01 - 13:06]: Angular angular, think of angular angular is the skill, Angular GS angular.
**Tommy | matchicalcom** [13:06 - 13:07]: I don't know.
**Tommy | matchicalcom** [13:08 - 13:09]: Two point zero.
**Tommy | matchicalcom** [13:09 - 13:11]: Why do you need a primary alias?
**Konsti | matchicalcom** [13:13 - 13:15]: Still we have multiple skill aliases for each skill.
**Konsti | matchicalcom** [13:15 - 13:15]: That's correct.
**Konsti | matchicalcom** [13:16 - 13:19]: But only one skill alias is the official one, the primary one.
**Tommy | matchicalcom** [13:20 - 13:23]: Why do we need that?
**Tommy | matchicalcom** [13:25 - 13:26]: Is this applicable?
**Tommy | matchicalcom** [13:27 - 13:28]: What was only my question?
**Tommy | matchicalcom** [13:28 - 13:30]: So just think about that.
**Tommy | matchicalcom** [13:30 - 13:33]: Just think about the angular angular is.
**Tommy | matchicalcom** [13:33 - 13:41]: The skill is angular GS angular GS, angular DS, angular TS.
**Tommy | matchicalcom** [13:41 - 13:43]: What is the primary alias?
**Carlos | matchicalcom** [13:43 - 13:44]: Out of that, what we need in.
**Konsti | matchicalcom** [13:44 - 13:46]: The end is, we need one official name.
**Konsti | matchicalcom** [13:47 - 13:52]: We could store this official name in the skill table, Like we could store it here with a property.
**Konsti | matchicalcom** [13:53 - 13:54]: But if we would store.
**Konsti | matchicalcom** [13:54 - 14:00]: The official skill name here and you can look for either skills and skill aliases.
**Konsti | matchicalcom** [14:00 - 14:11]: And like the issue is, if we have the official name of the skill in the skill and not in the alias list, then we always need to join skills and skill aliases, because we want to show you everything.
**Konsti | matchicalcom** [14:11 - 14:28]: Either you can choose the official name of the skill or or you choose one of the aliases That's why we decided already in our current system that we have like all you can only choose like you can only query through the skill aliases and one of these skill alias.
**Tommy | matchicalcom** [14:28 - 14:30]: Yeah, I know, I know, I know, I know.
**Konsti | matchicalcom** [14:30 - 14:38]: So the skill itself has no name and when the skill itself has no name, he needs to have this name within the skill alias and therefore one of these skill aliases needs to be.
**Konsti | matchicalcom** [14:38 - 14:39]: The official name.
**Konsti | matchicalcom** [14:39 - 14:42]: So his primary, true that primary his.
**Tommy | matchicalcom** [14:42 - 14:45]: Name is skill is a skill is.
**Carlos | matchicalcom** [14:45 - 14:49]: Primary, a skill is the copy of the skill.
**Carlos | matchicalcom** [14:49 - 15:08]: I would probably say that this, since it really needs an explanation, it's probably creating confusion or complexity that's probably not needed in the graphs joining skill and aliases since they will have a direct relationship is drop that simple.
**Carlos | matchicalcom** [15:08 - 15:14]: So and in terms of performance, I don't think that it would affect too much.
**Carlos | matchicalcom** [15:14 - 15:16]: So we can always revisit in the future.
**Konsti | matchicalcom** [15:16 - 15:28]: But this is, we could do it, because now it's kind of painful, whenever I want to join to a skill alias, actual official name, I need to join the skill and with the skill I need to join the skill alias that is the primary one, you know?
**Konsti | matchicalcom** [15:28 - 15:29]: That's painful.
**Carlos | matchicalcom** [15:29 - 15:35]: And the three lookup tables for the language, so yes, that's a lot that's part of.
**Carlos | matchicalcom** [15:36 - 15:46]: It's not really covered here, because I don't think that's part of the initial discussion would be the all the multi language and all that, if we see it fit as part of it.
**Carlos | matchicalcom** [15:46 - 15:48]: But that's another conversation.
**Carlos | matchicalcom** [15:48 - 15:52]: Yeah, for now it's English, but in this case I would agree with Tommy.
**Carlos | matchicalcom** [15:52 - 15:59]: I will just remove these primary because it representing the skill and leave the node as the skill.
**Carlos | matchicalcom** [16:01 - 16:03]: It wouldn't be a huge difference.
**Carlos | matchicalcom** [16:08 - 16:18]: For example in the current implementation on that test what I've created is only skills and there is a boolean that says if it is alliance or not.
**Carlos | matchicalcom** [16:19 - 16:24]: Yeah, exactly it's a skills just, but.
**Konsti | matchicalcom** [16:25 - 16:28]: Those things are my only open question.
**Konsti | matchicalcom** [16:29 - 16:32]: I agree on this one good point from both of you.
**Konsti | matchicalcom** [16:32 - 16:34]: My only open question in this case is.
**Tommy | matchicalcom** [16:37 - 16:38]: Like.
**Konsti | matchicalcom** [16:41 - 16:47]: My only open question is like when something becomes a skill.
**Konsti | matchicalcom** [16:49 - 16:51]: In this case this skill has no.
**Konsti | matchicalcom** [16:52 - 16:55]: We don't duplicate the skill alias of the skill, right?
**Carlos | matchicalcom** [16:56 - 16:56]: Correct.
**Konsti | matchicalcom** [16:57 - 17:39]: Okay, okay, this mean that this redirect two thing can also redirect to a skill alias to a skill and not just to a skill alias, right?
**Carlos | matchicalcom** [17:40 - 17:47]: Yes, I think that's why not I read that somewhere.
**Carlos | matchicalcom** [17:47 - 17:52]: Yes, redirect will be just a different label for a specific node.
**Konsti | matchicalcom** [17:56 - 17:56]: But we.
**Tommy | matchicalcom** [17:56 - 18:05]: Will have the two We will have skill and skill alias, we will have it, but we are querying on skills and skill aliases as well.
**Tommy | matchicalcom** [18:05 - 18:07]: Or if we, if we crap it.
**Carlos | matchicalcom** [18:07 - 18:19]: Out only those two concepts for now in terms of implementation, I would probably just create one, but with a bullying that.
**Carlos | matchicalcom** [18:20 - 18:31]: Or if they get very complex now that it's so simple, I will just keep an attribute, but if it gets more complexity, we'll probably need to break the two concepts.
**Tommy | matchicalcom** [18:33 - 18:34]: Okay?
**Konsti | matchicalcom** [18:34 - 18:55]: But that's Carlos, when we think about skills versus skill aliases and when we think about the graph and the good thing about the graph is, we can also have a visual representation and so on like wouldn't it be helpful to see Here's the skill and these are all the skill aliases, The visualization of the graphs.
**Carlos | matchicalcom** [18:55 - 18:59]: If they are very complex, they trend to be messy.
**Carlos | matchicalcom** [18:59 - 19:10]: Okay, it works, but querying for a specific skill with all its alices would be just very simple.
**Konsti | matchicalcom** [19:11 - 19:14]: Okay, let's challenge this just for one more.
**Konsti | matchicalcom** [19:14 - 19:21]: Second is there any reason why it would make sense to divide skills and skill aliases into two separate.
**Konsti | matchicalcom** [19:21 - 19:26]: Things or just having skills purely and just making the differentiation.
**Konsti | matchicalcom** [19:26 - 19:27]: We are a property.
**Carlos | matchicalcom** [19:31 - 19:32]: In my opinion.
**Carlos | matchicalcom** [19:32 - 19:44]: Since that normally you want to search both, they should be the same note, the same note type, because the way that I see the users searching, it would be they need to search both.
**Carlos | matchicalcom** [19:44 - 19:49]: Or the system try to match some text that it has to a skill.
**Carlos | matchicalcom** [19:49 - 19:54]: It will have to always search both and sometimes even do redirect.
**Carlos | matchicalcom** [19:54 - 19:58]: So for skills I would say that's pretty much the same thing at this.
**Tommy | matchicalcom** [19:58 - 20:05]: Point and constantly your actual implementation is to solve this problem.
**Tommy | matchicalcom** [20:05 - 20:21]: You have everything in skill aliases so yeah, so I think we just switch from skill alias to skill and the property has also so there must be skill skill alias true and related.
**Tommy | matchicalcom** [20:21 - 20:33]: And if skill alias true, there must be a related skill in the end there must an in skill connection you know what I mean?
**Tommy | matchicalcom** [20:34 - 20:40]: Otherwise we don't know which skill is related to the skill alias.
**Konsti | matchicalcom** [20:42 - 20:43]: There is no skill alias anymore.
**Konsti | matchicalcom** [20:43 - 20:44]: What do you mean?
**Konsti | matchicalcom** [20:44 - 20:44]: In this case?
**Konsti | matchicalcom** [20:44 - 20:49]: If we do it like this that we have no skill alias but just skills, then we need to reintroduce.
**Konsti | matchicalcom** [20:49 - 20:50]: This is primary, right?
**Konsti | matchicalcom** [20:51 - 20:52]: Then we need to introduce.
**Carlos | matchicalcom** [20:53 - 20:55]: Yeah, yeah, yeah, it's one or the other, right?
**Carlos | matchicalcom** [20:55 - 21:04]: You keep two different concepts, two different nodes and you don't need the attribute, or you make the same and you need the attribute.
**Tommy | matchicalcom** [21:05 - 21:16]: But my question is, if it's a skill alias and if it's a skill alias true, we have to also connect it to the real skill.
**Konsti | matchicalcom** [21:21 - 21:22]: Correct.
**Carlos | matchicalcom** [21:22 - 21:25]: But that happens in both places.
**Carlos | matchicalcom** [21:25 - 21:31]: If you do it with the same node, you connect the node to the same node of its own time Exactly.
**Carlos | matchicalcom** [21:32 - 21:34]: Or two different types.
**Tommy | matchicalcom** [21:35 - 21:43]: Yeah, it's only an edge we have right here skill off or whatever.
**Konsti | matchicalcom** [21:47 - 21:48]: Or.
**Tommy | matchicalcom** [21:48 - 21:50]: Relates to or whatever in the end.
**Tommy | matchicalcom** [21:50 - 21:52]: I don't know we will see.
**Konsti | matchicalcom** [21:54 - 22:00]: So skills are connected to skills via this alias of connection, right?
**Tommy | matchicalcom** [22:03 - 22:05]: Yeah, exactly that's what I meant.
**Tommy | matchicalcom** [22:06 - 22:06]: What?
**Tommy | matchicalcom** [22:07 - 22:12]: Exactly I think it's edge.
**Tommy | matchicalcom** [22:13 - 22:24]: We are talking about nodes and edges are is nodes, nodes with properties and edges are the connections between.
**Konsti | matchicalcom** [22:24 - 22:25]: Is this right?
**Carlos | matchicalcom** [22:25 - 22:34]: If we're talking about relations, at least the name that I've seen in the bibliography would be relation.
**Tommy | matchicalcom** [22:34 - 22:39]: So you have nodes and relations, not etches is relations.
**Konsti | matchicalcom** [22:39 - 22:42]: Okay, it was what I read, but it doesn't matter.
**Konsti | matchicalcom** [22:42 - 22:42]: Like.
**Konsti | matchicalcom** [22:45 - 22:49]: Is it nodes and etches or notes and relations or notes and connections?
**Konsti | matchicalcom** [22:49 - 22:50]: Can you sort these terms for us?
**Konsti | matchicalcom** [22:50 - 22:52]: We are not sure.
**Tommy | matchicalcom** [22:53 - 22:54]: It's not so important.
**Tommy | matchicalcom** [22:54 - 22:56]: It's only that we are talking about the same thing.
**Konsti | matchicalcom** [22:57 - 22:59]: Interesting nodes.
**Carlos | matchicalcom** [23:02 - 23:03]: It's a different thing.
**Konsti | matchicalcom** [23:05 - 23:07]: Relation, not a native graph theory.
**Konsti | matchicalcom** [23:07 - 23:13]: Semantic graph mean, but specific type edge informal synonym for edges.
**Konsti | matchicalcom** [23:13 - 23:18]: Okay, notes and edges.
**Carlos | matchicalcom** [23:18 - 23:19]: It's edges.
**Carlos | matchicalcom** [23:19 - 23:20]: Okay.
**Konsti | matchicalcom** [23:22 - 23:22]: Easy.
**Konsti | matchicalcom** [23:22 - 23:34]: Yeah, Chico told me so many things about his notes and this is interesting fact.
**Konsti | matchicalcom** [23:34 - 23:36]: Okay, good other points.
**Tommy | matchicalcom** [23:40 - 23:48]: So the second point, only main idea or the concept to be honest.
**Tommy | matchicalcom** [23:48 - 23:51]: Registry and resolution map.
**Tommy | matchicalcom** [23:51 - 23:57]: I think that's something very good.
**Tommy | matchicalcom** [23:57 - 24:04]: So if we really prevent duplicates in the first place, yeah, we prevent duplicates in the first place.
**Tommy | matchicalcom** [24:06 - 24:17]: So I thought about registry and afterwards, two minutes later, you talked about the resolution because we have to subscribe to this registry in the end.
**Tommy | matchicalcom** [24:17 - 24:30]: So if you parse for example ncv and you have this skill two, three times, it must go to the resolution map because you have to know what will happen with this skill.
**Tommy | matchicalcom** [24:32 - 24:34]: But I think that's a good idea.
**Tommy | matchicalcom** [24:34 - 24:35]: That's a really good idea.
**Konsti | matchicalcom** [24:36 - 24:41]: When we set up this whole workflow, this definitely needs to go and be the ODC workflow thing, right?
**Konsti | matchicalcom** [24:42 - 24:44]: We don't spin up one hundred different.
**Carlos | matchicalcom** [24:45 - 24:46]: Yeah, probably.
**Carlos | matchicalcom** [24:46 - 24:53]: And we might reduce a little bit the number of events and do some things just sequentially, right?
**Konsti | matchicalcom** [24:54 - 25:00]: But we can do it sequentially Sometimes it's faster.
**Carlos | matchicalcom** [25:00 - 25:04]: So you have less parallel jobs, but then you don't have this messiness of.
**Konsti | matchicalcom** [25:05 - 25:21]: A good thing is check this one out, it was released yesterday GROC four fast, very intelligent, quite fast and super cheap and we can use it for our skill database because it's not company like customer specific data.
**Konsti | matchicalcom** [25:23 - 25:29]: So I will implement this API within the next few days or whenever I have time, let's see.
**Tommy | matchicalcom** [25:31 - 26:08]: Okay, but constitu this is really, really, really great, so the idea is good and worth a try because I think it really prevents, prevents a lot of headache afterwards if you really, if we really prevent getting crap into our skill system in the end, so that's the main idea or the idea is really to be really really careful what will.
**Konsti | matchicalcom** [26:09 - 26:30]: Pass through maybe let me go into this one for a second, because directly place into what you are stating basically the idea is the front door lookup process, like we mentioned the use case Carlos and Tommy we are currently either extracting a demand or an engagement and now we are at the final step where I ask the prompt.
**Konsti | matchicalcom** [26:30 - 26:38]: OK I don't provide you by the way, this retrieval thing we don't do this anymore as we don't want to bias the LLM, but we just ask the prompt right away.
**Konsti | matchicalcom** [26:38 - 26:38]: OK?
**Konsti | matchicalcom** [26:39 - 26:48]: This is a concept of a skill for example doesn't matter, but this is the engagement that we have extract me all skills and kind of roles and how they.
**Konsti | matchicalcom** [26:48 - 27:03]: Belong together out of this engagement and maybe our different categories doesn't matter, but long story short, it starts with this is the engagement that we have extract me all these skills, so we don't provide initial like maybe it's this one or this one or this one.
**Konsti | matchicalcom** [27:03 - 27:11]: We just say extract me all those skills and then after we get this list back our array of skills, basically we do the check in this order.
**Konsti | matchicalcom** [27:12 - 27:16]: First WE check against graph equality always with lowercase.
**Konsti | matchicalcom** [27:16 - 27:17]: Basically obviously.
**Konsti | matchicalcom** [27:18 - 27:20]: So first we check do we have an exact graphit?
**Konsti | matchicalcom** [27:20 - 27:24]: Then okay, we already know the id attach done.
**Konsti | matchicalcom** [27:24 - 27:31]: Second is the dictionary split the dictionary split is for this kind of normalization dictionary.
**Konsti | matchicalcom** [27:32 - 27:40]: So the idea is in our normalization dictionary that we store those requests where multiple things get requested in one skill.
**Konsti | matchicalcom** [27:40 - 28:01]: For example this HTML, CSS, JavaScript sometimes people are kind of requesting exactly this composite skill, that's not one skill like CICD is a composite skill as a concept CICD is a known concept, so that's a different, but there's also this composite as list like HTML, JavaScript, CSS.
**Konsti | matchicalcom** [28:03 - 28:11]: We have a classifier prompt that we will go back to later that is doing, this is a composite thing and we need to spin up.
**Konsti | matchicalcom** [28:11 - 28:14]: One for HTML, one for CSS and one for JavaScript.
**Konsti | matchicalcom** [28:14 - 28:20]: And when we have this classification, done, we store this information in our let's say normalization dictionary.
**Konsti | matchicalcom** [28:20 - 28:23]: In the end it's just a table in ODC.
**Konsti | matchicalcom** [28:23 - 28:31]: And there we store OK, if this term is coming, that's actually a split and it needs to be split in X, y and D.
**Konsti | matchicalcom** [28:31 - 28:38]: So first we check for graphic quality, if we have a hit here, OK done if we have not a hit, we check dictionary.
**Konsti | matchicalcom** [28:38 - 28:43]: Maybe this is a composited skill that we already had, then.
**Konsti | matchicalcom** [28:43 - 28:45]: We know how to how to split it.
**Konsti | matchicalcom** [28:45 - 28:47]: Up and then we spin up the child workflows.
**Konsti | matchicalcom** [28:47 - 28:51]: But at that point we should already have classified all the childs, right?
**Konsti | matchicalcom** [28:52 - 28:56]: So that's the second lookup and the third one is in our registry.
**Konsti | matchicalcom** [28:56 - 29:02]: So the registry is our storage for the not relevant ones and it's.
**Konsti | matchicalcom** [29:02 - 29:03]: Not a permanent storage.
**Konsti | matchicalcom** [29:03 - 29:08]: So maybe it's just like we check within the last six months was this.
**Konsti | matchicalcom** [29:08 - 29:13]: Already classified as not relevant, so that we don't store not relevant things permanently.
**Konsti | matchicalcom** [29:13 - 29:19]: The idea behind this was, maybe it's not relevant currently, but we want to reassess this in a half year.
**Konsti | matchicalcom** [29:20 - 29:23]: So now the big question comes up.
**Konsti | matchicalcom** [29:24 - 29:29]: Carlos why do we store those three different things at three different spots that we need to look up?
**Konsti | matchicalcom** [29:30 - 29:33]: And what basically ChatGPT told me regarding.
**Konsti | matchicalcom** [29:33 - 29:35]: This one is in our graph.
**Konsti | matchicalcom** [29:35 - 29:38]: We only want to keep what the actual truth right?
**Konsti | matchicalcom** [29:39 - 29:42]: So everything that is classified in the Dictionary.
**Konsti | matchicalcom** [29:42 - 29:43]: Split is really just.
**Konsti | matchicalcom** [29:43 - 29:44]: For this.
**Konsti | matchicalcom** [29:44 - 29:50]: We don't want to introduce this to our graph, because it's just like, ah yeah, how do we split this up?
**Konsti | matchicalcom** [29:50 - 30:00]: And the not relevant thing is again something different that we could store in an extra not relevant cache table, but ChatGPT mentioned like you could also put it in your registry and just check against this one.
**Konsti | matchicalcom** [30:00 - 30:14]: What do you think about this approach of like this approach basically is there for ensuring that we don't start a flow for reclassification or anything for something that we already know that we know.
**Carlos | matchicalcom** [30:14 - 30:15]: That matters or not.
**Carlos | matchicalcom** [30:15 - 30:17]: In this case, that's interesting.
**Carlos | matchicalcom** [30:18 - 30:23]: I was hearing about this and trying to understand where we would put some of these things.
**Carlos | matchicalcom** [30:23 - 30:26]: Not sure IF, ODC that data tables would be the.
**Carlos | matchicalcom** [30:26 - 30:39]: Best place, but because of performance, because of the things we can do, for example a different database, even it's like a vectorial or a graph database, but, or a different one, right?
**Carlos | matchicalcom** [30:39 - 30:51]: So not the same, so just for technology purpose and searchability, but to start, I think ODC tables would be simple the different separations.
**Carlos | matchicalcom** [30:51 - 30:52]: Yeah, I think it's relevant.
**Carlos | matchicalcom** [30:52 - 30:54]: It could be one table can be two tables.
**Carlos | matchicalcom** [30:54 - 31:06]: I think the way that this is written is for you huge volume, the way that it's structured and to make sure that everything is indexed and really structured.
**Konsti | matchicalcom** [31:07 - 31:24]: I think in terms of volume in this normalization, like in total, my assumption was like maybe it's by far too much, but my assumption that I worked with was like maybe let's consider that at one day there will be fifty to one hundred thousand official.
**Konsti | matchicalcom** [31:24 - 31:31]: Skills, probably much less, but let's say one to two million skill aliases that we.
**Konsti | matchicalcom** [31:31 - 31:32]: Have like an idea.
**Konsti | matchicalcom** [31:32 - 31:37]: I don't think it will be tens or hundreds of aliases, but more like in this direction.
**Carlos | matchicalcom** [31:39 - 31:40]: I'm not sure.
**Carlos | matchicalcom** [31:40 - 32:09]: If we couldn't simplify it maybe makes it more complex, but this dictionary split, since we are talking about two different things, two different alliances or skills, it probably could be redirect and node that redirect to the others and we have to understand that we have some nodes that redirect to more than one skill and just use the graph but.
**Konsti | matchicalcom** [32:12 - 32:13]: Can.
**Tommy | matchicalcom** [32:13 - 32:16]: Also be ideal, but yeah, but yeah.
**Konsti | matchicalcom** [32:17 - 32:19]: Yeah, sorry for one second.
**Konsti | matchicalcom** [32:19 - 32:29]: Also it could be that in this composite thing there are like three things in and one of them is not relevant then we would also need to keep not relevant within the graph, you know?
**Konsti | matchicalcom** [32:30 - 32:34]: Okay, so basically mentioned, these are different concepts.
**Konsti | matchicalcom** [32:34 - 32:38]: The one concept is really, you just want to have a dictionary look up for.
**Konsti | matchicalcom** [32:38 - 32:40]: Okay, how do I need to split this up?
**Konsti | matchicalcom** [32:40 - 32:49]: I know this I know that I need to split this up and the other thing is in your graph there's your official like this is just like kind of approved keep validator.
**Tommy | matchicalcom** [32:49 - 32:55]: Yeah, okay, yeah, but this kansi just one question on the second point.
**Tommy | matchicalcom** [32:55 - 33:03]: This will also so this will do a lookup if something is already there, which follows some rules.
**Konsti | matchicalcom** [33:03 - 33:09]: Full text match the combination that you did send us do have a full text match for if it's a combination at all.
**Tommy | matchicalcom** [33:09 - 33:20]: Okay, And how do we find out for example, if UNIX Linux is not in place in firsthand, which prompt will do that?
**Konsti | matchicalcom** [33:21 - 33:22]: Our classifier zero prompt.
**Konsti | matchicalcom** [33:22 - 33:30]: This one will do where there's one dedicated prompt that's only meant for composite detection.
**Konsti | matchicalcom** [33:30 - 33:33]: Checking the first gate like is it relevant or not?
**Konsti | matchicalcom** [33:33 - 33:49]: Like round rewashing it's not relevant at all for us and provide me a very short description for what is currently requested that we can do a better backdoor retrieval, that's the job to be done for the first classifier prompt.
**Tommy | matchicalcom** [33:49 - 33:57]: Yeah, understand, understand and I think yeah, we do need this dictionary split, but.
**Konsti | matchicalcom** [33:57 - 34:03]: Because it's so this is already pain in the aß right with the roads you mentioned all the time, yeah, it.
**Tommy | matchicalcom** [34:03 - 34:35]: Happens very often, so we hadn't it in mind, Carlos, if we drafted it the first time, our first version out of it, but it's really often just think about developer, DevOps Engineer, so we have this very often and our skill or role system is really only working, it must be DevOps or Developer.
**Konsti | matchicalcom** [34:35 - 34:59]: And yeah, this one testing for example and the thing is, Tommy, I will try to prevent those composite things in the first place when we do the extraction from our skills, but we cannot rely on this one so in our workflow we need also to be able to kind of decompose these things especially also users can request shit I was.
**Carlos | matchicalcom** [34:59 - 35:07]: Going just to ask on this dictionary split those terms we would search by the slash I percent the commas or.
**Carlos | matchicalcom** [35:07 - 35:14]: Some ways that normally are separators or it's an LLM that just does that.
**Konsti | matchicalcom** [35:14 - 35:24]: It'S much easier just imagine HTML, JavaScript, CSS got requested, we do a graph lookup.
**Konsti | matchicalcom** [35:24 - 35:27]: We don't have graphic reality, then we do dictionary split.
**Konsti | matchicalcom** [35:27 - 35:34]: We don't have this exact combination in our dictionary right now we just look for exact text match, okay, do we have it in our registry?
**Konsti | matchicalcom** [35:34 - 35:42]: No, then we kick it in our workflow and the first classifier within our workflow is basically checking is this a composited list skill?
**Konsti | matchicalcom** [35:42 - 35:50]: And yeah, it is one and then it spins up, OK, one process for HTML, one for CSS and one for JavaScript.
**Konsti | matchicalcom** [35:50 - 35:57]: And also it's saving the information that this exact string translates into this.
**Carlos | matchicalcom** [35:57 - 36:05]: So in this case it will be a prompt and LLM just to do that evaluation.
**Konsti | matchicalcom** [36:06 - 36:12]: We don't need to do any fancy split or regex or anything, we just need to retrieve like in here, yeah.
**Carlos | matchicalcom** [36:13 - 36:20]: You just put the name itself all lowercase and just search it directly in an index and that's easy enough.
**Konsti | matchicalcom** [36:20 - 36:25]: And that's why he mentioned like okay, have A Dedicated Normalization Dictionary for this.
**Konsti | matchicalcom** [36:25 - 36:37]: One that we can also look up by hand and maintain by hand if we want to OK next one this registry cache thing here I did.
**Konsti | matchicalcom** [36:37 - 36:43]: Not dive too deeply into this one, because I think you have some solid concepts in your head color.
**Konsti | matchicalcom** [36:43 - 36:51]: So this can be done best, but long story short, what you already mentioned is what could be a good idea is that we enforce Uniqueness via the database thing.
**Konsti | matchicalcom** [36:51 - 37:00]: And what ChatGPT proposed here is that we do not even like for checking about uniqueness, we do not even query against the table.
**Konsti | matchicalcom** [37:00 - 37:05]: We do like what is it called this SQL operation like right.
**Konsti | matchicalcom** [37:05 - 37:14]: But if conflict stop kind of thing, you know like right on conflict resolve or so.
**Konsti | matchicalcom** [37:14 - 37:16]: There's like, where was it?
**Konsti | matchicalcom** [37:18 - 37:25]: Registry here in flight where insert on conflict to nothing.
**Konsti | matchicalcom** [37:25 - 37:26]: Do you know this one?
**Carlos | matchicalcom** [37:28 - 37:28]: Never use that.
**Carlos | matchicalcom** [37:29 - 37:30]: But I understand the concept.
**Carlos | matchicalcom** [37:30 - 37:32]: No, understand the content.
**Carlos | matchicalcom** [37:33 - 37:37]: If it's already there, just don't throw an error, just move on and that's the idea.
**Konsti | matchicalcom** [37:37 - 37:39]: Then we do not need to query in the first place.
**Konsti | matchicalcom** [37:39 - 37:45]: Yeah, we just can do and directly stay on conflict, do nothing and then we handle like.
**Konsti | matchicalcom** [37:45 - 37:48]: Okay, we have it and then we only retrieve it when we know that it's there.
**Tommy | matchicalcom** [37:49 - 37:54]: Yeah, but you have to get it back, you have to get an empty.
**Tommy | matchicalcom** [37:55 - 37:58]: Yeah, you need because you have to subscribe to the solution.
**Konsti | matchicalcom** [37:58 - 38:01]: We did hit the conflict in the first place.
**Konsti | matchicalcom** [38:01 - 38:04]: You know that we don't fetch otherwise we would always need to fetch.
**Konsti | matchicalcom** [38:04 - 38:05]: And then we did not get it.
**Konsti | matchicalcom** [38:05 - 38:07]: We did not get it, We did not get it.
**Konsti | matchicalcom** [38:07 - 38:11]: So it's more efficient for those flows where we do not have duplicates.
**Konsti | matchicalcom** [38:11 - 38:17]: You know, where do we see?
**Tommy | matchicalcom** [38:17 - 38:19]: If we have duplicates?
**Konsti | matchicalcom** [38:19 - 38:31]: We could do either in the first place, we could already kind of query against our registry and look for a full text match so that we know, ah, we have a full text match, so this would be a duplicate.
**Konsti | matchicalcom** [38:31 - 38:32]: Just subscribe to this one.
**Konsti | matchicalcom** [38:34 - 38:37]: But then we would always need to query our whole registry.
**Konsti | matchicalcom** [38:38 - 38:44]: And when we just write immediately and we say okay, created and on conflict, I know, oh, there's a conflict.
**Konsti | matchicalcom** [38:44 - 38:47]: Now I start querying, then we only query on conflict.
**Konsti | matchicalcom** [38:47 - 38:50]: So we don't query in ninety-eight percent of the time.
**Konsti | matchicalcom** [38:50 - 38:52]: We only query for duplicate.
**Tommy | matchicalcom** [38:52 - 38:57]: So there's also a method on conflict, race error.
**Konsti | matchicalcom** [38:57 - 38:57]: I don't know.
**Carlos | matchicalcom** [39:00 - 39:12]: We'll need to see those details, but in this case you probably will always have to query, because the ID itself, it might be relevant as part of the process, but not sure, let's see.
**Konsti | matchicalcom** [39:12 - 39:16]: Yeah, but you can query afterwards after you did hit the conflict, that's the only thing.
**Konsti | matchicalcom** [39:17 - 39:18]: If I don't hit a conflict.
**Konsti | matchicalcom** [39:18 - 39:20]: Ah, good, I saved one query if I hit a conflict.
**Carlos | matchicalcom** [39:21 - 39:25]: No, but if you didn't have the conflict and you started a new record.
**Carlos | matchicalcom** [39:25 - 39:26]: You probably need that ID.
**Carlos | matchicalcom** [39:28 - 39:31]: You probably need it depending on the rest of the flow.
**Konsti | matchicalcom** [39:32 - 39:38]: No, But when you do a create, you get the ID back, you create new, you generate your GUID.
**Carlos | matchicalcom** [39:39 - 39:45]: Technically, it's a query, I'll just for you, but it's a get to you for sure.
**Carlos | matchicalcom** [39:46 - 39:54]: Yeah, it's a new one because the insert itself by default just responds like one row inserted, just that.
**Tommy | matchicalcom** [39:56 - 39:57]: We don't.
**Konsti | matchicalcom** [39:57 - 40:00]: Use auto increment so we know we can provide our.
**Carlos | matchicalcom** [40:00 - 40:04]: Okay, it's a fixed idea, okay, okay, it's a text so you have it.
**Konsti | matchicalcom** [40:04 - 40:08]: Up front, or what do you recommend using auto increment?
**Konsti | matchicalcom** [40:09 - 40:11]: We don't use auto increment anywhere, but.
**Carlos | matchicalcom** [40:13 - 40:15]: No, you just use weeds, right?
**Carlos | matchicalcom** [40:15 - 40:17]: That's just weed id's.
**Carlos | matchicalcom** [40:17 - 40:18]: Okay, I saw that.
**Konsti | matchicalcom** [40:18 - 40:24]: But auto increment maybe it helps, probably.
**Carlos | matchicalcom** [40:24 - 40:34]: Not, because remember, you can have multiple processes running at the same time, unless you lock the table to make sure that you know what's the next ID exactly.
**Carlos | matchicalcom** [40:35 - 40:37]: Not solve it, we will say.
**Tommy | matchicalcom** [40:37 - 41:16]: But there is, there is Carlos Chester short side note, there is especially on Microsoft SQL Server, there is the select add identity query you can give with, so you have really in scope if you work with the OTPC connection for example, you have really the current ID of this object, if you have auto increment on, so you don't have to query again, but because you have to select max or select max number to get back.
**Tommy | matchicalcom** [41:16 - 41:17]: Your current row.
**Carlos | matchicalcom** [41:21 - 41:26]: Sorry, Carlos, I was just saying there are some nuances like that.
**Carlos | matchicalcom** [41:27 - 41:35]: In this case we are working with postgres that I'm not expert yet, so we'll have to search some of those details, but for sure.
**Konsti | matchicalcom** [41:41 - 41:46]: I'm not an expert on anything that stands here anyway.
**Carlos | matchicalcom** [41:48 - 41:57]: Some of those things, but I've implemented some of these things already so I know right, so we know what we're talking about and it's easily or it's doable.
**Carlos | matchicalcom** [41:57 - 42:12]: It's not a huge thing I think having a get query or a select query over the index, it's not our will never be our main problem, because drop down quickie, that's not a big thing.
**Carlos | matchicalcom** [42:13 - 42:20]: If you have like a group by ten fields and okay, on a million records, okay, those are the problematic ones.
**Carlos | matchicalcom** [42:20 - 42:20]: This is.
**Konsti | matchicalcom** [42:23 - 42:25]: Carlos, we are doing it right this time.
**Konsti | matchicalcom** [42:25 - 42:27]: No, I fully agree.
**Konsti | matchicalcom** [42:27 - 42:29]: Like, as I mentioned in the beginning, nothing here is written in stone.
**Konsti | matchicalcom** [42:29 - 42:41]: It's just like I think the workflow itself goes in the right direction, so the big question here now, if we look at this together, it's like I think there are no, let's say functional requirements or business requirements.
**Konsti | matchicalcom** [42:41 - 42:45]: Tommy, it's just a technical thing and our technical or functional requirement here.
**Konsti | matchicalcom** [42:45 - 42:51]: Is, we want to prevent duplicates in the first place, no duplicates in our workflows.
**Konsti | matchicalcom** [42:51 - 42:55]: First it costs money, the second is cost compute and third is.
**Konsti | matchicalcom** [42:55 - 42:58]: Just painting the S to clean them up afterwards and do the remappings.
**Konsti | matchicalcom** [42:58 - 43:05]: Do you think with this setup we can prevent them reliable, also considering things are running in parallel.
**Carlos | matchicalcom** [43:08 - 43:08]: Yes.
**Carlos | matchicalcom** [43:09 - 43:14]: And in the current setup you can always do it just put a unique attribute on the column.
**Carlos | matchicalcom** [43:17 - 43:19]: Sorry, it will work.
**Carlos | matchicalcom** [43:20 - 43:21]: Oh, okay, okay.
**Carlos | matchicalcom** [43:21 - 43:30]: But it work because it will be the database responsible To guarantee all that uniqueness you need to make sure that you handle the rest of the code correctly.
**Carlos | matchicalcom** [43:31 - 43:33]: So at the same time you'll never have the same.
**Carlos | matchicalcom** [43:33 - 43:38]: The same idea you can, but the expression but colors.
**Tommy | matchicalcom** [43:38 - 43:43]: We will then we have to introduce the resolution map and displays, also because correct.
**Tommy | matchicalcom** [43:43 - 43:47]: So the problem here is, if we set it to unique true.
**Tommy | matchicalcom** [43:47 - 44:04]: So that was also Concierge was explaining the concept and I haven't read about it and I really wrote, we have to think about what if the same skill comes in parallel and after that I wrote it constantly, said ah, yeah, and therefore we have the resolution map and so.
**Tommy | matchicalcom** [44:04 - 44:07]: Okay, everything's clear in my head.
**Tommy | matchicalcom** [44:07 - 44:08]: So.
**Carlos | matchicalcom** [44:10 - 44:14]: You would have to handle that exception, because it would not happen very frequently.
**Carlos | matchicalcom** [44:14 - 44:19]: But when it happens, you need to go to the database and something in.
**Tommy | matchicalcom** [44:19 - 44:26]: Europe it happens very often to be honest, because just imagine the same engagements.
**Konsti | matchicalcom** [44:26 - 44:30]: Get extracted in parallel from a consultant that is doing always the same skills and it's like.
**Carlos | matchicalcom** [44:32 - 44:43]: Exactly, but you are not inserting those, but it's just the first time that you are introducing the new skill, because after that doesn't get introduced again.
**Konsti | matchicalcom** [44:44 - 44:46]: True, true, right?
**Konsti | matchicalcom** [44:48 - 44:58]: We also consider this then our skill database growth from skills grow from five thousand to ten thousand, from ten thousand, twenty thousand, twenty thousand, fifty thousand, fifty thousand, one hundred thousand.
**Carlos | matchicalcom** [44:58 - 45:03]: They are not all skills, those are alliances redirect or other things that's not skills.
**Konsti | matchicalcom** [45:04 - 45:04]: Yeah.
**Konsti | matchicalcom** [45:05 - 45:08]: But even there we are hitting still duplicates all the time.
**Konsti | matchicalcom** [45:08 - 45:14]: But I think just because my workflow has bottlenecks, let's say like this.
**Tommy | matchicalcom** [45:17 - 45:20]: But the deer is great, the idea is great constant.
**Tommy | matchicalcom** [45:20 - 45:26]: I think from a functional side so as I can say I don't have to develop it.
**Tommy | matchicalcom** [45:26 - 45:27]: I'm pretty happy.
**Konsti | matchicalcom** [45:27 - 45:30]: First time I don't have to develop it.
**Tommy | matchicalcom** [45:30 - 45:34]: Great, Carlos Just make it happen, please I will go on vacation.
**Konsti | matchicalcom** [45:37 - 45:37]: You promise.
**Carlos | matchicalcom** [45:38 - 45:41]: Yeah, in two weeks we'll be ready.
**Tommy | matchicalcom** [45:42 - 45:51]: No, but this registry with resolution map, I think it's a brilliant idea and it's scalable.
**Tommy | matchicalcom** [45:51 - 45:55]: It's from a functional side crate, so there are no flaws.
**Tommy | matchicalcom** [45:55 - 46:06]: I can imagine no roadblocks and also from a technical side it's pretty straightforward in the end.
**Tommy | matchicalcom** [46:06 - 46:06]: So.
**Konsti | matchicalcom** [46:08 - 46:11]: You know what I mean regarding this implementation.
**Konsti | matchicalcom** [46:12 - 46:21]: Carlos I think I already told it to you yesterday, but you cannot imagine how, how much relief and stress I have just from knowing you are there.
**Carlos | matchicalcom** [46:24 - 46:31]: Okay, I will get you a picture of me that you can put on your desk or something like that, if it helps.
**Konsti | matchicalcom** [46:33 - 46:37]: I'm bringing my one hundred twenty megapixels camera to Portugal.
**Carlos | matchicalcom** [46:37 - 46:39]: Okay, okay, that's cool.
**Carlos | matchicalcom** [46:40 - 46:42]: No, don't worry, we'll get.
**Carlos | matchicalcom** [46:42 - 46:48]: I'm sure that you will not get completely right one hundred percent at the first try, but we'll get disimplemented.
**Konsti | matchicalcom** [46:48 - 47:02]: This is not when we put this, also when we put this in a workflow and we set it up with a fresh mind, a clear concept, like everything that was created before was like, oh yeah, I plopped these things and now it's different, sorry, so it will be much better.
**Konsti | matchicalcom** [47:02 - 47:05]: Okay, so question regarding the resolution map.
**Konsti | matchicalcom** [47:06 - 47:09]: My only concern or my challenging was regarding this one.
**Konsti | matchicalcom** [47:09 - 47:13]: What we could also do is, we could just like this registry ID.
**Konsti | matchicalcom** [47:13 - 47:19]: We could put it to the engagement role skill kind of, and then do it the other way around.
**Konsti | matchicalcom** [47:19 - 47:25]: But ChatGPT propose really stick to the real resolution map as it's more scalable.
**Konsti | matchicalcom** [47:29 - 47:40]: So you know we need to create, so imagine we are extracting the engagement in the engagement we get back, okay, this is for example the role and these are the skills beneath the role.
**Konsti | matchicalcom** [47:40 - 47:45]: What we do next is, we create already the I do, have it open?
**Konsti | matchicalcom** [47:45 - 47:46]: Give me a second.
**Konsti | matchicalcom** [47:46 - 48:01]: We already create these, wait one second here we already create these engagement role skills, so like blah blah blah.
**Konsti | matchicalcom** [48:01 - 48:06]: We have here the engagement and then we have here the junction table between engagement and roles.
**Konsti | matchicalcom** [48:06 - 48:08]: Because an engagement can have multiple roles.
**Konsti | matchicalcom** [48:08 - 48:18]: We need to create this already to basically know the rate that also the LLM returns and then we already create these.
**Konsti | matchicalcom** [48:19 - 48:20]: That's the question.
**Konsti | matchicalcom** [48:20 - 48:26]: Do we already create these or do we create them afterwards these engagement role skills?
**Konsti | matchicalcom** [48:26 - 48:29]: Because here we actually only need to know the engagement role ID.
**Konsti | matchicalcom** [48:30 - 48:34]: So this ID here and otherwise It's just a junction between, okay, to this.
**Carlos | matchicalcom** [48:34 - 48:38]: Engagement you also need the skill ID, right?
**Konsti | matchicalcom** [48:38 - 48:41]: Yeah, here we would need the skill ID and that's the thing.
**Konsti | matchicalcom** [48:41 - 48:46]: So what I currently do is, I create a skill and the skill is in draft or request.
**Konsti | matchicalcom** [48:46 - 48:46]: A state.
**Konsti | matchicalcom** [48:46 - 48:56]: And once it's done with classification, I go through all engagement role skills that have this skill ID and basically set.
**Konsti | matchicalcom** [48:56 - 48:58]: It to kind of no, I do nothing.
**Konsti | matchicalcom** [48:58 - 49:00]: Actually now it's already a skill ID.
**Carlos | matchicalcom** [49:00 - 49:09]: You already have the ID, you can have the the skill not approved or some so something can happen and would require you to review it again.
**Carlos | matchicalcom** [49:09 - 49:11]: But if the skill gets approved, the.
**Konsti | matchicalcom** [49:11 - 49:14]: Issue is a common use case is remapping.
**Konsti | matchicalcom** [49:14 - 49:23]: Yeah, it's redirect to because we already have this just type it a little bit different and then I would need to replace this.
**Carlos | matchicalcom** [49:26 - 49:38]: Okay, okay, that shouldn't be complex to remap, because would be just a direct SQL query, replace ID one hundred, four, two hundred and something just direct query.
**Carlos | matchicalcom** [49:39 - 49:50]: But what you need to prevent is getting the skill wrong the first time trying to if it has an alliance, if it was typed differently try to get the right skill up front if possible.
**Carlos | matchicalcom** [49:51 - 49:53]: But I'm sure that we will not get one hundred percent.
**Konsti | matchicalcom** [49:55 - 50:03]: One issue is like we cannot like the issue is and that's why Auto Resolution Map might make more.
**Konsti | matchicalcom** [50:03 - 50:10]: Sense instead of because we don't know it could be composite skill and we need to spin up three skills for this one, you know?
**Konsti | matchicalcom** [50:11 - 50:11]: So.
**Carlos | matchicalcom** [50:15 - 50:21]: It shouldn't be added as in my opinion at least as a role skill if we are.
**Carlos | matchicalcom** [50:21 - 50:24]: Still through the process, if it's a.
**Konsti | matchicalcom** [50:24 - 50:25]: Composite, that's the thing.
**Carlos | matchicalcom** [50:26 - 50:30]: Yeah, right, The prompt will find it because that's adding.
**Carlos | matchicalcom** [50:30 - 50:33]: In this case you are adding it to the role.
**Carlos | matchicalcom** [50:33 - 50:43]: But first of all you need to match it to a current existing skill or define through the process that we reviewed that the new one, one of the two things.
**Carlos | matchicalcom** [50:44 - 50:54]: If it's a new one get added and when you get at this point, you know that the skill should exist at least at the best of our efforts, with all the validations that we have.
**Konsti | matchicalcom** [50:57 - 51:07]: So when it's not a new one, when we can find an exact match, then it's obvious, right we just create a wisdom skill id correct when it's.
**Konsti | matchicalcom** [51:07 - 51:17]: A new one, like basically what I did so far, I just already created a skill and said OK, worst case I need to remap it and switch the ID later on.
**Konsti | matchicalcom** [51:17 - 51:44]: Or if it's not relevant, I need to delete this thing and what ChatGPT proposes like, okay, just create this kind of empty empty thing and populate it only when you're done with in the registry, you provide the resolution map and about this thing, I'm really not so certain, because it might also be that we don't just need to create one but one, two, three.
**Konsti | matchicalcom** [51:44 - 51:45]: But the issue.
**Carlos | matchicalcom** [51:47 - 51:54]: What I'm seeing so trying to think in a sequential way, we know that we can have multiple at the same time.
**Carlos | matchicalcom** [51:55 - 51:57]: It's part of the way of the approach.
**Carlos | matchicalcom** [51:57 - 52:16]: But in this case, you have a skill or a composite skill, so you have a string, you have a piece of text that represents a skill, or should you need to throw this code will be waiting until you figure out if that's one skill, two skills, three skills and you have a specific database id for them in.
**Carlos | matchicalcom** [52:16 - 52:17]: Our site.
**Carlos | matchicalcom** [52:19 - 52:31]: While we go through this process, these role skills need to wait a little bit it will end and once it ends, you know that you mean in.
**Konsti | matchicalcom** [52:31 - 52:34]: The workflow we wait until the classification is fully done.
**Konsti | matchicalcom** [52:35 - 52:37]: Yeah, for sure, sure, yeah, yeah.
**Konsti | matchicalcom** [52:38 - 52:42]: Before we did not have this workflow thing so we need always no, no.
**Carlos | matchicalcom** [52:42 - 52:44]: But it's not because it's the workflow.
**Carlos | matchicalcom** [52:45 - 52:56]: It's just not trying to use events to solve every part of the problem, because if you start spinning events, you lose the context of what you are.
**Konsti | matchicalcom** [52:56 - 53:03]: Doing and then that was the issue because, also we cannot create this junction table before we have classified this one.
**Konsti | matchicalcom** [53:03 - 53:05]: We first need to know what is the role?
**Konsti | matchicalcom** [53:05 - 53:12]: We can classify them all in parallel, but we need to know if this is a role that actually gets approved by the way, that's one thing.
**Konsti | matchicalcom** [53:13 - 53:19]: And second, if it gets approved like, okay, what's the idea that we can create this one that we then have the entry for this junction table disengagement role.
**Carlos | matchicalcom** [53:20 - 53:23]: Those things need to be sequential in my opinion need to be sequential.
**Carlos | matchicalcom** [53:23 - 53:26]: Or you need to start creating tem tables and all kind.
**Carlos | matchicalcom** [53:26 - 53:30]: Of weird additional information to be able to track it.
**Konsti | matchicalcom** [53:30 - 53:37]: We could spin them up in parallel and wait until all are done and then we sequentially first create this and then create this, right?
**Carlos | matchicalcom** [53:38 - 53:40]: Yes, it's possible.
**Carlos | matchicalcom** [53:40 - 53:41]: Let's see if it's worth it.
**Konsti | matchicalcom** [53:42 - 53:45]: Okay, but I think in the workflow.
**Konsti | matchicalcom** [53:45 - 53:47]: Yeah, you're true.
**Konsti | matchicalcom** [53:47 - 53:54]: But this means that we don't need a registry resolution map, But at least we don't need the resolution map.
**Konsti | matchicalcom** [53:54 - 53:56]: We just need the registration, right?
**Carlos | matchicalcom** [53:58 - 54:00]: Yes, I don't think.
**Carlos | matchicalcom** [54:00 - 54:06]: And if you have one would be very simple like a map the workflows.
**Konsti | matchicalcom** [54:06 - 54:11]: Are similar to BPT, right what happens if one element in the workflow fails?
**Konsti | matchicalcom** [54:11 - 54:15]: Does it retry just that one element or does it retry the whole workflow?
**Carlos | matchicalcom** [54:16 - 54:18]: You need to handle that you love?
**Carlos | matchicalcom** [54:18 - 54:21]: So we were saying failing like times out.
**Konsti | matchicalcom** [54:22 - 54:30]: Yeah, the whole thing, no, for example, the whole thing I think your workflow cannot time out.
**Konsti | matchicalcom** [54:30 - 54:32]: Like the timeout is very long, it.
**Carlos | matchicalcom** [54:33 - 54:37]: Has like two minutes per activity, per activity.
**Konsti | matchicalcom** [54:37 - 54:39]: So imagine one activity times out.
**Konsti | matchicalcom** [54:41 - 54:44]: Is it then retrying this activity or is it retrying the whole work?
**Carlos | matchicalcom** [54:44 - 54:46]: I would suppose it.
**Carlos | matchicalcom** [54:46 - 55:04]: I would suppose that will on VPT just gets suspended so it stops and you can you can manually just restart it from where it was, but it does not go just automatically try and try and retry, okay, but that's VPT workflow.
**Carlos | matchicalcom** [55:04 - 55:07]: I don't know that detail, but I will get back to you.
**Konsti | matchicalcom** [55:08 - 55:17]: I think that's but long story short, it's important for us that we kind of have a clear path on okay?
**Konsti | matchicalcom** [55:17 - 55:35]: As soon as something is kind of done with the WISI classification, like how does it get back to where it belongs to that's just a proposition here and about this proposition I'm not one hundred percent sure OK cool.
**Carlos | matchicalcom** [55:36 - 55:42]: I wouldn't worry too much We'll have to review a lot of these things when we are going like ends on just implementing.
**Carlos | matchicalcom** [55:42 - 55:47]: But at this point I wouldn't worry too much with that part, because it doesn't.
**Carlos | matchicalcom** [55:47 - 55:50]: I don't think that affect the overall solution.
**Carlos | matchicalcom** [55:50 - 55:54]: We just need to make sure that those are unique and we have the ideas how do we get there.
**Konsti | matchicalcom** [55:55 - 56:00]: The only reason why I'm worrying is because the way I did set it up is like too many events.
**Konsti | matchicalcom** [56:00 - 56:05]: I did not have the transparency, did not have the control and then there were a lot of ripple effects.
**Konsti | matchicalcom** [56:05 - 56:06]: Okay, blah blah blah blah blah.
**Konsti | matchicalcom** [56:06 - 56:19]: Now remap those experience those engagement road skills die engagement road skills change so we need to recalculate the current experiences for the consultant and there were a lot of like ripple effects.
**Konsti | matchicalcom** [56:19 - 56:30]: Oh, now I had in the beginning something a duplicate got introduced and instead of remapping the new duplicate to the old thing that we already have, I remap the old thing to the new thing and then I started recalculation for.
**Carlos | matchicalcom** [56:30 - 56:37]: All the things and talking about duplicate it can be like ten at the same time if you go down that path, okay?
**Carlos | matchicalcom** [56:37 - 56:42]: But for example to calculate the experience, I think we need to make sure that all the roles and all the skills are introduced.
**Carlos | matchicalcom** [56:42 - 56:48]: We cannot calculate or else you are going to have to recalculate anyway, so.
**Konsti | matchicalcom** [56:48 - 57:00]: Let'S I don't do calculate recalculation on the fly, I just set a flag like, okay, this one needs to be recalculated and when one of the cool cleanup jobs is triggering, he looks OK in this queue how many?
**Carlos | matchicalcom** [57:01 - 57:05]: But at that point you don't know if all the skills are calculated or not.
**Konsti | matchicalcom** [57:05 - 57:12]: No, but it really doesn't matter if you have three hundred or two hundred and ninety nine experiences, but you're right.
**Konsti | matchicalcom** [57:13 - 57:16]: But okay, something where I assume the models are done.
**Carlos | matchicalcom** [57:17 - 57:22]: Yeah, you need to wait until everything is completely introduced in terms of relation database and then you.
**Konsti | matchicalcom** [57:25 - 57:25]: Get bulletproof.
**Konsti | matchicalcom** [57:25 - 57:34]: Here we need to get more bulletproof, because the issue that we are currently having is due to the many events that was my help of doing it.
**Konsti | matchicalcom** [57:34 - 57:39]: Workflows weren't introduced back then we have basically very limited control.
**Konsti | matchicalcom** [57:39 - 57:43]: I added some layers of control for us, but it's painful basically.
**Tommy | matchicalcom** [57:44 - 57:49]: Okay, But we do need this resolution map or otherwise we.
**Konsti | matchicalcom** [57:49 - 57:54]: Don't the idea is for now we need to check.
**Konsti | matchicalcom** [57:54 - 58:10]: But in our systems you can also now have instead of events you can have those workflows, they are more like kind of zapier flows, you know, Tommy, that you built here directly and those workflows more or less like maybe I.
**Carlos | matchicalcom** [58:10 - 58:19]: Can show you but think of this as it was like a timer running, so it's a process, it's sequential and.
**Konsti | matchicalcom** [58:19 - 58:31]: Has activities, yeah, and here you can, here you have kind of unlimited or like a workflow can run for hours or so, so here we don't have.
**Carlos | matchicalcom** [58:31 - 58:37]: This one hundred twenty-second issue or dies because it.
**Carlos | matchicalcom** [58:37 - 58:43]: Has human activities so there are some steps that can be done by humans can be configured like that.
**Carlos | matchicalcom** [58:43 - 58:46]: So like go to a specific page, do a manual approval.
**Konsti | matchicalcom** [58:49 - 58:56]: And for all our like the CV parser and actually all the the still approval things we should.
**Konsti | matchicalcom** [58:57 - 58:58]: Switch them to workflows.
**Tommy | matchicalcom** [58:59 - 59:00]: Yeah, OK.
**Konsti | matchicalcom** [59:02 - 59:22]: And then we have a longer time horizon that basically means, after the engagement got extracted, we can wait and kick off multiple classifications for all the skills and everything wait until all are done and then we get the information and then we kind of create the engagement role, so we don't need to resolve anything you know.
**Tommy | matchicalcom** [59:24 - 59:26]: So you will do a temporary.
**Konsti | matchicalcom** [59:29 - 59:33]: You just halt the process of creating the engagement until all skills are classified.
**Konsti | matchicalcom** [59:35 - 59:39]: That's the thing and we could not do this before, but you will need.
**Tommy | matchicalcom** [59:39 - 01:00:09]: Also for just sorry, I think it's too technical, but just from an understanding of for my curiosity here, we start a workflow, we have a CV parser, we get the first skill, I don't know Java, okay, and just imagine Java it's not in our database, I don't know if any reason it's not in our database, so it must go to our registry because it must be done something with it.
**Tommy | matchicalcom** [01:00:10 - 01:00:14]: And in the same time from the same CV parser.
**Tommy | matchicalcom** [01:00:15 - 01:00:18]: Java also comes from an other engagement.
**Tommy | matchicalcom** [01:00:20 - 01:00:23]: We have to put it in a resolution or in whatever.
**Tommy | matchicalcom** [01:00:23 - 01:00:40]: I don't know because we have to say OK Java is also is in the registry, it's there, please wait so make a combination, make a connection because we have to handle this.
**Tommy | matchicalcom** [01:00:41 - 01:00:44]: If Java from the registry is finished.
**Tommy | matchicalcom** [01:00:44 - 01:00:48]: What should happen with the JAVA from the second engagement for example, that's true.
**Konsti | matchicalcom** [01:00:48 - 01:00:49]: That's true, that's true.
**Konsti | matchicalcom** [01:00:50 - 01:00:53]: We cannot wait for a workflow from another instance.
**Konsti | matchicalcom** [01:00:53 - 01:00:55]: Carlos, right?
**Konsti | matchicalcom** [01:00:55 - 01:00:58]: Also the skill approve itself is something.
**Carlos | matchicalcom** [01:00:58 - 01:01:06]: No, but I would see the workflow would be the full process, I will call it CV parser.
**Carlos | matchicalcom** [01:01:06 - 01:01:11]: Okay, just first step goes very the.
**Konsti | matchicalcom** [01:01:11 - 01:01:16]: Skill AI approval thing is a workflow because there are multiple prompts that we.
**Carlos | matchicalcom** [01:01:16 - 01:01:17]: Have sure it can be.
**Carlos | matchicalcom** [01:01:17 - 01:01:27]: I would say in here I'm not sure if they have subflows, but in EBPT they have like you have the process and sub-processes so smaller processes.
**Carlos | matchicalcom** [01:01:27 - 01:01:40]: They can run for specific parts, so we have them a bigger workflow and don't focus too much in the workflow itself once again.
**Carlos | matchicalcom** [01:01:40 - 01:01:44]: This is just a way to run code, that is a visual representation.
**Carlos | matchicalcom** [01:01:44 - 01:01:48]: This could be a timer that runs for five minutes for example.
**Konsti | matchicalcom** [01:01:48 - 01:01:50]: No, it cannot be in timer because.
**Konsti | matchicalcom** [01:01:50 - 01:01:50]: Timer cannot.
**Konsti | matchicalcom** [01:01:50 - 01:01:51]: Run in parallel.
**Konsti | matchicalcom** [01:01:51 - 01:01:54]: You cannot spin up multiple instances of timers, that's the issue.
**Carlos | matchicalcom** [01:01:58 - 01:01:59]: More or less.
**Carlos | matchicalcom** [01:01:59 - 01:02:05]: You can have three or four that call the same action, It's parallel timers.
**Carlos | matchicalcom** [01:02:07 - 01:02:10]: You can have like two different timers.
**Konsti | matchicalcom** [01:02:10 - 01:02:21]: That now they introduce parallel, but as you can see they did, we can only automated activity, we can only select here.
**Konsti | matchicalcom** [01:02:23 - 01:02:28]: Yeah, we cannot select other workflows here, other workflows.
**Carlos | matchicalcom** [01:02:28 - 01:02:42]: So they don't have the so you have the but you can have them don't worry, because you can we can, you can have multiple calls here or you can have an interview section that Does the multiple calls and wides a little bit?
**Carlos | matchicalcom** [01:02:42 - 01:02:44]: I know that we have the two minute limit.
**Carlos | matchicalcom** [01:02:44 - 01:02:46]: So probably needs to be two different.
**Konsti | matchicalcom** [01:02:46 - 01:02:53]: Service sections, like the two dimensional different is an issue, because we can have up to four prompts in one classification.
**Konsti | matchicalcom** [01:02:53 - 01:02:54]: This we cannot fit in two minutes.
**Carlos | matchicalcom** [01:02:55 - 01:03:07]: Okay, We'll have to figure out the solution for that you probably can do in terms of implementation multiple server actions, service actions.
**Tommy | matchicalcom** [01:03:07 - 01:03:14]: Sorry, but can you, sorry, do we need a resolution map or whatever?
**Tommy | matchicalcom** [01:03:14 - 01:03:16]: Or do we don't need something like that.
**Konsti | matchicalcom** [01:03:16 - 01:03:23]: Yeah, that's the question like, what about, like another workflow is requesting the same like he needs to know.
**Konsti | matchicalcom** [01:03:23 - 01:03:28]: Okay, now I need to kind of subscribe to this workflow and wait until it's done.
**Carlos | matchicalcom** [01:03:28 - 01:03:32]: No, the communication itself, it's been done by the database.
**Carlos | matchicalcom** [01:03:32 - 01:03:41]: The other workflow will search the skill If at that moment is on the database you have the skill or on the graph if at that moment it does not have.
**Carlos | matchicalcom** [01:03:41 - 01:03:46]: You need to start that approach of adding the skill.
**Konsti | matchicalcom** [01:03:46 - 01:03:56]: Yeah, but imagine, like three different things are waiting for the same approach, for the same classification thing like they will not be waiting.
**Konsti | matchicalcom** [01:03:58 - 01:03:59]: I do not have the skill.
**Konsti | matchicalcom** [01:03:59 - 01:04:02]: Okay, I start the workflow because it's not there yet.
**Konsti | matchicalcom** [01:04:02 - 01:04:07]: Then the second parser is running here and oh, I do not have a skill, but it's already in the registry.
**Konsti | matchicalcom** [01:04:07 - 01:04:09]: Okay, I need to wait for this one.
**Carlos | matchicalcom** [01:04:11 - 01:04:15]: If you don't have the if don't, don't have that part of the registry and wait.
**Carlos | matchicalcom** [01:04:15 - 01:04:16]: What would happen would be?
**Carlos | matchicalcom** [01:04:16 - 01:04:28]: Both will start the classification and one of them will fail because the first one will add it, the second one will fail because it's already added and it just retrieves the existing ID.
**Konsti | matchicalcom** [01:04:30 - 01:04:35]: But the idea was not to start a classification if we know it's already in the loop in the in the process.
**Carlos | matchicalcom** [01:04:36 - 01:04:42]: Okay, I'm not sure if it's worth to keep all that just because of I'm saying a couple of seconds.
**Carlos | matchicalcom** [01:04:42 - 01:04:44]: But if you tell me that.
**Konsti | matchicalcom** [01:04:48 - 01:04:48]: Fifty.
**Carlos | matchicalcom** [01:04:48 - 01:04:49]: Seconds is not a.
**Carlos | matchicalcom** [01:04:49 - 01:04:49]: Lot.
**Carlos | matchicalcom** [01:04:49 - 01:04:53]: But I understand just not sure how many.
**Konsti | matchicalcom** [01:04:56 - 01:05:00]: Seconds or compute that you'll say matures.
**Konsti | matchicalcom** [01:05:00 - 01:05:02]: Those cases will go down and down and down.
**Carlos | matchicalcom** [01:05:03 - 01:05:04]: That's for the first day.
**Carlos | matchicalcom** [01:05:04 - 01:05:06]: Yes, the first day will be a nightmare.
**Carlos | matchicalcom** [01:05:06 - 01:05:09]: Okay, so we probably need to It's.
**Konsti | matchicalcom** [01:05:09 - 01:05:10]: Really the first year like.
**Carlos | matchicalcom** [01:05:11 - 01:05:17]: No, it's not because you said that you were thinking about bulk processing most of the CV's.
**Carlos | matchicalcom** [01:05:17 - 01:05:38]: So that's that the process needs probably to be adjusted a little bit to run some thousands right because after that initial step I don't, I don't expect, I don't know everything of course or the business too well, but I don't expect hundreds or thousands of new skills every day.
**Carlos | matchicalcom** [01:05:38 - 01:05:44]: Maybe when you onboard a new client that works not in it in a different field, maybe.
**Carlos | matchicalcom** [01:05:44 - 01:05:48]: But the database will start to be.
**Konsti | matchicalcom** [01:05:48 - 01:05:58]: Currently we extracted a lot of skills and we have these duplicate things still on a constant basis because there are so many fields where we don't know.
**Konsti | matchicalcom** [01:05:58 - 01:06:02]: So let's leave it as an open point that we definitely need to think about.
**Carlos | matchicalcom** [01:06:04 - 01:06:07]: We can approach this as an approach.
**Carlos | matchicalcom** [01:06:08 - 01:06:18]: If we simply simply we can always simplify to start with and then log or count measure how many times these kind of hard worker cases will happen.
**Carlos | matchicalcom** [01:06:18 - 01:06:23]: And handling better, just do a better more performant or just a better approach.
**Konsti | matchicalcom** [01:06:24 - 01:06:41]: Can be always involving, OK, OK, so then let's go into the classifier here It's more like the idea was, the classifier zero is basically about is it relevant at all or is it not relevant?
**Konsti | matchicalcom** [01:06:41 - 01:06:51]: And this decomposition Of HTML, CSS, JavaScript Slashes, that's basically the only thing that will be decided in here.
**Konsti | matchicalcom** [01:06:51 - 01:07:07]: And also what the idea was, if there is a typo provided for example Python with double O, we could already kind of shortcut the rest of the flow, because when it's an obvious typo, he will give us back this is the cleaned up version without the typo.
**Konsti | matchicalcom** [01:07:07 - 01:07:09]: And we can do an exact match.
**Konsti | matchicalcom** [01:07:09 - 01:07:11]: Maybe we already have it in the Graph Database and then we.
**Konsti | matchicalcom** [01:07:11 - 01:07:17]: Can create this skill automatically as a redirect because I was a typo.
**Konsti | matchicalcom** [01:07:17 - 01:07:18]: So we have this typo.
**Konsti | matchicalcom** [01:07:18 - 01:07:28]: We don't need to run the rest of the pipeline and it also will provide a short description for better retrieval with the vector retrieval search right when we.
**Konsti | matchicalcom** [01:07:28 - 01:07:31]: Have I will come here like is.
**Tommy | matchicalcom** [01:07:31 - 01:07:38]: A short description better concept is a short description better than the dex of.
**Konsti | matchicalcom** [01:07:39 - 01:07:57]: One line Basically is oftentimes better for lexical we just use the skill name, but for embedding basically embedding is more about the meaning a very short description like liner is better because spring for example is spring, summer, winter, you know.
**Tommy | matchicalcom** [01:07:58 - 01:08:02]: Yeah, time of the year, yeah, yeah, time period of the year.
**Konsti | matchicalcom** [01:08:04 - 01:08:06]: Yeah, that's the idea.
**Konsti | matchicalcom** [01:08:06 - 01:08:11]: Also the idea was, when the classifier zero, we do not necessarily need it.
**Konsti | matchicalcom** [01:08:11 - 01:08:22]: We could do it to save some time computing costs, but not really necessarily when it's decompositing these things like and states OK, this is HTML, this is CSS and this is JavaScript.
**Konsti | matchicalcom** [01:08:23 - 01:08:42]: We could already tell the classifier zero to return out the boolean of relevant, true or false and the short description and the fix of a typo, so that when we then spin up new workflows, we can tell, okay, for classifier zero we already have the results from the first classifier zero, so that we don't need to reclassify and run the classifier zero.
**Konsti | matchicalcom** [01:08:42 - 01:09:03]: That's like here pre flight, bypass true thing and just a minor thing, Then we have this retrieval and here was the idea yeah, yeah, yeah, yeah, yeah, only retrieve skills absolutely, absolutely constantly much.
**Tommy | matchicalcom** [01:09:03 - 01:09:18]: Much better, yeah, I wrote it down some game changing thought in this case, because then this Camunda version eight wants never happen again.
**Konsti | matchicalcom** [01:09:18 - 01:09:30]: So yeah, that's one thing and also like the retrieval won't be so messy there can be like for each skill we can have like hundreds or sometimes even five hundred or thousand of skill aliases or redirects or.
**Konsti | matchicalcom** [01:09:30 - 01:09:55]: I don't know if we only retrieve for skills and then the next classifiers, only focus on tell me if this is an existing skill or if this is a new skill, then we can This is the most important part of classification, knowing if this is an existing skill or a new skill, the rest is like when and when a new skill is, we also need to connect it correctly, but that's more downstream.
**Konsti | matchicalcom** [01:09:55 - 01:10:01]: But when it's an existing skill, then we can go in another classifier that is getting like, okay, it is an existing skill, we know it.
**Konsti | matchicalcom** [01:10:01 - 01:10:04]: Here are all the aliases we have of this skill.
**Konsti | matchicalcom** [01:10:04 - 01:10:27]: Let me know if it's a new alias or just a redirect to a certain alias, so this one is quite straightforward and easy and give me, if it's a new alias, some of the descriptions like that we put in our like you know for each of the skills we have some descriptions that's always slow, like this one here, give me these kind of descriptions, blah, blah, blah.
**Konsti | matchicalcom** [01:10:27 - 01:10:37]: So we can tell this one the prompt, the downstream prompt here, that doesn't really need to classify anything, but it's super important and here we need to really play around with it a little bit.
**Carlos | matchicalcom** [01:10:39 - 01:10:46]: Yes, sorry, on c one to know if it's an existing skill or not, you have to send everything.
**Carlos | matchicalcom** [01:10:48 - 01:10:54]: Every existing belong the graph we just.
**Konsti | matchicalcom** [01:10:54 - 01:11:02]: Do, we just do retrieval here that's the only thing where we do retrieval and we do the retrieval only on the skills that's important because much less.
**Carlos | matchicalcom** [01:11:02 - 01:11:07]: So you have a list of skill right on that.
**Carlos | matchicalcom** [01:11:07 - 01:11:09]: When do you finish the C zero?
**Konsti | matchicalcom** [01:11:11 - 01:11:30]: When we finish the C zero, we just have maybe a cleaned up name name that we can match right away, but if not, when we finish C zero we have a short description and the skill name right and skill name, yeah, okay, so C one skill name, we do basically a retrieval and we do two types of retrieval.
**Konsti | matchicalcom** [01:11:30 - 01:11:42]: First like Lexi Kilpas with this BM twenty five or open search algorithm, like Neo four J is capable about this one and retrieve here like let's say top forty, forty to sixty, I don't know.
**Konsti | matchicalcom** [01:11:43 - 01:11:48]: And then we do also embedding path, so we combine the scale name and the short description that we have some more of the meaning space.
**Konsti | matchicalcom** [01:11:48 - 01:11:58]: And then we do like with Neo four J we can also do this like an embedding search, like vector similarity search and based on this we do the retrieval and get like the top.
**Konsti | matchicalcom** [01:11:58 - 01:12:06]: Like let's say we need to play around with it, but I think we can easily get like two hundred skills and two hundred skills that are very close related to this specific.
**Konsti | matchicalcom** [01:12:06 - 01:12:07]: Name.
**Konsti | matchicalcom** [01:12:07 - 01:12:12]: We will have enough data for the c-one classifier to do the right classification.
**Konsti | matchicalcom** [01:12:13 - 01:12:15]: We could even fill this up to five hundred.
**Konsti | matchicalcom** [01:12:15 - 01:12:17]: It should still work quite decently.
**Carlos | matchicalcom** [01:12:19 - 01:12:29]: Right, Because once I'm guessing that after a while that retrieval will have a lot of one hundred percent, so just very very close.
**Carlos | matchicalcom** [01:12:29 - 01:12:37]: But okay, I see, I see where we're going, so there is a an additional prompt to that gets that subset that was retrieved.
**Carlos | matchicalcom** [01:12:38 - 01:12:43]: That was just the call to the graph just to get that information.
**Carlos | matchicalcom** [01:12:43 - 01:12:45]: And you send all that to another.
**Konsti | matchicalcom** [01:12:46 - 01:12:48]: Okay, to another prompt that's making the decision.
**Konsti | matchicalcom** [01:12:48 - 01:12:49]: Is this a skill or not?
**Konsti | matchicalcom** [01:12:49 - 01:12:51]: Is this a new skill?
**Carlos | matchicalcom** [01:12:51 - 01:12:53]: It's a new one or it's an alliance or whatever.
**Tommy | matchicalcom** [01:12:53 - 01:12:54]: Yeah, exactly.
**Tommy | matchicalcom** [01:12:54 - 01:13:02]: And the game changing ideas is, at this moment we are sending skills and skill aliases to the to.
**Tommy | matchicalcom** [01:13:02 - 01:13:13]: The we are querying or we are busy, we are rieving skills and skill aliases and that's the big problem at this, at this stage for us.
**Tommy | matchicalcom** [01:13:13 - 01:13:24]: So if we are searching for Camunda, for example PPM and Camunda, we get all the Camunda aliases as well, or think about SAP.
**Tommy | matchicalcom** [01:13:24 - 01:13:28]: Yeah, that's it's getting, yeah, exactly too much.
**Konsti | matchicalcom** [01:13:28 - 01:13:38]: Yeah, yeah, yeah, look at the skills like we have we have in this engagement we have the information about like okay, what did I do?
**Konsti | matchicalcom** [01:13:38 - 01:13:43]: I did Azure, Azure, Azure and some other things here.
**Konsti | matchicalcom** [01:13:43 - 01:14:00]: But long story short, this one is probably just named once but Azure you find here one hundred times and therefore we are like providing you Azure all the time because of our whole fucking aliases and we get rid of this issue by just looking for skills, right?
**Carlos | matchicalcom** [01:14:00 - 01:14:05]: Just focus on those, yeah, but you search all the others so you should have the matching.
**Konsti | matchicalcom** [01:14:06 - 01:14:24]: The idea was also next to our lexical retrieval here and the embeddings path we also go along the graph and I would even state let's go one up and one down like you know give me from the embeddings and the lexica path we got these.
**Konsti | matchicalcom** [01:14:24 - 01:14:36]: Skills and now let's look for their parents and their child's kind of and also feed these in so that we have kind of three hierarchical layers that we and then it's maybe even up to two hundred, doesn't matter.
**Konsti | matchicalcom** [01:14:36 - 01:14:42]: Like the LLMs can easily handle this amount and look through all of them and challenge the skill that we request against those three hundred.
**Konsti | matchicalcom** [01:14:43 - 01:14:44]: But that's a good thing.
**Konsti | matchicalcom** [01:14:44 - 01:14:56]: We can use lexical and we can use embeddings and then we go also to graph one up, one down and when it is this one, I think we have like I cannot imagine a case where we don't.
**Konsti | matchicalcom** [01:14:56 - 01:14:59]: But this is something on my open list like this.
**Konsti | matchicalcom** [01:14:59 - 01:15:17]: I want to do next is really deeply challenge the retrieval thing, because with this retrieval and how good our retrieval is basically the rest of the quality kind of stands and falls if our retrieval is bad and we start reintroducing new skills all the time that are not new, then we have a big issue.
**Konsti | matchicalcom** [01:15:17 - 01:15:20]: And that's why this retrieval just one.
**Tommy | matchicalcom** [01:15:22 - 01:15:25]: Question or just to confirm from your side.
**Tommy | matchicalcom** [01:15:25 - 01:15:37]: So the idea is we retrieve three hierarchy layers so the skill one parent and one child in this case and.
**Konsti | matchicalcom** [01:15:37 - 01:15:40]: Then we do, yeah, then we, then.
**Tommy | matchicalcom** [01:15:40 - 01:16:00]: We do have this list, then the LM decides, okay, it's existing so it's already there and it's that and if it's that just go next prompt just give me the aliases of that.
**Tommy | matchicalcom** [01:16:00 - 01:16:01]: Yeah, exactly.
**Tommy | matchicalcom** [01:16:02 - 01:16:05]: And then please alias or an existing.
**Konsti | matchicalcom** [01:16:05 - 01:16:07]: Alias in the redirect.
**Tommy | matchicalcom** [01:16:07 - 01:16:11]: Yeah, exactly OK got it, that's great so far.
**Tommy | matchicalcom** [01:16:11 - 01:16:20]: And then the question that the following question is if it is done is great if it's a new alias.
**Tommy | matchicalcom** [01:16:20 - 01:16:23]: It's great if it's remember we can do everything.
**Tommy | matchicalcom** [01:16:23 - 01:16:25]: I don't see any problem.
**Tommy | matchicalcom** [01:16:30 - 01:16:42]: Yeah, but now, yeah, as I wrote it down, so this how do bring it, bring some new connection between, also the same principle.
**Konsti | matchicalcom** [01:16:42 - 01:16:56]: Then we just query for skills that are top and down and we provide a list and then tell me what connections and when I just need to it's just, I think the same way, like just look for skills and the connections and so on it will work.
**Konsti | matchicalcom** [01:16:56 - 01:17:16]: I'm quite confident that this will work quite well, because then we already know the area where to look at we retrieve like this will another retrieval and in this retrieval we can use embedding and basically telling the embedding I'm looking for parents like or we can even ask c one if it stays.
**Konsti | matchicalcom** [01:17:16 - 01:17:22]: As a new skill, Give me some potential parent names that I can query for in our database.
**Konsti | matchicalcom** [01:17:22 - 01:17:28]: Like you know what are potential parents for this new skill that we have something for our new retrieval?
**Konsti | matchicalcom** [01:17:28 - 01:17:30]: What are potential childs that we have something for a new retrieval?
**Konsti | matchicalcom** [01:17:30 - 01:17:32]: And then we do a big retrieval.
**Konsti | matchicalcom** [01:17:32 - 01:17:43]: If the quality is not good, we even do like a double workflow where we once retrieve just childs and have a child classification prompt and then we just retrieve parents have a parent classification prompt.
**Konsti | matchicalcom** [01:17:43 - 01:17:44]: We could do this.
**Konsti | matchicalcom** [01:17:44 - 01:17:46]: Probably little overkill, but.
**Tommy | matchicalcom** [01:17:50 - 01:17:52]: At this point I'm not.
**Tommy | matchicalcom** [01:17:52 - 01:17:54]: Yeah, sorry Carlos, no, I was just.
**Carlos | matchicalcom** [01:17:54 - 01:17:55]: Going to say that.
**Carlos | matchicalcom** [01:17:56 - 01:18:06]: Before going to some of these prompts, I'll probably just do a string match with like ninety-nine percent coffee this or.
**Carlos | matchicalcom** [01:18:06 - 01:18:12]: Something, because the was already clean up and I think some of those matching over time will be just direct.
**Carlos | matchicalcom** [01:18:15 - 01:18:32]: Okay, so to simplify the process, I would first when you do the retrieval just instead of going trying to get the first forty or the ones that are matching more, let's just try to see if we already have it or not and then we would start the LLM work.
**Konsti | matchicalcom** [01:18:32 - 01:18:35]: We have it as an exact match or what do you mean with we have it?
**Carlos | matchicalcom** [01:18:35 - 01:18:37]: Yes, yes, exact match.
**Konsti | matchicalcom** [01:18:37 - 01:18:38]: But we cannot have it as an exact match.
**Konsti | matchicalcom** [01:18:38 - 01:18:41]: If we would have it as an exact match, we would not be here.
**Konsti | matchicalcom** [01:18:43 - 01:18:46]: If there's already an exact match, we would not be at this place.
**Konsti | matchicalcom** [01:18:46 - 01:18:49]: We would never need to kick off.
**Tommy | matchicalcom** [01:18:49 - 01:18:54]: The pipeline, you know, Because that's in the registry process, that's the classifier zero.
**Tommy | matchicalcom** [01:18:55 - 01:18:59]: Look at the hit match Okay, if it's done, check it.
**Tommy | matchicalcom** [01:19:00 - 01:19:02]: I know, it's a little bit confusing.
**Carlos | matchicalcom** [01:19:02 - 01:19:03]: But it's a lot of information.
**Carlos | matchicalcom** [01:19:03 - 01:19:06]: Yeah, for sure, for sure, for sure.
**Konsti | matchicalcom** [01:19:08 - 01:19:10]: It's amazing enough that you can discuss.
**Tommy | matchicalcom** [01:19:10 - 01:19:20]: With us these things, so we are very deep in the topic and you can follow our thoughts, so that's right.
**Konsti | matchicalcom** [01:19:21 - 01:19:26]: In the end we can definitely say we are not just an LLM rapper, because there's some fancy things around it.
**Konsti | matchicalcom** [01:19:26 - 01:19:35]: Right, right, right, yeah, so full text like, but I'm pretty bullish Carlos on this classifier prompt.
**Konsti | matchicalcom** [01:19:35 - 01:19:36]: Really?
**Konsti | matchicalcom** [01:19:36 - 01:19:37]: I'm pretty bullish on this one.
**Konsti | matchicalcom** [01:19:37 - 01:19:43]: That was a good retrieval, like he's stating stuff that we could like This is here maximum marginal relevance.
**Konsti | matchicalcom** [01:19:43 - 01:19:53]: That we can kind of filter out a little bit of what we retrieve to not have so many similar skills, but we skills aren't that similar at all, so it doesn't really matter.
**Konsti | matchicalcom** [01:19:55 - 01:20:00]: So I'm quite bullish on this was only thing that we need to prevent and this is way more downstream.
**Konsti | matchicalcom** [01:20:00 - 01:20:04]: We need to prevent that we don't introduce too many new skills.
**Konsti | matchicalcom** [01:20:04 - 01:20:09]: You could say, okay, Python is a skill and Django is distinct enough, also to be a skill.
**Konsti | matchicalcom** [01:20:10 - 01:20:13]: But when we also start introducing Python frameworks as a skill.
**Konsti | matchicalcom** [01:20:13 - 01:20:17]: Between Python and Django, then we will have too many skills at one point.
**Konsti | matchicalcom** [01:20:17 - 01:20:20]: So we need to be careful that we really do.
**Konsti | matchicalcom** [01:20:20 - 01:20:26]: Also in our like classifier prompt and the kind of what is our skill definition?
**Konsti | matchicalcom** [01:20:27 - 01:20:36]: It should not be too granular that we should always prevent not to get too many skills and we should do QA on new skills to kind of do it have a sanity check.
**Konsti | matchicalcom** [01:20:36 - 01:20:39]: Is this really like?
**Konsti | matchicalcom** [01:20:40 - 01:20:48]: You know, skills are something that has kind of a distinct learning curve and that clients kind of look for because it's relevant at all.
**Konsti | matchicalcom** [01:20:49 - 01:20:51]: But this is a little bit downstream.
**Tommy | matchicalcom** [01:20:52 - 01:20:55]: Just just to be to be clear.
**Tommy | matchicalcom** [01:20:55 - 01:21:02]: I think I got your idea and I can really imagine to classify.
**Tommy | matchicalcom** [01:21:02 - 01:21:06]: It's a skill, it's a new skill alias everything's fine.
**Tommy | matchicalcom** [01:21:06 - 01:21:12]: I think this is perfect, but I really have some doubt.
**Tommy | matchicalcom** [01:21:13 - 01:21:19]: Doubt is too much, but I don't have the correct English word, so.
**Carlos | matchicalcom** [01:21:20 - 01:21:20]: I'm.
**Tommy | matchicalcom** [01:21:20 - 01:21:47]: Not one hundred percent sure with this really new connections between introduce a new connection, so we have Angular, we don't have, we have just imagine we have Angular, react and view and we only have the parent as A specialized in frontend frameworks.
**Tommy | matchicalcom** [01:21:47 - 01:21:53]: And now we want to bring up JavaScript frameworks.
**Tommy | matchicalcom** [01:21:54 - 01:21:56]: JavaScript front end frameworks, I don't know.
**Tommy | matchicalcom** [01:21:56 - 01:22:00]: And that must be a set between them.
**Tommy | matchicalcom** [01:22:01 - 01:22:19]: React, view and angular must point to JavaScript frontend and the connection JavaScript frontend specializes in front end technologies, so that's so hard to achieve, but that's or.
**Konsti | matchicalcom** [01:22:20 - 01:22:22]: You can basically do it in the same way.
**Konsti | matchicalcom** [01:22:22 - 01:22:24]: We just do a retrieval really, Okay.
**Tommy | matchicalcom** [01:22:24 - 01:22:28]: If it's done, because that's only in my head.
**Tommy | matchicalcom** [01:22:28 - 01:22:36]: Because that's kind of, if we solve that problem, our matching will be so so much better in the end.
**Tommy | matchicalcom** [01:22:38 - 01:22:47]: Because actually we do have the problem just to give you a short introduction, we do have a problem on the it's it.
**Tommy | matchicalcom** [01:22:47 - 01:22:49]: So what is the main?
**Tommy | matchicalcom** [01:22:49 - 01:22:56]: The problem are written very granular.
**Tommy | matchicalcom** [01:23:00 - 01:23:02]: Okay, okay, okay, we can skip it.
**Konsti | matchicalcom** [01:23:02 - 01:23:04]: Okay, then we'll get there in a second.
**Konsti | matchicalcom** [01:23:04 - 01:23:08]: But the short idea is that the C one class, but I'm not there yet.
**Konsti | matchicalcom** [01:23:08 - 01:23:10]: This is one of my open points.
**Konsti | matchicalcom** [01:23:10 - 01:23:11]: I want to provide some.
**Konsti | matchicalcom** [01:23:11 - 01:23:14]: I need to do some as I did this one back and forth and then.
**Konsti | matchicalcom** [01:23:14 - 01:23:15]: Provide a proposition.
**Konsti | matchicalcom** [01:23:15 - 01:23:29]: But my current idea is, C one can return us lists of propositions of potential charts and skills and then we can do again like retrieval against those and the probability that we retrieve the right ones is quite high.
**Konsti | matchicalcom** [01:23:30 - 01:23:40]: So then we know where to connect it and then we only need to figure out afterwards, okay, what connections to clean up and what connections to clean up is just like we can do this purely technical.
**Konsti | matchicalcom** [01:23:40 - 01:23:58]: It's just like kind of an algorithm where we need to check, okay, when this connects to this and this to this is like what is directly you know if there's a connection from something to a parent, Where's actually something between that has this one as a child and this one is apparent, We know this connection is redundant.
**Konsti | matchicalcom** [01:23:58 - 01:24:12]: So with these kind of algorithmic patterns we can clean up without any LLM redundant connections and redundant connections are not the they are not good, but they are not like.
**Konsti | matchicalcom** [01:24:13 - 01:24:18]: They are not, Let's say they are not ideal, but they are not like bad.
**Konsti | matchicalcom** [01:24:18 - 01:24:21]: They are just like redundant, but they are not like bad.
**Konsti | matchicalcom** [01:24:22 - 01:24:26]: The more important thing is to get the right connections.
**Konsti | matchicalcom** [01:24:26 - 01:24:39]: But yeah, I think as we are already approaching ninety minutes and I need to go for lunch in five minutes, because otherwise I won't make it to lunch today.
**Konsti | matchicalcom** [01:24:40 - 01:24:42]: That's like the current.
**Konsti | matchicalcom** [01:24:43 - 01:24:46]: That's where I'm currently at Let me give you a quick preview.
**Konsti | matchicalcom** [01:24:47 - 01:24:49]: One thing is, we already talked a little bit about it.
**Konsti | matchicalcom** [01:24:50 - 01:24:52]: When we have the information.
**Konsti | matchicalcom** [01:24:52 - 01:24:54]: It's a skill alias to a skill.
**Konsti | matchicalcom** [01:24:54 - 01:24:58]: That we know, then we have a classifier that just tells us is a new skill alias or just a.
**Konsti | matchicalcom** [01:24:58 - 01:24:58]: Redirect.
**Konsti | matchicalcom** [01:24:58 - 01:25:00]: And what is the description of a new skill alias?
**Konsti | matchicalcom** [01:25:00 - 01:25:11]: Pretty straightforward, this is an open topic and mid inversion these things are open topics, but basically even the other connections that you propose.
**Konsti | matchicalcom** [01:25:11 - 01:25:17]: Carlos here even these one we could like specializes in I'm bullish on this one.
**Konsti | matchicalcom** [01:25:17 - 01:25:22]: Generalized two is just the opposite of specializes in prerequisite.
**Konsti | matchicalcom** [01:25:22 - 01:25:29]: For I think the most valuable one would be alternative two where we have this postgres like this one we could consider.
**Konsti | matchicalcom** [01:25:29 - 01:25:36]: But for each of these we probably need new other workflows, so we should maybe, but introducing them later will be pain in the aß.
**Konsti | matchicalcom** [01:25:36 - 01:25:42]: So that's that's just a thing to give you for thinking about it and I will ideate about it.
**Konsti | matchicalcom** [01:25:43 - 01:25:44]: But just.
**Carlos | matchicalcom** [01:25:46 - 01:26:00]: As we roll this out, we can focus on these two three initial ones and I think we can probably, if we are not going to use the other ones for now, let's leave it for a later.
**Konsti | matchicalcom** [01:26:00 - 01:26:01]: Yeah, I agree.
**Konsti | matchicalcom** [01:26:01 - 01:26:07]: But it's like reclassifying your whole graph will also be painful, but I agree, what we don't use.
**Konsti | matchicalcom** [01:26:07 - 01:26:14]: We should not implement the only thing, the only candidate I see, but let's not fix this decision for now.
**Konsti | matchicalcom** [01:26:14 - 01:26:21]: Is this alternative to where you mentioned like playwright versus Selenium.
**Konsti | matchicalcom** [01:26:21 - 01:26:35]: Tommy your example, Yeah, maybe the rest is still tbd I provided here like what's what's still like?
**Konsti | matchicalcom** [01:26:35 - 01:26:43]: The biggest things where I will provide you propositions for is like OK, what is the skill definition for us?
**Konsti | matchicalcom** [01:26:44 - 01:26:51]: That is something we need to talk about this retrieval thing how we can really ensure like best retrieval.
**Konsti | matchicalcom** [01:26:52 - 01:26:58]: I think we can just also drive up the numbers like even like three hundred should be easily handled before LLMs.
**Konsti | matchicalcom** [01:26:59 - 01:27:02]: This new placement stuff we talked about currently.
**Konsti | matchicalcom** [01:27:02 - 01:27:07]: Tommy, I will make a proposition for this composite.
**Konsti | matchicalcom** [01:27:08 - 01:27:09]: I think we already talked about it.
**Konsti | matchicalcom** [01:27:09 - 01:27:11]: Redirect versus casing.
**Konsti | matchicalcom** [01:27:11 - 01:27:12]: We had this a little bit.
**Konsti | matchicalcom** [01:27:13 - 01:27:22]: These are just minor things, but the biggest three items is this one, this one and this one.
**Konsti | matchicalcom** [01:27:22 - 01:27:25]: But I will provide a proposition for this one as well.
**Konsti | matchicalcom** [01:27:25 - 01:27:28]: My question now is based on what we were talking through.
**Konsti | matchicalcom** [01:27:28 - 01:27:31]: I think we see things that we talked here about.
**Konsti | matchicalcom** [01:27:31 - 01:27:33]: I will update this stuff.
**Konsti | matchicalcom** [01:27:33 - 01:27:35]: What do you think about it in general?
**Tommy | matchicalcom** [01:27:38 - 01:27:44]: Yeah, absolutely right direction in the end.
**Tommy | matchicalcom** [01:27:44 - 01:28:04]: And it seems the most important thing is, it seems feasible so for me it seems really feasible and I can imagine that the quality will get really much much better if you're doing in that way.
**Tommy | matchicalcom** [01:28:06 - 01:28:11]: So that's my conclusion.
**Konsti | matchicalcom** [01:28:13 - 01:28:15]: Good, I totally agree with this one.
**Konsti | matchicalcom** [01:28:15 - 01:28:24]: It's like yesterday Tommy and I talked Carlos and for me it was completely kind of intangible like I don't know, like shit I just know the problems.
**Konsti | matchicalcom** [01:28:24 - 01:28:25]: I don't have any ideas.
**Konsti | matchicalcom** [01:28:25 - 01:28:28]: Like now I think there's a path and it's actually quite fast.
**Konsti | matchicalcom** [01:28:28 - 01:28:30]: How are we going to go to.
**Carlos | matchicalcom** [01:28:30 - 01:28:37]: What do you think Carlos to process those prompt parts?
**Carlos | matchicalcom** [01:28:37 - 01:28:40]: I'm always curious to see how accurate we can just make it.
**Carlos | matchicalcom** [01:28:41 - 01:28:43]: The rest is just math and algorithms.
**Carlos | matchicalcom** [01:28:43 - 01:28:50]: So it doesn't seem that complicated once we process one hundred or one thousand CV's.
**Carlos | matchicalcom** [01:28:50 - 01:29:12]: Probably everyone will prove me wrong because it's just the data will get messy, but I think the risk here probably this have a lot of different technologies and this is always a challenge sometimes to integrate in a speed manner and the time that maybe we can start simplifying and just layer some vectorial search afterwards or so.
**Carlos | matchicalcom** [01:29:12 - 01:29:15]: Just start layering different technologies as we need.
**Carlos | matchicalcom** [01:29:16 - 01:29:24]: Let's for now keep it ODC with SQL, The Graphs in Neo Four J and the Prompts.
**Konsti | matchicalcom** [01:29:24 - 01:29:27]: Those are the three things let's start with this one.
**Carlos | matchicalcom** [01:29:29 - 01:29:38]: Let's in a week or two have a running process that classifies and then we improve quality.
**Konsti | matchicalcom** [01:29:39 - 01:29:43]: My proposition would be like Carlos you are still working on the library, right?
**Konsti | matchicalcom** [01:29:44 - 01:29:48]: And here nothing changed like we know this technology and every single check.
**Konsti | matchicalcom** [01:29:48 - 01:30:06]: So it's definitely the right invested time what I will do like today the rest of the day I mainly booked with meetings, but I will try maybe even this evening or tomorrow in morning finish the open things that we can talk about these.
**Konsti | matchicalcom** [01:30:07 - 01:30:14]: Then we have all the big question marks came up and then we then we can start a little bit refining and make it a little bit more actionable.
**Konsti | matchicalcom** [01:30:14 - 01:30:31]: Like how do we actually implement this and so on Carlos at that point we definitely need to also invite you to our notion that we where we try to maintain something like a backlog, but yeah, that we have something together make it way more tangible and make it way more actionable.
**Konsti | matchicalcom** [01:30:31 - 01:30:56]: I think the goal for this week should be like okay, we have progress with the library, we have our concept on a high level that we know OK let's try to implement this and then play around with it and then next week I can really go deep in starting already working on those prompts and you can start working on this work from the technical implementation and maybe you can also join forces here.
**Tommy | matchicalcom** [01:30:57 - 01:31:03]: Next week we are in so we will meet us in person.
**Tommy | matchicalcom** [01:31:03 - 01:31:04]: I'm looking forward.
**Carlos | matchicalcom** [01:31:05 - 01:31:08]: Bring your laptops and let's build this together.
**Carlos | matchicalcom** [01:31:08 - 01:31:12]: Yeah, for sure just go for a few drinks.
**Carlos | matchicalcom** [01:31:17 - 01:31:18]: Yeah, yeah.
**Carlos | matchicalcom** [01:31:18 - 01:31:23]: Next week, I don't think next week will be the most productive that we'll have, but we'll figure it out.
**Tommy | matchicalcom** [01:31:23 - 01:31:27]: Yeah, sometimes, but but conceal, yeah, to.
**Konsti | matchicalcom** [01:31:27 - 01:31:28]: Wrap it up, really?
**Tommy | matchicalcom** [01:31:30 - 01:31:31]: Yeah, yeah, yeah, yeah.
**Konsti | matchicalcom** [01:31:31 - 01:31:32]: That's great.
**Tommy | matchicalcom** [01:31:32 - 01:31:33]: That's great, really?
**Konsti | matchicalcom** [01:31:33 - 01:31:33]: That's great.
**Tommy | matchicalcom** [01:31:34 - 01:31:35]: It's promising.
**Tommy | matchicalcom** [01:31:35 - 01:31:36]: It's promising.
**Tommy | matchicalcom** [01:31:36 - 01:31:45]: And Carlos, we don't have to make one hundred percent mathematical correct results.
**Tommy | matchicalcom** [01:31:46 - 01:31:56]: It's really about to bring so much unstructured data to life and that's something we can really do in a very, very valid way.
**Tommy | matchicalcom** [01:31:56 - 01:31:57]: And that is, that's some kind.
**Carlos | matchicalcom** [01:31:58 - 01:32:06]: The only last comment I think we will have some quality control or something that we should run frequently.
**Carlos | matchicalcom** [01:32:07 - 01:32:08]: You guys know the business.
**Carlos | matchicalcom** [01:32:08 - 01:32:11]: Let's go directly to the graph and see the data.
**Carlos | matchicalcom** [01:32:11 - 01:32:12]: Let's go.
**Carlos | matchicalcom** [01:32:12 - 01:32:16]: Let's export that into some kind of approach or sample testing.
**Carlos | matchicalcom** [01:32:16 - 01:32:20]: We need to control quality control it automatically or.
**Konsti | matchicalcom** [01:32:22 - 01:32:27]: Open points like how do we QA, governance, maintenance and so on upon this.
**Konsti | matchicalcom** [01:32:27 - 01:32:29]: That's definitely very important.
**Konsti | matchicalcom** [01:32:29 - 01:32:31]: Good that you bring it up, yeah.
**Konsti | matchicalcom** [01:32:31 - 01:32:39]: But as to mentioned, if we nail this, we have a huge asset that probably no one in our niche will ever try.
**Carlos | matchicalcom** [01:32:39 - 01:32:43]: Didn't understood the if we nailed it.
**Konsti | matchicalcom** [01:32:43 - 01:32:50]: When we nailed, will happen, we'll do it after we made this.
**Carlos | matchicalcom** [01:32:52 - 01:32:53]: Next month.
**Tommy | matchicalcom** [01:32:56 - 01:32:57]: Guys.
**Tommy | matchicalcom** [01:32:57 - 01:33:01]: Just my last really rough estimation.
**Tommy | matchicalcom** [01:33:02 - 01:33:09]: Do you think we can make it happen in the next four to six weeks?
**Konsti | matchicalcom** [01:33:10 - 01:33:11]: I think three weeks.
**Konsti | matchicalcom** [01:33:12 - 01:33:12]: Is this.
**Konsti | matchicalcom** [01:33:12 - 01:33:13]: Is this possible?
**Carlos | matchicalcom** [01:33:13 - 01:33:14]: I'm on board.
**Carlos | matchicalcom** [01:33:14 - 01:33:15]: I'm on board.
**Carlos | matchicalcom** [01:33:15 - 01:33:18]: I would just not try to nail costly.
**Carlos | matchicalcom** [01:33:18 - 01:33:21]: But if you can do the prompts, the rest it's just easy.
**Carlos | matchicalcom** [01:33:22 - 01:33:23]: No, it's possible.
**Carlos | matchicalcom** [01:33:23 - 01:33:31]: It's possible to because we can have this running a lot of code like CV parsing.
**Carlos | matchicalcom** [01:33:31 - 01:33:32]: It's done right.
**Carlos | matchicalcom** [01:33:32 - 01:33:34]: So extracting you might adjust the prompt.
**Carlos | matchicalcom** [01:33:34 - 01:33:38]: But the technical parts are the new technical part that we are bringing.
**Carlos | matchicalcom** [01:33:38 - 01:33:44]: It's the neo four J and the library this week will be the initial one will be run.
**Carlos | matchicalcom** [01:33:44 - 01:33:56]: Next week will be probably a few performance ticks, a few updates, but it will be done so that's just use the pieces the right way, so the technical part I think we are close.
**Konsti | matchicalcom** [01:33:57 - 01:33:58]: Okay, perfect.
**Konsti | matchicalcom** [01:33:58 - 01:33:59]: Very nice, Yeah.
**Konsti | matchicalcom** [01:33:59 - 01:34:00]: I agree on this one.
**Konsti | matchicalcom** [01:34:00 - 01:34:08]: I can definitely like, depending on the but I can finish the prompts within the next one and a half weeks.
**Konsti | matchicalcom** [01:34:08 - 01:34:14]: Or let's say in the next two weeks, considering that we are one week off or mostly off.
**Konsti | matchicalcom** [01:34:14 - 01:34:17]: But yeah, very nice, very productive session.
**Konsti | matchicalcom** [01:34:17 - 01:34:20]: I would say, guys, was a pleasure as always.
**Tommy | matchicalcom** [01:34:20 - 01:34:22]: Thank you, Kanci for your preparation.
**Tommy | matchicalcom** [01:34:25 - 01:34:27]: I go back to my sharepoint.
**Konsti | matchicalcom** [01:34:27 - 01:34:29]: I prepared just quickly.
**Konsti | matchicalcom** [01:34:29 - 01:34:37]: It's this kind of visualization I never, never we detected, but if someone is interested in, I can share, no, thank you.
**Konsti | matchicalcom** [01:34:38 - 01:34:40]: It goes in the right direction actually.
**Konsti | matchicalcom** [01:34:40 - 01:34:43]: And it's not as undeasing.
**Konsti | matchicalcom** [01:34:43 - 01:34:47]: But I will try to have a visualization at the very end when we have something settled.
**Konsti | matchicalcom** [01:34:49 - 01:34:50]: Have a good lunch.
**Tommy | matchicalcom** [01:34:51 - 01:34:52]: See you guys.
**Tommy | matchicalcom** [01:34:53 - 01:34:54]: Meal meat.
**Tommy | matchicalcom** [01:34:56 - 01:34:57]: See ya, guys.
