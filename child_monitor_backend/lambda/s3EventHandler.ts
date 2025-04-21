import { Handler, S3Event } from "aws-lambda";

export const handler: Handler<S3Event> = async (event) => {
    console.log("S3 Event received:", JSON.stringify(event, null, 2));

    for (const record of event.Records) {
        const bucket = record.s3.bucket.name;
        const key = record.s3.object.key;
        console.log(`New object added: s3://${bucket}/${key}`);
    }

    return;
};
