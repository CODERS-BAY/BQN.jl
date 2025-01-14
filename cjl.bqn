#! /usr/bin/env bqn

# Javascript/JSON formatting
L ← "["∾"]"∾˜(0<≠)◶⟨"",1↓·∾","⊸∾¨⟩ # Native list/array
T ← "("∾")"∾˜(0<≠)◶⟨"",1↓·∾","⊸∾¨⟩ # Native list/array
App ← {∾𝕨‿"("‿𝕩‿")"}          # Native list/array indexing
Ind ← {∾𝕨‿"["‿𝕩‿"]"}          # Native list/array indexing
Cat ← {∾𝕨‿".concat("‿𝕩‿")"}   # Native list/array concatenation (like ∾)
# Escape the special characters that appear in BQN sources.
Esc←{
  in ← (@+0‿9‿10‿13)∾"'"""    # Null, Tab, LF, CR, and quotes
  out ← "0tnr"                # Whitespace characters changed to letters
  i ← in⊐𝕩
  𝕩 ↩ i ⊏⟜out⌾((i<≠out)⊸/) 𝕩  # Replace
  ∾(i<≠in) /⟜"\"⊸∾¨ 𝕩         # Insert \
}⍟(0<≠)
Str ← "str("""∾Esc∾""")"˜     # A BQN string
Char ← "'"(∾∾⊣)Esc∘⥊          # A BQN character
F ← •Repr                     # Native format
FP ← ∞⊸=◶⟨∾⟜".0"⍟(¬·∨´".e"⊸∊)F,"Inf"⟩ # Format positive number
Num ← 0⊸≤◶⟨"-"∾FP∘|,FP⟩       # Format number

glyphs ← •Import "BQN/src/glyphs.bqn"
_getComp ← { (4+useInd) ↑ (𝕗 •Import "BQN/src/c.bqn"){𝔽} }
useInd ← "-i"≡⊑args←•args ⋄ args↓˜↩useInd
Comp ← ((<"runtime" App F)¨↕≠∾glyphs) glyphs _getComp ⊢
J ← ∾∾⟜(@+10)¨
Fconst ← ≡◶⟨@⊸≤◶{Num𝕩}‿Char, Str, ⊑⟩
Fout ← (≠↑⟨FP,Fconst,L =◶⟨FP,L(L FP¨)¨⟩¨,L ·FP¨2⊸↑,L FP¨⟩˙) {L𝕎¨𝕩}¨ ⊢
Long ← ∾ (≠↑1‿4/⟨"  "⊸∾⋄((@+10)∾" ,")⊸∾⟩˙) {𝕎𝕩}¨ ⊢
LFC ← {"quote ("∾𝕩∾") end"}∘Long∘Fout∘Comp

RT ← {
  src‿need‿inputs←𝕩•Import"BQN/src/pr.bqn"
  pr←"runtime_0"‿"provide"{(∾𝕨<⊸(<∘App⟜F¨)⟜(↕≠)¨𝕩)⊏˜(∾𝕩)⊐∾need}○((-1+1=𝕩)⊸↑)inputs
  {"quote ("∾𝕩∾") end"}∘Long Fout pr need _getComp src
}
CArg ← {Num↩π⊸=◶Num‿"float(π)" ⋄ J (¯5⊸↓∾𝕩˙)⌾⊑ •FLines "BQN/src/c.bqn"}
SVG ← {∾⟨"Modify←GetHighlights←⊢⋄"⟩∾ •FChars∘∾⟜".bqn"¨ "../svg"‿𝕩}

•Out (⊑"r"‿"r0"‿"r1"‿"c"‿"cc"‿"f"‿"e"‿"p"⊐⊏)◶⟨
  RT∘2, RT∘0, RT∘1
  {𝕩⋄LFC CArg "⟨"∾"⟩"«∾","⊸∾¨'"'(⊣∾∾˜)¨glyphs}
  {𝕩⋄LFC "{"∾"}"∾˜CArg"𝕩"}
  {𝕩⋄LFC •FChars "BQN/src/f.bqn"}
  {𝕩⋄LFC SVG "e"}
  {𝕩⋄LFC SVG "p"}
  ¯1 ↓ · J {"quote "∾𝕩∾" end"}∘T∘Fout∘Comp¨
⟩ args
