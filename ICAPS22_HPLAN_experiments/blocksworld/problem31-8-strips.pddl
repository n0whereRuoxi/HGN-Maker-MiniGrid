( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b43 - block
    b948 - block
    b688 - block
    b512 - block
    b565 - block
    b449 - block
    b289 - block
    b877 - block
    b971 - block
    b193 - block
    b774 - block
    b343 - block
    b574 - block
    b26 - block
    b962 - block
    b54 - block
    b905 - block
    b284 - block
    b222 - block
    b405 - block
    b221 - block
    b340 - block
    b311 - block
    b921 - block
    b509 - block
    b891 - block
    b542 - block
    b928 - block
    b695 - block
    b184 - block
    b30 - block
    b374 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b43 )
    ( on b948 b43 )
    ( on b688 b948 )
    ( on b512 b688 )
    ( on b565 b512 )
    ( on b449 b565 )
    ( on b289 b449 )
    ( on b877 b289 )
    ( on b971 b877 )
    ( on b193 b971 )
    ( on b774 b193 )
    ( on b343 b774 )
    ( on b574 b343 )
    ( on b26 b574 )
    ( on b962 b26 )
    ( on b54 b962 )
    ( on b905 b54 )
    ( on b284 b905 )
    ( on b222 b284 )
    ( on b405 b222 )
    ( on b221 b405 )
    ( on b340 b221 )
    ( on b311 b340 )
    ( on b921 b311 )
    ( on b509 b921 )
    ( on b891 b509 )
    ( on b542 b891 )
    ( on b928 b542 )
    ( on b695 b928 )
    ( on b184 b695 )
    ( on b30 b184 )
    ( on b374 b30 )
    ( clear b374 )
  )
  ( :goal
    ( and
      ( clear b43 )
    )
  )
)
