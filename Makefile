.PHONY: generate

# MicroFeature 모듈 생성
module:
	@echo ${name}
	@tuist scaffold module --name ${name}

