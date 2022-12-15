---
slug: /affective-cloud/affective-cloud-protocol
sidebar_label: 情感云开发接口协议
sidebar_position: 1
---

# 情感云开发接口协议

## 简介

本协议面向开发者详细介绍情感云平台 [WebSocket](https://en.wikipedia.org/wiki/WebSocket) 接口相关协议。你可以根据协议进行个性化的情感云开发，获取需要的情感云服务，调整初始化配置以获得不同的情感云返回值，修改实时分析的间隔时间等。正式开发前，请仔细阅读协议内容。

- [协议结构](./affective-cloud-protocol/protocol-structure)规定了接口协议的基本结构。
- [会话协议](./affective-cloud-protocol/session-protocol)介绍了会话相关操作，包括创建会话、恢复会话、结束会话。
- [生物数据分析服务协议](./affective-cloud-protocol/biological-data-analysis-service-protocol)介绍了生物数据分析服务的相关操作，包括启动并初始化服务、订阅实时分析、取消订阅实时分析、上传数据和获取报表分析。
- [生理状态分析服务协议](./affective-cloud-protocol/physiological-state-analysis-service-protocol)介绍了生理状态分析服务的相关操作，包括启动并初始化服务、订阅实时分析、取消订阅实时分析、获取报表分析和结束服务。
- [错误代码](./affective-cloud-protocol/error-code)列举了错误代码对应的错误信息。

## 服务内容

| 服务类型 | 数据分析服务 | 服务代码名称 |
| --- | --- | --- |
| 生物数据分析 | 双通道脑电波 | eeg |
|  | 单通道脑电波 | sceeg |
|  | 心率 | hr |
|  | 压电压阻 | pepr |
| 生理状态分析 | 注意力 | attention |
|  | 放松度 | relaxation |
|  | 压力水平 | pressure |
|  | 愉悦度 | pleasure |
|  | 激活度 | arousal |
|  | 和谐度 | coherence |
|  | 睡眠 | sleep |
|  | 儿童注意力 | attention_chd |
|  | 儿童放松度 | relaxation_chd |

## 服务器地址

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

<Tabs>
  <TabItem value="apple" label="国内服" default>
    wss://server.affectivecloud.cn/ws/algorithm/v2/
  </TabItem>
  <TabItem value="orange" label="国外服">
    wss://server.affectivecloud.com/ws/algorithm/v2/
  </TabItem>
</Tabs>

## 开发须知

:::caution

- 回车情感云暂未开放自由注册，需要使用请联系管理员（微信 id：fakegeek）进行用户和应用的注册
- 接口使用 WebSocket 协议通信
- 接口协议示例代码运行环境为 python 3.6

:::
