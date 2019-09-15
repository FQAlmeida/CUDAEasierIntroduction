#include <math.h>
#include <iostream>

__global__ void add(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x +  threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i+=stride)
        y[i] = x[i] + y[i];
}

int main(void) {
    int n = 1 << 20;
    float *x;
    float *y;

    cudaMallocManaged(&x, n * sizeof(float));
    cudaMallocManaged(&y, n * sizeof(float));

    for (size_t i = 0; i < n; i++) {
        *(x + i) = 1.0f;
        *(y + i) = 2.0f;
    }

    int blockSize = 256;
    int numBlocks = (n + blockSize - 1) / blockSize;
    add<<<numBlocks, blockSize>>>(n, x, y);

    cudaDeviceSynchronize();

    float max_error = 0.0f;
    for (int i = 0; i < n; i++)
        max_error = fmax(max_error, fabs(y[i] - 3.0f));
    std::cout << "Max error: " << max_error << std::endl;

    cudaFree(x);
    cudaFree(y);

    return 0;
}