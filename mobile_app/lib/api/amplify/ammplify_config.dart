/// The AWS resources have been deleted, so this information is not usable for anything.
const amplifyConfig = '''{
  "auth": {
    "plugins": {
      "awsCognitoAuthPlugin": {
        "CognitoUserPool": {
          "Default": {
            "PoolId": "ap-northeast-1_KnRu3tBnu",
            "AppClientId": "4j7medp0et4vo3u5ie4hobdb8l",
            "Region": "ap-northeast-1"
          }
        },
        "Auth": {
          "Default": {
            "authenticationFlowType": "USER_SRP_AUTH",
            "socialProviders": [],
            "usernameAttributes": [],
            "signupAttributes": [
              "email"
            ],
            "passwordProtectionSettings": {
              "passwordPolicyMinLength": 8,
              "passwordPolicyCharacters": []
            },
            "mfaConfiguration": "OFF",
            "mfaTypes": [
              "SMS"
            ],
            "verificationMechanisms": [
              "EMAIL"
            ]
          }
        }
      }
    }
  },
  "api": {
    "plugins": {
      "awsAPIPlugin": {
        "child_monitoring": {
          "endpointType": "GraphQL",
          "endpoint": "https://cqw6ap65t5aznlpwgcngkgerv4.appsync-api.ap-northeast-1.amazonaws.com/graphql",
          "region": "ap-northeast-1",
          "authorizationType": "AMAZON_COGNITO_USER_POOLS"
        }
      }
    }
  }
}''';
