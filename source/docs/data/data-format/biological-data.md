---
slug: /data/data-format/biological-data
sidebar_label: 生物数据
sidebar_position: 2
description: 情感云和本地化数据分析 SDK 的各项生物数据返回值及其说明
---

# 生物数据

## 生物数据实时分析返回值 {#biological-data-realtime-analysis-returns}

### 实时双通道脑电波返回值 {#double-channel-eeg-realtime-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| eeg | eegl_wave<br/>eegr_wave | list[float] | [-500, 500] $\times$ 150 $\times$ upload_cycle （upload_cycle<=6） | 左、右通道脑电波形片段<br/>初始阶段返回为空数组，之后返回数组长度为 150 $\times$ upload_cycle<br/>upload_cycle 超过 6 时返回数组长度最大为 1000 |
|  | eeg_alpha_power<br/>eeg_beta_power<br/>eeg_theta_power<br/>eeg_delta_power<br/>eeg_gamma_power | float | [0, 1]（power_mode="rate"）<br/>[0, +∞)（power_mode="db"） | 脑电 α/β/θ/δ/γ 频段能量占比/分贝值<br/>初始阶段与信号质量不佳时返回为0，其余情况返回能量占比/分贝值<br/>通过 power_mode 配置返回为占比或分贝值 |
|  | eegl_alpha_power<br/>eegl_beta_power<br/>eegl_theta_power<br/>eegl_delta_power<br/>eegl_gamma_power | float | [0, 1]（power_mode="rate"）<br/>[0, +∞)（power_mode="db"） | 左通道脑电 α/β/θ/δ/γ 频段能量占比/分贝值<br/>channel_power_verbose=True 时输出<br/>初始阶段与信号质量不佳时返回为 0，其余情况返回能量占比/分贝值<br/>通过 power_mode 配置返回为占比或分贝值 |
|  | eegr_alpha_power<br/>eegr_beta_power<br/>eegr_theta_power<br/>eegr_delta_power<br/>eegr_gamma_power | float | [0, 1]（power_mode="rate"）<br/>[0, +∞)（power_mode="db"） | 右通道脑电 α/β/θ/δ/γ 频段能量占比/分贝值<br/>channel_power_verbose=True 时输出<br/>初始阶段与信号质量不佳时返回为 0，其余情况返回能量占比/分贝值<br/>通过 power_mode 配置返回为占比或分贝值 |
|  | eeg_quality | int | {0, 1, 2, 3, 4} | 脑电信号质量等级<br/>0 表示未检测到佩戴，电极与皮肤接触不良<br/>1 表示检测到数据但没有有效脑电信号<br/>2 表示检测到脑电信号但信噪比较低，只显示波形而不进行计算<br/>3 表示检测到脑电信号质量正常，可进行正常计算<br/>4 表示检测到脑电信号质量很好，信噪比较高，计算结果更准确 |

### 实时心率返回值 {#heart-rate-realtime-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| hr | hr | int | [0, +∞) | 心率值，单位：BPM |
|  | hrv | float | [0, +∞) | 心率变异性，单位：毫秒 |

### 实时单通道脑电波返回值 {#single-channel-eeg-realtime-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| sceeg | eeg_wave | list[float] | [-500, 500] $\times$ 150 $\times$ upload_cycle （upload_cycle<=6） | 脑电波形片段<br/>初始阶段返回为空数组，之后返回数组长度为 150 $\times$ upload_cycle<br/>upload_cycle 超过 6 时返回数组长度最大为1000 |
|  | eeg_alpha_power<br/>eeg_beta_power<br/>eeg_theta_power<br/>eeg_delta_power<br/>eeg_gamma_power | float | [0, 1]（power_mode="rate"）<br/>[0, +∞)（power_mode="db"） | 脑电 α/β/θ/δ/γ 频段能量占比/分贝值<br/>初始阶段与信号质量不佳时返回为0，其余情况返回能量占比/分贝值<br/>通过 power_mode 配置返回为占比或分贝值 |
|  | eeg_quality | int | {0, 1, 2, 3, 4} | 脑电信号质量等级<br/>0 表示未检测到佩戴，电极与皮肤接触不良<br/>1 表示检测到数据但没有有效脑电信号<br/>2 表示检测到脑电信号但信噪比较低，只显示波形而不进行计算<br/>3 表示检测到脑电信号质量正常，可进行正常计算<br/>4 表示检测到脑电信号质量很好，信噪比较高，计算结果更准确 |

### 实时压电压阻（ PEPR） 返回值 {#pepr-realtime-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| pepr | bcg_wave | list[float] | [-1000, 1000] $\times$ 75 $\times$ upload_cycle （upload_cycle<=6） | 脉搏波波形片段<br/>初始阶段返回为空数组，之后返回数组长度为 75 $\times$ upload_cycle<br/>upload_cycle 超过 6 时返回数组长度最大为 500 |
|  | rw_wave | list[float] | [-1000, 1000] $\times$ 15 $\times$ upload_cycle （upload_cycle<=6） | 呼吸波波形片段<br/>初始阶段返回为空数组，之后返回数组长度为 15 $\times$ upload_cycle<br/>upload_cycle 超过 6 时返回数组长度最大为 100 |
|  | bcg_quality | int | {0, 1, 2} | 脉搏波信号质量等级<br/>0 表示未检测到佩戴/坐下<br/>1 表示检测到数据但没有有效信号<br/>2 表示检测到脉搏波信号质量良好 |
|  | rw_quality | int | {0, 1, 2} | 呼吸波信号质量等级<br/>0 表示未检测到佩戴/坐下<br/>1 表示检测到数据但没有有效信号<br/>2 表示检测到呼吸波信号质量良好 |
|  | hr | int | [0, +∞) | 心率值，单位：BPM |
|  | rr | float | [0, +∞) | 呼吸率值，单位：次/分 |
|  | hrv | float | [0, +∞) | 心率变异性，单位：毫秒 |

