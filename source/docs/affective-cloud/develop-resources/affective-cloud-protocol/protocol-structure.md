---
slug: /affective-cloud/affective-cloud-protocol/protocol-structure
sidebar_label: 协议结构
sidebar_position: 2
description: 情感云开发接口协议基本结构
---

# 协议结构

情感云 WebSocket 协议中的 Request 和 Response 结构及字段名约定如下。

## Request 结构体

- services【必填】
  - 服务类型：session、biodata、affective等
- op【必填】
  - 请求操作：start、restore、process、finish等
- args
  - 列表型参数
- kwargs
  - 字典型参数

## Response 结构体

- code【必填】
  - 0 请求成功 其它见 [错误代码](./error-code)
- request【必填】
  - services【必填】
  - op【必填】
- data
  - 请求返回数据包
- msg
  - 请求返回信息

## 注意事项

:::caution

- 所有数据传输都需要做 gzip 压缩
- 文档协议中加 "" 的为字符串，不加的为变量名

:::