---
slug: /data/raw-data-protocol/hr-data-protocol
sidebar_label: 心率数据协议
sidebar_position: 3
description: 心率原始数据包格式与解析方法
---

# 心率数据协议

:::caution
在进行解析前，请确保你已经进行了如下处理：

- 如果你正在从设备实时获取硬件数据包，请确保已将字节流数据转换为**十进制无符号 int 型**（注意每个数据范围为 0~255，而不是 -128~127）。
- 如果你是从情感云管理后台下载的原始数据文件中获取的数据，请先按照不同类型数据包的长度，将其按顺序拆分为若干数据包，再进行解析。
:::

## 心率数据包格式

一个心率数据包由 1 个心率数据组成，即每次发送 1 个心率数据。

| 包内容 | 心率数据 |
| :---: | :---: |
| 字节数 | 1 |

- 数据包长度：1 字节
- 采样率：5 Hz（每秒钟发送 5 个心率数据）

:::info
心率采集模块实际为每秒钟计算 1 个心率值，但为保证与脑电波数据同步，硬件按照每秒钟 5 个心率数据发送，这 5 个心率数据相同。
:::

## 心率数据解析方法

每一个心率数据即 1 个字节。

由于我们已经将数据包转换为十进制 int 型数据，因此该数据即为心率数据。例如：对于数据包中的 `72`，其解析值即为：72。

<details>
<summary>心率原始信号示例</summary>

典型的心率原始信号如下图。

**心率原始信号**
![心率原始信号](./image/hr-raw-signal.png)

</details>
