# COVID-19-Detector-V1.1

# Project Motivation

A novel strain of coronavirus — SARS-CoV-2 — was first detected in December 2019 in Wuhan, a city in China’s Hubei province with a population of 11 million, after an outbreak of pneumonia without an obvious cause. The virus has now spread to over 200 countries and territories across the globe and was characterized as a pandemic by the World Health Organization. India coronavirus cases crossed the one million or the 10 lakh-mark. 
The aim of this project is to create a web application and a mobile app for detection of COVID through frontal Chest X-rays.

# Local Installation 
1. Clone the Repo by going to your local Git Client and pushing in the command:</br>
`https://github.com/kazimsayed954/COVID-19-Detector-V1.1.git`
2. Open terminal and change the directory to models/MobileNetV2_Ver2.0 <br>
`cd/models/MobileNetV2_Ver2.0/`
3. Install the packages <br>
`pip install -r requirements.txt`
4. To run the program <br>
`python app.py`

# File Description

1 - Dataset created <br>
`COVID-19-Detector-V1.1/DataSet Creator.ipynb
`

2 - CNN Model <br>
`COVID-19-Detector-V1.1/Model/COVID_19_Detector.ipynb
`

> **To make a CNN Model we use 120 COVID Images and 120 Nomal Images.**


3 - tfllite file <br>
`COVID-19-Detector-V1.1/Model/covid_model.tflite
`

4 - lables <br>
`COVID-19-Detector-V1.1/Model/labels.txt
`

5 - Flutter Application <br>
`COVID-19-Detector-V1.1/App/covid/
`

# Licensing and Acknowledgements

Dataset collected from -

1- [GitHub for COVID cases](https://github.com/ieee8023/covid-chestxray-dataset)

2 - [Kaggle for Normal Cases](https://www.kaggle.com/paultimothymooney/chest-xray-pneumonia)

**3 - TO make a flutter app go through the official documentation.**

[Flutter App](https://flutter.dev/docs/get-started/install)
