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

Dieses Werkzeug kann in der Reflexionsphase nach einem [Larp](https://nordiclarp.org/wiki/Larp) (Live-Rollenspiel) als Visualisierungs- und Auswertungsverfahren eingesetzt werden (Review, Reflektion > reLarp). Diese Mixed-Method-Auswertungsstrategie wurde von der ursprünglich von [NAITŌ Testuo](https://pacanalysis.jimdofree.com/) (auf Japanisch) entwickelten *Personal Attitude Construct (PAC)-Analyse* inspiriert. „Die PAC-Analyse wird heute in Japan in verschiedenen Bereichen eingesetzt, von der Psychologie über die Soziologie und dem Sprachunterricht bis hin zur Beratung, und kombiniert Tiefeninterviews mit statistischen Clustern und Visualisierungen, um individuelle Erfahrungen zu vermitteln. Die Visualisierung bezieht sich hier auf Baumdiagramme, die die Verbindungen zwischen Schlüsselwörtern darstellen, die die Befragten zur Beschreibung ihrer Erfahrungen gewählt haben. In der Visualität des Ansatzes liegt sein Hauptvorteil für Lernzwecke, denn sie liefert eine Grundlage für die Reflexion der Teilnehmenden und macht ihre Reflexion auch für andere kommunizierbar“ (Kamm [2019](https://doi.org/10.1007/978-981-13-8039-6_36); aus dem Englischen). <br/>
Als hochstrukturierte Debriefing-Strategie verwenden wir eine an Larp-Erfahrungen angepasste PAC-Analyse-Variante, um die Evaluation des Larp-Designs zu unterstützen und, was noch wichtiger ist, als Methode, um die Teilnehmenden im Prozess der Sinngebung ihrer Erfahrung zu unterstützen und ihr Lernen zu visualisieren. <br/>
Diese Shiny-App vereinfacht den Prozess: Die Teilnehmenden können ihre Eindrücke individuell eingeben und werden durch den gesamten Prozess geführt. Am Ende können sie alle generierten Ergebnisse (Dendrogramme, Matrizen) an die Moderation senden. <br/>
Eine Demoversion ist auf https://b-ok.shinyapps.io/reLarp/ verfügbar.<br/>
Vor der Nutzung der Demoversion auf shinyapps.io bitten wir darum, die entsprechdenden [Datenschutzhinweise](https://www.larpwright.eu/de/relarp/#data_privacy) zu lesen.

## Ablauf des Verfahrens
**1.) Anweisung**<br/>
Zunächst erhalten die Teilnehmenden ispirierende Anweisungen, um ein Einzelinterview oder eine Gruppendiskussion zu beginnen. Unser Beispiel edu-larp, *Village, Shelter, Comfort* ([Design Document](https://www.b-ok.de/vsc_larp/)) soll die Auseinandersetzung mit einem paradoxen Dilemma fördern, daher haben wir die Erfahrung dieses Dilemmas in den Mittelpunkt der Überlegungen gestellt. Unabhängig von der Landessprache entsprechen die Anweisungen daher folgendem Format (paraphrasiert):
> Erinnert euch bitte an die Erfahrung, mit dem Dilemma in den drei Szenarien Dorf, Unterkunft, Komfort konfrontiert gewesen zu sein. Schreibt Wörter oder kurze Sätze auf, die für euch bedeutungsvoll sind, um diese Erfahrung zu beschreiben. Denkt an so viele Wörter wie möglich und schreibt sie in der Reihenfolge auf, in der euch die Wörter eingefallen sind.

**2.) Freie Wortassoziation**<br/>
Nach diesen Anweisungen geben die Teilnehmenden ihre Wortassoziationen in Bezug auf ihre Erfahrungen mit dem Dilemma des Larps ein.

**3.) Reihenfolge nach Wichtigkeit**<br/>
Die ersten Wörter oder Bilder, die den Teilnehmenden einfallen, sind nicht unbedingt die "wichtigsten" in dem Sinne, dass sie helfen, die erinnerte Erfahrung zu erklären. Daher werden die Teilnehmenden in diesem Schritt gebeten, ihre Eingaben in der Reihenfolge ihrer Wichtigkeit zu ordnen.

**4.) Vorstellung/Evaluation**<br/>
Für die anschließende Analyse bitten wir die Teilnehmenden auch, die Bedeutung der einzelnen Elemente als positiv (+), negativ (-) oder neutral (~) zu bewerten.

**5.) Grad der Ähnlichkeit**<br/>
In Vorbereitung auf die anschließende Diskussion und Analyse werden die Teilnehmenden gebeten, ihre Eingaben paarweise nach dem Grad ihrer Bedeutungsähnlichkeit auf einer 7-Punkte-Skala zu bewerten (von 1, sehr ähnlich in der Bedeutung, bis 7, sehr unterschiedlich in der Bedeutung). Die Teilnehmenden erhalten Anweisungen, wie zum Beispiel:
> Bitte bewertet den Abstand zwischen jedem Paar der von euch aufgelisteten Begriffe anhand der nachstehenden 7er-Skala. Bewertet dabei, wie nahe sie sich in eurer Vorstellung sind. Bewertet nicht nach der Genauigkeit der Bedeutung im Wörterbuch.

