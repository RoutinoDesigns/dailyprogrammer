--write a program that can encrypt texts with an alphabetical caesar cipher.
--This cipher can ignore numbers, symbols, and whitespace.
--for extra credit, add a "decrypt" function to your program!

with Ada.Text_IO,ada.Integer_Text_IO, Ada.Strings.Unbounded,
     Ada.Text_IO.Unbounded_IO;

use  Ada.Text_IO,ada.Integer_Text_IO,Ada.Strings.Unbounded,
    Ada.Text_IO.Unbounded_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling;
use  Ada.Characters.Handling;


procedure challenge3v2 is

   EncryptedSentence:Unbounded_String;
   subtype Letter is Character
   with Static_Predicate => Letter in 'A' .. 'Z' | 'a' .. 'z';

   -- Subtype Uppercase is Character Range 'A'..'Z';
   -- Subtype Lowercase is Character Range 'a'..'z';

   function characterValue (toconvert:Character) return integer is
      ASCIIvalue:Integer;
   begin
      --  If toconvert in Uppercase or toconvert in Lowercase then

      if toconvert in Letter then
         ASCIIvalue:=Character'Pos(toconvert);

      end if;
      return ASCIIvalue;

   end characterValue;

   function encryptString(Key:in out Integer;Sentence:in out Unbounded_String) return Unbounded_String is


      ASCII_Of_CharacterInString:Integer;
      Temp_Unbounded_String : Unbounded_String;
   begin
      Put_Line("what is the sentence to encrypt");
      Sentence:= To_Unbounded_String(Ada.Text_IO.Get_Line);
      Put_Line("what is they key?");
      Get(Key);
      New_Line(1);
      for index in 1.. Length(Sentence) loop

         ASCII_Of_CharacterInString:=characterValue(Element(Sentence,Index));    -- use charactervalue function to convert character in Unbounded string to integer
         if ASCII_Of_CharacterInString+Key<97 then
            Append(Temp_Unbounded_String,  Character'Val( ASCII_Of_CharacterInString+Key+26));

         elsif ASCII_Of_CharacterInString+Key>122 then
            Append(Temp_Unbounded_String,  Character'Val( ASCII_Of_CharacterInString+Key-26));
         else
            Append(Temp_Unbounded_String,  Character'Val( ASCII_Of_CharacterInString+Key));
         end if;
      end loop;
      return Temp_Unbounded_String;

   end encryptString;
   function decryptString(Key:in out Integer;Sentence:in out Unbounded_String) return Unbounded_String is

      ASCII_Of_CharacterInString:Integer;
      Temp_Unbounded_String : Unbounded_String;
   begin
      Put_Line("what is the sentence to decrypt");
      Sentence:= To_Unbounded_String(Ada.Text_IO.Get_Line);
      Put_Line("what is they key?");
      Get(Key);
      New_Line(1);
      for index in 1.. Length(Sentence) loop

         ASCII_Of_CharacterInString:=characterValue(Element(Sentence,Index));    -- use charactervalue function to convert character in Unbounded string to integer
         if ASCII_Of_CharacterInString+Key<97 then
            Append(Temp_Unbounded_String,  Character'Val( ASCII_Of_CharacterInString-Key));
         end if;

         if ASCII_Of_CharacterInString+Key>122 then
            Append(Temp_Unbounded_String,  Character'Val( ASCII_Of_CharacterInString-Key));
         else
            Append(Temp_Unbounded_String,  Character'Val( ASCII_Of_CharacterInString-Key));
         end if;
      end loop;
      return Temp_Unbounded_String;

   end decryptString;
   Key:Integer;
   Sentence:Unbounded_String;

begin

   --   Put_Line(Integer'Image(characterValue('A')));
   Put_Line(encryptString(Key,Sentence));
   --Put_Line(decryptString(Key,Sentence));
   --encryptString(4,"hello");

end challenge3v2;
