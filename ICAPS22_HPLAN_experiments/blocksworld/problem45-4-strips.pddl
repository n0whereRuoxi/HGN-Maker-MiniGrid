( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b890 - block
    b626 - block
    b203 - block
    b481 - block
    b126 - block
    b166 - block
    b685 - block
    b862 - block
    b118 - block
    b83 - block
    b275 - block
    b952 - block
    b981 - block
    b672 - block
    b812 - block
    b598 - block
    b842 - block
    b882 - block
    b67 - block
    b681 - block
    b270 - block
    b281 - block
    b625 - block
    b85 - block
    b746 - block
    b6 - block
    b469 - block
    b312 - block
    b36 - block
    b758 - block
    b462 - block
    b933 - block
    b856 - block
    b381 - block
    b170 - block
    b93 - block
    b768 - block
    b286 - block
    b72 - block
    b959 - block
    b135 - block
    b13 - block
    b62 - block
    b585 - block
    b335 - block
    b220 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b890 )
    ( on b626 b890 )
    ( on b203 b626 )
    ( on b481 b203 )
    ( on b126 b481 )
    ( on b166 b126 )
    ( on b685 b166 )
    ( on b862 b685 )
    ( on b118 b862 )
    ( on b83 b118 )
    ( on b275 b83 )
    ( on b952 b275 )
    ( on b981 b952 )
    ( on b672 b981 )
    ( on b812 b672 )
    ( on b598 b812 )
    ( on b842 b598 )
    ( on b882 b842 )
    ( on b67 b882 )
    ( on b681 b67 )
    ( on b270 b681 )
    ( on b281 b270 )
    ( on b625 b281 )
    ( on b85 b625 )
    ( on b746 b85 )
    ( on b6 b746 )
    ( on b469 b6 )
    ( on b312 b469 )
    ( on b36 b312 )
    ( on b758 b36 )
    ( on b462 b758 )
    ( on b933 b462 )
    ( on b856 b933 )
    ( on b381 b856 )
    ( on b170 b381 )
    ( on b93 b170 )
    ( on b768 b93 )
    ( on b286 b768 )
    ( on b72 b286 )
    ( on b959 b72 )
    ( on b135 b959 )
    ( on b13 b135 )
    ( on b62 b13 )
    ( on b585 b62 )
    ( on b335 b585 )
    ( on b220 b335 )
    ( clear b220 )
  )
  ( :goal
    ( and
      ( clear b890 )
    )
  )
)
