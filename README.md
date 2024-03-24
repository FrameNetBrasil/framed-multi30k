# Framed Multi30k (FM30K)

This repo contains the scripts and data related to the Framed Multi30k (FM30K) dataset.

The dataset can be found in three different formats:
- Under [data/flickr30k](data/flickr30k) the new, original 158,915 descriptions for Flickr30k images in Brazilian Portuguese can be found in the same format used by Flickr30k to provide captions.
- The 31,014 translations of English captions from Flickr30k, align with translations from Multi30k can be found in [data/multi30k](data/multi30k). These sentences are already split into train, test and val sets aligned with Multi30k. The tokenized versions are also provided.
- Finally, for the frame annotated sentences and images, use the files in [data/framed30k](data/framed30k). Each part of the dataset is stored as [JSON Lines](https://jsonlines.org/) files.

## JSONL files

An example of how a line the JSON Lines looks like is:

```
{
  "sentenceId": 29643249,
  "flickr30kImageId": "1053116826.jpg",
  "flickr30kSentenceNumber": 5,
  "sentence": "Duas crianças estão rindo na grama.",
  "tokens": [ "Duas", "crianças", "estão", "rindo", "na", "grama", "." ],
  "frames": [
    {
      "id": "Cardinal_numbers",
      "span": [0, 0],
      "frameElements": [{ "id": "Entity", "span": [1, 1] }]
    },
    { "id": "People_by_age", "span": [1, 1], "frameElements": [] },
    ...
  ]
}
```

All files contain a reference to the original Flickr30k dataset either through ```flickr30kImageId``` (image) or the pair ```(flickr30kImageId, flickr30kSentenceNumber)``` (sentence). The ```span``` property of frames and frameElements represent the interval of tokens where that entity is realized in the sentence.

The Portuguese Original Captions ([PTO.jsonl.gz](data/framed30k/PTO.jsonl.gz)]) don't have ```flickr30kSentenceNumber``` set, only ```sentenceNumber``` to identify that sentence number for the image.

For [IMG.jsonl.gz](data/framed30k/IMG.jsonl.gz), two extra fields (```annotationCondition``` and ```flickr30kEntitiesObjectId```) are set. The first is used to tell whether annotators saw a caption for the image or not while annotating it. The second links the annotation to a Flickr30k Entities object.


## How to cite

We'll update the repo with the BibTex soon.