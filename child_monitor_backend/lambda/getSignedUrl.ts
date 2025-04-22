import { S3Client, GetObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";

const s3 = new S3Client({ region: process.env.AWS_REGION });
const BUCKET_NAME = process.env.BUCKET_NAME!;

export const handler = async (event: any) => {
    console.log("Received event:", JSON.stringify(event, null, 2));

    const keys: string[] = event.arguments.keys;

    try {
        const urls = await Promise.all(
            keys.map(async (key) => {
                const command = new GetObjectCommand({
                    Bucket: BUCKET_NAME,
                    Key: key,
                });

                return getSignedUrl(s3, command, { expiresIn: 3600 });
            })
        );

        return urls;
    } catch (err) {
        console.error(err);
        throw new Error("Failed to generate presigned URL");
    }
};
