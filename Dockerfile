FROM alpine:latest as build

RUN apk add g++ make cmake libusb-dev && \
	\
	wget -qO- https://github.com/Benjamin-Dobell/Heimdall/archive/refs/tags/v1.4.2.tar.gz  | tar xvz && \
	mkdir /Heimdall-1.4.2/build && \
	cd /Heimdall-1.4.2/build && \
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -static" -DDISABLE_FRONTEND=1 .. && \
	make

#--------------------------------------------------------------------------------

FROM scratch

COPY --from=build /Heimdall-1.4.2/build/bin/heimdall /opt/heimdall/heimdall
ENV PATH=$PATH:/opt/heimdall

WORKDIR /fw

ENTRYPOINT ["heimdall"]
