import os,jenkins,subprocess




def execCommand(cmd):
    subp=subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE)
    while subp.poll()==None:
        message = subp.stdout.readline()
        print message
    status =  subp.returncode
    if status == 0:
        return True
    else:
        return False


jenkinsParas = eval(os.getenv("jenkinsParas")) #{'jenkinsUrl':'http://10.10.10.10:9999','username':'admin','password':'admin','nodename':'slave1'}
server = jenkins.Jenkins(jenkinsParas['jenkinsUrl'], username=jenkinsParas['username'], password=jenkinsParas['password'])

params={
}
if not server.node_exists(jenkinsParas['nodename']):
    server.create_node(
        jenkinsParas['nodename'],
        nodeDescription='cloudwalk test slave',
        remoteFS='/root/',
        labels='cloudwalk',
        exclusive=True,
        launcher=jenkins.LAUNCHER_JNLP,
        launcher_params=params)

#server.disable_node(jenkinsParas['nodename'])
#server.enable_node(jenkinsParas['nodename'])
execCommand("nohup /opt/apache-tomcat-8.5.13/bin/startup.sh&")
status=execCommand("rm -rf slave*")
status=execCommand("wget " + jenkinsParas['jenkinsUrl'] + "/jnlpJars/slave.jar")
status=execCommand("java -jar slave.jar -jnlpUrl " + jenkinsParas['jenkinsUrl'] + "/computer/" + jenkinsParas['nodename'] + "/slave-agent.jnlp")
