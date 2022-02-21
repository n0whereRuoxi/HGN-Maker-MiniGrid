( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b407 - block
    b353 - block
    b551 - block
    b974 - block
    b816 - block
    b20 - block
    b322 - block
    b9 - block
    b480 - block
    b316 - block
    b771 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b407 )
    ( on b353 b407 )
    ( on b551 b353 )
    ( on b974 b551 )
    ( on b816 b974 )
    ( on b20 b816 )
    ( on b322 b20 )
    ( on b9 b322 )
    ( on b480 b9 )
    ( on b316 b480 )
    ( on b771 b316 )
    ( clear b771 )
  )
  ( :goal
    ( and
      ( clear b407 )
    )
  )
)
