function test_prim_0(only=nothing)
  cases = [
           (1, """0≡¯2+2"""),
           (1, """1e4≡5e3+5e3"""),
           (1, """'c'≡'a'+2"""),
           (1, """'a'≡¯2+'c'"""),
           (MethodError, """'a'+'c'"""),
           (MethodError, """F←-⋄f+2"""),
           (1, """¯∞≡1e6-∞"""),
           (1, """4≡-¯4"""),
           (1, """¯∞≡-∞"""),
           (1, """∞≡-¯∞"""),
           (1, """4≡9-5"""),
           (1, """@≡'a'-97"""),
           (1, """3≡'d'-'a'"""),
           (1, """'Q'≡'q'+'A'-'a'"""),
           (MethodError, """97-'a'"""),
           (InexactError, """@-1"""),
           (MethodError, """-'a'"""),
           (MethodError, """F←÷⋄-f"""),
           (1, """1.5≡3×0.5"""),
           (MethodError, """2×'a'"""),
           (1, """4≡÷0.25"""),
           (1, """∞≡÷0"""),
           (1, """0≡÷∞"""),
           (MethodError, """÷'b'"""),
           (MethodError, """F←√-⋄÷f"""),
           (1, """1≡⋆0"""),
           (1, """¯1≡¯1⋆5"""),
           (1, """1≡¯1⋆¯6"""),
           (MethodError, """⋆'π'"""),
           (MethodError, """'e'⋆'π'"""),
           (1, """3≡⌊3.9"""),
           (1, """¯4≡⌊¯3.9"""),
           (1, """∞≡⌊∞"""),
           (1, """¯∞≡⌊¯∞"""),
           (1, """¯1e30≡⌊¯1e30"""),
           (MethodError, """F←⌈⋄⌊f"""),
           (1, """1≡1=1"""),
           (1, """0≡¯1=∞"""),
           (1, """1≡'a'='a'"""),
           (1, """0≡'a'='A'"""),
           (1, """1≡{F←+⋄f=f}"""),
           (1, """1≡{a‿b←⟨+´,+´⟩⋄a=b}"""),
           (1, """0≡{_op←{𝕗}⋄op='o'}"""),
           (1, """0≡{F←{𝕩}⋄G←{𝕩}⋄f=g}"""),
           (1, """1≡{F←{𝕩}⋄f=f}"""),
           (1, """1≡1≤1"""),
           (1, """1≡¯∞≤¯1e3"""),
           (1, """0≡∞≤¯∞"""),
           (1, """1≡∞≤@"""),
           (1, """0≡'z'≤¯0.5"""),
           (1, """1≡'a'≤'a'"""),
           (1, """0≡'c'≤'a'"""),
           (MethodError, """F←+⋄G←-⋄f≤g"""),
           (1, """⟨⟩≡≢<2"""),
           (1, """⟨3⟩≡≢"abc" """),
           (1, """⟨2,3⟩≡≢>"abc"‿"fed" """),
           (1, """⟨2,3,4,5⟩≡≢2‿3‿4‿5⥊↕120"""),
           (1, """⟨6⟩≡≢⥊>"abc"‿"fed" """),
           (1, """"abc"≡0⊑"abc"‿"de" """),
           (1, """"de"≡1⊑"abc"‿"de" """),
           (1, """⟨⟩≡↕0"""),
           (1, """⟨0⟩≡↕1"""),
           (1, """⟨0,1,2,3,4,5,6⟩≡↕7"""),
           (1, """1≡!1"""),
           (1, """1≡'e'!1"""),
           (BQNError, """!0"""),
           (BQNError, """"error"!"abc" """),
  ]
  @testset "layer 0" begin run_testsuite(cases, only=only) end
end

