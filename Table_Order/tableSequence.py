# open the input file and put each lines to 'lines' list.
try:
    with open('input.txt', 'r') as f:
        # Read and process the file
        lines = f.readlines()
        f.close()
except (IOError,FileNotFoundError):
    print("An error occurred while reading the file.")

# split each line based on ',' charactor combination and then
# store the resulting integers in a 'lst' list.
lst=[]
for i in lines:
    j=i.split(',')
    lst.append(int(j[0]))
    lst.append(int(j[1]))   

high_tsk = max(lst) # the maximum number of the tasks
tsk_list=[[] for i in range (high_tsk) ]

#to my convineant, I reduce each task number by 1, so that tasks are starting with index 0.
for i in range(len(lst)):
    lst[i]-=1

in_degre = [ 0 for i in range (high_tsk) ] # to store in degree of the each task
task_complete=[False for i in range (high_tsk)] # to indicate whether task is completed or not 

# tsk_list is a two dimentional list. the lists inside the list, stores task numbers that are related to i th task 
# where i th task is denoted by the interiour list number itself.  
for i in range (0,len(lst),2):
    tsk_list[lst[i]].append(lst[i+1])
    in_degre[lst[i+1]]+=1

#find 0 in degree elements. and mark them as completed. when coplete a task reduce the in degree of related other tasks. 
n=high_tsk
tsk_order=[]
while (n !=0 ):
    is_changed=False
    for i in range (high_tsk):
        if in_degre[i]==0 and not task_complete[i]:
            is_changed=True
            tsk_order.append(i+1)
            task_complete[i]=True
            n-=1
            for j in tsk_list[i]:
                in_degre[j]-=1
            break
    # if there are tasks that is forming a oop and cannot proceed , it is detected here. and exit the loop
    if (not is_changed):
        tsk_order=None
        break
    
# write the result into the output file
result=''
if tsk_order != None: 
    for i in range (len(tsk_order)-1):
        result+= "Table "+str(tsk_order[i])+'\n'
    result+="Table "+str(tsk_order[-1])
 
else:
    result="Failed to compute an entering order"

outputFile=open('tableSequence.txt','w')
outputFile.write(result)
outputFile.close()