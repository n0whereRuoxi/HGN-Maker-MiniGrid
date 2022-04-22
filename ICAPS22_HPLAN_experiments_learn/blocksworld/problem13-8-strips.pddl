( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b445 - block
    b170 - block
    b912 - block
    b959 - block
    b906 - block
    b47 - block
    b21 - block
    b644 - block
    b270 - block
    b311 - block
    b468 - block
    b158 - block
    b605 - block
    b611 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b445 )
    ( on b170 b445 )
    ( on b912 b170 )
    ( on b959 b912 )
    ( on b906 b959 )
    ( on b47 b906 )
    ( on b21 b47 )
    ( on b644 b21 )
    ( on b270 b644 )
    ( on b311 b270 )
    ( on b468 b311 )
    ( on b158 b468 )
    ( on b605 b158 )
    ( on b611 b605 )
    ( clear b611 )
  )
  ( :goal
    ( and
      ( clear b445 )
    )
  )
)