function test_prim_1(only=nothing)
  cases = [
           (1, "3≡4>◶+‿-1"),
           (1, "3≡4⊢◶+‿-1"),
           (1, "3≡4 1◶+‿-1"),
           (1, "5≡4<◶+‿-1"),
           (1, "5≡4 0◶+‿-1"),
           (1, "1≡-⊘0 ¯1"),
           (1, "1≡¯1-⊘+2"),
           (1, """ "abc"≡⊢"abc" """),
           (1, """ ""≡3⊢"" """),
           (1, "⟨⟩≡⊣⟨⟩"),
           (1, """ "ab"≡"ab"⊣⟨⟩ """),
           (1, "4≡+˜2"),
           (1, "3≡1-˜4"),
           (1, "1≡-∘×¯6"),
           (1, "¯6≡2-∘×3"),
           (1, "1≡-○×¯7"),
           (1, "2≡5-○×¯7"),
           (1, "¯20≡1⊸-⊸×5"),
           (1, """ (0‿2+⌜0‿1)≡(>⟨"ab","cd"⟩)≢⊸⥊↕4 """),
           (1, "20≡×⟜(-⟜1)5"),
           (1, "4≡5+⟜×¯3"),
           (1, "7≡5+⟜2 ¯3"),
           (1, "2≡√4"),
           (1, "3≡3√27"),
           (MethodError, "√'x'"),
           (1, "6≡2∧3"),
           (1, "0≡¯2∧0"),
           (MethodError, "'a'∧¯1"),
           (1, "0.75≡∨˜0.5"),
           (1, "1.75≡2∨0.25"),
           (MethodError, "F←-⋄2∨f"),
           (1, "0≡¬1"),
           (1, "1≡¬0"),
           (1, "2≡¬¯1"),
           (MethodError, "¬'a'"),
           (1, "0≡3¬4"),
           (1, "2≡4¬3"),
           (1, "4≡5¬2"),
           (1, "5≡'g'¬'c'"),
           (1, "'b'≡'c'¬2"),
           (MethodError, "2¬'c'"),
           (MethodError, "F←{𝕩}⋄0¬f"),
           (1, "0≡|0"),
           (1, "5≡|¯5"),
           (1, "6≡|6"),
           (1, "∞≡|¯∞"),
           (MethodError, "F←+-⋄|f"),
           (1, "2≡3|8"),
           (1, "2≡3|¯7"),
           (1, "¯1≡¯3|8"),
           (MethodError, "26|'A'"),
           (1, """ "a"≡⥊<'a' """),
           (1, """ "abcd"≡⊑<"abcd" """),
           (1, "⟨⟩≡≢<⟨2,⟨3,4⟩⟩"),
           (1, "0≡4<2"),
           (1, "0≡5>5"),
           (1, "0≡3≥4"),
           (1, """ 0≡≠"" """),
           (1, """ 1≡≠"a" """),
           (1, "1≡≠'a'"),
           (1, """ 2≡≠"ab" """),
           (1, "25≡≠↕25"),
           (1, "1≡×5"),
           (1, "¯1≡×¯2.5"),
           (1, "3≡3⌊4"),
           (1, "¯3≡¯3⌊∞"),
           (1, "4≡3⌈4"),
           (1, "1≡1⌈¯1"),
           (1, "5≡⌈4.01"),
           (1, "⟨⟩≡≢'a'"),
           (1, "⟨⟩≡≢0"),
           (1, "⟨0⟩‿⟨1⟩‿⟨2⟩≡⥊¨↕3"),
           (1, """(↕6)≡⟜(≠¨)○(2‿3⊸⥊)⟨⟩‿"a"‿"ab"‿"abc"‿"abcd"‿"abcde"‿"abcdef" """),
           (1, "≡⟜(≠¨)4‿0‿2⥊↕0"),
           (1, "6≡+´↕4"),
           (1, """ (⊑≡⊣´)"a"‿2‿(3‿"d") """),
           (1, """ 0(⊑≡⊣´)"a"‿2‿(3‿"d") """),
           (1, """ (2⊸⊑≡⊢´)"a"‿2‿(3‿"d") """),
           (BQNError, """ ⊑"" """),
           (BQNError, "⊑2‿0⥊⟨⟩"),
           (1, """ 2(⊣≡⊢´)"a"‿2‿(3‿"d") """),
           (1, "7‿10≡+¨´⟨⟨2,3⟩,⟨5,7⟩⟩"),
           (BQNError, "+´11"),
           (BQNError, "-´<'a'"),
           (BQNError, """ ×´3‿1⥊"abc" """),
  ]
  @testset "layer 1" begin run_testsuite(cases, only=only) end
end

function test_prim_2(only=nothing)
  cases = [
           (1, """ ⟨⟩≡⟨⟩∾"" """),
           (1, """ "a"≡⟨⟩∾"a" """),
           (1, """ "a"≡"a"∾⟨⟩ """),
           (1, """ "aBCD"≡"a"∾"BCD" """),
           (1, """ ((+⌜˜≠¨)≡(≠¨∾⌜˜))""‿⟨2,3⟩‿"abcde" """),
           (1, """ (⥊⟜(↕×´)≡(×⟜4)⊸(+⌜)○↕´)3‿4 """),
           (1, """ (⥊⟜(↕×´)≡(×⟜4)⊸(+⌜)○↕´)0‿4 """),
           (1, """ (3‿2‿0⥊"")≡(3‿2⥊↕6)+⌜"" """),
           (1, """ (<-2)≡-¨2 """),
           (1, """ (<<2)≡<¨2 """),
           (1, """ ⟨1,⟨3,2,2‿2⥊⟨1,0,2,0⟩⟩,⟨5,4⟩⟩≡-⟨-1,⟨-3,-2,-¨2‿2⥊⟨1,0,2,0⟩⟩,⟨-5,-4⟩⟩ """),
           (1, """ 3(+¨≡+⌜)↕6 """),
           (BQNError, """ 2‿3⊢¨4‿5‿6 """),
           (BQNError, """ "abcd"-"a" """),
           (1, """ 3‿4‿5‿6‿6≡{𝕊⍟(×≡)⊸∾⟜⥊´𝕩}⟨2,1⟩+⟨⟨⟨⟨1,2⟩,3⟩,4⟩,5⟩ """),
           (1, """ 3‿2≡≢(↕3)(⊣×⊢⌜)↕2 """),
           (1, """ (<-4)≡-<4 """),
           (1, """ (<2)≡1+<1 """),
           (BQNError, """ (↕4)×(↕3)⊢⌜↕2 """),
           (1, """ (=¨⟜(⥊⟜(↕×´)3‿4)≡(↕4)=⌜˜4|⊢)1‿6‿8 """),
           (1, """ 0‿1≡+‿-=⊑⟨-⟩ """),
          ]
  @testset "layer 2" begin run_testsuite(cases, only=only) end
end

