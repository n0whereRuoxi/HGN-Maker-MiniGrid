( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b248 - block
    b551 - block
    b790 - block
    b130 - block
    b864 - block
    b740 - block
    b866 - block
    b708 - block
    b127 - block
    b278 - block
    b975 - block
    b403 - block
    b880 - block
    b366 - block
    b629 - block
    b698 - block
    b247 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b248 )
    ( on b551 b248 )
    ( on b790 b551 )
    ( on b130 b790 )
    ( on b864 b130 )
    ( on b740 b864 )
    ( on b866 b740 )
    ( on b708 b866 )
    ( on b127 b708 )
    ( on b278 b127 )
    ( on b975 b278 )
    ( on b403 b975 )
    ( on b880 b403 )
    ( on b366 b880 )
    ( on b629 b366 )
    ( on b698 b629 )
    ( on b247 b698 )
    ( clear b247 )
  )
  ( :goal
    ( and
      ( clear b248 )
    )
  )
)
