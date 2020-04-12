--create a program that will ask the users name, age, and reddit username.
--have it tell them the information back, in the format:

--  your name is (blank), you are (blank) years old, and your username is (blank)

--for extra credit, have the program log this information in a file to be accessed late

with Ada.Text_IO,ada.Integer_Text_IO, Ada.Strings.Unbounded,
     Ada.Text_IO.Unbounded_IO;

use  Ada.Text_IO,ada.Integer_Text_IO,Ada.Strings.Unbounded,
    Ada.Text_IO.Unbounded_IO;

procedure challenge1 is
   Name,Username:Unbounded_String;
   Age:Positive range 1..130;
   File:File_Type;

begin

   Put_Line("what is your name?");
   Name:=To_Unbounded_String(Ada.Text_IO.Get_Line);
   Put_Line("what is your username?");
   Username:=To_Unbounded_String(Get_Line);
   Put_Line("what is your age?");
   Get(Age);

   begin
      Open(File ,Append_File,"userinfo.text");
   exception
      when Name_Error =>

         Create(File,Out_File,"userinfo.txt");
   end;
   Put_Line(File,"your name is" & Name &" you are " & Integer'Image(Age) &" years old, and your username is "
            & Username );
   close(File);

end challenge1;
