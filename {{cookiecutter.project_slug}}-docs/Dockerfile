# Use the official MkDocs Material image as a parent image
FROM squidfunk/mkdocs-material

# Set env vars
ENV TZ="America/New_York"
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Copy the dependencies file to the working directory
COPY pyproject.toml .

# Install any dependencies
RUN pip install -U pip && pip install --no-cache-dir .
