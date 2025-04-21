import { S3Event } from "aws-lambda";
import { v4 as uuidv4 } from "uuid";
import fetch from "node-fetch";

const APPSYNC_API_URL = process.env.APPSYNC_API_URL!;
const APPSYNC_API_KEY = process.env.APPSYNC_API_KEY!;

const mutation = `
  mutation AddMetadata($id: ID!, $bucket: String!, $key: String!, $createdAt: AWSDateTime!) {
    addMetadata(id: $id, bucket: $bucket, key: $key, createdAt: $createdAt) {
      id
    }
  }
`;


export const handler = async (event: S3Event) => {
    for (const record of event.Records) {
        console.log("S3 Event received:", JSON.stringify(event, null, 2));
        const bucket = record.s3.bucket.name;
        const key = decodeURIComponent(record.s3.object.key.replace(/\+/g, " "));
        const createdAt = new Date().toISOString();
        const id = uuidv4();

        const variables = {
            id,
            bucket,
            key,
            createdAt,
        };

        try {
            const res = await fetch(APPSYNC_API_URL, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "x-api-key": APPSYNC_API_KEY,
                },
                body: JSON.stringify({
                    query: mutation,
                    variables,
                }),
            });

            const result = await res.json();
            console.log("GraphQL result:", result);
        } catch (err) {
            console.error("Error calling AppSync:", err);
        }
    }
};
