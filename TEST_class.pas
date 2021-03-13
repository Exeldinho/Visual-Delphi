unit TEST_class;

interface

uses
  Jpeg, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Contnrs, ExtCtrls;

type
  TMain = class(TForm)
    BtnCreate: TButton;
    BtnQuit: TButton;
    BtnCreate2: TButton;
    procedure BtnQuitClick(Sender: TObject);
    Procedure imgCreate(path:string; w:integer);
    procedure BtnCreateClick(Sender: TObject);
    procedure BtnCreate2Click(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure closeView(Sender: TObject);
    procedure BigSize();
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  Preview : TForm;
  LoadFrom: string;

implementation

{$R *.dfm}


Procedure TMain.imgCreate(Path:string; w:integer); //процедура створеня картинок
  var img: Timage;
begin
   img := Timage.create(Main);
   img.Parent:= Main;
   img.Picture.LoadFromFile(Path);
   img.Height:=193;
   img.Left:= w;
   img.Top:=32;
   img.Width:=255;
   img.Proportional:=true;
   img.AutoSize:=false;

   img.Visible:=true;
   img.OnClick:=ImageClick;
   end;

procedure TMain.BtnCreateClick(Sender: TObject);  //підвантажуємо 1 картинку
begin
 LoadFrom := 'c:\Lion.Jpeg';
 imgCreate(LoadFrom, 8);
end;

procedure TMain.BtnCreate2Click(Sender: TObject);  //підвантажуємо 2 картинку
begin
 LoadFrom := 'c:\car.Jpg';
 imgCreate(LoadFrom, 275);
end;


procedure TMain.ImageClick(Sender: TObject);  //визиваємо процедуру збільшення зоображення
 begin
  BigSize();
 end;

 procedure TMain.closeView(Sender: TObject);  //закриваємо збільшену картинку
 begin
   Preview.Hide;
 end;

procedure TMain.FormCreate(Sender: TObject);
begin
Preview := TForm.Create(Self);  //динамічно створюємо форму, в якій малюємо збільшену картинку
   Tform.Create(preview);
   Preview.Width:=800;
   Preview.Height:=800;
   Preview.Caption := ('Перегляд зоображення');
end;

procedure TMain.BigSize();  //для збільшення зоображення використовуємо форму Preview

var
  imgPr: Timage;
begin
 //Preview.Free;
   Preview.Show;

       imgPr := Timage.create(Main);
       imgPr.Parent:= Preview;

       imgPr.Picture.LoadFromFile(LoadFrom);

       imgPr.Align:=alClient;
       imgPr.Center:=true;
       imgPr.Stretch:=true;
       imgPr.Proportional:=true;
       imgPr.AutoSize:=true;
       imgPr.OnClick:= closeView;


    //imgPr.Picture.LoadFromClipboardFormat();
    //imgPr.Picture.LoadFromFile('c:\cat.jpg');
    //imgPr:=TImage(FindComponent('Image'));

    // imgPr.Picture:=Tmain.ClassName(TJPEGImage);
    //imgCreate(LoadFrom, 0);

    //imgPr:=TImage(FindComponent('Image'));
   end;


procedure TMain.BtnQuitClick(Sender: TObject);  //Вихід з програми
begin
  Application.Terminate;
end;

end.
