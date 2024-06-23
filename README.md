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

Marcelo Viridiano, Arthur Lorenzi, Tiago Timponi Torrent, Ely E. Matos, Adriana S. Pagano, Natália Sathler Sigiliano, Maucha Gamonal, Helen de Andrade Abreu, Lívia Vicente Dutra, Mairon Samagaio, Mariane Carvalho, Franciany Campos, Gabrielly Azalim, Bruna Mazzei, Mateus Fonseca de Oliveira, Ana Carolina Luz, Livia Padua Ruiz, Júlia Bellei, Amanda Pestana, et al.. 2024. [Framed Multi30K: A Frame-Based Multimodal-Multilingual Dataset](https://aclanthology.org/2024.lrec-main.656/). In Proceedings of the 2024 Joint International Conference on Computational Linguistics, Language Resources and Evaluation (LREC-COLING 2024), pages 7438–7449, Torino, Italia. ELRA and ICCL.

```
@inproceedings{viridiano-etal-2024-framed-multi30k,
    title = "Framed {M}ulti30{K}: A Frame-Based Multimodal-Multilingual Dataset",
    author = "Viridiano, Marcelo  and
      Lorenzi, Arthur  and
      Timponi Torrent, Tiago  and
      Matos, Ely E.  and
      Pagano, Adriana S.  and
      Sathler Sigiliano, Nat{\'a}lia  and
      Gamonal, Maucha  and
      de Andrade Abreu, Helen  and
      Vicente Dutra, L{\'\i}via  and
      Samagaio, Mairon  and
      Carvalho, Mariane  and
      Campos, Franciany  and
      Azalim, Gabrielly  and
      Mazzei, Bruna  and
      Fonseca de Oliveira, Mateus  and
      Luz, Ana Carolina  and
      Padua Ruiz, Livia  and
      Bellei, J{\'u}lia  and
      Pestana, Amanda  and
      Costa, Josiane  and
      Rabelo, Iasmin  and
      Silva, Anna Beatriz  and
      Roza, Raquel  and
      Souza Mota, Mariana  and
      Oliveira, Igor  and
      Pelegrino de Freitas, M{\'a}rcio Henrique",
    editor = "Calzolari, Nicoletta  and
      Kan, Min-Yen  and
      Hoste, Veronique  and
      Lenci, Alessandro  and
      Sakti, Sakriani  and
      Xue, Nianwen",
    booktitle = "Proceedings of the 2024 Joint International Conference on Computational Linguistics, Language Resources and Evaluation (LREC-COLING 2024)",
    month = may,
    year = "2024",
    address = "Torino, Italia",
    publisher = "ELRA and ICCL",
    url = "https://aclanthology.org/2024.lrec-main.656",
    pages = "7438--7449",
    abstract = "This paper presents Framed Multi30K (FM30K), a novel frame-based Brazilian Portuguese multimodal-multilingual dataset which i) extends the Multi30K dataset (Elliot et al., 2016) with 158,915 original Brazilian Portuguese descriptions, and 30,104 Brazilian Portuguese translations from original English descriptions; and ii) adds 2,677,613 frame evocation labels to the 158,915 English descriptions and to the ones created for Brazilian Portuguese; (iii) extends the Flickr30k Entities dataset (Plummer et al., 2015) with 190,608 frames and Frame Elements correlations with the existing phrase-to-region correlations.",
}
```
