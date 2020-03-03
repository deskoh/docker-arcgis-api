pipeline {
  agent { label 'docker' }

  parameters {
    string(name: 'API_VERSION', defaultValue: '4.X', description: 'ArcGIS JavaScript API version used to tag Docker image')
    string(name: 'API_URL', defaultValue: 'http://file.io/arcgis-api/arcgis_js_v4XX_api.zip', description: 'Download URL for ArcGIS JavaScript API')
  }

  environment {
    DOCKER_REGISTRY = 'docker.io'
    PUBLISH_DOCKER_REGISTRY = 'docker.io'
  }

  stages {
    stage('Download API') {
      steps {
        sh 'rm -rf arcgis*'
        sh "wget -O sdk.zip -nv ${params.API_URL}"
        sh 'unzip -q sdk.zip'
      }
    }
    stage('Build Image') {
      steps {
        script {
          withDockerRegistry([url: 'http://${PUBLISH_DOCKER_REGISTRY}', credentialsId: 'artifactory-jenkins']) {
            def image = docker.build(
              '${PUBLISH_DOCKER_REGISTRY}/deskoh/arcgis-api',
              "--build-arg ARCGIS_JS_ROOT=${API_URL.substring(API_URL.lastIndexOf('/'), API_URL.lastIndexOf('.'))}/arcgis_js_api/library/${API_VERSION} --build-arg BASE_REGISTRY=${DOCKER_REGISTRY} ."
            )
            image.push("${API_VERSION}")
          }
        }
      }
    }
  }
  post {
    always {
      sh 'git reset --hard HEAD'
      sh 'git clean -f -d'
    }
  }
}