function test_prim_3(only=nothing)
  cases = [
           (1, """ 2≡⊑2 """),
           (1, """ 2≡⊑⟨2⟩ """),
           (1, """ "ab"≡⊑⟨"ab"⟩ """),
           (1, """ 0≡⊑↕20 """),
           (1, """ 4≡⊑3‿2‿1⥊4⥊⊸∾5⥊0 """),
           (1, """ 'c'≡2⊑"abcd" """),
           (1, """ 'c'≡¯2⊑"abcd" """),
           (1, """ 7≡7⊑↕10 """),
           (1, """ 7≡⟨7⟩⊑↕10 """),
           (1, """ 0≡¯10⊑↕10 """),
           (BoundsError, """ 10⊑↕10 """),
           (BoundsError, """ ¯11⊑↕10 """),
           (InexactError, """ 0.5⊑↕10 """),
           (BQNError, """ 'x'⊑↕10 """),
           (BQNError, """ ⟨⟩⊑↕10 """),
           (1, """ 21≡2‿¯3⊑(10×↕3)+⌜↕4 """),
           (BQNError, """ 2⊑3+⌜○↕4 """),
           (1, """ 21‿12‿03≡⟨2‿¯3,1‿2,0‿¯1⟩⊑(10×↕3)+⌜↕4 """),
           (BQNError, """ 21‿12‿03≡⟨2‿¯3‿0,1‿2,0‿¯1⟩⊑(10×↕3)+⌜↕4 """),
           (BQNError, """ ⟨2,⟨3⟩⟩⊑↕4 """),
           (BQNError, """ (<2)⊑↕4 """),
           (BQNError, """ (≍≍2)⊑↕4 """),
           (BQNError, """ ⟨≍1‿2⟩⊑↕5‿5 """),
           (1, """ "dfeb"≡(⥊¨-⟨3,1,2,5⟩)⊑"abcdef" """),
           (1, """ "abc"≡⟨⟩⊑<"abc" """),
           (1, """ 'a'≡⟨⟩⊑'a' """),
           (1, """ ⟨7,7‿7,7⟩≡⟨⟨⟩,⟨⟨⟩,⟨⟩⟩,⟨⟩⟩⊑<7 """),
           (1, """ ⟨7,⟨7,<7⟩⟩≡⟨⟨⟩,⟨⟨⟩,<⟨⟩⟩⟩⊑7 """),
           (1, """ "abcfab"≡⥊(↕2‿3)⊑5‿5⥊"abcdef" """),
           (1, """ "aedcaf"≡⥊(-↕2‿3)⊑5‿5⥊"abcdef" """),
           (BQNError, """ ↕@ """),
           (BQNError, """ ↕2.4 """),
           (BQNError, """ ↕<6 """),
           (BQNError, """ ↕≍2‿3 """),
           (BQNError, """ ↕¯1‿2 """),
           (1, """ (<6⥊0)(⊑≡<∘⊑∘⊢)(6⥊1)⥊5 """),
           (1, """ ¯6≡1‿0◶(2‿2⥊0‿0‿-‿0)6 """),
           (BQNError, """ -˙◶÷‿× 4 """),
           (1, """ ⟨3⟩≡⥊3 """),
           (1, """ (⟨⟩⊸⥊≡<)3 """),
           (1, """ ⟨3,3,3⟩≡3⥊3 """),
           (1, """ ⟨3,3,3⟩≡3<⊸⥊3 """),
           (BQNError, """ ¯3⥊3 """),
           (BQNError, """ 1.6‿2.5⥊↕4 """),
           (BQNError, """ (≍2‿3)⥊↕3 """),
           (BQNError, """ "     "≡5⥊"" """),
           (1, """ 6(⊢⌜≡∾○≢⥊⊢)○↕3 """),
           (1, """ (<≡↕)⟨⟩ """),
           (1, """ (↕∘⥊≡⥊¨∘↕)9 """),
           (1, """ ∧´(⟨∘⟩⊸⥊≡⥊)¨ ⟨4,↕4,↕2‿4⟩ """),
           (BQNError, """ 4‿∘⥊↕15 """),
           (1, """ 1‿2‿3‿0‿1≡⥊5‿⌽⥊↑‿4⥊3‿⌊⥊1+↕4 """),
           (1, """ ≡´⟨2‿⌽‿4,2‿3‿4⟩⥊¨<↕19 """),
           (1, """ ¬'a'≡<'a' """),
           (1, """ ¬"a"≡≍"a" """),
           (1, """ ¬⟨1,2,⟨4,4⟩,5⟩≡○(2‿2⊸⥊)⟨1,2,⟨3,4⟩,5⟩ """),
           (1, """ ¬2‿3‿4≡2‿3 """),
           (1, """ ¬1.001≡1.002 """),
           (1, """ 'a'≢2 """),
           (1, """ 2≢<2 """),
           (1, """ 2‿3≢2‿4 """),
           (1, """ 2‿3≢≍2‿3 """),
           (1, """ 0≡≡'a' """),
           (1, """ 1≡≡↕6 """),
           (1, """ 2≡≡↕2‿4 """),
           (1, """ 3≡≡<<<4 """),
           (1, """ (1¨≡-○≡˜⟜↕¨)⟨0,⟨⟩,⟨1⟩,2,⟨3,4⟩⟩ """),
           (1, """ 2≡≡⟨5,⟨'c',+,2⟩⟩ """),
           (1, """ 0≡≡⊑⟨-⟩ """),
  ]
  @testset "layer 3" begin run_testsuite(cases, only=only) end
