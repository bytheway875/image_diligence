# image_diligence
Some image due-diligence for blurriness and OCR.

## Getting Going

In order to install the gem mini_magick, you'll need to have imagemagick installed. If you don't already have it installed, you can install it using homebrew:

```brew install imagemagick```

The rtesseract gem uses rmagick by default, but on my local machine I already had mini_magick installed, so I used that instead. If you prefer rmagick, you can remove the code that designates mini_magick as the RTesseract processor.

## Running the Examples
```bundle exec irb```
```load './app.rb'```

For simplicities sake, I'm just puts-ing stuff to the console. Comment or uncomment code to focus on the data you're interested in.
