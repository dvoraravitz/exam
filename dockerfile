FROM python:3.8
WORKDIR /app
COPY requirements.txt .
COPY convert_image_to_pdf.py .
RUN apt update
RUN apt install -y curl
# download certificate
RUN curl -sL https://netfree.link/dl/unix-ca.sh | sh
# pip config
RUN pip config set global.cert /usr/lib/ssl/certs/ca-certificates.crt

RUN pip install -r requirements.txt

EXPOSE 80

ENTRYPOINT ["python", "convert_image_to_pdf.py"]
