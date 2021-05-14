# PANCHANGE - factors influencing perceived and objective change in symptoms of anxiety, depression and PTSD during 2020 pandemic in the UK

## Summary

Code repository for Young et al 2020 manuscript "Anxiety, depression and trauma symptom change during the COVID-19 pandemic: Retrospective versus objective assessment"

The project uses data from the [Repeated Assessment of Mental health during a Pandemic (RAMP)](https://rampstudy.co.uk/), COVID-19 Psychiatry and Neurological Genetics (COPING), [Genetic links to Anxiety and Depression](https://gladstudy.org.uk/) (GLAD) and [Eating Disorder Genetics Initiative](https://edgiuk.org/) (EDGI) studies.

***Aims***
1) Assess current symptoms among individuals with and without a prior diagnosis of an anxious or depressive disorder.
2) Assess objective and retrospective symptom change in the GLAD sample.
3) If 2. considered sufficiently valid, report on whole RAMP and COPING sample current v retrospective change

***Sensitivity checks / stratifications***
* perceived change in symptoms
* Pre-existing mental health diagnosis
* Chronicity of pre-existing diagnosis
* Severity of objective baseline symptoms (GLAD & EDGI)
* Gender
* Age
* Ethnicity (if sufficiently powered to do so)
* Keyworker / vulnerable individual status


## Project details

***Authors***
Katherine Young, Kirstin Purves, Christopher Hübel, Molly Davies, Katie Thompson, Shannon Bristow, ..., Thalia Eley, Gerome Breen

***Analysts***
Kirstin Purves, Topher Hübel, Molly Davies, Katie Thompson

***Data processing team***
Leo Lin, Kirstin Purves, Topher Hübel

***Principal investigators***
Katherine Young, Gerome Breen

***Work flow details***
Work flow and details for collaborative process (including naming conventions) can be found within this folder (PANCHANGE_workflow_2020-07-20.txt).

***data access***
Data stored on secure server. Anonymised data specific to this project available on request after publication, and may be made open source if anonymity and data security can be assured.

## Power calculations

We conducted a priori power calculations using G* power to check the minimum sample size required for between group comparisons under a number of assumptions about group allocation and effect size. We will avoid doing sub group analyses where we are clearly underpowered.

We conducted all power analyses assuming standard t-test (mean difference between 2 independent groups), two-tailed hypothesis, 80% power and alpha 0.05. We test for a range of effect size anging from d 0.2 - d.05 to capture small to medium effect size.

We will not run analyses where they are not at 80% power to detect a medium-large effect of 0.5.

We use power analyses most appropriate to the sample allocation ratio we observe in our data to decide the sample cut off based on pwoer analyses. We assume in most cases this will be uneven.

### version 1
#### equal group allocation

* **Sample size assuming d = 0.2:**
394 per group (n = 788)

* **Sample size assuming d = 0.3:**
176 per group (n = 352)
* **Sample size assuming d = 0.4:**
100 per group (n = 200)
* **Sample size assuming d = 0.5:**
64 per group (n = 128)

### version 2.
#### 1:3 group allocation

* **Sample size assuming d = 0.2:**
group 1 = 263
group 2 = 787
n = 1050

* **Sample size assuming d = 0.3:**
group 1 = 117
group 2 = 351
n =468
* **Sample size assuming d = 0.4:**
group 1 = 66
group 2 = 198
n = 264
* **Sample size assuming d = 0.5:**
group 1 = 43
group 2 = 127
n = 128

### version 3.
#### 1:4 group allocation

* **Sample size assuming d = 0.2:**
group 1 = 246
group 2 = 984
n = 1230

* **Sample size assuming d = 0.3:**
group 1 = 110
group 2 = 438

* **Sample size assuming d = 0.4:**
group 1 = 62
group 2 = 428
n = 310

* **Sample size assuming d = 0.5:**
group 1 = 40
group 2 = 160
n =200

### version 3.
#### 1:6 group allocation

* **Sample size assuming d = 0.2:**
group 1 = 229
group 2 = 1377
n = 1606

* **Sample size assuming d = 0.3:**
group 1 = 102
group 2 = 614
n = 716
* **Sample size assuming d = 0.4:**
group 1 = 58
group 2 = 346
n = 404

* **Sample size assuming d = 0.5:**
group 1 = 37
group 2 = 223
n =260
