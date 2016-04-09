attributes = {
  packages: %w(
    wget
    build-essential
    curl
    git
    language-pack-ja
    libxslt1-dev
    libxml2-dev
    imagemagick
    libmagickwand-dev
    zlib1g-dev
    libfreetype6-dev
    liblcms1-dev
    libjpeg8-dev
    libevent-dev
    libev-dev
    libyaml-dev
    libffi-dev
    libtidy-dev
    libcurl4-openssl-dev
    libssl-dev
    libmemcached-dev
    wkhtmltopdf
    libv8-dev
    libjpeg-dev
    libpng12-dev
    python-pip
    gawk
    fonts-ipafont-gothic
  )
}

node.reverse_merge!(essentials: attributes)
