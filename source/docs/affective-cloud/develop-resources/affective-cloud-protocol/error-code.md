---
slug: /affective-cloud/affective-cloud-protocol/error-code
sidebar_label: 错误代码
sidebar_position: 6
description: 情感云开发接口协议错误代码
---

# 错误代码

| 服务模块 | 错误码 | 错误信息 | 英文 |
|---|---|---|---|
| 会话 | 1001 | 签名过期 | Signature expired
|| 1002 | 签名无效 | Invalid signature
|| 1003 | user_id 无效 | Invalid user_id
|| 1004 | App Key 不存在 | App Key is not exist
|| 1005 | 时间戳无效 | Invalid timestamp
|| 1006 | App 没有开通任何服务 | App has no service
|| 1007 | 同时开启会话数超过限制 | Simultaneous opening of sessions exceeds limit
| 生物数据分析服务 | 2001 | 生物数据分析服务尚未初始化 | Biodata services are uninitialized
|| 2002 | 测试应用使用量超过限制 | Test app has exceeded the limit
|| 2003 | 正式应用可用余量不足 | App's remaining amount is not enough
|| 2004 | 参数 X 不正确 | The key 'X' is incorrect
|| 2005 | 找不到 X 服务 | No 'X' service
|| 2006 | 参数 X 的值不正确 | The value of 'X' is incorrect
| 生理状态分析服务 | 3001 | 生理状态分析服务尚未启动 | Affective services are not started
|| 3002 | 找不到 X 服务 | No 'X' service
|| 3003 | 测试应用使用量超过限制 | Test app has exceeded the limit
|| 3004 | 正式应用可用余量不足 | App's remaining amount is not enough
|| 3005 | 参数 X 不正确 | The key 'X' is incorrect
| 其它 | 400 | 请求异常 | Request exception
|| 401 | 会话不存在，请先建立会话 | Session not exist, create a session first.
|| 404 | 服务不存在 | Sevice not exist
|| 405 | 操作太频繁 | Operation is too frequently
