FROM arm32v7/buildpack-deps

# COPY Portus Portus
RUN git clone https://github.com/SUSE/Portus.git --depth=1
RUN apt-get update && apt-get install -y --no-install-recommends \
    ruby ruby-dev nodejs mysql-client postgresql-client sqlite3 libffi-dev \
    libxml2-dev git-core phantomjs &&
    cd Portus && gem install bundler --no-ri --no-rdoc -v 1.16.0 && \
    bundle install --retry=3
