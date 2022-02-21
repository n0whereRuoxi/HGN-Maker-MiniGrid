( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b401 - block
    b440 - block
    b819 - block
    b454 - block
    b322 - block
    b506 - block
    b188 - block
    b877 - block
    b255 - block
    b942 - block
    b826 - block
    b503 - block
    b444 - block
    b471 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b401 )
    ( on b440 b401 )
    ( on b819 b440 )
    ( on b454 b819 )
    ( on b322 b454 )
    ( on b506 b322 )
    ( on b188 b506 )
    ( on b877 b188 )
    ( on b255 b877 )
    ( on b942 b255 )
    ( on b826 b942 )
    ( on b503 b826 )
    ( on b444 b503 )
    ( on b471 b444 )
    ( clear b471 )
  )
  ( :goal
    ( and
      ( clear b401 )
    )
  )
)
