pipeline {
    agent {
        label 'testintegration'
//        docker {
//            image 'docker.io/manics/omero-build-gradle:latest'
//        }
    }

    environment {
        // Needed for Gradle, not sure why the slave doesn't handle this
        JAVA_HOME = '/usr/lib/jvm/jre-1.8.0-openjdk'

        // Default credentials for testing on devspace
        ARTIFACTORY_URL = 'http://nexus:8081/nexus/repository/maven-internal/'
        ARTIFACTORY_USER = 'admin'
        ARTIFACTORY_PASSWORD = 'admin123'

        // Fetch artifacts from this repository
        MVN_REPOSITORY_URL = 'http://nexus:8081/nexus/repository/maven-internal/'
    }

    stages {
        stage('Build') {
            steps {
                sh 'gradle publishToMavenLocal'
            }
        }
        stage('Deploy') {
            steps {
                sh 'gradle publish'
            }
        }
    }

    post {
        always {
            // Cleanup workspace
            deleteDir()
        }
    }
}
