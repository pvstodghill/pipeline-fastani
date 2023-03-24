# -*- default-generic -*-

FROM pvstodghill/pvs-conda-base:latest

# File Author / Maintainer
MAINTAINER Paul Stodghill <paul.stodghill@usda.gov>

# Image meta-data
ENV PACKAGE pipeline-fastani

# Install more required packages
# RUN apt-get install --yes FIXME

# Install package(s)
ADD conda-setup.bash /tmp
RUN bash -x /tmp/conda-setup.bash -f

# Set up working environment
USER guest1000

# Default command - list the installed files
CMD find /opt/conda/pkgs/${PACKAGE}-${VERSION}-* -not -type d | sort
