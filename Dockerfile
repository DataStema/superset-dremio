FROM apache/superset AS builder

# Switching to root to install the required packages
USER root

# Install prerequisites for Dremio connector
RUN apt-get update && apt install -y unixodbc unixodbc-dev alien
ADD https://download.dremio.com/odbc-driver/dremio-odbc-LATEST.x86_64.rpm .
RUN alien -d dremio-odbc-LATEST.x86_64.rpm

FROM apache/superset

LABEL org.label-schema.author='DataStema'
LABEL org.label-schema.name='datastemalux/superset-dremio'
LABEL org.label-schema.description='Apache Superset with Dremio connector'

# Switching to root to install the required packages
USER root
COPY --from=builder dremio-odbc-LATEST.x86_64.deb .
RUN dpkg -i dremio-odbc-LATEST.x86_64.deb && rm dremio-odbc-LATEST.x86_64.deb

RUN pip install pyodbc

# Install SQLAlchemy Dremio connector
RUN pip install sqlalchemy_dremio

# Switching back to using the `superset` user
USER superset