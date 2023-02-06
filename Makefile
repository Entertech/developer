.PHONY: build update

export VERSION = 0.1.0

export REGISTRY = registry.cn-shanghai.aliyuncs.com/entertech
export REPO = https://gitee.com/lockeysama/developer.git
export BRANCH = main

_echo:
	@echo "Version: " ${VERSION}
	@echo "Registry: " ${REGISTRY}
	@echo "Project: " && pwd
	@echo "Git Branch: " && git branch | grep "*" | awk '{print $2}'
	@read -p "按任意键继续..."

update: build
	docker push ${REGISTRY}/developer:${VERSION}

updatex: _echo
	docker buildx build --platform linux/amd64 --push -t ${REGISTRY}/developer:${VERSION} .