**6.) Clusteranalyse**<br/>
Auf der Grundlage der im vorigen Schritt erstellten Matrix führen wir eine hierarchische Clusteranalyse mit der Ward-Methode auf der Ähnlichkeitsmatrix durch, um ein so genanntes Dendrogramm zu erhalten, ein Baumdiagramm zur Veranschaulichung der Anordnung von Clustern. Cluster bezieht sich hier auf eine Anzahl von Elementen, die in ihrer Bedeutung nahe beieinander liegen und somit eine Reihe von Beziehungen bilden können. Dies bezieht sich auf die sinnvolle Strukturierung von Informationen, die für das Lernen notwendig ist.
Obwohl die Analyse des Abstands zwischen den Begriffen sinnvoll sein kann, wird das Dendrogramm in einer PAC-Analyse verwendet, um die strukturelle Bedeutung der Erfahrungen der Teilnehmenden zu untersuchen.

**7.) Dendrogramminterpretation**<br/>
In diesem wichtigen Schritt bitten wir die Teilnehmenden, die Bedeutung jedes Clusters, die Beziehung zwischen den Clustern und auch innerhalb der Cluster zu erklären. Daher werden die Teilnehmenden gebeten, einige der Begriffe zu erläutern. Oft beziehen die Teilnehmenden die Bewertungen aus Schritt 4 in ihre Erklärungen ein. Dieser gesamte Prozess dient dazu, das Gesamtbild der Teilnehmenden von der betreffenden Erfahrung (dem Dilemma) zu erforschen und ihnen bei der Reflexion zu helfen. Dieser Schritt kann natürlich auch Fragen und Kommentare der Larp-Orga/der Moderation beinhalten.

**8.) Kooperative Verständigung**<br/>
Im Anschluss an die obigen Ausführungen können die Organisator*innen ihre Interpretation des Dendrogramms sofort mit den Teilnehmenden teilen oder ihre Gedanken bis zum Ende der Nachbesprechung zurückhalten. Wichtig ist, dass die Orga/Moderation, wenn die Interpretation in einem Dialog erfolgt, den Teilnehmenden nicht ihre eigene Interpretation aufzwingen oder sie zu einer gewünschten Schlussfolgerung "überreden". Das Ziel ist es, Interpretationen auszutauschen, um Antworten von den Teilnehmenden zu erhalten. Dieser Prozess erfordert Zusammenarbeit und Interaktion zwischen beiden Parteien.

Weitere Einzelheiten zu diesem Prozess und Beispielanalysen finden sich hier:<br/>
- Kamm, Björn-Ole. [2017](https://www.b-ok.de/download/Kamm_2017_TranslatingResearchIntoLarp.pdf). “Translating Research into Larp: Village, Shelter, Comfort.” In *LARP: Silberhochzeit. Aufsatzsammlung zum MittelPunkt 2017*, edited by Rafael Bienia and Gerke Schlickmann, 31–60. Braunschweig: Zauberfeder Verlag.<br/>
- Kamm, Björn-Ole. [2019](https://doi.org/10.1007/978-981-13-8039-6_36). “Experience Design for Understanding Social Withdrawal: Employing a Live-Action Role-Play (LARP) to Learn About and Empathize with Hikikomori in Japan.” In *Neo-Simulation and Gaming toward Active Learning*, edited by Ryoju Hamada, Songsri Soranastaporn, Hidehiko Kanegae, et al., 387–96. Singapore: Springer.<br/>
- カム ビョーン=オーレ. [2019](https://doi.org/10.32191/jjos.13.1_32). “ライブ・アクション・ロールプレイ(LARP)という意識向上を目的とした シリアス・ゲーミング方法:「ひきこもり」についての LARP を例に” [Live-Action Role-Play(Larp)as a Serious Gaming Tool for Awareness Raising: The Case of hikikomori(Acute Social Withdrawal]. 作業科学研究 13 (1): 32–44.

## App-Installation/Nutzung
Lade den Code herunter und kopiere ihn zu deinem Shiny-Server.<br/>
Ersetze den Hostnamen des Mailservers in [app.R](app.R) durch deine Angaben (damit E-Mails an die Moderation gesendet werden können). Speichere deine SMTP-Anmeldedaten in der Datei  [.Renviron](.Renviron).<br/>
Teile den Link zur App mit deinen Teilnehmenden.

## Übersetzungen
Derzeit ist die App auf Englisch, Deutsch und Japanisch verfügbar (und enthält einen Sprachumschalter über [shiny.i18n](https://github.com/Appsilon/shiny.i18n). Es können gerne weitere Übersetzungen über die translation.json im www-Ordner hinzugefügt werden.<br/><br/>

## Copyright
Copyright &copy; 2023, [Björn-Ole Kamm](https://www.b-ok.de)

reLarp ist freie Software: Es kann unter den Bedingungen der GNU General Public License, wie von der Free Software Foundation veröffentlicht, weitergegeben und/oder modifiziert werden, entweder in Version 3 der Lizenz oder (nach Wahl) in einer späteren Version.

reLarp wird in der Hoffnung verteilt, dass es nützlich sein wird, aber OHNE JEGLICHE GARANTIE; sogar ohne die implizite Garantie der MARKTREIFE oder der EIGNUNG FÜR EINEN BESTIMMTEN ZWECK. Weitere Einzelheiten finden sich in der GNU General Public License.

reLarp sollte eine Kopie der GNU General Public License beigefügt sein. Falls nicht, siehe https://www.gnu.org/licenses/.

## Danksagung
Die App-Entwicklung ist Teil des Forschungsprojekts [Transcultural Learning through Simulated Co-Presence: How to Realize Other Cultures and Life-Worlds](https://kaken.nii.ac.jp/en/grant/KAKENHI-PROJECT-19KT0028/), gefördert von der [Japan Society for the Promotion of Science](https://www.jsps.go.jp/english/) (JSPS).
