FROM summerwind/actions-runner:latest

# Switch to root to install packages
USER root

# Install GitHub CLI keyring
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Install basic tools and build essentials
RUN apt-get update && apt-get install -y \
    build-essential \
    gh \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Clean up
RUN rm -rf /var/lib/apt/lists/*

# Switch back to default runner user
USER runner
