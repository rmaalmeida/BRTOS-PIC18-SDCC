
#define MAX_DEPTH_TRACE 200
#define MAX_TRACE_LINE  10

#define DELAYTASK 0
#define SEMPEND   1
#define QUEUEPEND 2
#define MUTEXPEND 3 
#define SEMPOST   4
#define QUEUEPOST 5
#define MUTEXPOST 6
#define OS_IDLE   7

#define ISR_ONLY   1
#define ISR_TICK   2

void Update_OSTrace (INT8U task, INT8U syscall);
void Send_OSTrace(void);

#define OS_TICK_SHOW 1
#define OS_IDLE_SHOW 0

#define OS_TRACE_BY_TASK 1  

void Transmite_Uptime(void);
void Transmite_RAM_Ocupada(void);
void Transmite_Task_Stacks(void);
void Transmite_CPU_Load(void);
