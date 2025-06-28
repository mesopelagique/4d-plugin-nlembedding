//%attributes = {}
var $embeddings : Collection
var $vector : 4D:C1709.Vector

$embeddings:=nl_word_embedding("apple")
If (Asserted:C1132($embeddings#Null:C1517))
	$vector:=4D:C1709.Vector.new($embeddings)
End if 

$embeddings:=nl_word_embedding("pomme"; "fr")
If (Asserted:C1132($embeddings#Null:C1517))
	$vector:=4D:C1709.Vector.new($embeddings)
End if 

$embeddings:=nl_sentence_embedding("Pen Pineapple Apple Pen")
If (Asserted:C1132($embeddings#Null:C1517))
	$vector:=4D:C1709.Vector.new($embeddings)
End if 

$embeddings:=nl_sentence_embedding("Crayon Ananas Pomme Crayon"; "fr")
If (Asserted:C1132($embeddings#Null:C1517))
	$vector:=4D:C1709.Vector.new($embeddings)
End if 


// MARK: - errors

// no input
$embeddings:=nl_word_embedding()
ASSERT:C1129($embeddings=Null:C1517)

$embeddings:=nl_sentence_embedding()
ASSERT:C1129($embeddings=Null:C1517)

// bad language parameter
$embeddings:=nl_word_embedding("Crayon Ananas Pomme Crayon"; "badlg")
ASSERT:C1129($embeddings=Null:C1517)

$embeddings:=nl_sentence_embedding("Crayon Ananas Pomme Crayon"; "badlg")
ASSERT:C1129($embeddings=Null:C1517)

// wrong language
$embeddings:=nl_word_embedding("pomme"; "en")
ASSERT:C1129($embeddings=Null:C1517)