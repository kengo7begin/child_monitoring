import { S3Client, GetObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";

const s3 = new S3Client({ region: process.env.AWS_REGION });
const BUCKET_NAME = process.env.BUCKET_NAME!;

export const handler = async (event: any) => {
    console.log("Received event:", JSON.stringify(event, null, 2));

    const key = event.arguments.key;

    try {
        const command = new GetObjectCommand({
            Bucket: BUCKET_NAME,
            Key: key,
        });

        const url = await getSignedUrl(s3, command, { expiresIn: 3600 }); // 1時間
        return url;
    } catch (err) {
        console.error(err);
        throw new Error("Failed to generate presigned URL");
    }
};
