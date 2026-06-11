# frozen_string_literal: true

require "redcarpet"
require "md_reader/version"

module MdReader
  class Converter
    MARKDOWN_EXTENSIONS = {
      fenced_code_blocks: true,
      tables: true,
      autolink: true,
      strikethrough: true,
      superscript: true,
      highlight: true,
      footnotes: true,
      no_intra_emphasis: true
    }.freeze

    def call(content, title = "Document")
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, with_toc_data: true)
      markdown = Redcarpet::Markdown.new(renderer, MARKDOWN_EXTENSIONS)
      body = markdown.render(content)
      html_template(body, title)
    end

    private

    def html_template(body, title)
      <<~HTML
        <!DOCTYPE html>
        <html lang="pt-BR">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>#{title}</title>
          <style>
            *, *::before, *::after { box-sizing: border-box; }

            body {
              font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif;
              font-size: 16px;
              line-height: 1.6;
              color: #24292e;
              background: #ffffff;
              max-width: 860px;
              margin: 0 auto;
              padding: 2rem 3rem;
            }

            h1, h2, h3, h4, h5, h6 {
              margin-top: 1.5rem;
              margin-bottom: 0.75rem;
              font-weight: 600;
              line-height: 1.25;
            }
            h1 { font-size: 2em; padding-bottom: 0.3em; border-bottom: 1px solid #eaecef; }
            h2 { font-size: 1.5em; padding-bottom: 0.3em; border-bottom: 1px solid #eaecef; }
            h3 { font-size: 1.25em; }
            h4 { font-size: 1em; }
            h5 { font-size: 0.875em; }
            h6 { font-size: 0.85em; color: #6a737d; }

            p { margin-top: 0; margin-bottom: 1rem; }

            a { color: #0366d6; text-decoration: none; }
            a:hover { text-decoration: underline; }

            code {
              font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, monospace;
              font-size: 85%;
              background: #f6f8fa;
              border-radius: 3px;
              padding: 0.2em 0.4em;
            }

            pre {
              background: #f6f8fa;
              border-radius: 6px;
              padding: 1rem;
              overflow: auto;
              line-height: 1.45;
              margin-bottom: 1rem;
            }
            pre code {
              background: transparent;
              padding: 0;
              font-size: 100%;
            }

            blockquote {
              margin: 0 0 1rem 0;
              padding: 0 1em;
              color: #6a737d;
              border-left: 0.25em solid #dfe2e5;
            }
            blockquote > p { margin-bottom: 0; }

            ul, ol {
              padding-left: 2em;
              margin-top: 0;
              margin-bottom: 1rem;
            }
            li + li { margin-top: 0.25rem; }

            table {
              border-collapse: collapse;
              width: 100%;
              margin-bottom: 1rem;
              overflow: auto;
              display: block;
            }
            table th {
              font-weight: 600;
              background: #f6f8fa;
            }
            table th, table td {
              padding: 6px 13px;
              border: 1px solid #dfe2e5;
            }
            table tr:nth-child(even) { background: #f6f8fa; }

            img { max-width: 100%; height: auto; }

            hr {
              height: 0.25em;
              padding: 0;
              margin: 1.5rem 0;
              background-color: #e1e4e8;
              border: 0;
            }

            mark { background: #fff3b8; border-radius: 2px; padding: 0.1em 0.2em; }
          </style>
        </head>
        <body>
          #{body}
        </body>
        </html>
      HTML
    end
  end
end
