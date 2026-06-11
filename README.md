# md-reader

A simple Ruby gem that opens Markdown files in your browser as formatted HTML.

## Installation

```bash
gem install md-reader
```

## Usage

```bash
md-reader README.md
```

That's it. The file opens in your default browser with GitHub-like styling.

## Features

- Fenced code blocks with syntax highlighting structure
- Tables, strikethrough, autolinks
- Blockquotes, footnotes
- Clean GitHub-inspired CSS — no external dependencies at runtime
- Temporary file is cleaned up automatically on exit

## Development

```bash
git clone https://github.com/italomatos/md-reader
cd md-reader
bundle install
bundle exec bin/md-reader test.md
```

## Contributing

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Commit your changes
4. Open a Pull Request

## License

MIT — see [LICENSE](LICENSE).
