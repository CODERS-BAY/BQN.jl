function test_undo(only=nothing)
  cases = [
    # Data
    (1, """ ∧´{𝕩≡𝕩⁼𝕩}¨⟨¯∞,3,@,'⁼',↕4⟩ """),
    # (1, """ ! % 3⁼4 """),
    # (1, """ ! % 2‿3⁼2‿3.1 """),

    # Primitives
    (1, """ ∧´ {(𝕎≡𝕎⁼)𝕩}⟜¯0.3‿0‿8¨ +‿-‿÷‿¬‿⊢‿⊣‿⌽ """),
    # (1, """ ! % -⁼ 'a' """),
    # (1, """ ! % ×⁼ 5 """),
    (1, """ (√√⁼)⊸≡ 0‿0.4‿π‿1e9‿∞ """),
    (1, """ (⋆⁼⋆)⊸≡ ↕4 """),
    # TODO: formatting error
    # (1, """ 1e¯14>|1-⋆+´⋆⁼1(⊢÷«)1+↕11 """),
    (1, """ ∧´ {𝕩≡6𝕎6𝕎⁼𝕩}⟜1‿2‿3¨ +‿-‿×‿÷‿√‿∧‿¬‿⊢ """),
    (1, """ 'a' ≡ 3+⁼'d' """),
    (3, """ 'd'-⁼'a' """),
    (1, """ 0.3‿1.01‿π(⋆⁼⌜≡÷˜⌜○(⋆⁼))0‿2‿5.6‿∞ """),
    (1, """ (⊢≡⊣⁼˜)"abcd" """),
    # (1, """ ! % "ab"⊣⁼"ac" """),
    (1, """ (<⁼<)¨⊸≡⟨0,⟨⟩,"abc"⟩ """),
    (1, """ (/⁼/)⊸≡1‿0‿2‿4 """),
    (1, """ ⟨⟩≡/⁼⟨⟩ """),
    (1, """ (3⊸⌽≡2⌽⁼⊢)↕5 """),
    (1, """ ((≢⍉⁼)≡¯1⌽≢)↕↕4 """),
    (1, """ ≡´⍉⍟¯1‿2⥊⟜(↕×´)2‿3‿3 """),
    (1, """ 2‿1(⊢≡⊣⍉⍉⁼)⥊⟜(↕×´)2‿3‿1‿4 """),

    # Self/Swap
    (1, """ ∧´ {6(𝕎˜⁼≡𝕎⁼)𝕩}⟜¯0.8‿0‿3¨ +‿×‿∧ """),
    (3.5, """ +˜⁼7 """),
    (0.5, """ ∨˜⁼0.75 """),
    (1, """ +´∊⟨√,×˜⁼,∧˜⁼⟩{𝕎𝕩}⌜0‿2‿∞ """),
    (1, """ ∧´ -‿÷‿⋆ {3(𝕎˜⁼≡𝕏)2‿π∾⋆2}¨ +‿×‿√ """),
    (4, """ 16√˜⁼2 """),
    (1, """ 4‿2‿0(¬˜⁼≡¯1++)1‿2‿9 """),

    # Mapping and scan
    # (1, """ ! % -¨⁼ 2 """),
    # (1, """ ! % -⌜⁼ 2 """),
    # (1, """ ! % -˘⁼ 2 """),
    # (1, """ ! % -˘⁼ <2 """),
    # (1, """ ! % -`⁼ 2 """),
    # (1, """ ! % 0-´⁼ 2 """),
    (1, """ (∾˜ ≡ ·(<⌜⁼∾<¨⁼)<¨) "abcd" """),
    (1, """ "ab"‿"abc"≡1⌽⁼¨"ba"‿"bca" """),
    (1, """ (2-=⌜˜↕2)≡/˘⁼0‿1‿1≍0‿0‿1 """),
    (1, """ 2(⌽˘⁼≡·⍉⌽⁼⟜⍉)≍"abcde" """),
    (1, """ (4⥊1) ≡ +`⁼ 1+↕4 """),
    (1, """ ⟨⟩ ≡ !`⁼⟨⟩ """),
    (1, """ (-⟜» ≡ +`⁼) 2|⌊×⌜˜π+↕5 """),
    (1, """ (5⥊2)≡2÷`⁼2⋆-↕5 """),
    (1, """ (0‿1‿1×⌜⥊˜4)≡(↕4)+`⁼3‿4⥊↕12 """),
    # (1, """ ! % (↕3)+`⁼3‿4⥊↕12 """),

    # Composition
    (0.75, """ (÷¬)⁼ 4 """),
    (4, """ ⊢∘√⁼ 2 """),
    (1, """ (⌽/1‿3)≡(·+`⌽)⁼↕4 """),
    (1, """ (⌽⊸/1‿3)≡(⌽·-`⌽)⁼↕4 """),
    (1, """ (¯1‿0+⌜"BQN")≡(1⌽⍉)⁼3‿2⥊"PQMNAB" """),
    (-1, """ (3×·√2+¬)⁼6 """),
    (1, """ (3⊸√+⟜7)⁼2 """),
    (-1, """ 5×⟜¬⁼10 """),
    (9, """ (√-2{𝔽})⁼1 """),
    (9, """ (√-2˙)⁼1 """),
    (3, """ 21(1+÷)⁼8 """),
    (1, """ (2⊸⌽ ≡ 2⊸(-⊸⌽)⁼)"abcde" """),
    (4, """ ¯2 ÷˜○¬⁼ ¯1 """),
    # TODO: formatting error...
    # (1, """ 1e¯12>|16- 2 ÷˜○(⋆⁼)⁼ 4 """),
    (1, """ (+`⌾⌽⁼≡+`⁼⌾⌽) ↕4 """),
    (2, """ ×˜⍟3⁼256 """),
    (1, """ √⊘-{𝕗⁼≡6𝕗⁼⊢} ¯3‿2 """),
    (1, """ ∧´ {(𝕎≡𝕎⁼⁼)𝕩}⟜2‿4‿1¨ /‿⌽‿< """),

    # Extensions
    (1, """ 9 ≡ ×˜⁼⁼ ¯3 """),
    (1, """ 2 ≡ @ {≠𝕨‿𝕩}⁼⁼ π """),
    (1, """ 0‿2‿1‿1 ≡ /⁼2‿3‿1‿1 """),
    (1, """ (/2‿3) ≡ /⁼⁼2‿3‿0 """),
    (1, """ (/2‿3) ≡ /⍟¯1⁼2‿3‿0 """),
  ]
  @testset "undo" begin run_testsuite(cases, only=only) end
  nothing
end
