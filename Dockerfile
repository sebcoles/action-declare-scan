FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS base

RUN cd /
# Install Declare
RUN curl -LO https://raw.githubusercontent.com/sebcoles/Veracode.OSS.Declare/master/scripts/get_latest.sh
RUN chmod +x ./get_latest.sh
RUN ./get_latest.sh
RUN rm get_latest.sh

# Install Declare Artifactory Provider
RUN curl -LO https://raw.githubusercontent.com/sebcoles/Veracode.OSS.Declare.Artifactory/main/scripts/get_latest.sh
RUN chmod +x ./get_latest.sh
RUN ./get_latest.sh
RUN rm get_latest.sh

RUN . ~/.bashrc && \
	echo $PATH > /etc/environment

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

