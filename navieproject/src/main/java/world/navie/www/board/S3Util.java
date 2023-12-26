package world.navie.www.board;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.awscore.exception.AwsServiceException;
import software.amazon.awssdk.core.exception.SdkClientException;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.core.waiters.WaiterResponse;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.HeadObjectRequest;
import software.amazon.awssdk.services.s3.model.HeadObjectResponse;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;
import software.amazon.awssdk.services.s3.waiters.S3Waiter;
import software.amazon.awssdk.services.secretsmanager.SecretsManagerClient;
import software.amazon.awssdk.services.secretsmanager.model.GetSecretValueRequest;
import software.amazon.awssdk.services.secretsmanager.model.GetSecretValueResponse;


public class S3Util { 
	
    private static final String BUCKET = "navie-bucket-board-save-web";
    
    // Secret Manager에서 자격 증명을 가져오는 메소드
	public static Map<String, String> getSecret() {
        String secretName = "MyS3Secret";
        Region region = Region.of("ap-northeast-2");

        // Create a Secrets Manager client
        SecretsManagerClient client = SecretsManagerClient.builder()
//        		.credentialsProvider(ProfileCredentialsProvider.create("s3_user")) // local test (credential)
                .region(region)
                .build();

        GetSecretValueRequest getSecretValueRequest = GetSecretValueRequest.builder()
                .secretId(secretName)
                .build();

        GetSecretValueResponse getSecretValueResponse = client.getSecretValue(getSecretValueRequest);

        String secret = getSecretValueResponse.secretString();

        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> secretMap = null;
        try {
            secretMap = mapper.readValue(secret, Map.class);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        	client.close();
        }
        return secretMap;
    }
  
	
    // S3에 파일을 업로드하는 메소드
	public static void uploadFile(String fileName, InputStream inputStream) 
						throws S3Exception, AwsServiceException, SdkClientException, IOException {
		
        Map<String, String> secretMap = getSecret();
        String accessKey = secretMap.get("AccessKey");
        String secretKey = secretMap.get("SecretKey");
        
		S3Client client = S3Client.builder()
									.region(Region.of("ap-northeast-2"))
									.credentialsProvider(StaticCredentialsProvider.create(
											AwsBasicCredentials.create(accessKey, secretKey)))
									.build();
		PutObjectRequest request = PutObjectRequest.builder()
													.bucket(BUCKET)
													.key(fileName)
													.acl("public-read")
													.build();
		client.putObject(request, RequestBody.fromInputStream(inputStream, inputStream.available()));
		
		S3Waiter waiter = client.waiter();
		HeadObjectRequest waitRequest = HeadObjectRequest.builder()
														.bucket(BUCKET)
														.key(fileName)
														.build();
		WaiterResponse<HeadObjectResponse> waitResponse =  waiter.waitUntilObjectExists(waitRequest);
		waitResponse.matched().response().ifPresent(x->{
			System.out.println("The file "+ fileName + "is now ready.");
		});
	}
}
