---
slug: /data/data-files-protocol/raw-data-files
sidebar_label: 原始数据文件
sidebar_position: 1
description: 原始数据文件的详细格式
---

# 原始数据文件

## 文件内容

原始数据文件中主要保存了硬件采集到的原始数据，经解析后可以得到相应原始信号。

## 文件名称

原始数据文件按照不同的原始信号类型保存为不同的后缀名称。

| 原始信号类型 | 原始数据文件后缀 |
| --- | --- |
| 双通道脑电波 | .eeg |
| 单通道脑电波 | .sceeg |
| 心率 | .hr |
| 压电压阻 | .pepr |

## 文件格式

| 一级字段 | 二级字段 | 值 | 内容说明 |
| --- | --- | --- | --- |
| user | id | str<br/>MD5 | 用户 ID |
|  | sex | str<br/>'m'/'f' | 用户性别 'm': 男性; 'f': 女性 |
|  | age | int<br/>[0, 255] | 用户年龄 |
| device | sn | str | 设备序列号 |
|  | name | str | 设备名称 |
| data | type | str<br/>'eeg'/'hr'/'sceeg'/'pepr' | 原始信号类型 |
|  | **raw** | list[int]<br/>[0, 255] | 硬件输出的**原始数据**，解析后可得**原始信号** |
|  | start_time | str<br/>'YYYY-MM-DD-hh-mm-ss' | 起始时间 年-月-日-时-分-秒 |
|  | close_time | str<br/>'YYYY-MM-DD-hh-mm-ss' | 结束时间 年-月-日-时-分-秒 |
|  | source | int | 数据来源，即 App ID，用于区分不同应用 |
| label | case | str | 标签情景，对应不同的实验名称 |
|  | rec | list[dict] | 标签记录，分段记录具体的标签信息<br/>rec 的具体格式见[标签记录格式](./) |

<details>
<summary>原始数据文件格式示例</summary>

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
        "type": "eeg",                              // 数据类型：双通道脑电波
        // highlight-next-line
        "raw": [0,0,119,7,236,...,136,214,58],      // 原始数据
        "start_time": "2019-08-18-09-36-59",        // 起始时间：2019年8月18日9时36分59秒
        "close_time": "2019-08-18-10-04-27",        // 结束时间：2019年8月18日10时4分27秒
        "source": 1                                 // 数据来源
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
