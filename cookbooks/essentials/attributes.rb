attributes = {
  packages: %w(
    build-essential
    curl
    fonts-ipafont-gothic
    gawk
    git
    imagemagick
    language-pack-ja
    libcurl4-openssl-dev
    libev-dev
    libevent-dev
    libffi-dev
    libfreetype6-dev
    libjpeg-dev
    libjpeg8-dev
    liblcms1-dev
    libmagickwand-dev
    libmemcached-dev
    libpng12-dev
    libsqlite3-dev
    libssl-dev
    libtidy-dev
    libv8-dev
    libxml2-dev
    libxslt1-dev
    libyaml-dev
    python-pip
    sqlite3
    wget
    wkhtmltopdf
    zlib1g-dev
  )
}

node.reverse_merge!(essentials: attributes)
