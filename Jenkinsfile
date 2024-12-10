pipeline {
    agent any

    stages{
        stage("SSH-Test"){
            steps{
                script{
                    def remote = [:];
                remote.name = '192.168.62.11';
                remote.host = '192.168.62.11';
                remote.user = 'donkey';
                remote.password = 'donkey';
                remote.allowAnyHosts = true;

                sshCommand remote: remote, command: "./deploy-auth.sh"

              }
          }
      }
   }
}