import { Bucket } from "aws-cdk-lib/aws-s3";
import { Construct } from "constructs";

export const importRaspiCameraBucket = (scope: Construct): Bucket => {
    return Bucket.fromBucketArn(
        scope,
        "RaspiCameraBucket",
        "arn:aws:s3:::20250414-raspi-camera"
    ) as Bucket;
};
