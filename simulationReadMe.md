Simulation files available here:

> https://bitbucket.org/gwynniebee/monica-repo/src/master/dev/simulation/?at=master

#Allocation Schemata

Users have been partitioned into two groups by minimizing the 
number of USPS zones between their addresses and their "home" warehouse.
The distribution of users between NY-OH is approximately 25%-75%.

We are currently comparing the following three allocation schemata:

1. BASE CASE

    Random 25-75 (assign snowflakes randomly 
    between NY-OH with a 25-75 distribution)

2. SKU

    For each SKU, allocate its snowflakes 25-75 between NY-OH.
    Partial garments are rounded in favor of Ohio 
    (resulting in a distribution of 18.5% NY - 81.5% OH)
    
3. Weighted Demand

    Split each SKU by the weighted demand ratio 
    between NY and OH users

#Input Files and Generation
Running an inventory simulation requires the following input files inside 
every simulation folder:

1.   Closets of users that have the simulated warehouse as their "home"
    ("1", in subfolder Closet)
2.   Users that have the simulated warehouse as their "home", and their 
    plan sizes
    ("UserPlan")
3.   Random distribution of cycle times for SKU return ("SKUReturnPlan")
4.   SKUs and their counts in the simulated warehouse ("SKUAvailability")

The source files for creating these inputs are the following, in the folder
"masterTemplates":

1.   userClosetPartition.sql : run query, save results into two different 
    files and remove warehouse desgination label
2.   userPlanPartition.sql : run query, save results into two different files 
    and remove warehouse designation label
3.   getSKUReturnPlan.py : run python file in terminal ('python 
    getSKUReturnPlan.py'), rename output file without .csv extension
4.   Every allocation schema has a separate query for SKUAvailability; save results 
    of query as separate file:
    * random-wh-allocation.sql
    * SKU-wh-allocation.sql
    * wd-wh-allocation.sql

#Creating Input and Output File Structure on S3
The simulation engine copies input files from Amazon S3, runs the 
simulation for one day, copies that output to Amazon S3, and then 
uses that output to run the following day (unless 
specifically instructed otherwise).

The simulation folders may be accessed on the web console by visting:

> https://console.aws.amazon.com/s3/home?region=us-east-1

> _dev_store > simulation_two_warehouse > 0

> If you do not have access and write permissions, please bother Prashant.

Every individual warehouse for every allocation schema must have
its own input and output folder. Since we are testing 3 schema 
and 2 warehouses we have the following 12 folders:

* random-ny-input
* random-ny-output
* random-oh-input
* random-oh-output
* sku-ny-input
* sku-ny-output
* sku-oh-input
* sku-oh-output
* wd-ny-input
* wd-ny-output
* wd-oh-input
* wd-oh-output

Every input folder contains: 

* a subfolder called Closet, containing file 1
* UserPlan
* SKUReturnPlan
* SKUAvailability

Output folders are empty until filled by the simulation engine.


#Properties Files
After creating the folder tree and uploading the input files, add the 
destination names to the properties files.

The properties files are the configuration files that direct 
the simulation engine. Properties files are in the propertiesFiles subfolder.
Every warehouse for every schema must have a properties file:

* random.ny.properties
* random.oh.properties
* sku.ny.properties
* sku.oh.properties
* wd.ny.properties
* wd.oh.properties

Upload properties files to the ec2 instance that runs the simulation, e.g.:

    scp random.ny.properties mq@simulation-allocation.gwynniebee.com:~

SSH into the ec2 instance and move the properties files into the 
trace manager folder:, e.g.

    ssh mq@simulation-allocation.gwynniebee.com
    sudo mv random.ny.properties /home/gb/conf/simulation-trace-manager

Access to ec2 is based on the SSH keys that have been uploaded to Chef,
please see here for more details:

> https://gwynniebee.atlassian.net/wiki/display/INFRA/How+to+get+an+account+to+login+to+our+systems

##Run file
The run file must have a shell script command for every simulation. 
The run file is located in the parent folder of the repository: 
run-two-warehouse.sh

Upload the run file to the shared folder on ec2:

    scp run-two-warehouse.sh mq@simulation-allocation.gwynniebee.com:/tmp

To run the simulation, log into ec2 and execute the file:

    . run-two-warehouse.sh

To watch the log during the simulation, execute the tail command:

    tail -f /logs/simulation-trace-manager-core.log

##Troubleshooting the Run

Each simulation has a Metadata file in its output folder upon successful completion. If the Metadata file does not exist after the run, then the simulation has an error.

Potential errors:

* ec2 instance does not have enough memory (ask TR to increase the box size)

* ec2 did not communicate with s3 correctly (run again and pray)

* relax4 module not found (ask dongming to push correct code)


##Download Results

Download results using s3cmd:

    s3cmd get s3://_dev_store/simulation-two-warehouse/0/wd-oh-output/2014/04/17/20140417-184123/AllocationTrace/ --recursive

Run python stats script to get results:

    python ~/monica-repo/dev/simulation/simulationStats.py



