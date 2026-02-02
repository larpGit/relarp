<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://www.larpwright.eu/assets/rl-logo_wh.png">
  <source media="(prefers-color-scheme: light)" srcset="https://www.larpwright.eu/assets/rl-logo_bl.png">
  <img align="right" alt="Larpwright Logo." src="https://www.larpwright.eu/assets/rl-logo_bl.png">
</picture>

# reLarp
[![en](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![de](https://img.shields.io/badge/lang-de-green.svg)](README.de.md)
[![ja](https://img.shields.io/badge/lang-ja-red.svg)](README.ja.md)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/larpgit/relarp?color=lightgrey&label=version&logo=github)](https://github.com/larpGit/relarp/releases/latest)

This tool can be used for the reflection phase after a [larp](https://nordiclarp.org/wiki/Larp) (live-action role-play) as a visualization and evaluation procedure (re-view, re-flection > reLarp). This mixed-method evaluation strategy was inspired by *Personal Attitude Construct (PAC) Analysis* originally developed by [NAITŌ Testuo](https://pacanalysis.jimdofree.com/) (in Japanese). "Used in various fields in Japan today, ranging from psychology, sociology, language education, to counselling, PAC analysis combines in-depth interviews with statistical clustering and visualisations to communicate individual experiences. Visualisation here refers to tree diagrams representing the connections between keywords the interviewees chose to describe their experiences. The visuality of the approach translates into its main advantage for learning purposes because it delivers a basis for the participant’s reflection and makes their reflection also communicable to others" (Kamm [2019](https://doi.org/10.1007/978-981-13-8039-6_36)). <br/>
As a highly structured debriefing strategy, we use a PAC analysis variant adjusted for larp experiences to assist with evaluating a larp's design and, more importantly, as a method to assist participants in the process of making sense of their experience and visualize their learning. <br/>
This shiny app now streamlines the process: Participants can individually input their impressions and are guided through the whole process. In the end, they can send all generated output (dendrograms, matrices) to the facilitator. <br/>
A usable test version is available at https://b-ok.shinyapps.io/reLarp/.<br/>
If you use the test version on shinyapps.io, please read the respective [data and privacy disclaimer](https://www.larpwright.eu/relarp/#data_privacy).

## Procedure Overview
**Step 1: Stimulating Instructions**<br/>
First, the participants receive stimulating instructions to start an individual interview or a group discussion. Our example edu-larp, *Village, Shelter, Comfort* ([Design Document](https://www.b-ok.de/vsc_larp/)) seeks to foster an engagement with a paradox dilemma, thus, we placed the experience of this dilemma in the focus of the reflections. Regardless of language, the instructions thus conformed to the following format (paraphrased):
> Please recall the experience of facing the dilemma in the three scenarios of Village, Shelter, Comfort. List words or short sentences that are meaningful to you in describing this experience. Think of as many words as possible and record them in the order that the words occurred to you.

**Step 2: Free Word Association**<br/>
Following these instructions, the participants input their word associations related to their experience of the dilemma of the larp.

**Step 3: Order of Importance**<br/>
The first words or images that occur to participants may not always be the most “important” in that the words or images are necessary to explain the recalled experience. Thus, in this step, the participants are requested to rearrange their inputs in order of importance.

**Step 4: Image/Evaluation**<br/>
For the purpose of the subsequent analysis, we also ask participants to evaluate the meaning of each item as positive (+), negative (-), or neutral (~).

**Step 5: Degree of Similarity**<br/>
In preparation for the subsequent discussion and analysis, the participants are asked to rate the items in pairs based on the degree of how close they are in connotative meanings on a 7-point scale (from 1, very close in meaning, to 7, very different in meaning). The participants would receive instructions, such as:
> Please rate the distance between each pair of the items you listed according to the 7 scale below. In so doing, evaluate how close they are in your image. Do not evaluate in terms of the accuracy of meaning in the dictionary.

**Step 6: Cluster Analysis**<br/>
Based on the matrix given in the previous step, we perform a hierarchical cluster analysis with Ward’s method on the similarity matrix to obtain a so-called dendrogram, a tree diagram to illustrate the arrangement of clusters. Cluster here refers to a number of items that are close in meaning and thus may build a set of relations. This relates to the meaningful structuring of information necessary for learning.
Although the analysis of the distance between items can be meaningful, the dendrogram in a PAC analysis is utilized to explore the structural meaning of the participants’ experience.

**Step 7: Dendrogram Interpretation**<br/>
In this important step, we ask the participants to explain the meaning of each cluster, the relationship between or among clusters, and also within clusters. Therefore, the participants are asked to elaborate on some of the items. Often the participants include the evaluations from step 4 in their explanations. This whole process is for exploring the participant’s overall image of the experience (the dilemma) concerned and helping them in their reflection. This step may, of course, include questions and comments by the larp organizers.

**Step 8: Cooperative Understanding**<br/>
Following from the above, organizers may share their interpretation of the dendrogram rather immediately with the participants or keep their thoughts until the end of the debriefing process. Important to note is that if interpretation happens in a dialogue, organizers should refrain from imposing their own interpretation on the participants or  “rail-roading” them to a desired conclusion. The goal is to share interpretations to receive some responses from the participants. This process requires cooperation and interaction between both parties.

For more details on the process and example analyses, see:<br/>
- Kamm, Björn-Ole. [2017](https://www.b-ok.de/download/Kamm_2017_TranslatingResearchIntoLarp.pdf). “Translating Research into Larp: Village, Shelter, Comfort.” In *LARP: Silberhochzeit. Aufsatzsammlung zum MittelPunkt 2017*, edited by Rafael Bienia and Gerke Schlickmann, 31–60. Braunschweig: Zauberfeder Verlag.<br/>
- Kamm, Björn-Ole. [2019](https://doi.org/10.1007/978-981-13-8039-6_36). “Experience Design for Understanding Social Withdrawal: Employing a Live-Action Role-Play (LARP) to Learn About and Empathize with Hikikomori in Japan.” In *Neo-Simulation and Gaming toward Active Learning*, edited by Ryoju Hamada, Songsri Soranastaporn, Hidehiko Kanegae, et al., 387–96. Singapore: Springer.<br/>
- カム ビョーン=オーレ. [2019](https://doi.org/10.32191/jjos.13.1_32). “ライブ・アクション・ロールプレイ(LARP)という意識向上を目的とした シリアス・ゲーミング方法:「ひきこもり」についての LARP を例に” [Live-Action Role-Play(Larp)as a Serious Gaming Tool for Awareness Raising: The Case of hikikomori(Acute Social Withdrawal]. 作業科学研究 13 (1): 32–44.

## Application Set-Up/Use
Download the code and copy it to your shiny server.<br/>
In [app.R](app.R) replace the hostname for the mail server with your information (so that emails can be sent to the facilitator). Store your SMTP credentials in the [.Renviron](.Renviron) file.<br/>
Share the app link with your participants.

## Translations
Currently, the app is available in English, German, and Japanese (and includes a language switcher via [shiny.i18n](https://github.com/Appsilon/shiny.i18n)). Feel free to add further translations via the translation.json in the www-folder.<br/><br/>

## Copyright
Copyright &copy; 2023, [Björn-Ole Kamm](https://www.b-ok.de)

reLarp is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

reLarp is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with reLarp. If not, see https://www.gnu.org/licenses/.

## Acknowledgments
The app development is part of the research project [Transcultural Learning through Simulated Co-Presence: How to Realize Other Cultures and Life-Worlds](https://kaken.nii.ac.jp/en/grant/KAKENHI-PROJECT-19KT0028/), funded by the [Japan Society for the Promotion of Science](https://www.jsps.go.jp/english/) (JSPS).
