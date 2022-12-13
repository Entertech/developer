---
slug: /data/data-files-protocol/report-files
sidebar_label: 报表文件
sidebar_position: 2
description: 报表文件的详细格式
---

# 报表文件

## 文件内容

报表文件分为**生物数据报表文件**和**生理状态报表文件**。生物数据报表分析的结果保存在生物数据报表文件中，生理状态报表分析的结果保存在生理状态报表文件中。

## 文件名称

报表文件按照不同的数据分析服务类型保存为不同的后缀名称。

| 数据分析服务类型 | 报表文件后缀 |
| --- | --- |
| 双通道脑电波 | .eeg.report |
| 单通道脑电波 | .sceeg.report |
| 心率 | .hr.report |
| 压电压阻 | .pepr.report |
| 注意力 | .attention.report |
| 放松度 | .relaxation.report |
| 压力水平 | .pressure.report |
| 愉悦度 | .pleasure.report |
| 激活度 | .arousal.report |
| 和谐度 | .coherence.report |
| 睡眠 | .sleep.report |
| 儿童注意力 | .attention_chd.report |
| 儿童放松度 | .relaxation_chd.report |

## 文件格式

| 一级字段 | 二级字段 | 值 | 内容说明 |
| --- | --- | --- | --- |
| user | id | str<br/>MD5 | 用户 ID |
|  | sex | str<br/>'m'/'f' | 用户性别 'm': 男性; 'f': 女性 |
|  | age | int<br/>[0, 255] | 用户年龄 |
| device | sn | str | 设备序列号 |
|  | name | str | 设备名称 |
| data | service | str<br/>'eeg'/'hr'/'attention'/'relaxation' | 数据分析服务类型 |
|  | **report** | dict<br/>[0, 255] | **报表分析结果**，生物数据报表分析或生理状态报表分析的结果<br/>具体内容参考：<br/>[生物数据报表分析返回值](../data-format/biological-data#biological-data-report-analysis-returns)<br/>[生理状态报表分析返回值](../data-format/physiological-state-metrics) |
|  | start_time | str<br/>'YYYY-MM-DD-hh-mm-ss' | 起始时间 年-月-日-时-分-秒 |
|  | close_time | str<br/>'YYYY-MM-DD-hh-mm-ss' | 结束时间 年-月-日-时-分-秒 |
|  | source | int | 数据来源，即 App ID，用于区分不同应用 |
|  | **upload_cycle** | int<br/>[0, 100] | 上传周期倍数，报表分析中各项全程记录数据的间隔时间为 upload_cycle$\times$0.6<br/>例如上传周期倍数为 3，则全程记录数组中每个数据点间隔为 1.8 秒 |
|  | algorithm_params | dict | 算法配置参数（内部使用，无需关注） |
| label | case | str | 标签情景，对应不同的实验名称 |
|  | rec | list[dict] | 标签记录，分段记录具体的标签信息<br/>rec 的具体格式见[标签记录格式](./) |

<details>
<summary>报表文件格式示例</summary>

```json
{
    "user": {
        "id": "8**************************5c98c",   // 用户ID
        "sex": "m",                                 // 用户性别：男
        "age": 20                                   // 用户年龄：20岁
    },
    "device": {
        "sn": "C**********2"                        // 设备序列号
    },
    "data": {
        "service": "eeg",                           // 数据分析服务类型：双通道脑电波
        // highlight-start
        "report": {                                 // 报表分析结果
            "eeg_alpha_curve": [87.04, ...],
            "eeg_beta_curve": [92.68, ...],
            "eeg_theta_curve": [87.71, ...],
            "eeg_delta_curve": [76.62, ...],
            "eeg_gamma_curve": [83.65, ...],
        },
        // highlight-end
        "start_time": "2019-08-18-09-36-59",        // 起始时间：2019年8月18日9时36分59秒
        "close_time": "2019-08-18-10-04-27",        // 结束时间：2019年8月18日10时4分27秒
        "source": "Flowtime",                       // 数据来源
        // highlight-next-line
        "upload_cycle": 3,                          // 上传周期倍数
        "algorithm_params": {                       // 算法配置参数
            "eeg": {
                "tolerance": 2,
                "channel_power_verbose": True
            }
        }
    },
    "label": {
        "mode": "test",                             // 标签模式
        "case": "attention_experiment",             // 标签情景：注意力实验
        "rec": [                                    // 标签记录
                {                                   // 分段标签记录
                    "st": 0.0,                      // 分段起始时间
                    "et": 180.6,                    // 分段结束时间
                    "tag": {                        // 标签维度与标签值
                        "attention": "5",           // 专注程度：5
                        "task": "reading"           // 实验任务：阅读
                    },
                    "note": ["被试眨眼频繁"]         // 分段备注信息
                },
                ...
        ]
}
```

</details>
