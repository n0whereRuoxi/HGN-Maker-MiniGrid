( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b403 - block
    b872 - block
    b400 - block
    b270 - block
    b942 - block
    b378 - block
    b222 - block
    b281 - block
    b858 - block
    b6 - block
    b855 - block
    b877 - block
    b651 - block
    b245 - block
    b416 - block
    b467 - block
    b208 - block
    b864 - block
    b76 - block
    b215 - block
    b636 - block
    b205 - block
    b532 - block
    b951 - block
    b248 - block
    b623 - block
    b362 - block
    b772 - block
    b339 - block
    b462 - block
    b818 - block
    b584 - block
    b599 - block
    b387 - block
    b37 - block
    b679 - block
    b381 - block
    b835 - block
    b884 - block
    b147 - block
    b320 - block
    b967 - block
    b209 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b403 )
    ( on b872 b403 )
    ( on b400 b872 )
    ( on b270 b400 )
    ( on b942 b270 )
    ( on b378 b942 )
    ( on b222 b378 )
    ( on b281 b222 )
    ( on b858 b281 )
    ( on b6 b858 )
    ( on b855 b6 )
    ( on b877 b855 )
    ( on b651 b877 )
    ( on b245 b651 )
    ( on b416 b245 )
    ( on b467 b416 )
    ( on b208 b467 )
    ( on b864 b208 )
    ( on b76 b864 )
    ( on b215 b76 )
    ( on b636 b215 )
    ( on b205 b636 )
    ( on b532 b205 )
    ( on b951 b532 )
    ( on b248 b951 )
    ( on b623 b248 )
    ( on b362 b623 )
    ( on b772 b362 )
    ( on b339 b772 )
    ( on b462 b339 )
    ( on b818 b462 )
    ( on b584 b818 )
    ( on b599 b584 )
    ( on b387 b599 )
    ( on b37 b387 )
    ( on b679 b37 )
    ( on b381 b679 )
    ( on b835 b381 )
    ( on b884 b835 )
    ( on b147 b884 )
    ( on b320 b147 )
    ( on b967 b320 )
    ( on b209 b967 )
    ( clear b209 )
  )
  ( :goal
    ( and
      ( clear b403 )
    )
  )
)
