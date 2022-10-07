#include <stdio.h>
#include <time.h>

#define MSIZE 4

typedef union {
    unsigned char comp[MSIZE];
    unsigned int vect;
} vectorType;

typedef vectorType VectorArray[MSIZE];

void setInputMatrices(VectorArray, VectorArray);
void displayMatrix(VectorArray);
void multiMatrixSoft(VectorArray, VectorArray, VectorArray);
void mult(VectorArray, VectorArray, VectorArray);
void multiMatrixHard(VectorArray, VectorArray, VectorArray);

/* 1: create 3 global variables of type VectorArray */
VectorArray pInst[MSIZE];
VectorArray aInst[MSIZE];
VectorArray bInst[MSIZE];

/* 2: Implement a function called setInputMatrices that fills out the data structures */
void setInputMatrices(VectorArray *A, VectorArray *B) {
    int cnt = 1;
    for (int i = 0; i < MSIZE; i++) {
        for (int j = 0; j < MSIZE; j++) {
            A[i]->comp[j] = cnt;
            B[i]->comp[j] = i+1;
            cnt++;
        }
    }
}

/* 3: Implement a function called displayMatrix that displays a 4x4 matrix via the USB-UART interface */
void displayMatrix(VectorArray* input) {
    for (int i = 0; i < MSIZE; i++) {
        for (int j = 0; j < MSIZE; j++) {
            printf("%d ", input[i]->comp[j]);
        }
        printf("\n");
    }
    printf("\n");
}

/* 4: Implement a function called multiMatrixSoft that computes the 4x4 matrix product of the expr: P = A.B^T */
void multiMatrixSoft(VectorArray *A, VectorArray* B, VectorArray* P) {
    for (int i = 0; i < MSIZE; i++) {
        for (int j = 0; j < MSIZE; j++) {
            int p0 = A[i]->comp[0] * B[i+j]->comp[0];
            int p1 = A[i]->comp[1] * B[i+j]->comp[1];
            int p2 = A[i]->comp[2] * B[i+j]->comp[2];
            int p3 = A[i]->comp[3] * B[i+j]->comp[3]; 
            int p_ij = p0 + p1 + p2 + p3;
            P[i]->comp[j] = p_ij;
        }
    }
}

/* 5: Add a command called mult that multiplies AInst and BTinst matrices with the values
above. Display the result P and the execution time (in clock ticks) of the function
multiMatrixSoft in the USB UART windowS */
void mult(VectorArray* A, VectorArray* B, VectorArray* P) {
    for (int i = 0; i < MSIZE; i++) {
        for (int j = 0; j < MSIZE; j++) {
            int p0 = A[i]->comp[0];
            int p1 = A[i]->comp[1];
            int p2 = A[i]->comp[2];
            int p3 = A[i]->comp[3];
            int p_ij = (p0 + p1 + p2 + p3) * B[i + j]->comp[0];
            P[i]->comp[j] = p_ij;
        }
    }
}


int main() {
    clock_t start_t, end_t;
    double total_t;

    /* 2 */
    setInputMatrices(aInst, bInst);

    /* 3 */
    displayMatrix(aInst);
    displayMatrix(bInst);

    /* 4 */
    multiMatrixSoft(aInst, bInst, pInst);
    displayMatrix(pInst);

    /* 5 */
    start_t = clock();
    multiMatrixSoft(aInst, bInst, pInst);
    displayMatrix(pInst);
    end_t = clock();

    /* Compute and output execution time */
    total_t = (double)(end_t - start_t) / CLOCKS_PER_SEC;
    printf("Total time taken by CPU: %f\n", total_t);

    return 0;
}