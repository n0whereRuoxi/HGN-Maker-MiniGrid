( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b223 - block
    b536 - block
    b967 - block
    b170 - block
    b175 - block
    b216 - block
    b527 - block
    b888 - block
    b396 - block
    b187 - block
    b370 - block
    b295 - block
    b548 - block
    b373 - block
    b980 - block
    b194 - block
    b629 - block
    b694 - block
    b210 - block
    b687 - block
    b815 - block
    b489 - block
    b606 - block
    b150 - block
    b711 - block
    b229 - block
    b193 - block
    b851 - block
    b859 - block
    b511 - block
    b890 - block
    b6 - block
    b915 - block
    b841 - block
    b374 - block
    b332 - block
    b517 - block
    b272 - block
    b403 - block
    b940 - block
    b571 - block
    b872 - block
    b836 - block
    b843 - block
    b197 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b223 )
    ( on b536 b223 )
    ( on b967 b536 )
    ( on b170 b967 )
    ( on b175 b170 )
    ( on b216 b175 )
    ( on b527 b216 )
    ( on b888 b527 )
    ( on b396 b888 )
    ( on b187 b396 )
    ( on b370 b187 )
    ( on b295 b370 )
    ( on b548 b295 )
    ( on b373 b548 )
    ( on b980 b373 )
    ( on b194 b980 )
    ( on b629 b194 )
    ( on b694 b629 )
    ( on b210 b694 )
    ( on b687 b210 )
    ( on b815 b687 )
    ( on b489 b815 )
    ( on b606 b489 )
    ( on b150 b606 )
    ( on b711 b150 )
    ( on b229 b711 )
    ( on b193 b229 )
    ( on b851 b193 )
    ( on b859 b851 )
    ( on b511 b859 )
    ( on b890 b511 )
    ( on b6 b890 )
    ( on b915 b6 )
    ( on b841 b915 )
    ( on b374 b841 )
    ( on b332 b374 )
    ( on b517 b332 )
    ( on b272 b517 )
    ( on b403 b272 )
    ( on b940 b403 )
    ( on b571 b940 )
    ( on b872 b571 )
    ( on b836 b872 )
    ( on b843 b836 )
    ( on b197 b843 )
    ( clear b197 )
  )
  ( :goal
    ( and
      ( clear b223 )
    )
  )
)
