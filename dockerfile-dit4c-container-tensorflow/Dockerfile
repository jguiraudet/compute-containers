FROM jguiraudet/dit4c-container-jupyterlab:8.0-cudnn5-devel

# Ubuntu/Linux 64-bit, GPU enabled, Python 3.4
# Requires CUDA toolkit 8.0 and CuDNN v5. For other versions, see "Installing from sources" below.
RUN export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-0.12.0rc0-cp34-cp34m-linux_x86_64.whl &&\
	/opt/python/bin/pip3 install --upgrade $TF_BINARY_URL




