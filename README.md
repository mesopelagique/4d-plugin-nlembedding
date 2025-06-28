# 4d-plugin-nlembedding

![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20&color=blue)

Convert text input to embedding using Apple [Natural Language](https://developer.apple.com/documentation/naturallanguage).

## Overview

This 4D plugin provides text embedding capabilities using Apple's Natural Language framework. It supports both word-level and sentence-level embeddings with multi-language support.

## Features

- **Word Embeddings**: Convert individual words into vector representations
- **Sentence Embeddings**: Convert entire sentences into vector representations  
- **Multi-language Support**: Support for different languages (English, French, etc.)
- **4D Vector Integration**: Results can be directly used with 4D.Vector class

## Commands

### nl_word_embedding

Converts a word into its embedding vector representation.

**Syntax:**

```4d
nl_word_embedding(word {; language}) -> Collection
```

**Parameters:**

- `word` (Text): The word to convert to embedding
- `language` (Text, optional): Language code (e.g., "en", "fr"). Defaults to English if not specified

**Returns:**

- Collection of numbers representing the word embedding vector
- Null if an error occurs

**Examples:**

```4d
// Basic word embedding (English)
$embeddings:=nl_word_embedding("apple")
If ($embeddings#Null)
    $vector:=4D.Vector.new($embeddings)
End if 

// Word embedding with language specification (French)
$embeddings:=nl_word_embedding("pomme"; "fr")
If ($embeddings#Null)
    $vector:=4D.Vector.new($embeddings)
End if 
```

### nl_sentence_embedding

Converts a sentence into its embedding vector representation.

**Syntax:**

```4d
nl_sentence_embedding(sentence {; language}) -> Collection
```

**Parameters:**

- `sentence` (Text): The sentence to convert to embedding
- `language` (Text, optional): Language code (e.g., "en", "fr"). Defaults to English if not specified

**Returns:**

- Collection of numbers representing the sentence embedding vector
- Null if an error occurs

**Examples:**

```4d
// Basic sentence embedding (English)
$embeddings:=nl_sentence_embedding("Pen Pineapple Apple Pen")
If ($embeddings#Null)
    $vector:=4D.Vector.new($embeddings)
End if 

// Sentence embedding with language specification (French)
$embeddings:=nl_sentence_embedding("Crayon Ananas Pomme Crayon"; "fr")
If ($embeddings#Null)
    $vector:=4D.Vector.new($embeddings)
End if 
```

## Error Handling

Both commands return `Null` in the following error cases:

- No input text provided
- Invalid language parameter
- Text doesn't match the specified language
- Internal processing errors

**Examples:**

```4d
// No input - returns Null
$embeddings:=nl_word_embedding()
ASSERT($embeddings=Null)

// Invalid language parameter - returns Null
$embeddings:=nl_word_embedding("apple"; "invalid_lang")
ASSERT($embeddings=Null)

// Wrong language for text - returns Null
$embeddings:=nl_word_embedding("pomme"; "en")  // French word with English language
ASSERT($embeddings=Null)
```

## Supported Languages

The plugin supports various languages through Apple's Natural Language framework. Common language codes include:

- `"en"` - English
- `"fr"` - French
- `"es"` - Spanish
- `"de"` - German
etc...

See [NLLanguage](https://developer.apple.com/documentation/naturallanguage/nllanguage?language=objc)

## Requirements

- macOS (Intel or Apple Silicon)
- 4D v20R10 or later for 4D.Vector
