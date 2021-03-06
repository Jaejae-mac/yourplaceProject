package com.yourplace.commons.awss3;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

import javax.imageio.ImageIO;

import org.json.simple.parser.ParseException;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.yourplace.commons.json.ReadJsonFile;

public class AwsS3 {
	private AmazonS3 s3Client;
	private String accessKey;
	private String secretKey;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "yourplacebuc";

	private AwsS3() {
		ReadJsonFile readJsonFile = new ReadJsonFile();
		try {
			List<String> keys = Arrays.asList("awsAccessKey","awsSecretKey");
			List<String> values = readJsonFile.parser(keys);
			accessKey = values.get(0);
			secretKey = values.get(1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		createS3Client();
	}

	// construct singleton pattern
	static private AwsS3 instance = null;

	public static AwsS3 getInstance() {
		if (instance == null) {
			return new AwsS3();
		} else {
			return instance;
		}
	}
	
	public List<Bucket> getBucketList(){
		return this.s3Client.listBuckets();
	}

	// create S3 Client
	private void createS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();
	}

	// ????????? ?????????.
	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	
	public void uploadBufferedImageToServer(BufferedImage image, String fileName, String imageType) throws IOException, NullPointerException {
		ByteArrayOutputStream outstream = new ByteArrayOutputStream();
		ImageIO.write(image, "png", outstream);
		byte[] buffer = outstream.toByteArray();
		InputStream is = new ByteArrayInputStream(buffer);
		ObjectMetadata meta = new ObjectMetadata();
		meta.setContentType("image/" + imageType);
		meta.setContentLength(buffer.length);
		uploadToS3(new PutObjectRequest(this.bucket, fileName, is, meta).withCannedAcl(CannedAccessControlList.PublicRead));
	}

	// For MultipartFile
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);
		uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
	}

	// PutObjectRequest ??? AWS S3 ????????? ???????????? ?????? ?????? ???????????? ?????? ???????????? ???????????? ??????.
	private void uploadToS3(PutObjectRequest putObjectRequest) {
		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ?????? ?????????
	public void copy(String orgKey, String copyKey) {
		try {
			// copy ?????? ??????.
			CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgKey, this.bucket, copyKey);
			// copy
			this.s3Client.copyObject(copyObjectRequest);

			System.out.println(String.format("Finish copying [%s] to [%s]", orgKey, copyKey));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}

	// ?????? ?????????
	public void delete(String key) {
		try {
			System.out.println("0");
			// Delete ?????? ??????.
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);
			System.out.println("0-1");
			// ??????.
			this.s3Client.deleteObject(deleteObjectRequest);
			System.out.println("0-2");

			System.out.println(String.format("[%s3] deletion complete", key));

		} catch (AmazonServiceException e) {
			System.out.println("1");
			e.printStackTrace();
		}catch (SdkClientException e) {
			System.out.println("2");
			e.printStackTrace();
		}
	}

}