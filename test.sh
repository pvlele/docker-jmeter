#!/bin/bash

plugin_file="plugins.txt"

if [ -s "$plugin_file" ]
then
    plugins=$(head -n 1 $plugin_file )
	echo "---- Installing plugin------"
	echo "${plugins}"
	echo  "----------------------------"
    sh /opt/jmeter/bin/PluginsManagerCMD.sh install $plugins > /dev/null 2>&1
else 
    echo "plugin installation not required"
    echo $plugin_file
fi

# Pass Jmeter parameters here
T_DIR=tests
user1="2"
user2="3"
duration="30"


R_DIR=${T_DIR}/report
rm -rf ${R_DIR} > /dev/null 2>&1
mkdir -p ${R_DIR}

/bin/rm -f ${T_DIR}/results.jtl ${T_DIR}/jmeter.log  > /dev/null 2>&1

sh /opt/jmeter/bin/jmeter.sh -Dlog_level.jmeter=DEBUG \
	-Juser1=${user1} -Juser2=${user2} -Jduration=${duration} \
	-n -t ${T_DIR}/sample.jmx -l ${T_DIR}/results.jtl -j ${T_DIR}/jmeter.log \
	-e -o ${R_DIR}

echo "==== jmeter.log location:  ${T_DIR}/jmeter.log ===="
# cat ${T_DIR}/jmeter.log

echo "==== JTL filre location: ${T_DIR}/test-plan.jtl ===="
# cat ${T_DIR}/test-plan.jtl

# echo "==== HTML Test Report ===="
echo "====HTML test report:  ${R_DIR}/index.html"