## 生物数据报表分析返回值 {#biological-data-report-analysis-returns}

### 双通道脑电报表分析返回值 {#double-channel-eeg-report-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| eeg | eeg_alpha_curve<br/>eeg_beta_curve<br/>eeg_theta_curve<br/>eeg_delta_curve<br/>eeg_gamma_curve | list[float] | [0, 1] $\times$ n, (n≥20)（power_mode="rate"）<br/>[0, ∞) $\times$ n, (n≥20)（power_mode="db"）<br/>n 为 收到 subscribe 次数 | 脑电 α/β/θ/δ/γ 频段能量变化曲线<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | eegl_alpha_curve<br/>eegl_beta_curve<br/>eegl_theta_curve<br/>eegl_delta_curve<br/>eegl_gamma_curve | list[float] | [0, 1] $\times$ n, (n≥20)（power_mode="rate"）<br/>[0, ∞) $\times$ n, (n≥20)（power_mode="db"）<br/>n 为 收到 subscribe 次数 | 左通道脑电 α/β/θ/δ/γ 频段能量变化曲线<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒<br/>channel_power_verbose=True 时输出 |
|  | eegr_alpha_curve<br/>eegr_beta_curve<br/>eegr_theta_curve<br/>eegr_delta_curve<br/>eegr_gamma_curve | list[float] | [0, 1] $\times$ n, (n≥20)（power_mode="rate"）<br/>[0, ∞) $\times$ n, (n≥20)（power_mode="db"）<br/>n 为 收到 subscribe 次数 | 右通道脑电 α/β/θ/δ/γ 频段能量变化曲线<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒<br/>channel_power_verbose=True 时输出 |
|  | eeg_quality_rec | list[int] | {0, 1, 2, 3, 4} $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 脑电信号质量等级全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒<br/>0 表示未检测到佩戴，电极与皮肤接触不良<br/>1 表示检测到数据但没有有效脑电信号<br/>2 表示检测到脑电信号但信噪比较低，只显示波形而不进行计算<br/>3 表示检测到脑电信号质量正常，可进行正常计算<br/>4 表示检测到脑电信号质量很好，信噪比较高，计算结果更准确 |

### 心率报表分析返回值 {#heart-rate-report-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| hr | hr_avg | float | [0, +∞) | 心率平均值，单位：BPM |
|  | hr_max | float | [0, +∞) | 心率最大值，单位：BPM |
|  | hr_min | float | [0, +∞) | 心率最小值，单位：BPM |
|  | hr_rec | list[int] | [0, +∞) $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 心率值全程记录，单位：BPM<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | hrv_avg | float | [0, +∞) | 心率变异性平均值，单位：毫秒 |
|  | hrv_rec | list[float] | [0, +∞) $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 心率变异性全程记录，单位：毫秒<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |

### 单通道脑电报表分析返回值 {#single-channel-eeg-report-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| sceeg | eeg_alpha_curve<br/>eeg_beta_curve<br/>eeg_theta_curve<br/>eeg_delta_curve<br/>eeg_gamma_curve | list[float] | [0, 1] $\times$ n, (n≥20)（power_mode="rate"）<br/>[0, ∞) $\times$ n, (n≥20)（power_mode="db"）<br/>n 为 收到 subscribe 次数 | 脑电 α/β/θ/δ/γ 频段能量变化曲线<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | eeg_quality_rec | list[int] | {0, 1, 2, 3, 4} $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 脑电信号质量等级全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒<br/>0 表示未检测到佩戴，电极与皮肤接触不良<br/>1 表示检测到数据但没有有效脑电信号<br/>2 表示检测到脑电信号但信噪比较低，只显示波形而不进行计算<br/>3 表示检测到脑电信号质量正常，可进行正常计算<br/>4 表示检测到脑电信号质量很好，信噪比较高，计算结果更准确 |

### 压电压阻（ PEPR）报表分析返回值 {#pepr-report-analysis-returns}
| 服务 | 参数 | 类型 | 取值范围 | 说明 |
| --- | --- | --- | --- | --- |
| pepr | hr_avg | float | [0, +∞) | 心率平均值，单位：BPM |
|  | hr_max | float | [0, +∞) | 心率最大值，单位：BPM |
|  | hr_min | float | [0, +∞) | 心率最小值，单位：BPM |
|  | hr_rec | list[int] | [0, +∞) $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 心率值全程记录，单位：BPM<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | rr_avg | float | [0, +∞) | 呼吸率平均值，单位：次/分 |
|  | rr_rec | list[float] | [0, +∞) $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 呼吸率全程记录，单位：次/分<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | hrv_avg | float | [0, +∞) | 心率变异性平均值，单位：毫秒 |
|  | hrv_rec | list[float] | [0, +∞) $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 心率变异性全程记录，单位：毫秒<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒 |
|  | bcg_quality_rec | list[int] | {0, 1, 2} $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 脉搏波信号质量等级全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒<br/>0 表示未检测到佩戴/坐下<br/>1 表示检测到数据但没有有效信号<br/>2 表示检测到脉搏波信号质量良好 |
|  | rw_quality_rec | list[int] | {0, 1, 2} $\times$ n, (n≥20)<br/>n 为 收到 subscribe 次数 | 呼吸波信号质量等级全程记录<br/>横坐标点间间隔为 0.6 $\times$ upload_cycle 秒<br/>0 表示未检测到佩戴/坐下<br/>1 表示检测到数据但没有有效信号<br/>2 表示检测到呼吸波信号质量良好 |