end

function test_prim_4(only=nothing)
  cases = [
           (1, """ "a"≡⋈'a' """),
           (1, """ ({⟨𝕩⟩}≡⋈)'a'‿2 """),
           (1, """ "abc"‿1≡"abc"⋈1 """),
           (1, """ ⋈´⊸≡"ab" """),
           (1, """ ∧´≡⟜>¨⟨1,<'a',<∞,↕5,5‿3⥊2⟩ """),
           (1, """ 2‿3‿2≡≢>↕2‿3 """),
           (1, """ 2‿3≡>⟨<2,3⟩ """),
           (BQNError, """ >↕¨2‿3 """),
           (BQNError, """ >⟨⥊2,3⟩ """),
           (BQNError, """ >(≍⋈⊢)↕4 """),
           (1, """ ((4⥊2)⊸⥊≡(>2‿2⥊·<2‿2⥊⊢))"abcd" """),
           (1, """ (⊢≡>∘<)5‿3⥊↕15 """),
           (1, """ (⊢≡(><¨))5‿3⥊↕15 """),
           (1, """ (⥊≡≍)'a' """),
           (1, """ (⥊≡≍)<'a' """),
           (1, """ (1‿2⊸⥊≡≍)"ab" """),
           (1, """ 1‿2≡1≍2 """),
           (1, """ 2‿1(≍≡2‿2⥊∾)4‿3 """),
           (1, """ (≍⟜<≡≍˜)'a' """),
           (BQNError, """ 1‿0≍1‿2‿3 """),
           (BQNError, """ ≍⟜≍↕3 """),
           (BQNError, """ ⌽⎉1.1 ↕4 """),
           (BQNError, """ ⌽⎉'x' ↕4 """),
           (BQNError, """ ⌽⎉(<<0) ↕4 """),
           (BQNError, """ ⌽⎉≍ ↕4 """),
           (1, """ (≍˘˜⥊˘1‿5‿9)≡⌽⎉2⊸+⥊⟜(↕×´)3‿2‿1 """),
           (1, """ (<0)≡≡˘0 """),
           (1, """ (<1)≡≡˘<0 """),
           (1, """ (2⥊<<"ab") ≡ ⋈˜˘<"ab" """),
           (1, """ (3⥊0) ≡ {-}=˘↕3 """),
           (1, """ (↕4)(×⌜≡×⎉0‿2)↕5 """),
           (1, """ (↕4)(⋆˜⌜˜≡⋆⎉∞‿¯4)↕5 """),
           (1, """ (⟨2⟩⊸∾⍟(2‿2⥊0‿1‿1‿1)2‿3)≡≢¨≍⎉(⌊○=)⌜˜⟨↕3,2‿3⥊↕6⟩ """),
           (1, """ (2=⌜○↕3)≡(2‿4⥊"abc")≡⎉1(2‿3‿4⥊"abc") """),
           (1, """ ⟨0,0⟩≡(2‿4⥊"abc")≡⎉¯1(2‿3‿4⥊"abc") """),
           (BQNError, """ ⌽⚇2‿2.5 ↕3 """),
           (1, """ (-≡-⚇¯1)5 """),
           (1, """ ⟨5,⟨15,1⟩⟩≡+´⚇1⟨⟨3,2⟩,⟨⟨4,5,6⟩,⟨1⟩⟩⟩ """),
           (1, """ 5‿6‿15≡∾´+´⚇1⟨⟨0,1⟩,⟨⟨⟩⟩⟩⥊⊸∾⚇¯2‿1⟨⟨2,3⟩,⟨4,5,6⟩⟩ """),
           (1, """ (5⥊1)≡(↕5)=○=⚇0{≍} """),
           (BQNError, """ 2+⍟1‿'c'4 """),
           (BQNError, """ ⋆⍟1.5 2 """),
           (1, """ 4≡2+⍟¯1 6 """),
           (1, """ (2×↕7)≡2+⍟(¯3+↕7)6 """),
           (1, """ (3⌊↕5)≡{i←0⋄r←{i+↩1⋄1+𝕩}⍟(↕4)𝕩⋄r∾i}0 """),
           (1, """ (+⌜˜≡·>1+⍟⊢⊢)↕5 """),
           (1, """ 0‿1‿3‿6‿10≡+`↕5 """),
           (1, """ (-0‿1‿3‿6‿10)≡-`↕5 """),
           (1, """ ((0∾¨↕3)≍3⥊0)≡≡`↕2‿3 """),
           (1, """ ⟨⟩≡×`⟨⟩ """),
           (1, """ ≡⟜(!∘0`)3‿0‿2⥊"" """),
           (BQNError, """ +`4 """),
           (BQNError, """ +`<'c' """),
           (1, """ 2‿3‿5‿8‿12≡2+`↕5 """),
           (BQNError, """ 3‿4+`4+⌜○↕3 """),
           (1, """ (2⋆1‿2‿6×⌜0‿2)≡3‿4⋆`3+⌜○↕2 """),
  ]
  @testset "layer 4" begin run_testsuite(cases, only=only) end
end

