DOCKERIMAGE=vognev/buster-builder
.DEFAULT_GOAL := qcow

builder:
	docker build -t $(DOCKERIMAGE) .

image: builder
	docker run -it --rm --privileged=true -e http_proxy -e https_proxy -v ${PWD}:/build -v /dev:/dev $(DOCKERIMAGE) /build/build.sh

qcow: image
	qemu-img convert -c -p -O qcow2 image.img image.qcow2

clean:
	rm -f image.img image.qcow2  || true
	docker rmi $(DOCKERIMAGE) || true

