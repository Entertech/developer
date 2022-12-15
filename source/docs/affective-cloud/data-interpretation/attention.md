---
slug: /affective-cloud/data-interpretation/attention
sidebar_label: 注意力（Attention）
sidebar_position: 11
description: 关于注意力的详细解释与应用示例
---

# 注意力（Attention）

## 名词解释

在专注状态下，脑电波具有独特的特征[^1][^2]，研究表明专注状态下脑电波的高频能量会增加而低频能量相应减少[^3][^4][^5]。

注意力监测算法基于大量数据建模，并通过实时分析脑电波的频谱特征从而计算注意力，用于评价专注程度。注意力的值越高表明越专注，即大脑越活跃。

通过专注思考、注视等方式可以提高注意力的值。

:::info
由于每个人的脑电节律存在差异，注意力监测算法会在体验的初始阶段采集基线来进行自适应。为了获得较好的体验，在体验开始的前 30 秒请尽量减少面部活动（如眨眼、眼动、咬牙等）带来的干扰。
:::

## 最佳实践

:::tip
通过「最佳实践」，我们会提供一些我们已经实践过的应用场景供你参考，通过这些例子你可以了解如何将我们提供的数据和你的应用场景结合。
:::

### 注意力在冥想应用场景下的应用

大多数形式的冥想需要控制注意力，比如关注自己的呼吸，如果发现自己走神，需要把注意力唤回，重新保持对呼吸的关注，或者目不转睛盯住一个物体，控制自己的注意力。通过注意力指标可以反映冥想过程中的注意力变化趋势。

没有经过长期训练的人注意力难以在高水平维持较高时间，一般表现为忽高忽低，经过长期训练的人士可以将注意力维持在很高水平。

#### 冥想过程中典型注意力变化

未经过长期训练的冥想人士，注意力水平中等偏高，时高时低
![冥想过程中典型注意力变化](./image/attention-curve-in-typical-meditation.png)

#### 经过长期专注训练的冥想注意力变化

坚持长期的冥想练习，可使注意力总体水平和专注状态的持久度都得到提高。
![经过长期专注训练的冥想注意力变化](./image/attention-curve-with-high-level.png)

#### 以放松为主的冥想中的注意力变化

在一些以放松为主的冥想中，由于大脑活跃度降低，可能导致注意力水平较低。
![以放松为主的冥想中的注意力变化](./image/attention-curve-in-calm-meditation.png)

---

***参考文献***

[^1]: Wang, Yu-Kai & Jung, Tzyy-Ping & Lin, Chin-Teng. (2015). EEG-Based Attention Tracking During Distracted Driving. IEEE transactions on neural systems and rehabilitation engineering: a publication of the IEEE Engineering in Medicine and Biology Society. 23. 10.1109/TNSRE.2015.2415520.
[^2]: Xu, Lu-Qiang & Liu, Jing-Xia & Xiao, Guang-Can & Jin, Wei-Dong. (2013). Characterization and classification of EEG attention level. Journal of Computer Applications. 32. 3268-3270. 10.3724/SP.J.1087.2012.03268.
[^3]: Lutsyuk, N. & Éismont, E. & Pavlenko, Vladimir. (2006). Modulation of attention in healthy children using a course of EEG-feedback sessions. Neurophysiology. 38. 389-395. 10.1007/s11062-006-0076-0.
[^4]: Lansbergen, Marieke & Arns, Martijn & Dongen-Boomsma, Martine & Spronk, Desirée & Buitelaar, Jan. (2011). The increase in theta/beta ratio on resting-state EEG in boys with attention-deficit/hyperactivity disorder is mediated by slow alpha peak frequency. Progress in neuro-psychopharmacology & biological psychiatry. 35. 47-52. 10.1016/j.pnpbp.2010.08.004.
[^5]: Putman, Peter & Verkuil, Bart & Arias-Garcia, Elsa & Pantazi, Ioanna & van Schie, Charlotte. (2013). Erratum to: EEG theta/beta ratio as a potential biomarker for attentional control and resilience against deleterious effects of stress on attention. Cognitive, affective & behavioral neuroscience. 14. 10.3758/s13415-013-0238-7.
