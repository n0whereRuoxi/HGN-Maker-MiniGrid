( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b797 - block
    b725 - block
    b867 - block
    b583 - block
    b901 - block
    b274 - block
    b645 - block
    b994 - block
    b607 - block
    b71 - block
    b110 - block
    b161 - block
    b401 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b797 )
    ( on b725 b797 )
    ( on b867 b725 )
    ( on b583 b867 )
    ( on b901 b583 )
    ( on b274 b901 )
    ( on b645 b274 )
    ( on b994 b645 )
    ( on b607 b994 )
    ( on b71 b607 )
    ( on b110 b71 )
    ( on b161 b110 )
    ( on b401 b161 )
    ( clear b401 )
  )
  ( :goal
    ( and
      ( clear b797 )
    )
  )
)
