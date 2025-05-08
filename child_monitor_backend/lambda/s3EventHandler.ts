import { S3Event } from "aws-lambda";
import { v4 as uuidv4 } from "uuid";
import fetch from "node-fetch";
import { mutationAddPictureMetadata } from "../graphql/mutation";
import { SignatureV4 } from "@aws-sdk/signature-v4";
import { defaultProvider } from "@aws-sdk/credential-provider-node";
import { HttpRequest } from "@aws-sdk/protocol-http";
import { Sha256 } from "@aws-crypto/sha256-js";

const APPSYNC_API_URL = process.env.APPSYNC_API_URL!;

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

        const endpoint = new URL(APPSYNC_API_URL);
        const signer = new SignatureV4({
            service: "appsync",
            region: "ap-northeast-1",
            credentials: defaultProvider(),
            sha256: Sha256,
        });

        const req = new HttpRequest({
            method: "POST",
            protocol: endpoint.protocol,
            hostname: endpoint.hostname,
            path: endpoint.pathname,
            headers: {
                "Content-Type": "application/json",
                host: endpoint.hostname,
            },
            body: JSON.stringify({
                query: mutationAddPictureMetadata,
                variables,
            }),
        });

        const signed = await signer.sign(req);

        try {
            const res = await fetch(APPSYNC_API_URL, {
                method: signed.method,
                headers: signed.headers as any,
                body: signed.body,
            });

            const result = await res.json();
            console.log("GraphQL result:", result);
        } catch (err) {
            console.error("Error calling AppSync:", err);
        }
    }
};
