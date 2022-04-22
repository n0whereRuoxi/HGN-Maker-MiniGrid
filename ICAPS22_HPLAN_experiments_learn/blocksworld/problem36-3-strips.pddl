( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b238 - block
    b703 - block
    b425 - block
    b755 - block
    b696 - block
    b371 - block
    b842 - block
    b745 - block
    b364 - block
    b272 - block
    b61 - block
    b734 - block
    b68 - block
    b298 - block
    b435 - block
    b892 - block
    b234 - block
    b134 - block
    b157 - block
    b923 - block
    b394 - block
    b857 - block
    b35 - block
    b697 - block
    b20 - block
    b353 - block
    b196 - block
    b787 - block
    b710 - block
    b836 - block
    b940 - block
    b108 - block
    b776 - block
    b223 - block
    b446 - block
    b850 - block
    b153 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b238 )
    ( on b703 b238 )
    ( on b425 b703 )
    ( on b755 b425 )
    ( on b696 b755 )
    ( on b371 b696 )
    ( on b842 b371 )
    ( on b745 b842 )
    ( on b364 b745 )
    ( on b272 b364 )
    ( on b61 b272 )
    ( on b734 b61 )
    ( on b68 b734 )
    ( on b298 b68 )
    ( on b435 b298 )
    ( on b892 b435 )
    ( on b234 b892 )
    ( on b134 b234 )
    ( on b157 b134 )
    ( on b923 b157 )
    ( on b394 b923 )
    ( on b857 b394 )
    ( on b35 b857 )
    ( on b697 b35 )
    ( on b20 b697 )
    ( on b353 b20 )
    ( on b196 b353 )
    ( on b787 b196 )
    ( on b710 b787 )
    ( on b836 b710 )
    ( on b940 b836 )
    ( on b108 b940 )
    ( on b776 b108 )
    ( on b223 b776 )
    ( on b446 b223 )
    ( on b850 b446 )
    ( on b153 b850 )
    ( clear b153 )
  )
  ( :goal
    ( and
      ( clear b238 )
    )
  )
)
