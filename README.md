# HadzaMarketIntegration

This is a reposity for the paper 'Market integration in a transitional hunter-gatherer population benefits men, not women'

J. Colette Berbesque and Kara C. Hoover

Market integration in a transitional hunter-gatherer population benefits men, not women
Economic and subsistence transitions create wealth and health disparity. Sometimes transitions benefit one sex (usually male) or disadvantage the other (usually female). Hunter-gatherer societies with social hierarchies beyond a gender-based division of labor follow this pattern when groups make the transition from hunting-gathering to market economies. We applied non-invasive methods for assessing health during early childhood (ages 1-5) and found men’s health improves in response to market integration and women’s does not change. The health biomarker used is linear enamel hypoplasias, specifically the presence of missing enamel in permanent teeth which indicate stress during growth and development. We used a time series analysis (date of birth) relative to the frequency of teeth having a hypoplastic marker to test whether gender-based health differences occurred over time. Starting about 40 years ago, younger generations of Hadza men experienced less childhood stress than women and older generations. The transition to a market economy in bush-living Hadza has benefitted men’s health, but not women’s health. The broader implications are that the sex-based division of labor in hunting-gatherer societies is exacerbated by external forces favouring males over females.


RScript0: included for transparency in data transformation taking place with initial dataset that contains personal identifying information (and is not shared). Produces 1-data-hadza.stripped.csv

RScript1: contains code for cleaning data (tidy names, recoding scores from numbers to strings to be used as factors, creating analytical variables, trimming to final dataset). Uses 1-data-hadza.stripped.csv and produces 2-data-hadza.cleaned.csv

RScript2: contains code for testing against normal distribution, generating descriptive statistics. Uses 2-data-hadza.cleaned.csv 

RScript3: contains code for plots and analysis. Uses 2-data-hadza.cleaned.csv 
