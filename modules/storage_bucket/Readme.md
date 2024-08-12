google_storage_bucket

Creates a new bucket in Google cloud storage service (GCS). Once a bucket has been created, its location can't be changed.

Cloud Storage is the Google Cloud platform’s object storage system. Objects here can be of any type, either files or large binary objects. These objects are organized into buckets. Please note that cloud storage is not a file system. A service that receives, stores, and retrieves files and objects. You can also access it from your VM.

1) name of bucket
2) Choose where to store your data (Multi-region,Dual-region,Region)
3) Choose a storage class for your data
    Set a default class(Default: 'STANDARD'):
    1) Standard:  has replaced Multi-Regional and Regional as the hot storage class in this form. This won't change your bucket's cost or behavior.
    2) Nearline: Best for backups and data accessed less than once a month
    3) Coldline: Best for disaster recovery and data accessed less than once a quarter
    4) Archive: Best for long-term digital preservation of data accessed less than once a year

4) Choose how to control access to objects


location: Specifies the geographical location of the bucket. This should be set to a specific region, dual-region, or multi-region.

location_type: If you want a dual-region or multi-region bucket, this should be specified correctly. It should be removed from the location attribute and set properly in the location_type attribute.

Single Region: E.g., us-central1
Dual Region: E.g., EU (Europe), US (United States)
Multi Region: E.g., asia, nam5

