# Skills (Clone)

**Konsti | matchicalcom** [00:01 - 00:17]: Easy, easy, OK, give me a second perfect, okay?
**Konsti | matchicalcom** [00:17 - 00:21]: So what is your idea?
**Konsti | matchicalcom** [00:21 - 00:22]: Or what is your question?
**Konsti | matchicalcom** [00:22 - 00:25]: Mark, let's say yeah, yeah, I was.
**Carlos | matchicalcom** [00:25 - 00:29]: Not being within one hundred percent within all the flow.
**Carlos | matchicalcom** [00:30 - 00:50]: Let me just ask if this will work, So in this case where you're trying to define or find the concept of a specific skill that you are trying to do, I'm guessing that the LLM will get the name of the skill concept, right?
**Carlos | matchicalcom** [00:53 - 01:03]: So instead of thing if you are, if already exists a similar concept, you could ask the LLM please define at a high level.
**Carlos | matchicalcom** [01:03 - 01:08]: What would be this concept for this, for this string, for this skill.
**Konsti | matchicalcom** [01:11 - 01:27]: Interesting in this case, But in this case we kind of need would need to rely on interesting, very, very interesting thought, But in this case we need to rely on that.
**Konsti | matchicalcom** [01:27 - 01:34]: The LLM is always outputting constantly the same kind of skill concept names, right?
**Carlos | matchicalcom** [01:38 - 01:49]: Because if you could get there what I would do, I don't have it right now, because the action that I have created to create skills in graph, it expects you to send me the concept ID.
**Carlos | matchicalcom** [01:49 - 01:51]: But I could change this to just.
**Konsti | matchicalcom** [01:51 - 02:00]: To receive the example that I've showed you because there's a big let's take JavaScript versus JS, right?
**Carlos | matchicalcom** [02:03 - 02:04]: They are the same concept.
**Konsti | matchicalcom** [02:05 - 02:11]: Some would say JS is the official name, otherwise other ones would clearly state JavaScript is your official.
**Konsti | matchicalcom** [02:11 - 02:14]: Name kind of yeah, I don't care.
**Carlos | matchicalcom** [02:14 - 02:17]: Both would be connected to the same concept when it's primarily.
**Konsti | matchicalcom** [02:21 - 02:28]: Now imagine, we are requesting from the LLM, okay, we have something requested here that's called JS.
**Konsti | matchicalcom** [02:29 - 02:34]: What is the skill concept of JS And then the LLM response that's actually a skill concept.
**Konsti | matchicalcom** [02:34 - 02:37]: JS is the skill concept of JS, because it's JS, right?
**Konsti | matchicalcom** [02:40 - 02:46]: And in another workflow that's running in parallel, I would ask for JavaScript and it States the scale concept is JavaScript.
**Konsti | matchicalcom** [02:47 - 02:49]: So we would end up with no.
**Carlos | matchicalcom** [02:49 - 02:56]: Because I would say in this case don't forget the skill concept will have the different names in the way that you are describing.
**Carlos | matchicalcom** [02:56 - 02:59]: I would always add it to the same concept, right?
**Konsti | matchicalcom** [02:59 - 03:09]: But the LLM like, if we don't pass to the LLM, these are skill concepts that we already have, The LLM cannot do a lookup.
**Konsti | matchicalcom** [03:09 - 03:10]: Ah, you already have js.
**Konsti | matchicalcom** [03:10 - 03:12]: Our JavaScript belongs to js, right?
**Carlos | matchicalcom** [03:13 - 03:17]: But if we have all the alliances, I wouldn't care which alliances they would.
**Carlos | matchicalcom** [03:17 - 03:19]: It will return.
**Carlos | matchicalcom** [03:21 - 03:22]: See where I'm going.
**Konsti | matchicalcom** [03:24 - 03:26]: If we have all the alliances you would.
**Carlos | matchicalcom** [03:28 - 03:34]: If we have multiple alliance already so searching by the primary name or any other would make it part of the same concept.
**Konsti | matchicalcom** [03:35 - 03:52]: Yeah, yeah, yeah, yeah, this would be easy, this would be easy, but the question is like the issue still remains the same, right?
**Konsti | matchicalcom** [03:52 - 03:54]: So what is the idea of my workflow?
**Konsti | matchicalcom** [03:54 - 03:59]: The idea of my workflow is OK, we have something new requested.
**Konsti | matchicalcom** [03:59 - 04:15]: First we do check is it did we already have it in the graph, in the normalization dict, in the relevance registry and so on now we have already suppressed it and we know, okay, this one is something that we do not have as a full text match kind of so we.
**Konsti | matchicalcom** [04:15 - 04:23]: Need to classify it and so the first step of the classification would be are the skill concepts that we already.
**Konsti | matchicalcom** [04:23 - 04:37]: Have that are similar to what is requested based on our indexed like full text search retrieval with this kind of ranking right and the embeddings retrieval with another kind of ranking right.
**Konsti | matchicalcom** [04:37 - 04:51]: So these are potential candidates for maybe this could be just a term beneath one of these candidates and then the LLM response Ah yeah, this is react hooks, that's just a term beneath the candidate that you already have.
**Konsti | matchicalcom** [04:51 - 04:56]: The candidate is react right Can you do?
**Carlos | matchicalcom** [04:56 - 04:57]: Is it possible?
**Carlos | matchicalcom** [04:58 - 05:00]: Not special in LLMs?
**Carlos | matchicalcom** [05:00 - 05:01]: Is it possible?
**Carlos | matchicalcom** [05:02 - 05:13]: Instead of giving it a list of possibilities, describe generically what's a concept and what's a skill and let it try to figure it out.
**Konsti | matchicalcom** [05:17 - 05:32]: That's the thing in theory, yes, but I think in practice it won't be so reliable because the LLM will one say it's JS and the other size will say it's JavaScript.
**Konsti | matchicalcom** [05:33 - 05:53]: We could even tell the LLM provide me some potential names and I check against all these names what we already have in the graph, but still don't think about these super concrete things like programming language just think about stuff like backlog management versus backlog refinement versus like la la.
**Konsti | matchicalcom** [05:53 - 06:06]: There are so many things where it's like we will have better results when we pass already something to the graph, where like We have our skill concepts already structured like.
**Konsti | matchicalcom** [06:06 - 06:06]: This.
**Konsti | matchicalcom** [06:06 - 06:07]: And these are the similar ones.
**Konsti | matchicalcom** [06:07 - 06:13]: So the classification and the putting inserting into the graph.
**Konsti | matchicalcom** [06:13 - 06:16]: Will work the least when we have zero skills.
**Konsti | matchicalcom** [06:17 - 06:21]: Because then it's not I can build up on stuff, you know, so it will get better.
**Konsti | matchicalcom** [06:21 - 06:25]: The more we have with what you described.
**Konsti | matchicalcom** [06:26 - 06:35]: We were one hundred percent rely on what the LLM is outputting would need to kind of full text match to what we.
**Konsti | matchicalcom** [06:35 - 06:36]: Already have.
**Carlos | matchicalcom** [06:38 - 06:43]: And since we would have a lot of different options as the graph graphs all the different.
**Carlos | matchicalcom** [06:43 - 06:52]: Typings and the typos itself, we won't have it, because that would come on the resolution map and normalization and all that we talk about technology names.
**Carlos | matchicalcom** [06:53 - 06:56]: This is the example with a little bit of time.
**Carlos | matchicalcom** [06:56 - 06:58]: We should have pretty much most of them.
**Konsti | matchicalcom** [06:59 - 07:02]: There are so many, I know, but.
**Carlos | matchicalcom** [07:02 - 07:13]: They will keep evolving, but at least try to bring the skill, the concept itself to a higher level, to not be one of the nitty grid smaller ones.
**Konsti | matchicalcom** [07:20 - 07:21]: Sorry.
**Carlos | matchicalcom** [07:21 - 07:23]: Because I would say that would be something.
**Konsti | matchicalcom** [07:24 - 07:40]: We could basically use the best approach of those ideas, because yeah, your idea is when the LLM tells me it's a skill concept, no matter the retrieval or what I pass in initially, I will just add it as a skill concept, except I will already have that name, right?
**Carlos | matchicalcom** [07:42 - 07:49]: If you already have that name, it wouldn't be, we would have to probably associate it just as a skill instead of a concept.
**Konsti | matchicalcom** [07:49 - 07:50]: Yeah, yeah.
**Carlos | matchicalcom** [07:50 - 07:54]: So if you already have it, if we don't have it, we created skill.
**Konsti | matchicalcom** [07:56 - 08:00]: Yeah, right, My idea is the following.
**Konsti | matchicalcom** [08:00 - 08:09]: We can still do the retrieval based classification, because I think it will just perform much better if we provide the LLM.
**Konsti | matchicalcom** [08:10 - 08:29]: These are potential candidates already where you can put stuff in, but what we could do and with this we could really prevent that two things are added similarly is basically that we tell the LLM OK next to next to the name where you say put it.
**Konsti | matchicalcom** [08:29 - 08:34]: There provide me a few alternative names, so that I can check.
**Carlos | matchicalcom** [08:38 - 08:49]: If we have it as a skill or as a concept, or yeah, because all the concepts are related to skills and the levels are on the skills, if we have it already as a skill.
**Konsti | matchicalcom** [08:52 - 08:56]: As a skill concept, right as a skill.
**Carlos | matchicalcom** [08:57 - 09:00]: So skill concept is just aggregation of.
**Konsti | matchicalcom** [09:00 - 09:03]: Different labels, so yeah, yeah, yeah.
**Konsti | matchicalcom** [09:03 - 09:17]: But like the only thing I'm worrying about, I don't care if we have too many I don't care so much about the skills ich skill concepts there we need to be very precise, right.
**Carlos | matchicalcom** [09:20 - 09:20]: Right?
**Carlos | matchicalcom** [09:20 - 09:25]: But I was saying that, so the skills concept just groups different set of levels.
**Carlos | matchicalcom** [09:25 - 09:28]: We've created a school concept, just one.
**Konsti | matchicalcom** [09:28 - 09:30]: Kind of primary name, it's a primary.
**Carlos | matchicalcom** [09:30 - 09:35]: Yeah, Just that, but searching the primary or all the others for me would be the same.
**Carlos | matchicalcom** [09:35 - 09:36]: It makes part of that group.
**Carlos | matchicalcom** [09:40 - 09:50]: So with the idea that you just provide me some alternative names, I would say that we search any of them and we associated the skill to the first one, something like that.
**Konsti | matchicalcom** [09:55 - 09:57]: The workflow that you describe is basically okay.
**Konsti | matchicalcom** [09:57 - 09:59]: After we did the initial thing that we already have.
**Konsti | matchicalcom** [10:00 - 10:08]: It's like, okay, just tell me it's a skill concept or not if it is a skill concept or what would.
**Carlos | matchicalcom** [10:08 - 10:10]: Be the skill concept that describes this.
**Carlos | matchicalcom** [10:10 - 10:11]: Skill?
**Konsti | matchicalcom** [10:11 - 10:13]: Yeah, Just what would be the skill concept?
**Konsti | matchicalcom** [10:13 - 10:18]: To describe the skill and give me some alternative names.
**Carlos | matchicalcom** [10:18 - 10:19]: I think that would be great.
**Konsti | matchicalcom** [10:20 - 10:22]: Give me some alternative names.
**Konsti | matchicalcom** [10:22 - 10:28]: This is basically like the alternative name thing is new, but the other one is, that's exactly what I'm trying to do.
**Konsti | matchicalcom** [10:29 - 10:36]: Let me know what is the skill concept of that thing?
**Konsti | matchicalcom** [10:36 - 10:37]: That is requested?
**Carlos | matchicalcom** [10:38 - 10:50]: I'm just trying to avoid to do some bias on the LLM by providing some concepts already just how effective it will be.
**Carlos | matchicalcom** [10:50 - 10:52]: I don't know why.
**Konsti | matchicalcom** [10:52 - 10:53]: Would you consider this as a bias?
**Carlos | matchicalcom** [10:54 - 10:58]: Because you are saying pick from this list if possible.
**Konsti | matchicalcom** [10:59 - 11:06]: Yes, but no, not really pick from this list if possible.
**Konsti | matchicalcom** [11:06 - 11:25]: It's more like the idea is to pass a list and not like pick from this list as possible, but more like really analyze the situation and like I think why the list helps.
**Konsti | matchicalcom** [11:25 - 11:36]: I think we have no bias issue, because the problems nowadays are good enough with the reasoning and everything that when you state them clearly, they don't get biased basically.
**Konsti | matchicalcom** [11:36 - 11:43]: So what I tell The prompt currently is to choose between, or what is the idea basically?
**Konsti | matchicalcom** [11:43 - 11:52]: To choose between one of three scenarios and these three scenarios are basically so basically something is requested.
**Konsti | matchicalcom** [11:52 - 11:55]: Yeah, And then he needs to output the following.
**Konsti | matchicalcom** [11:55 - 11:57]: Okay, what's your decision?
**Konsti | matchicalcom** [11:57 - 12:01]: Choose one of three scenarios and there are these three scenarios.
**Konsti | matchicalcom** [12:02 - 12:13]: One scenario could be, it's an alias kind of a skill of an existing concept, right in this case, it would need to output the target index candidate and the target concept name this one.
**Konsti | matchicalcom** [12:13 - 12:16]: It would match from the list that we provided as name.
**Konsti | matchicalcom** [12:16 - 12:28]: We would provide potential things to pick from and then it can do this decision so here we have this one would be the kind of bias decision, because it needs to decide, okay, which one is it?
**Konsti | matchicalcom** [12:28 - 12:33]: But the prompt where we clearly say that like don't get yourself biased.
**Konsti | matchicalcom** [12:33 - 12:37]: Like if you don't find anything, it's not like you need to find anything.
**Konsti | matchicalcom** [12:37 - 12:42]: If you think it's new concept primary, then tell me that it's a new concept primary.
**Konsti | matchicalcom** [12:42 - 12:46]: This basically means what is requested is new, We don't have it yet and it's the primary.
**Konsti | matchicalcom** [12:47 - 12:56]: Then we know the requested terminology, but it's alias it's not there currently.
**Konsti | matchicalcom** [12:56 - 13:04]: We do not have the concept yet, but it's not the official name of the concept, the official name of the concept has this name, that's basically what you are stating.
**Konsti | matchicalcom** [13:04 - 13:12]: So give me the name of the concept and just echo the requested alias.
**Carlos | matchicalcom** [13:19 - 13:33]: Okay, I'm just trying to understand because I don't think that we can do text search, full text search vector analysis, but there is always a possibility that you don't really pass the right concept there.
**Carlos | matchicalcom** [13:34 - 13:37]: So what I'm trying to challenge.
**Carlos | matchicalcom** [13:37 - 13:50]: Is it worth that additional step of providing a list with all the or with some details, knowing that we sometimes might even fail on and we need to handle it anyway afterwards?
**Konsti | matchicalcom** [13:50 - 13:50]: Thing is.
**Konsti | matchicalcom** [13:50 - 13:58]: The thing is when we pass, when we pass like I think about even like passing eighty skill concepts along with their.
**Konsti | matchicalcom** [13:58 - 13:59]: Parent and child.
**Konsti | matchicalcom** [13:59 - 14:04]: So we have like one hundred or even two hundred things that we pass through the LLM.
**Carlos | matchicalcom** [14:06 - 14:09]: Sorry, what do you mean by parent and child?
**Konsti | matchicalcom** [14:09 - 14:11]: By parent child maybe.
**Konsti | matchicalcom** [14:11 - 14:20]: Like JavaScript specializes in programming languages and Angular specializes.
**Carlos | matchicalcom** [14:21 - 14:23]: We don't have the specialized one yet.
**Konsti | matchicalcom** [14:23 - 14:27]: Okay, okay, yeah, so this up and down basically.
**Konsti | matchicalcom** [14:31 - 14:44]: And in this way we would pass quite a lot to the LLM, not too much that it's too hard, Like two hundred terminologies are not hard to handle for the LLM and it would have quite a good oversight.
**Konsti | matchicalcom** [14:44 - 14:53]: Ah yeah, so it would be manifestation like this would result in like no matter how good our prompt is, it will be just our prompt.
**Konsti | matchicalcom** [14:53 - 15:12]: But when we also pass through the prompt like okay, this is the concept that we already have, and when we always do QA on it, it's basically a self enforcement of the quality, like we make from time to time certain decisions to override certain actions and these decisions will be echoed by the by the stuff so the LLM can see.
**Konsti | matchicalcom** [15:12 - 15:50]: Ah yeah, these are concepts for you so a long list of examples basically and how they are attached to each other and so on, and this will definitely help in the decision making process I think, and the error rate, considering that we pass so many things is quite low, but what we could still do and then we have the best of both, Like if we say it's a new concept primary or it's an alias of a new concept, we could tell him don't give me just a new concept name, also give me some potential alternatives and then we can do a lookup for these alternatives to see.
**Carlos | matchicalcom** [15:50 - 15:50]: If we find them.
**Carlos | matchicalcom** [15:53 - 15:54]: OK.
**Konsti | matchicalcom** [15:57 - 16:01]: I'll probably say that's a very, very good idea.
**Carlos | matchicalcom** [16:01 - 16:12]: If we measure, I think we could measure how many times we found the alternatives after a while, that would probably be interesting metric to now one hundred percent.
**Konsti | matchicalcom** [16:12 - 16:15]: Actually, I think that's a super important thing that.
**Konsti | matchicalcom** [16:15 - 16:28]: We like, because whenever we see that we find an alternative, we know our retrieval was bad, but we pass in and then we need to check like why this happened.
**Konsti | matchicalcom** [16:30 - 16:31]: And that's actually the best.
**Konsti | matchicalcom** [16:32 - 16:38]: With this one we could basically prevent what I stated here like this issue.
**Konsti | matchicalcom** [16:39 - 16:52]: In this case won't probably happen here, because when JavaScript is classified, we add JavaScript, then JS gets classified and then we can make a lookup for JS.
**Konsti | matchicalcom** [16:55 - 17:02]: And like when JS will have As a synonym JavaScript and then we can make a lookup for JavaScript.
**Carlos | matchicalcom** [17:04 - 17:08]: Because in the way that I have the graph built duplicate names, it's impossible.
**Konsti | matchicalcom** [17:09 - 17:10]: That's very good.
**Carlos | matchicalcom** [17:11 - 17:12]: It can happen.
**Carlos | matchicalcom** [17:13 - 17:27]: I think Would be, I would say skill concepts misclassification, so you have similar concepts and by some reason they created two different ones instead of just merging them, that might happen.
**Carlos | matchicalcom** [17:27 - 17:36]: That's some kind of analysis that we can do afterwards, probably on a data quality kind of approach.
**Konsti | matchicalcom** [17:38 - 17:40]: What we need to think about is the following.
**Konsti | matchicalcom** [17:44 - 17:50]: When the first specification for example, let's say they almost triggered in parallel.
**Konsti | matchicalcom** [17:50 - 17:57]: When they trigger perfectly in parallel, then it will be still an issue, but there will be probably some delay, but.
**Carlos | matchicalcom** [17:57 - 17:59]: We are talking about milliseconds.
**Carlos | matchicalcom** [17:59 - 18:14]: Okay, that's the parallel we have to be precisely and the graph itself, when you try to write it, will override it because I'm using the merge functionality, so the skill name will be, it does not get created again.
**Konsti | matchicalcom** [18:16 - 18:42]: Okay, my only question is, when the decision is a new skill, so add JavaScript, then JavaScript will not immediately be added or what we or we could in this case, that's a good idea, we could add JavaScript immediately to the graph and then do the further classification of okay, what edges do we connect and what type is this?
**Carlos | matchicalcom** [18:44 - 18:48]: So you have the skill and at the same time you connect it to a skill concept.
**Carlos | matchicalcom** [18:48 - 18:52]: All the rest can be done outside, even in a different process.
**Carlos | matchicalcom** [18:53 - 18:58]: So how do you do all the rest of the connections, yeah, yeah, and.
**Konsti | matchicalcom** [18:58 - 19:09]: That'S good, because in this case we don't need to wait for any LLM as soon as the classifier response OK, JavaScript is a new skill and we add it to the graph immediately.
**Konsti | matchicalcom** [19:10 - 19:22]: Then even if the second classifier that runs in parallel finishes and says, ah, JS is a new skill concept, it could but also hear some alternatives and we would then already be able to look up JavaScript as an alternative.
**Konsti | matchicalcom** [19:22 - 19:30]: And then just kind of end this flow and reroute the resolution map entries to there to.
**Carlos | matchicalcom** [19:30 - 19:31]: The new one that was created.
**Konsti | matchicalcom** [19:42 - 19:42]: That's good.
**Carlos | matchicalcom** [19:47 - 19:57]: So for now you have, I think I need to change the action that I have currently to create the skill in the graph and you can start using it.
**Carlos | matchicalcom** [19:57 - 20:13]: I will change it to receive a list of skill names and the concept name instead of the concept ID, because that would require in additional query to the graph so that right?
**Konsti | matchicalcom** [20:13 - 20:17]: Basically the name of the skill that is attached to it that has the attribute primary.
**Carlos | matchicalcom** [20:18 - 20:25]: No, I'm searching every skill, not so.
**Carlos | matchicalcom** [20:25 - 20:26]: The Skill Concept.
**Carlos | matchicalcom** [20:26 - 20:27]: The Primary Name.
**Carlos | matchicalcom** [20:27 - 20:28]: Is that one.
**Carlos | matchicalcom** [20:28 - 20:37]: But when I search so to solve the problem, if you search JS, JavaScript or whatever, I search all the skills.
**Konsti | matchicalcom** [20:37 - 20:39]: They would need to search any skill.
**Konsti | matchicalcom** [20:39 - 20:40]: That's correct.
**Konsti | matchicalcom** [20:40 - 20:40]: That's good.
**Carlos | matchicalcom** [20:41 - 20:41]: I'm doing that.
**Carlos | matchicalcom** [20:41 - 20:52]: Okay, so, but just to make it easier on the code and I would just make one call to the graph that way it minimizes the parallel problem.
**Carlos | matchicalcom** [20:52 - 20:54]: You pass A Concept.
**Carlos | matchicalcom** [20:54 - 20:57]: This Skill Name of the Concept.
**Carlos | matchicalcom** [20:58 - 21:16]: And the list of skills that are to be associated to that concept and I will see if I can make it happen in one call to the graph just create the skill concept if it doesn't exist and add all the skills to minimize the back and forth.
**Carlos | matchicalcom** [21:16 - 21:20]: I have that in like two or different, two or three different calls right now.
**Carlos | matchicalcom** [21:20 - 21:23]: And in this case, if I can put everything in the same, I think.
**Konsti | matchicalcom** [21:23 - 21:34]: It would be better the alternative name this one is proposing here so we say what's the new concept name and what are potential alternatives right?
**Konsti | matchicalcom** [21:35 - 21:39]: So you would propose when we receive these alternatives.
**Konsti | matchicalcom** [21:39 - 21:41]: Also let's add them to the graph directly.
**Konsti | matchicalcom** [21:41 - 21:42]: Probably makes sense, right?
**Konsti | matchicalcom** [21:42 - 21:45]: Because we know that they belong to this one, right?
**Carlos | matchicalcom** [21:45 - 21:47]: We could add it as SQLs.
**Konsti | matchicalcom** [21:48 - 21:58]: Yeah, could if they don't exist if they don't exist, but actually, yeah, we could do this right?
**Konsti | matchicalcom** [21:58 - 21:59]: Why not?
**Konsti | matchicalcom** [21:59 - 22:00]: Nothing stands against.
**Carlos | matchicalcom** [22:02 - 22:08]: Just never happened to appear in the CV yet, but we are improving our graph.
**Carlos | matchicalcom** [22:08 - 22:10]: I wouldn't see it as a cool.
**Konsti | matchicalcom** [22:11 - 22:12]: All right.
**Konsti | matchicalcom** [22:13 - 22:18]: So, but okay, in this case, I think we have the best of both worlds, but maybe let me do one thing.
**Carlos | matchicalcom** [22:22 - 22:26]: I don't think there is any to start changing everything right now.
**Carlos | matchicalcom** [22:26 - 22:47]: Let's just I would adjust the action to receive a list of like of concepts, a list of possible concepts to search for the main concept and I will have to review the cipher previous a little bit, but I think it's possible.
**Konsti | matchicalcom** [22:47 - 26:08]: Yeah, give me one second I want to challenge one thing the following idea the idea okay, about this one, I'm super curious, honestly speaking like I basically ask him about.
**Konsti | matchicalcom** [26:10 - 26:16]: Like do you think the added grounding and context data.
**Konsti | matchicalcom** [26:17 - 26:18]: We add.
**Konsti | matchicalcom** [26:18 - 26:26]: By providing the retrieval is a benefit or is it a negative?
**Konsti | matchicalcom** [26:26 - 26:28]: Considering bias potential?
**Carlos | matchicalcom** [26:29 - 26:34]: OK, I was reviewing my note, did not forget one thing.
**Carlos | matchicalcom** [26:34 - 26:44]: We need always the category, because if we are going to add a new skill concept, we always need the category to be known.
**Konsti | matchicalcom** [27:03 - 27:07]: But this will be category.
**Carlos | matchicalcom** [27:07 - 27:12]: It has a least that's outside the easy classification because you have a list of eleven.
**Konsti | matchicalcom** [27:12 - 27:15]: Why is it like the problem with this one is?
**Konsti | matchicalcom** [27:17 - 27:25]: First there could be some names that really don't fit in any category, so I'm not sure if it makes sense to make it mandatory.
**Konsti | matchicalcom** [27:26 - 27:36]: And second is, I would like to retrieve the category classification in another workflow, just to not overload the job to be done for the classifier.
**Konsti | matchicalcom** [27:36 - 27:41]: So we would need to live with not having a category for the first.
**Carlos | matchicalcom** [27:43 - 27:50]: I need to adjust some things then, because in this case I'm making the category mandatory when you created the concept.
**Konsti | matchicalcom** [27:51 - 28:05]: Yeah, but I think we should not do this, because first there can be some cases and second like what I currently mentioned, OK, love this question whenever I read this.
**Konsti | matchicalcom** [28:05 - 28:06]: It's like, oh, shut up.
**Carlos | matchicalcom** [28:07 - 28:10]: They are just, yeah, you single.
**Konsti | matchicalcom** [28:10 - 28:28]: But this is exactly where closed book versus open book patterns matter so pure LLM no retrieval at all pros zero candidate bias from retrieval great at coining expanding to plausible canonical names.
**Konsti | matchicalcom** [28:28 - 28:40]: Oh my goodness, it crashed DRF django REST framework simplest to wire initially const duplicate risk is real.
**Konsti | matchicalcom** [28:41 - 28:48]: If the graph already has concept with different spells, synonym the model won't see it and will happily create new concept.
**Konsti | matchicalcom** [28:48 - 28:59]: JS hallucinated canonical it's rare, but the model can invent tidy sounding concept names.
**Konsti | matchicalcom** [28:59 - 29:04]: Yeah, this could also be an issue sometimes inconsistent over time different requests.
**Konsti | matchicalcom** [29:05 - 29:09]: May propose slightly different best names if not grounded.
**Konsti | matchicalcom** [29:09 - 29:28]: Increasing QA load strong duplicate prevention more stable decisions, lower QA burden, candidate bias overfitting, quality of K becomes critical dependency that's true.
**Konsti | matchicalcom** [29:30 - 29:35]: Bind hybrid, close book, that's what he recommends.
**Konsti | matchicalcom** [29:37 - 29:48]: Do both, yeah, basically do both like what you propose the alternative names just providing them as an extra checkpoint, right?
**Konsti | matchicalcom** [29:48 - 30:04]: Avoids new concept inflation without blinding the model scales with your graph discovery still happens when it should lower qa costs better taxonomy incoherence in the hybrid biases because the first decision.
**Konsti | matchicalcom** [30:04 - 30:09]: C One A is blind retrieval is used only as a sanity check.
**Carlos | matchicalcom** [30:11 - 30:11]: And.
**Konsti | matchicalcom** [30:11 - 30:13]: The collision catcher not the source.
**Konsti | matchicalcom** [30:13 - 30:14]: Of truth.
**Konsti | matchicalcom** [30:14 - 30:16]: That's true, like the way I structure the prompt.
**Konsti | matchicalcom** [30:16 - 30:20]: And nowadays before you could not do this because models were not reasoning.
**Konsti | matchicalcom** [30:21 - 30:33]: But now when you say OK, before you even look at the like it will always look at these things, there will be some bias for sure, but it's getting so less error prone due to the reasoning.
**Konsti | matchicalcom** [30:34 - 30:48]: And when we tell you can really ignore the input as long as as long as you do not find the concept, then I think it helps concrete hybrid prototype alternative canonical names.
**Konsti | matchicalcom** [30:48 - 31:13]: Yeah, but that's a brilliant idea, Carlos Very good that you brought that up, because this will prevent so much headache for us.
**Carlos | matchicalcom** [31:15 - 31:17]: I think the thing that would be missing is.
**Carlos | matchicalcom** [31:17 - 31:25]: How do you want to search the graph by similar concepts or by the so how are we getting that data?
**Carlos | matchicalcom** [31:25 - 31:31]: We don't need the decision right now and we need also to see what neo-four J allows because I.
**Carlos | matchicalcom** [31:31 - 31:32]: Think they have something related to vectors.
**Carlos | matchicalcom** [31:32 - 31:36]: Also not sure if we should start there maybe it's a little bit too.
**Konsti | matchicalcom** [31:36 - 31:38]: Complex similar concept in retrieval.
**Konsti | matchicalcom** [31:40 - 31:52]: I think I can already tell you like this is basically like the process is pretty straightforward so I would like to do two different kinds of retrieval.
**Konsti | matchicalcom** [31:52 - 32:15]: One is basically just a full text search, so here it's this one, here the lexical path basically so they have it under out of the box there's BM twenty five, that's matching algorithm for blah blah blah.
**Carlos | matchicalcom** [32:16 - 32:20]: I've just seen a few of those things sometimes on the cloud version that we are using.
**Carlos | matchicalcom** [32:20 - 32:26]: Not sure if that one specific, but there are some things that new four J allows that on the cloud version hosted that we have.
**Carlos | matchicalcom** [32:26 - 32:27]: That's not available.
**Carlos | matchicalcom** [32:27 - 32:29]: So I would love to search these ones.
**Konsti | matchicalcom** [32:29 - 32:31]: This one is super common, this one.
**Carlos | matchicalcom** [32:31 - 32:33]: Is super common, okay, cool.
**Konsti | matchicalcom** [32:33 - 32:48]: And this one as well, so this one is basically whenever we store a new skill, we need to embed like vectorize the name that we can also do an embedding search and then we have like this two different kinds of search.
**Konsti | matchicalcom** [32:48 - 32:56]: First lexica pass with this algorithm and then second we do the vector search and then we basically combine both.
**Konsti | matchicalcom** [32:57 - 33:11]: We combine like we first do here like we first do the full text search, then we do the semantic search with the embeddings and then we deduplicate basically because we will probably get same results from both.
**Konsti | matchicalcom** [33:12 - 33:17]: If we look for top one hundred lexical and top one hundred semantic, it will probably be there a huge overlap.
**Konsti | matchicalcom** [33:19 - 33:24]: So the idea is then let's deduplicate the retrieve skill concepts, that's what I need here from your side.
**Konsti | matchicalcom** [33:25 - 33:31]: Deduplicate the retrieved skill concepts, pick the top eighty distinct skill concepts by score.
**Konsti | matchicalcom** [33:32 - 33:44]: Retrieve the direct child and parents so from all skills concepts that we now have in our final list, I want you to fetch the direct skill parents and the direct childs with cap to ten.
**Konsti | matchicalcom** [33:44 - 33:50]: So if something has like ten or let's say if something has fifteen child, because it's a very broad skill.
**Carlos | matchicalcom** [33:52 - 33:55]: We don't have the at least on the example that they've created.
**Carlos | matchicalcom** [33:55 - 34:00]: We don't have those parent and child relations yet this one.
**Konsti | matchicalcom** [34:00 - 34:07]: We still need this specializes in this is super important that we have this upwards layer and downwards layer.
**Carlos | matchicalcom** [34:09 - 34:13]: If you have the LLM part working at this.
**Carlos | matchicalcom** [34:13 - 34:15]: Point, can you create some examples.
**Carlos | matchicalcom** [34:15 - 34:21]: Would be cool to have like one hundred or a thousand skills with all those relations.
**Konsti | matchicalcom** [34:22 - 34:33]: This one you can already use, because probably until I have it fully running will take a little time, but you can already use it by in our current skills.
**Konsti | matchicalcom** [34:35 - 34:45]: If you look at for example, JavaScript will probably take a while.
**Konsti | matchicalcom** [34:56 - 34:57]: I should do this name.
**Konsti | matchicalcom** [34:57 - 35:00]: I said the search based on canonically.
**Carlos | matchicalcom** [35:04 - 35:15]: Because the graph that we have currently it's very very simple and I created manually pretty much all the steps and we need to just load it with a bit more information.
**Carlos | matchicalcom** [35:16 - 35:17]: So we can start.
**Konsti | matchicalcom** [35:18 - 35:19]: Oh, this is very bad.
**Carlos | matchicalcom** [35:20 - 35:21]: Testing these queries.
**Konsti | matchicalcom** [35:23 - 35:24]: We don't have.
**Konsti | matchicalcom** [35:28 - 35:29]: This is a prop right.
**Carlos | matchicalcom** [35:30 - 35:33]: It just searched it here.
**Konsti | matchicalcom** [35:33 - 35:36]: JavaScript is JavaScript.
**Konsti | matchicalcom** [35:39 - 35:55]: JavaScript, okay, give me a second here we have Java, so we have A duplicate of JavaScript.
**Konsti | matchicalcom** [36:03 - 36:04]: Well, that's very bad.
**Carlos | matchicalcom** [36:05 - 36:06]: Give me just one second.
**Konsti | matchicalcom** [36:37 - 36:38]: Oh my god.
**Carlos | matchicalcom** [38:21 - 38:37]: I'm back looking.
**Konsti | matchicalcom** [39:03 - 39:05]: I'm just generating you some dummy data.
**Konsti | matchicalcom** [39:05 - 39:06]: I think that's easiest way.
**Carlos | matchicalcom** [39:11 - 39:20]: Okay, okay, OK, If you can just in a JSON or a spreadsheet or something, so I can load the graph.
**Carlos | matchicalcom** [39:21 - 39:26]: I can load the graph at least have that as a testing one and maybe even create a second database.
**Carlos | matchicalcom** [39:26 - 39:31]: So we have a testing database in like a more one that you can use or something like that.
**Carlos | matchicalcom** [39:31 - 39:38]: But so I can load, if I load that it should be easy to start.
**Konsti | matchicalcom** [39:40 - 39:41]: Give me a second.
**Konsti | matchicalcom** [39:44 - 43:19]: Hi Michael, OK, sorry.
**Konsti | matchicalcom** [43:19 - 43:25]: Login issues, so just to finish it up where have we been?
**Konsti | matchicalcom** [43:27 - 43:28]: What was the question?
**Konsti | matchicalcom** [43:30 - 43:31]: One question.
**Konsti | matchicalcom** [43:31 - 43:43]: Carlos, might this be possible that, because I had no issues with my browser, but then I went to magical in AI usage and I refreshed.
**Konsti | matchicalcom** [43:43 - 43:53]: And I have sometimes a feeling that when I'm opening magical that it's loading my cache or whatever so busy that my browser gets low.
**Konsti | matchicalcom** [43:53 - 43:56]: Is this possible or is this just made up in my head?
**Carlos | matchicalcom** [43:57 - 44:01]: The page might be heavy, but you don't have a lot of cache load.
**Carlos | matchicalcom** [44:01 - 44:06]: I don't see how would it affect the overall performance of the browser?
**Konsti | matchicalcom** [44:07 - 44:08]: Okay, easy.
**Konsti | matchicalcom** [44:08 - 44:10]: Then it's maybe just made up in my head.
**Konsti | matchicalcom** [44:10 - 44:10]: OK, good.
**Carlos | matchicalcom** [44:13 - 44:16]: But we are going to make magical run faster.
**Carlos | matchicalcom** [44:16 - 44:17]: So I was just I have a.
**Konsti | matchicalcom** [44:18 - 44:20]: I wanted to send you the JSON right?
**Carlos | matchicalcom** [44:21 - 44:25]: Yeah, some JSON or something with some examples and the relations.
**Carlos | matchicalcom** [44:25 - 44:30]: The lions of and dispensary alliances.
**Carlos | matchicalcom** [44:32 - 44:33]: Send me when you can.
**Carlos | matchicalcom** [44:33 - 44:34]: It's not a problem.
**Carlos | matchicalcom** [44:34 - 44:38]: I was just reading about the vector search in new four J.
**Carlos | matchicalcom** [44:38 - 44:52]: It is possible, but we would have to upgrade our nodes to at least four gigabytes of RAM and that will be around two hundred sixty euros per month instead of the sixty vector really?
**Carlos | matchicalcom** [44:52 - 45:00]: Yes, it was a two minute search on the way I was reading about vector search.
**Carlos | matchicalcom** [45:00 - 45:00]: I will send you the link.
**Carlos | matchicalcom** [45:01 - 45:05]: They have a minimum to do to use the vector part.
**Carlos | matchicalcom** [45:06 - 45:14]: I can show you why I started searching this I'm just going to share my screen.
**Carlos | matchicalcom** [45:14 - 45:22]: I was going to I was going here to see because I've seen this configuration.
**Carlos | matchicalcom** [45:22 - 45:26]: I'm not sure if it's easy to read CVactor optimize configuration.
**Carlos | matchicalcom** [45:26 - 45:29]: I was going to see how could I activate it?
**Carlos | matchicalcom** [45:29 - 45:31]: And they have this big warning here.
**Konsti | matchicalcom** [45:44 - 45:49]: From so it was so maybe maybe let's do the following for the beginning.
**Konsti | matchicalcom** [45:49 - 45:50]: We can just go with lexical.
**Konsti | matchicalcom** [45:50 - 45:52]: I don't think it will be much worse.
**Carlos | matchicalcom** [45:53 - 46:00]: No, don't forget that we are always talking about the lowercase and just a small name something like this.
**Carlos | matchicalcom** [46:00 - 46:06]: So we'll get some score with the lexico the BM it's this one full text search, right?
**Carlos | matchicalcom** [46:07 - 46:13]: And let's see how this works and how it compares to what we would expect.
**Konsti | matchicalcom** [46:14 - 46:15]: Perfect agree.
**Konsti | matchicalcom** [46:15 - 46:15]: Cool.
**Carlos | matchicalcom** [46:18 - 46:21]: So send me that JSON.
**Carlos | matchicalcom** [46:21 - 46:22]: I will figure out a way to load it.
**Konsti | matchicalcom** [46:24 - 46:30]: Maybe you need to ask it to generate something new because this looks kind of weird to me.
**Konsti | matchicalcom** [46:31 - 46:38]: OK, can I download it?
**Konsti | matchicalcom** [46:40 - 46:51]: Nah, it's just new JSON.
**Konsti | matchicalcom** [46:51 - 46:52]: Give me a second.
**Konsti | matchicalcom** [47:01 - 47:02]: This is so nasty.
**Carlos | matchicalcom** [47:04 - 47:05]: Do you have a lot of birds?
**Carlos | matchicalcom** [47:06 - 47:13]: Birds at your house just to hear them.
**Carlos | matchicalcom** [47:13 - 47:17]: It's not a problem, It just looks like you are in the middle of the forest.
**Konsti | matchicalcom** [47:19 - 47:21]: Yeah, currently they are, It's like they most of the day.
**Konsti | matchicalcom** [47:21 - 47:27]: They're pretty silent, but whenever they hear you talking, they want to talk with.
**Carlos | matchicalcom** [47:27 - 47:30]: Oh, with me, Of course do they speak Portuguese.
**Konsti | matchicalcom** [47:31 - 47:37]: Sure, of course I did send you the jace, but I don't know how helpful it will be.
**Konsti | matchicalcom** [47:39 - 47:39]: OK.
**Carlos | matchicalcom** [47:42 - 47:44]: I'll see if I can bootstrap it.
**Konsti | matchicalcom** [47:45 - 47:45]: Yeah, maybe.
**Konsti | matchicalcom** [47:45 - 47:50]: But the idea is basically like JavaScript.
**Carlos | matchicalcom** [47:54 - 47:55]: Or?
**Konsti | matchicalcom** [47:55 - 47:58]: Angular specializes in JavaScript, react specializes in JavaScript.
**Konsti | matchicalcom** [47:59 - 48:11]: So it's this connection like skill concepts how they are connected in the hero key and we have Angular to JavaScript, to programming languages, to software development.
**Konsti | matchicalcom** [48:11 - 48:13]: I don't know that's exactly.
**Carlos | matchicalcom** [48:14 - 48:18]: Yeah, the software development would be a category.
**Carlos | matchicalcom** [48:18 - 48:23]: I think it's on that list that initially provided the specialized one that is.
**Carlos | matchicalcom** [48:23 - 48:26]: The relation between skill concepts is the one.
**Carlos | matchicalcom** [48:26 - 48:27]: That I have not implemented yet.
**Carlos | matchicalcom** [48:28 - 48:29]: That's part of an example.
**Carlos | matchicalcom** [48:32 - 48:37]: But okay, I will create some examples to make the graph a little bit.
**Konsti | matchicalcom** [48:37 - 48:39]: More complex and I will work.
**Konsti | matchicalcom** [48:40 - 48:41]: Cool.
**Konsti | matchicalcom** [48:43 - 48:44]: See ya, we'll be talking.
**Carlos | matchicalcom** [48:44 - 48:45]: See you bye.
**Konsti | matchicalcom** [48:45 - 48:45]: Yeah, sure.
**Konsti | matchicalcom** [48:45 - 48:48]: Hit me up if I can help you with anything or you have new ideas.
**Konsti | matchicalcom** [48:49 - 48:50]: The idea was really good.
**Konsti | matchicalcom** [48:50 - 48:51]: Like I like it.
**Carlos | matchicalcom** [48:51 - 48:52]: We'll get there.
**Carlos | matchicalcom** [48:52 - 48:54]: Don't worry, let's go.