function test_prim_5(only=nothing)
  cases = [
           (1, """ (<'a')≡⊏"abc" """),
           (BQNError, """ ⊏"" """),
           (1, """ "a"≡⊏⥊˘"abc" """),
           (BQNError, """ ⊏0‿3⥊"" """),
           (1, """ (<'c')≡2⊏"abc" """),
           (BoundsError, """ 3⊏"abc" """),
           (InexactError, """ 1.5⊏"abc" """),
           (BQNError, """ 'x'⊏"abc" """),
           (1, """ (<'c')≡¯1⊏"abc" """),
           (1, """ "ccc"≡2‿¯1‿2⊏"abc" """),
           (BQNError, """ ⟨⥊0,1⟩⊏≍"abc" """),
           (1, """ ((3-˜↕5)⊸⊏≡2⊸⌽)↕5‿2 """),
           (1, """ (0‿3⥊0)≡⟨⟩⊏2‿3⥊↕6 """),
           (1, """ ⟨3‿0,2‿1‿2⟩(×⟜5⊸+⌜´∘⊣≡⊏)⥊⟜(↕×´)6‿5 """),
           (BQNError, """ 0‿0<¨⊸⊏"abc" """),
           (1, """ (2‿0⥊0)≡⟨3‿¯1,⟨⟩⟩⊏4‿3⥊0 """),
           (InexactError, """ ⟨3‿¯∞,⟨⟩⟩⊏4‿3⥊0 """),
           (1, """ 5‿1(<⊸⊏≡⊏)↕6‿2 """),
           (BQNError, """ (≍≍<5‿1)⊏↕6‿2 """),
           (1, """ ⟨4‿0,1‿2‿3‿2‿1‿0⟩(+⌜´⊸(×⌜)≡⊏⟜(×⌜˜))+⌜˜↕5 """),
           (1, """ ∧´1=≡¨(<⟨⟩)(↑¨∾↓¨)⟨@,+,<@,↕3⟩ """),
           (1, """ "abc"≡3↑"abce" """),
           (1, """ "e"≡¯1↑"abce" """),
           (1, """ ""≡0↑"ab" """),
           (BQNError, """ 2.5↑"abce" """),
           (1, """ (<⟜3⊸×↕5)≡5↑↕3 """),
           (1, """ (6⥊0)≡¯6↑↕0 """),
           (1, """ (≍↕3)≡1↑2‿3⥊↕6 """),
           (1, """ (↑⟜4≡⥊⟜0)↕3 """),
           (1, """ (≍"abc")≡(<1)↑2‿3↑"abcd" """),
           (BQNError, """ 2‿'c'↑"abcd" """),
           (BQNError, """ (≍2‿3)↑"abcd" """),
           (1, """ (6⥊1)(↑≡⥊⟜⊑)2‿3⥊↕6 """),
           (1, """ (↕¨∘↕∘(1⊸+)≡↑∘↕)5 """),
           (1, """ (↑≡((↕4)≍¨2)⥊¨<)3‿2⥊"abcdef" """),
           (1, """ "d"≡3↓"abcd" """),
           (InexactError, """ 0.1↓"abcd" """),
           (BQNError, """ ⟨∘⟩↓"abcd" """),
           (1, """ 1‿2≡⟜(¯3⊸↓)○↕4‿2 """),
           (1, """ 1‿1‿3‿2‿1≡≢(5⥊0)↓↕3‿2‿1 """),
           (1, """ (↓∘↕≡↕∘(1⊸+)+⟜⌽↑∘↕)5 """),
           (1, """ (↕3‿4)≡1↓¨⊏↕2‿3‿4 """),
           (1, """ (4+⌜○↕2)≡2↕↕5 """),
           (BQNError, """ @↕↕5 """),
           (BQNError, """ 2‿1↕↕5 """),
           (BQNError, """ ¯1↕↕5 """),
           (BQNError, """ 7↕↕5 """),
           (1, """ ⟨⟩(↕≡⊢)4‿3⥊"abcd" """),
           (1, """ (0⊸↕≡(0≍˜1+≠)⊸⥊)↕6 """),
           (1, """ (7↕6‿0⥊"")≡0‿7‿0⥊"" """),
           (BQNError, """ 'a'«'b' """),
           (BQNError, """ "a"»'b' """),
           (BQNError, """ ≍⊸»"abc" """),
           (1, """ (»˜⊸≡∧«˜⊸≡)"" """),
           (1, """ "a"≡⟨⟩»"a" """),
           (1, """ ⟨⟩≡"a"»⟨⟩ """),
           (1, """ "aBC"≡"a"»"BCD" """),
           (1, """ "CDa"≡"a"«"BCD" """),
           (1, """ "d"≡"abcd"«⟨4⟩ """),
           (1, """ ((⊢⌜˜≠¨)≡(≠¨«⌜˜))""‿⟨2,3⟩‿"abcde" """),
           (1, """ "Zcab"≡"WXYZ"«´"ab"‿"c"‿"" """),
           (1, """ "dab"≡'d'»"abc" """),
           (1, """ "dab"≡'d'<⊸»"abc" """),
           (1, """ (1⊸⌽≡⊏⊸«)'a'+⥊⟜(↕×´)4‿2 """),
           (1, """ ¯2(⌽≡↑»⊢)'a'+⥊⟜(↕×´)4‿2 """),
           (1, """ 6(↑≡»⟜(⥊⟜0)˜)↕4 """),
           (1, """ «˜⊸≡2‿3⥊"abcdef" """),
           (1, """ (»≡0⌈-⟜1)↕6 """),
           (1, """ («≡1⊸⌽)↕6 """),
           (1, """ (»≡0⌈-⟜2)⥊⟜(↕×´)5‿2 """),
           (1, """ («≡1⌽1⊸<⊸×)⥊⟜(↕×´)5‿2 """),
           (BQNError, """ ⌽'a' """),
           (BQNError, """ ⌽<∞ """),
           (1, """ ≡⟜⌽⟨⟩ """),
           (1, """ ≡⟜⌽"a" """),
           (1, """ "ba"≡⟜⌽"ab" """),
           (1, """ (⌽≡(1-˜≠)(-○⊑∾1↓⊢)⚇1⊢)↕3‿2‿4 """),
           (1, """ ≡⟜⌽↕↕3 """),
           (BQNError, """ 2⌽'a' """),
           (BQNError, """ 1‿2⌽↕4 """),
           (BQNError, """ ⌽‿2⌽3+⌜○↕4 """),
           (BQNError, """ (<<3)⌽↕4 """),
           (1, """ ∧´5(⌽≡⊢)¨⟨"",⥊∞,↕5,↕0‿4,2‿0‿3⥊""⟩ """),
           (1, """ ∧´("bcdea"≡⌽⟜"abcde")¨1+5×¯10‿¯2‿¯1‿0‿1‿6‿61 """),
           (1, """ ∧´⟨1,0‿2,¯1‿1‿3⟩(⊑∘⌽≡(3⊸↑)⊸⊑)⚇¯1‿∞ 2‿3‿5⥊"abcdef" """),
           (1, """ (⟨⟩⊸⌽≡<)'a' """),
           (BQNError, """ /2 """),
           (BQNError, """ /1‿¯1‿0 """),
           (BQNError, """ /=⌜˜↕2 """),
           (1, """ 0‿4≡/1‿0‿0‿0‿1‿0 """),
           (1, """ 1‿1‿2≡/0‿2‿1 """),
           (1, """ ≡⟜/⟨⟩ """),
           (BQNError, """ 2/<2 """),
           (BQNError, """ 0‿1/"abc" """),
           (BQNError, """ ⟨↕3,↕3⟩/"abc" """),
           (BQNError, """ 1‿2/○≍"ab" """),
           (BQNError, """ ¯1‿2/"ab" """),
           (1, """ "aabbcc"≡2/"abc" """),
           (1, """ ""≡4/"" """),
           (1, """ (6‿0⥊"")≡⟨5,1⟩‿⟨⟩/2‿0⥊"" """),
           (1, """ 3‿3‿3‿2‿2‿1≡/˜3‿2‿1 """),
           (1, """ 3‿3‿3‿2‿2‿1≡<⊸/3‿2‿1 """),
           (1, """ (≍1∾¨1‿2‿2)≡(↕¨/↕)2‿3 """),
           (1, """ (⟨⟩⊸/≡<)'a' """),
           (1, """ ⟨⟩(/≡⊢)↕10 """),
           (1, """ ⟨⟩(/≡⊢)≍"ab" """),
           (1, """ ⟨2,<3⟩(/≡⥊˜¨⟜≢/⊢)'a'+4‿2⥊↕8 """),
  ]
  @testset "layer 5" begin run_testsuite(cases, only=only) end
