# Sunlight-test

This is a Docker Compose file that runs:

 * filippo.io/sunlight
 * minio
 * local dynamodb
 * certificate-transparency-go preloader

This setup copies an existing external log, using preloader, into a Sunlight
instance that is backed by a local minio.
