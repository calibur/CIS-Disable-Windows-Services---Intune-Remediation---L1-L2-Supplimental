# CIS - Disable Windows Services - Intune-Remediation - L1/L2/Supplemental

![PowerShell](https://img.shields.io/badge/Language-PowerShell-blue)
![Platform](https://img.shields.io/badge/Platform-Intune-lightgrey)
![Compliance](https://img.shields.io/badge/Compliance-CIS_L1%2FL2-green)
![Status](https://img.shields.io/badge/Status-Active-brightgreen)

> **TL;DR:** PowerShell scripts to harden Windows endpoints by disabling services for CIS Level 1, Level 2, compliance using Intune  Remediations.

Current scripts are made for v3.0.1 of the Windows 11 CIS baseline.

---

## 📜 Description

This repository provides detection and remediation scripts targeting unnecessary Windows services to improve system security.  
The scripts align with:

- **CIS Benchmarks Level 1** (basic security best practices)
- **CIS Benchmarks Level 2** (advanced hardening for sensitive environments)
- **Community-Recommended Supplemental** settings (optional hardening based on industry best practices)

---

## 📂 Structure

- `L1/` — Scripts following CIS Level 1 recommendations.
- `L2/` — Scripts following CIS Level 2 recommendations.
- `Supplemental/` — Scripts for additional hardening beyond CIS.

Each set includes:

- **Detection Script:** Checks if the service is incorrectly enabled.
- **Remediation Script:** Disables or configures the service as recommended.

These scripts are primarily intended for use with **Microsoft Intune Remediations**, but can be adapted for other endpoint management tools.

---