end

function test_prim_6(only=nothing)
  cases = [
           (BQNError, """ ∾'c' """),
           (1, """ ≡⟜(∾⥊¨)"abc" """),
           (1, """ (∾´≡∾)"ab"‿"cde"‿"" """),
           (BQNError, """ ∾"abc" """),
           (BQNError, """ ∾≍"ab"‿"cde"‿"" """),
           (1, """ "abc"≡∾"ab"‿'c'‿"" """),
           (1, """ 1‿2‿3‿4‿6‿9≡∾(⊢×≠↑↓)1+↕3 """),
           (1, """ (≡⟜∾∧≡⟜(∾<))<4 """),
           (1, """ ⟨1‿4,⥊2⟩((∾⋆⌜⌜)≡⋆⌜○∾)⟨2‿3‿4,⟨⟩,⥊5⟩ """),
           (1, """ (6‿3⥊0)≡∾⟨2‿3,3,3‿3⟩⥊¨0 """),
           (BQNError, """ ∾⟨2‿3,1‿3,2‿2⟩⥊¨0 """),
           (1, """ "abcd"≡"abc"∾'d' """),
           (1, """ "abcd"≡"abc"∾<'d' """),
           (1, """ (↕4‿3)≡(↕3‿3)∾3∾¨↕3 """),
           (1, """ (∾˜≡·¯1⊸(×´∘↓∾↑)∘≢⊸⥊≍˜)2‿3⥊"abcdef" """),
           (1, """ (∾´≡∾)⟨3‿2‿1,0‿2‿1⟩⥊¨<↕6 """),
           (BQNError, """ 'a'∾≍"abc" """),
           (ArgumentError, """ "ab"∾○≍"cde" """),
           (ArgumentError, """ (2‿3⥊↕6)∾↕2 """),
           (1, """ ⟨1‿2,⥊0,⥊3⟩≡⊔1‿0‿0‿2 """),
           (1, """ ⟨⟩≡⊔5⥊¯1 """),
           (1, """ ≡⟜⊔⟨⟩ """),
           (BQNError, """ ⊔3 """),
           (BQNError, """ ⊔<3 """),
           (BQNError, """ ⊔≍↕3 """),
           (BQNError, """ ⊔1.5‿0‿2 """),
           (BQNError, """ ⊔1‿¯2 """),
           (1, """ (⊔≡⥊¨¨∘⊔∘⊑)⟨1‿0‿0‿2⟩ """),
           (1, """ (≍⍟2∘<¨⌽↕3‿2)≡⊔⟨2‿1‿0,0‿1⟩ """),
           (1, """ (↕0‿0)≡⊔⟨⟩‿⟨⟩ """),
           (1, """ (⊔≡·≍⍟2∘<·∾⌜´/∘(0⊸=)¨)⟨0‿¯1‿0‿0,¯1‿0‿0⟩ """),
           (1, """ (0‿0‿1↑⌜≍⍟2∘<∘⥊¨1‿0)≡⊔⟨2,1‿0⟩ """),
           (1, """ (0‿0‿1↑⌜≍⍟2∘(<0‿0‿0⊸∾)¨1‿0)≡⊔0‿0⊸↓¨⟨2,1‿0⟩ """),
           (1, """ 4‿3‿2(⋈≡·(≠¨⋈∾)/⊸⊔)"abcdefghi" """),
           (1, """ ⟨⟩≡(3⥊¯1)⊔"abc" """),
           (1, """ ⟨⟩≡(2⥊¯1)⊔"a" """),
           (BQNError, """ ⊔˜'a'‿1‿0 """),
           (BQNError, """ 4⊔○↕2 """),
           (1, """ (≍˘1‿1‿4<∘⥊⎉1 16‿4+⌜↕4)≡2↓⟨3‿2,¯1‿0‿¯1⟩⊔2‿3‿4⥊↕24 """),
           (1, """ ⥊⚇0⊸≡○⊔⟜(⥊<)1‿2‿2‿¯1‿0 """),
           (1, """ (∾↕¨∘≢⊸⊔)⊸≡ 3‿2‿4⥊↕24 """),
           (1, """ -⟜'a'⊸(⊔≡⊔○⥊)"acc"≍"bac" """),
           (1, """ (2‿1/⟨↕0‿1,1‿1⥊3⟩)≡2⊔⥊3 """),
           (1, """ ((<=·↕1⊸+)≡·≢¨<¨⊸⊔⟜(<@))2‿1‿3 """),
           (BQNError, """ ⟨1‿2,3‿1⟩⊔2‿3⥊0 """),
           (BQNError, """ ⟨1‿2,3‿4‿5,6‿7⟩⊔2‿3⥊0 """),
           (BQNError, """ ≍⊸⊔≍˘↕3 """),
           (BQNError, """ ⟨⟨<3,2⟩,¯1‿0‿¯1⟩⊔2‿3‿4⥊↕24 """),
           (1, """ (1‿3/⟨"a",""⟩)≡0‿¯1‿4⊔"ab" """),
           (1, """ ¯1⊸↓⊸(≡○(⊔⟜"ab"))2‿3‿1 """),
           (1, """ (≍1‿1‿0≍∘/⟜≍¨"bac")≡⟨0,1‿0‿3⟩⊔"ab" """),
           (1, """ (⌽˘≡·∾⟨2‿2,1‿0‿1⟩⊸⊔)"ab"≍"cd" """),
           (BQNError, """ (2‿3⥊↕4)⊔↕2‿2 """),
           (BQNError, """ (3‿3⥊↕4)⊔↕2‿2 """),
           (BQNError, """ ⊐˜'a' """),
           (BQNError, """ ⊏⊸⊐"abc" """),
           (BQNError, """ (3‿2‿4⥊0)⊐4⥊1 """),
           (1, """ 2‿0‿4≡"abcd"⊐"cae" """),
           (1, """ ⟨1⟩≡"abcd"⊐"b" """),
           (1, """ (<2)≡"cdef"⊐'e' """),
           (1, """ (<3)≡⊐⟜(3⊸⊏)"abcd" """),
           (1, """ (5⌊3+↕5)≡⊐⟜(3‿0‿0+⚇1⊢)↕5‿2‿1 """),
           (BQNError, """ ⊐+˙@ """),
           (1, """ 0‿0‿1‿0‿2≡⊐"ccacb" """),
           (1, """ 0‿0‿1‿0‿2≡⊐≍˜˘"ccacb" """),
           (1, """ ≡⟜⊐⟨⟩ """),
           (BQNError, """ (↕5)∊1 """),
           (BQNError, """ 2∊≍˘↕4 """),
           (1, """ 1‿0‿0‿1≡"acef"∊"adf" """),
           (1, """ (∊⟜(↕2)≡<⟜2)3⋆⌜○↕5 """),
           (1, """ (<1)≡3‿4‿5∊4+⌜○↕3 """),
           (BQNError, """ ∊<4 """),
           (1, """ ('0'≠"11010001")≡∊"abacbacd" """),
           (1, """ (↑⟜1≡⟜∊⥊⟜∞)9 """),
           (1, """ (⥊⟜1≡∊∘↕)6 """),
           (1, """ ≡⟜∊⟨⟩ """),
           (1, """ ≡○∊⟜(≍˜˘)"abcadbba" """),
           (BQNError, """ ⍷'a' """),
           (1, """ ≡⟜⍷⟨⟩ """),
           (1, """ "ba"≡⍷"baa" """),
           (BQNError, """ ≍⊸⍷"abc" """),
           (1, """ 0‿1‿0‿0≡"abc"⍷"aabcba" """),
           (1, """ (0‿1≍0‿0)≡(1‿2≍4‿5)⍷3‿3⥊↕9 """),
           (1, """ (↕3‿0)≡⍷⟜(≍˘)"abc" """),
           (1, """ 'a'(=≡⍷)"abc" """),
           (1, """ (⌽¨≡⍉)↕2⥊3 """),
           (1, """ (⍉≡<)'a' """),
           (1, """ ∧´⍉⊸≡¨⟨<'a',"a","abc",""⟩ """),
           (1, """ (↕4)(-˜⌜˜≡·⍉-⌜)↕3‿2 """),
           (BQNError, """ 0‿¯1‿1⍉(3⥊1)⥊1 """),
           (BQNError, """ 1‿0≍˘⊸⍉"ab"≍"cd" """),
           (BQNError, """ 0‿2⍉+⌜˜↕3 """),
           (BQNError, """ 2‿0‿0⍉↕↕3 """),
           (BQNError, """ 3⍉↕↕3 """),
           (1, """ (2×↕3)≡0‿0⍉6+⌜○↕3 """),
           (1, """ (⟨⟩⊸⍉≡<)4 """),
           (1, """ ⟨⟩(⍉≡⊢)<4 """),
           (1, """ (2‿0‿1⥊⟨⟩)≡1‿2‿0‿1⍉↕↕4 """),
           (1, """ (↕1‿2‿0‿3)≡2<⊸⍉↕↕4 """),
           (1, """ 0⊸⍉⊸≡2‿3⥊↕6 """),
           (BQNError, """ ⍋'a' """),
           (BQNError, """ ⍋'a'‿∘ """),
           (BQNError, """ ⍒2 """),
           (1, """ 2‿0‿3‿1‿4≡⍋"bdace" """),
           (1, """ 5‿2‿4‿3‿0‿1≡⍋↓"deabb" """),
           (1, """ (⍋≡⍒)⟨"",↕0,0↑<"abc"⟩ """),
           (1, """ (⍋≡↕∘≠)4‿0⥊@ """),
           (1, """ (⍒≡⌽∘↕∘≠)⟨¯∞,¯1.5,π,∞,'A','a','b'⟩ """),
           # TODO: issue with number formatting...
           # (1, """ (⍒≡⌽∘↕∘≠)⟨↕0,¯1.1,¯1,¯1‿¯∞,¯1‿0,¯1‿0‿0,¯1‿∞,0,6⥊0,1e¯20,1,1+1e¯15⟩ """),
           (1, """ (⍒≡⌽∘↕∘≠)(<∾⟨↕0,1,1‿1,2‿1‿1,2‿1,2,1‿2,2‿2,3⟩⥊¨<)'a' """),
           (1, """ (⍋≡↕∘≠)⥊⍉(↕5)⥊⟜1⊸⥊⌜1‿'b' """),
           (1, """ (⊢≡○⍋(0‿1+≠)⥊⊢)⟨¯2,'a',1,'f'⟩ """),
           (1, """ ⟨1,2,3,1‿2,2‿1,1‿3,2‿2,3‿1⟩(⥊⊸(≠∘⊣∾˜¯1⊸⊑⊸(⌊∾⊣)∾×´⊸⌊)⌜≡○(⍋⥊)⥊⌜⟜(+`∘≠⟜(↕6)¨))↕4 """),
           (1, """ ((⥊˜-⥊⟜2‿0)∘≠≡⍋+⍒)2/↕5 """),
           (BQNError, """ ∧⊏⟨+⟩ """),
           (BQNError, """ ∧+‿- """),
           (BQNError, """ ∨'c' """),
           (1, """ "edcba"≡∨"bdace" """),
           (1, """ (↕7)≡∧⍋|⟜⌽1+↕7 """),
           (BQNError, """ ⍋˜6 """),
           (BQNError, """ ⍒⟜↕4 """),
           (BQNError, """ (3‿2‿4⥊0)⍋4⥊1 """),
           (BQNError, """ (3‿2‿4⥊0)⍒1 """),
           (MethodError, """ ⟨+⟩⍋↕6 """),
           (BQNError, """ ⟨1‿3‿1,1‿3‿2⟩⍒⟨1‿3‿{𝕩}⟩ """),
           (1, """ ⟨1,3,∞,'e','i'⟩ (⍋≡≠∘⊣(⊣↓⊢⍋⊸⊏+`∘>)⍋∘∾) (2÷˜↕8)∾"aegz" """),
           (1, """ ⟨'z','d',1‿0,0⟩ (⍒≡≠∘⊣(⊣↓⊢⍋⊸⊏+`∘>)⍒∘∾) (2÷˜↕8)∾"aegz" """),
           (1, """ (<∘⌈≡(↕6)⊸⍋)2.5 """),
           (1, """ (<1)≡(↕2‿3)⍋1+↕3 """),
           (1, """ (<0)≡"abc"⥊⊸⍒○<≍"acc" """),
  ]
  @testset "layer 6" begin run_testsuite(cases, only=only) end
end

function test_prim()
  @testset "prim" verbose=true begin
    test_prim_0()
    test_prim_1()
    test_prim_2()
    test_prim_3()
    test_prim_4()
    test_prim_5()
    test_prim_6()
  end
end
