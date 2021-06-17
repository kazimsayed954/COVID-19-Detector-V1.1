# COVID-19-Detector

![c](https://user-images.githubusercontent.com/44340485/91125475-725c1200-e6bf-11ea-8d2b-a030f44ddc70.jpg)


The following repo contained work implemented as by various contributors under PSoC i.e Programming Summer Of Code hosted by PClub, UIET, Panjab University.

**The aim of this project was to create a web application and a mobile app for detection of COVID through frontal Chest X-rays.**

---


## Project Motivation

A novel strain of coronavirus — SARS-CoV-2 — was first detected in December 2019 in Wuhan, a city in China’s Hubei province with a population of 11 million, after an outbreak of pneumonia without an obvious cause. The virus has now spread to over 200 countries and territories across the globe and was characterized as a pandemic by the World Health Organization. India coronavirus cases crossed the one million or the 10 lakh-mark.

---

#### The following tasks have been completed :

- [x] Deep Learning Model trained using Tensorflow API.
- [x] Android and iOS app created using Flutter and Deep Learning Model Deployed using TFlite along with feature of COVID tracker for India.
- [x] Android App created using Java.
- [x] Web Application created and Deployed using Flask.


---

## Setup : 

    git clone https://github.com/kazimsayed954/COVID-19-Detector-V1.1.git


For further using Components see the directory structure below and use Web Application or Mobile Application.

---
## Directory Structure

- The `main dataset` directory contains the dataset finalized for training the model.
- `COVID-19_Flutter` contains the flutter code for Android and iOS application.
- `COVID-19_Java` contained the Java code for another Application for COVID-Detector.

- `model` dir has three trained models along side their respective installation instructions.
    - `MobileNetV2_Ver1.0` contains the first trained model.
    - `MobileNetV2_Ver2.0` contrains the second trained model.
    - `covid_detector_model_3` contained 3rd trained model, it does not use MobilNetV2 hence the non descriptive name.


Please check the respective directories inside for their setup instructions present in their `README.md`.

The web application has been deployed inside `MobileNetV2_Ver2.0` directory. Please go through it's `README.md` for the same.



## Licensing and Acknowledgements

Dataset collected from -

1- [Dataset](https://github.com/ieee8023/covid-chestxray-dataset)

2 - [Kaggle for more images of Normal Cases](https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia)


Acknowledgements for App illustrations :

 - https://iconscout.com/icon-pack/coronavirus-covid19
 - https://iconscout.com/icon-pack/disease-2

---

## DISCLAIMER 

The work cannot be used in the field of medical science in anyway and we do not hold any responsibility for any mishappening.

## Demo
#### WEB Demo
![](https://github.com/kazimsayed954/COVID-19-Detector-V1.1/blob/demo/Demo/bandicam%202020-09-06%2011-23-38-293%20(online-video-cutter.com).gif)

#### Our valuable Contributor :
<a href="https://github.com/kazimsayed954/COVID-19-Detector-V1.1/graphs/contributors">
  <img src="https://contributors-img.web.app/image?repo=kazimsayed954/COVID-19-Detector-V1.1" />
</a>
