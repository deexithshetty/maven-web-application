node{

def mavenHome = tool name: "maven3.8.6"
properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')), [$class: 'JobLocalConfiguration', changeReasonComment: ''], pipelineTriggers([pollSCM('* * * * *')])])

stage('CheckoutCode'){
git branch: 'development', credentialsId: 'GitHub Credentials', url: 'https://github.com/deexithshetty/maven-web-application.git'
}
stage('Build'){
sh "${mavenHome}/bin/mvn clean package"
}
stage('ExecuteSonarQuberepor'){
sh "${mavenHome}/bin/mvn clean sonar:sonar"
}
stage('UploadArtifactstoArticatoryRepo'){
sh "${mavenHome}/bin/mvn clean deploy"
}
stage('DeploytoTocatserver'){
sshagent(['75f6f989-2b9b-4f68-b8fd-b9df34053171']) {
sh "scp -o StrictHostKeyChecking=no target/maven-web-application.war ec2-user@172.31.34.16:/opt/apache-tomcat-9.0.65/webapps/"
}
}
}

