---
slug: /data/data-format/physiological-state-metrics
sidebar_label: 生理状态指标
sidebar_position: 3
description: 情感云和本地化数据分析 SDK 的各项生理状态指标返回值及其说明
---

# 生理状态指标

## 生理状态实时分析返回值 {#physiological-state-realtime-analysis-returns}

| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| attention | attention | float | [0, 100] | 注意力值，数值越高代表注意力越高 |
| relaxation | relaxation | float | [0, 100] | 放松度值，数值越高代表放松度越高 |
| pressure | pressure | float | [0, 100] | 压力水平值，数值越高代表压力水平越高 |
| pleasure | pleasure | float | [0, 100] | 愉悦度值，数值越高代表情绪愉悦度越高 |
| arousal | arousal | float | [0, 100] | 激活度值，数值越高代表情绪激活度越高 |
| coherence | coherence | float | [0, 100] | 和谐度值，数值越高代表越和谐 |
| sleep | sleep_degree | float | [0, 100] | 睡眠程度，数值越小代表睡得越深 |
|  | sleep_state | int | {0, 1} | 睡眠状态，0 表示未入睡，1 表示已入睡 |
|  | eeg_alpha_power<br/>eeg_beta_power<br/>eeg_theta_power<br/>eeg_delta_power<br/>eeg_gamma_power | float | {0, 1} | 脑电α/β/θ/δ/γ频段能量占比<br/>初始阶段与信号质量不佳时返回为0，其余情况返回能量占比/分贝值<br/>eeg_power_output=True时输出 |
|  | eeg_quality | int | {0, 1, 2, 3, 4} | 脑电信号质量等级<br/>0表示未检测到佩戴，电极与皮肤接触不良<br/>1表示检测到数据但没有有效脑电信号<br/>2表示检测到脑电信号但信噪比较低，只显示波形而不进行计算<br/>3表示检测到脑电信号质量正常，可进行正常计算<br/>4表示检测到脑电信号质量很好，信噪比较高，计算结果更准确<br/>eeg_quality_output=True时输出 |
|  | sleep_stage | int | {0, 1, 2, 3, 4} | 实时睡眠分期<br/>0：清醒期<br/>1：N1期<br/>2：N2期<br/>3：N3期<br/>4：REM期<br/>sleep_stage_output=True时输出 |
| attention_chd | attention_chd | float | [0, 100] | 儿童注意力值，数值越高代表注意力越高 |
| relaxation_chd | relaxation_chd | float | [0, 100] | 儿童放松度值，数值越高代表放松度越高 |


## 生理状态报表分析返回值 {#physiological-state-report-analysis-returns}

| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| attention | attention_avg | float | [0, 100] | 注意力平均值 |
|  | attention_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 注意力全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
| relaxation | relaxation_avg | float | [0, 100] | 放松度平均值 |
|  | relaxation_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 放松度全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
| pressure | pressure_avg | float | [0, 100] | 压力水平平均值 |
|  | pressure_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 压力水平全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
| pleasure | pleasure_avg | float | [0, 100] | 愉悦度平均值 |
|  | pleasure_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 愉悦度全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
| arousal | arousal_avg | float | [0, 100] | 激活度平均值 |
|  | arousal_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 激活度全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
| coherence | coherence_avg | float | [0, 100] | 和谐度平均值 |
|  | coherence_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 和谐度全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | coherence_flag | list[int] | {0, 1} $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 和谐区间标记<br/>横坐标点间间隔为 0.6 * upload_cycle 秒<br/>0 表示非和谐状态，1 表示和谐状态 |
|  | coherence_duration | int | [0, +∞) | 和谐时长，单位：秒 |
| sleep | sleep_curve | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 睡眠曲线，连续描绘整个小睡过程的睡眠程度<br/>横坐标点间间隔为 0.6 * upload_cycle 秒（upload_cycle≥10）<br/>该值越小表示越接近深睡；该值越大表示越接近清醒 |
|  | sleep_stage | list[int] | {0, 1, 2, 3, 4} $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 睡眠分期<br/>横坐标点间间隔为 0.6 * upload_cycle 秒（upload_cycle≥10）<br/>0：清醒期<br/>1：N1期<br/>2：N2期<br/>3：N3期<br/>4：REM期<br/>sleep_stage_output=True 时输出 |
|  | sleep_point | int | [0, +∞) | 入睡点时间轴索引，用于标记入睡点<br/>对应睡眠曲线数组的索引，表示在该索引对应的时刻用户入睡<br/>0 表示无效值，未检测到入睡 |
|  | sleep_latency | int | [0, +∞) | 入睡用时，单位：秒<br/>0 表示无效值，未检测到入睡 |
|  | awake_duration | int | [0, +∞) | 清醒时长，单位：秒 |
|  | light_duration | int | [0, +∞) | 浅睡时长，单位：秒 |
|  | deep_duration | int | [0, +∞) | 深睡时长，单位：秒 |
|  | rem_duration | int | [0, +∞) | 快速眼动期时长，单位：秒<br/>sleep_stage_output=True 时输出 |
|  | eeg_alpha_curve<br/>eeg_beta_curve<br/>eeg_theta_curve<br/>eeg_delta_curve<br/>eeg_gamma_curve | list[float] |  [0, 1]*k, (k≥5) | 脑电α/β/θ/δ/γ频段能量占比变化曲线，横坐标点间间隔为6x秒<br/>eeg_power_output=True时输出 |
|  | eeg_quality_rec | list[int] | {0, 1, 2, 3, 4}*k, (k≥5) | 脑电信号质量等级<br/>0表示未检测到佩戴，电极与皮肤接触不良<br/>1表示检测到数据但没有有效脑电信号<br/>2表示检测到脑电信号但信噪比较低，只显示波形而不进行计算<br/>3表示检测到脑电信号质量正常，可进行正常计算<br/>4表示检测到脑电信号质量很好，信噪比较高，计算结果更准确<br/>eeg_quality_output=True时输出 |
|  | sleep_stage | list[int] | {0, 1, 2, 3, 4}{*k, (k≥5) | 睡眠分期，横坐标点间间隔为6x秒<br/>0：清醒期<br/>1：N1期<br/>2：N2期<br/>3：N3期<br/>4：REM期<br/>sleep_stage_output=True时输出 |
|  | movement_count | int | [0, +∞) | 体动次数<br/>advanced_analysis=True时输出 |
|  | arousal_count | int | [0, +∞) | 觉醒次数<br/>advanced_analysis=True时输出 |
|  | movement_rec | list[int] | {0, 1}*k, (k≥5) | 体动标志记录<br/>0表示无体动<br/>1表示有体动<br/>advanced_analysis=True时输出 |
|  | arousal_rec | list[int] | {0, 1}*k, (k≥5) | 觉醒标志记录<br/>0表示无觉醒<br/>1表示有觉醒<br/>advanced_analysis=True时输出 |
|  | disturb_tolerance | float | [0, 100] | 睡眠抗干扰能力，睡眠过程中的噪声耐受性，与脑电中的纺锤波有关<br/>值越大表示抗干扰能力越强<br/>advanced_analysis=True时输出 |
| attention_chd | attention_chd_avg | float | [0, 100] | 注意力平均值 |
|  | attention_chd_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 注意力全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | attentive_duration | int | [0, +∞) | 专注状态时长，单位：秒 |
|  | distracted_duration | int | [0, +∞) | 分心状态时长，单位：秒 |
|  | normal_duration | int | [0, +∞) | 普通状态时长，单位：秒 |
| relaxation_chd | relaxation_chd_avg | float | [0, 100] | 放松度平均值 |
|  | relaxation_chd_rec | list[float] | [0, 100] $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 放松度全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | relaxed_duration | int | [0, +∞) | 放松状态时长，单位：秒 |
|  | nervous_duration | int | [0, +∞) | 紧张状态时长，单位：秒 |
|  | normal_duration | int | [0, +∞) | 普通状态时长，单位：秒 |
