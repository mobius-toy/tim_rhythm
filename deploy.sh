#!/bin/bash

# Tim Rhythm GitHub Pages 部署脚本
# 此脚本用于将 tim_rhythm_web 的构建产物复制到 tim_rhythm 仓库

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 项目路径
TIM_WORKSPACE="/Users/ddd/GitHub/tim_workspace"
TIM_RHYTHM_WEB="$TIM_WORKSPACE/tim_rhythm_web"
TIM_RHYTHM="$TIM_WORKSPACE/tim_rhythm"

echo -e "${GREEN}🚀 开始部署 Tim Rhythm 到 GitHub Pages${NC}"

# 检查项目路径是否存在
if [ ! -d "$TIM_RHYTHM_WEB" ]; then
    echo -e "${RED}❌ tim_rhythm_web 项目不存在: $TIM_RHYTHM_WEB${NC}"
    exit 1
fi

if [ ! -d "$TIM_RHYTHM" ]; then
    echo -e "${RED}❌ tim_rhythm 项目不存在: $TIM_RHYTHM${NC}"
    exit 1
fi

# 进入 tim_rhythm_web 项目
cd "$TIM_RHYTHM_WEB"

echo -e "${YELLOW}📦 构建 tim_rhythm_web 项目...${NC}"

# 安装依赖（如果需要）
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}📥 安装依赖...${NC}"
    npm install
fi

# 构建项目
echo -e "${YELLOW}🔨 运行构建命令...${NC}"
npm run build

# 检查构建产物是否存在
if [ ! -d "out" ]; then
    echo -e "${RED}❌ 构建产物不存在: out 目录未找到${NC}"
    exit 1
fi

echo -e "${GREEN}✅ tim_rhythm_web 构建完成${NC}"

# 进入 tim_rhythm 项目
cd "$TIM_RHYTHM"

echo -e "${YELLOW}📋 清理 tim_rhythm 项目...${NC}"

# 清理现有文件（保留 .git 目录）
find . -maxdepth 1 -not -name '.git' -not -name '.' -exec rm -rf {} +

echo -e "${YELLOW}📂 复制构建产物...${NC}"

# 复制构建产物
cp -r "$TIM_RHYTHM_WEB/out/"* .

echo -e "${GREEN}✅ 构建产物复制完成${NC}"

# 检查是否有文件需要提交
if [ -z "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}ℹ️  没有文件需要提交${NC}"
    exit 0
fi

# 添加所有文件
echo -e "${YELLOW}📝 添加文件到 Git...${NC}"
git add .

# 提交更改
COMMIT_MSG="Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
echo -e "${YELLOW}💾 提交更改: $COMMIT_MSG${NC}"
git commit -m "$COMMIT_MSG"

# 推送到远程仓库
echo -e "${YELLOW}🚀 推送到 GitHub...${NC}"
git push origin main

echo -e "${GREEN}🎉 部署完成！${NC}"
echo -e "${GREEN}🌐 访问地址: https://mobius-toy.github.io/tim_rhythm/${NC}"
