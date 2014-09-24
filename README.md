UN-MyWorld-Project
==================

UN MyWorld Priorities - DataViz Project @ Columbia

Background: The UN created a global survey of citizens' priority issues to be incorporated in the next wave of UN Millenium Goals. Any online or ballot voter can choose the six priorities that they feel will most affect their family in the next 15 years. Currently the survey has over 1 million responses and counting. Check out the site: My World While the site has a few cool visualization, the analysis is very basic. The team at the UN was particularly interested in dissecting 'Honest and Responsible Government' (which was surprisingly high) to uncover connections with the UN corruption index.

Team Members: Erin McMahon (ecm2113@columbia.edu) Priya Venkat (gv2227@columbia.edu, priyavenkat225@gmail.com)

Project Outline: Our current plan is to uncover what economic, social, political, and environmental factors affect the percentage of citzens that choose a particular item as a priority for the future. One example is the corruption index: how much does corruption in a country influence how important people feel this is? or is there a tipping point for access to clean water, for example?

After looking closely through the various indicators, we found that the project will be most impactful if we center it around three questions:

1) What indicators and/or indicator clusters are most impactful and for which of the 16 priorities?
	Elastic net regression on 16 priorities to determine the impact of various indicators and how they group together. (In elastic net, indicators with similar betas are correlated.)

2) What are linkages between/among both the indicators and priorities and how can we show this most clearly?
	PCA including both the priorities and indicators to get a sense of how these link together.

3) Working backwards, can we rank the indicators to show which metrics specific countries should prioritize?
	We haven't done this yet. Hope to do this data analysis in the future.

###Final Visualization
We created a D3 visualization based inspired by the chord diagram at [d3js.org](http://www.d3js.org)

[Here is our graphic](http://bl.ocks.org/gnanapriyav/ab18aea53a5d8901a597)

The circle is split into two parts. The first part (representing 16 priority goals of [unMyworld.org](www.unmyworld.org) represents 25% of the circumference and the impacted indicators represent the rest of the circumference. You can notice that onmouseover each of the priority, corresponding impacted indicators are highlighted.

