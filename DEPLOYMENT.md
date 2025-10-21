# Tim Rhythm GitHub Pages 部署指南

## 项目概述

`tim_rhythm` 是 `tim_rhythm_web` 项目的构建产物仓库，专门用于 GitHub Pages 部署。

## 项目结构

```
tim_rhythm/
├── README.md              # 项目说明
├── .github-pages          # GitHub Pages 配置
├── .gitignore             # Git 忽略文件
├── deploy.sh              # 完整部署脚本
├── deploy-from-web.sh     # 简化部署脚本
└── index.html             # 临时首页（构建后会被替换）
```

## 部署流程

### 1. 自动部署（推荐）

在 `tim_rhythm_web` 项目中运行：

```bash
cd tim_rhythm_web
npm run deploy:github-pages
```

### 2. 手动部署

#### 方法一：使用完整脚本
```bash
cd tim_rhythm
./deploy.sh
```

#### 方法二：使用简化脚本
```bash
cd tim_rhythm_web
bash ../tim_rhythm/deploy-from-web.sh
```

## 部署步骤详解

1. **构建 tim_rhythm_web 项目**
   - 安装依赖（如果需要）
   - 运行 `npm run build`
   - 生成静态文件到 `out` 目录

2. **清理 tim_rhythm 项目**
   - 删除现有文件（保留 `.git` 目录）
   - 准备接收新的构建产物

3. **复制构建产物**
   - 将 `tim_rhythm_web/out/` 中的所有文件复制到 `tim_rhythm/`

4. **提交和推送**
   - 添加所有文件到 Git
   - 提交更改
   - 推送到 GitHub

## GitHub Pages 配置

### 仓库设置
- 仓库地址: `git@github.com:mobius-toy/tim_rhythm.git`
- 分支: `main`
- 源文件夹: `/ (root)`

### 访问地址
- GitHub Pages: https://mobius-toy.github.io/tim_rhythm/

## 注意事项

1. **构建产物**: 确保 `tim_rhythm_web` 项目已正确构建
2. **Git 配置**: 已配置用户信息（Marcus, heymarcusday@gmail.com）
3. **权限**: 确保有推送到 `mobius-toy/tim_rhythm` 仓库的权限
4. **网络**: 如遇网络问题，请使用代理设置

## 故障排除

### 常见问题

1. **构建失败**
   - 检查 `tim_rhythm_web` 项目依赖是否完整
   - 运行 `npm install` 安装依赖

2. **推送失败**
   - 检查 SSH 密钥配置
   - 确认仓库权限

3. **页面无法访问**
   - 检查 GitHub Pages 设置
   - 确认分支和源文件夹配置正确

### 代理设置

如遇网络问题，使用以下代理设置：

```bash
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
```

## 开发工作流

1. 在 `tim_rhythm_web` 中开发
2. 测试功能正常
3. 运行 `npm run deploy:github-pages`
4. 检查 GitHub Pages 部署结果

## 联系信息

- 开发者: Marcus
- 邮箱: heymarcusday@gmail.com
- 组织: mobius-toy
