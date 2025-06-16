' Copyright (c) 2025 Thomas Hugo Williams
' License MIT <https://opensource.org/licenses/MIT>
' For MMB4L v0.8

Option Base 0
Option Default None
Option Explicit Option

Const PATH = Mm.Info(Path)
Const ASSET_DIR = PATH + "assets"
Const DST_DIR = PATH + "converted"

Dim cmd$
Dim f$ = Dir$(ASSET_DIR + "/*.*", File)
Dim f_new$

If Not Mm.Info(Exists Dir DST_DIR) Then MkDir DST_DIR

Do While f$ <> ""
  If Right$(f$, 4) <> ".png" Then f$ = Dir$() : Continue Do
  If InStr(f$, "-small") Then f$ = Dir$() : Continue Do
  ? "Processing " + PATH + f$ + " ..."
  f_new$ = Left$(f$, Len(f$) - 4) + "-small.png"

  cmd$ = "convert " + ASSET_DIR + "/" + f$ + " -resize 240x160 " + DST_DIR + "/" + f_new$
  System cmd$

  f$ = Dir$()
Loop
