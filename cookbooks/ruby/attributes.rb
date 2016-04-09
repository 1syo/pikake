attributes = {
  default: 'ruby2.3.0',
  version: '2.3.0',
  packages: %w(
      ruby2.3
      libruby2.3
      ruby2.3-dev
      ruby-switch
    ),
  gems: %w(
      bundler
      rake
    )
}

node.reverse_merge!(ruby: attributes)
