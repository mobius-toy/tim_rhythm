#!/bin/bash

# 简化的部署脚本 - 在 tim_rhythm_web 项目中运行
# 此脚本会调用 tim_rhythm 项目中的完整部署脚本

set -e

# 项目路径
TIM_WORKSPACE="/Users/ddd/GitHub/tim_workspace"
TIM_RHYTHM_DEPLOY="$TIM_WORKSPACE/tim_rhythm/deploy.sh"

echo "🚀 开始部署到 GitHub Pages..."

# 检查部署脚本是否存在
if [ ! -f "$TIM_RHYTHM_DEPLOY" ]; then
    echo "❌ 部署脚本不存在: $TIM_RHYTHM_DEPLOY"
    exit 1
fi

# 运行部署脚本
bash "$TIM_RHYTHM_DEPLOY"

echo "✅ 部署完成！"
