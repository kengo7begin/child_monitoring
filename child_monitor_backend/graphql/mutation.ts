export const mutationAddPictureMetadata = `
  mutation AddPictureMetadata($id: ID!, $bucket: String!, $key: String!, $createdAt: AWSDateTime!) {
    addPictureMetadata(id: $id, bucket: $bucket, key: $key, createdAt: $createdAt) {
      id
      bucket
      key
      createdAt
    }
  }
`;